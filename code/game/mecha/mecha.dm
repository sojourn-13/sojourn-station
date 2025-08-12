#define MECHA_INT_FIRE 1
#define MECHA_INT_TEMP_CONTROL 2
#define MECHA_INT_SHORT_CIRCUIT 4
#define MECHA_INT_TANK_BREACH 8
#define MECHA_INT_CONTROL_LOST 16

#define MECHA_MELEE 1
#define MECHA_RANGED 2

#define MOVEMODE_STEP 1
#define MOVEMODE_THRUST 2

#define MECHA_ARMOR_LIGHT 2
#define MECHA_ARMOR_SCOUT 3
#define MECHA_ARMOR_MEDIUM 4
#define MECHA_ARMOR_HEAVY 5
#define MECHA_ARMOR_SUPERHEAVY 6

/obj/mecha
	name = "Mecha"
	desc = "Exosuit"
	icon = 'icons/mecha/mecha.dmi'
	density = 1 //Dense. To raise the heat.
	opacity = 1 ///opaque. Menacing.
	anchored = 1 //no pulling around.
	unacidable = 1 //and no deleting hoomans inside
	layer = BELOW_MOB_LAYER//icon draw layer
	infra_luminosity = 15 //byond implementation is bugged.
	var/initial_icon = null //Mech type for resetting icon. Only used for reskinning kits (see custom items)
	var/can_move = 0 // world.time of next allowed movement
	var/mob/living/carbon/occupant = null
	var/list/dropped_items = list()

	health = 300 //health is health
	var/deflect_chance = 10 //chance to deflect incoming projectiles, hits, or lesser the effect of ex_act.
	var/r_deflect_coeff = 1
	var/m_deflect_coeff = 1
	//ranged and melee damage multipliers
	var/r_damage_coeff = 1
	var/m_damage_coeff = 1
	var/r_armor_addition = 0
	var/m_armor_addition = 0
	var/rhit_power_use = 0
	var/mhit_power_use = 0

	//Movement
	var/step_in = 10 //make a step in step_in/10 sec.
	var/dir_in = 2//What direction will the mech face when entered/powered on? Defaults to South.
	var/normal_step_energy_drain = 10
	var/step_energy_drain = 10
	var/overload_step_energy_drain_min = 100
	var/obj/item/mecha_parts/mecha_equipment/thruster/thruster = null

	//the values in this list show how much damage will pass through, not how much will be absorbed.
	var/list/damage_absorption = list("brute"=6,"melee"=6,"fire"=1.2,"bullet"=6,"energy"=6,"bomb"=1)
	// This armor level indicates how fortified the mech's armor is.
	var/armor_level = MECHA_ARMOR_LIGHT
	var/obj/item/cell/large/cell
	var/state = 0
	var/list/log = new
	var/last_message = 0
	var/add_req_access = 1
	var/maint_access = 1
	var/dna	//dna-locking the mech
	var/datum/effect/effect/system/spark_spread/spark_system
	var/datum/effect/effect/system/smoke_spread/smoke_system
	var/lights = 0
	var/lights_power = 6
	var/force = 0
	var/melee_cooldown = 1 SECONDS
	var/melee_can_hit = TRUE
	var/list/destroyable_obj = list(/obj/mecha, /obj/structure/window, /obj/structure/grille, /turf/simulated/wall)

	//inner atmos
	var/use_internal_tank = 0
	var/internal_tank_valve = ONE_ATMOSPHERE
	var/obj/machinery/portable_atmospherics/canister/internal_tank
	var/datum/gas_mixture/cabin_air
	var/obj/machinery/atmospherics/portables_connector/connected_port = null

	var/obj/item/device/radio/radio = null

	var/max_temperature = 25000
	var/internal_damage_threshold = 50 //health percentage below which internal damage is possible
	var/internal_damage = 0 //contains bitflags

	var/list/operation_req_access = list()//required access level for mecha operation
	var/list/internals_req_access = list()//required access level to open cell compartment
	var/list/dna_req_access = list(access_heads)

	var/wreckage
	var/noexplode = 0 // Used for cases where an exosuit is spawned and turned into wreckage

	var/list/equipment = new
	var/obj/item/mecha_parts/mecha_equipment/selected
	var/max_equip = 4
	var/datum/events/events

	//Sounds
	var/step_sound = 'sound/mecha/Mech_Step.ogg'
	var/step_turn_sound = 'sound/mecha/Mech_Rotation.ogg'

	var/list/obj/item/mech_ammo_box/ammo[3] // List to hold the mech's internal ammo.

	var/obj/item/clothing/glasses/hud/hud

	// set to a direction to make the mech go inertial
	var/inertial_movement = 0

	// Functionality that used to be on subtypes
	var/defense_mode = FALSE
	var/defense_mode_boost = 30
	var/list/cargo = list()
	var/cargo_capacity = 0
	var/leg_overload_mode = FALSE
	var/leg_overload_coeff = 100
	var/smoke = 5
	var/smoke_ready = TRUE
	var/smoke_cooldown = 100
	var/zoom_mode = FALSE
	var/phasing = FALSE
	var/phasing_energy_drain = 200
	var/phase_state = "" //icon_state when phasing

/obj/mecha/can_prevent_fall()
	return TRUE

/obj/mecha/get_fall_damage()
	return FALL_GIB_DAMAGE

/obj/mecha/drain_power(var/drain_check)
	if(drain_check)
		return 1

	if(!cell)
		return 0

	return cell.drain_power(drain_check)

/obj/mecha/Initialize()
	. = ..()

	events = new()
	update_icon()
	add_radio()
	add_cabin()
	add_airtank() //All mecha currently have airtanks. No need to check unless changes are made.
	spark_system = new()
	spark_system.set_up(2, 0, src)
	spark_system.attach(src)
	smoke_system = new()
	smoke_system.set_up(3, 0, src)
	smoke_system.attach(src)
	add_cell()
	START_PROCESSING(SSobj, src)
	log_message("[name] created.")
	GLOB.mechas_list += src //global mech list
	add_hearing()

/obj/mecha/Destroy()
	STOP_PROCESSING(SSobj, src)
	go_out()

	for(var/mob/M in src) //Let's just be ultra sure
		M.forceMove(loc)

	for(var/atom/movable/AM in cargo)
		AM.forceMove(loc)

	cargo.Cut()

	if(loc)
		loc.Exited(src)

	if(prob(30) && !noexplode)
		explosion(get_turf(loc), 0, 0, 1, 3)

	if(wreckage)
		var/obj/effect/decal/mecha_wreckage/WR = new wreckage(loc)
		for(var/obj/item/mecha_parts/mecha_equipment/E in equipment)
			if(E.salvageable && prob(30))
				WR.crowbar_salvage += E
				E.forceMove(WR)
				E.equip_ready = 1
			else
				E.forceMove(loc)
				E.destroy()
		if(cell)
			WR.crowbar_salvage += cell
			cell.forceMove(WR)
			cell.charge = rand(0, cell.charge)
			cell = null

		if(internal_tank)
			WR.crowbar_salvage += internal_tank
			internal_tank.forceMove(WR)
			internal_tank = null
	else
		for(var/obj/item/mecha_parts/mecha_equipment/E in equipment)
			E.detach(loc)
			E.destroy()

		QDEL_NULL(cell)
		QDEL_NULL(internal_tank)

	equipment.Cut()
	connected_port = null

	QDEL_NULL(events)
	QDEL_NULL(cabin_air)
	QDEL_NULL(spark_system)
	QDEL_NULL(smoke_system)

	GLOB.mechas_list -= src //global mech list
	remove_hearing()
	. = ..()

/obj/mecha/lost_in_space()
	return occupant.lost_in_space()

/obj/mecha/handle_atom_del(atom/A)
	. = ..()
	if(A == cell)
		cell = null

/obj/mecha/get_cell()
	return cell

/obj/mecha/update_icon()
	if(initial_icon)
		icon_state = initial_icon
	else
		icon_state = initial(icon_state)

	if(!occupant)
		icon_state += "-open"

/obj/mecha/proc/reload_gun()
	var/obj/item/mech_ammo_box/MAB
	if(istype(selected, /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack)) // Does it use bullets?
		var/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/missile = selected
		missile.rearm()
		return TRUE
	if(!istype(selected, /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic)) // Does it use bullets?
		return FALSE

	var/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/gun = selected
	for(var/obj/item/mech_ammo_box/M in ammo) // Run through the boxes
		if(M.ammo_type == gun.ammo_type) // Is it the right ammo?
			MAB = M
			break

	if(MAB) // Only proceed if MAB isn't null, AKA we got a valid box to draw from
		while(gun.max_ammo > gun.projectiles) // Keep loading until we're full or the box's empty

			if(gun.projectiles + MAB.amount_per_click > gun.max_ammo) //Check to see if we are going to overload a gun
				MAB.amount_per_click = gun.max_ammo - gun.projectiles //Make it so we reload the gun to its fulliest amount and not a shell more

			//Prevents negitive numbers or cheating magic ammo
			if(MAB.amount_per_click > MAB.ammo_amount_left) //Check to see if we would add more ammo then we have
				MAB.amount_per_click = MAB.ammo_amount_left //Make it so we add the last of are ammo

			MAB.ammo_amount_left -= MAB.amount_per_click // Remove the ammo from the box
			gun.projectiles += MAB.amount_per_click // Put the ammo in the gun

			if(MAB.ammo_amount_left <= 0) // Check if there's enough ammo left
				occupant_message(SPAN_WARNING("[MAB.name] depleted, auto dropping.")) //Let the user know that we dropped ammo
				MAB.forceMove(loc) // Drop the empty ammo box
				for(var/i = ammo.len to 1 step -1) // Check each spot in the ammobox list
					if(ammo[i] == MAB) // Is it the same box?
						ammo[i] = null // It is no longer there
						MAB = null //Null this out so we later down dont need to do the initial ammo

			if(MAB) //Check to see if we are still around
				MAB.amount_per_click = initial(MAB.amount_per_click) //Reset are amount per click in cases of non-standered ammo adding


			occupant_message(SPAN_WARNING("[selected.name] reloaded successfully.")) //Let the user know they infact reloaded their gun
		return TRUE

	//This means we don't have ammo stored for our weapon - Trilby
	occupant_message(SPAN_WARNING("No Ammo Detected for Selected Weapon."))
	return FALSE


////////////////////////
////// Helpers /////////
////////////////////////
/obj/mecha/proc/add_airtank()
	internal_tank = new /obj/machinery/portable_atmospherics/canister/air(src)
	return internal_tank

/obj/mecha/proc/add_cell()
	cell = new /obj/item/cell/large/super(src)

/obj/mecha/proc/add_cabin()
	cabin_air = new
	cabin_air.temperature = T20C
	cabin_air.volume = 200
	cabin_air.adjust_multi(
		"oxygen",   O2STANDARD*cabin_air.volume/(R_IDEAL_GAS_EQUATION*cabin_air.temperature),
		"nitrogen", N2STANDARD*cabin_air.volume/(R_IDEAL_GAS_EQUATION*cabin_air.temperature)
	)
	return cabin_air

/obj/mecha/proc/add_radio()
	radio = new(src)
	radio.name = "[src] radio"
	radio.icon = icon
	radio.icon_state = icon_state
	radio.subspace_transmission = 1

//Called each step by mechas, and periodically when drifting through space
/obj/mecha/proc/check_for_support()
	var/turf/T = get_turf(src)
	//If we're standing on solid ground, we are fine, even in space.
	//We'll assume mechas have magnetic feet and don't slip
	if(!T.is_hole)
		return TRUE

	//Ok we're floating and there's no gravity
	else
		for(var/a in T)
			if(a == src)
				continue

			var/atom/A = a
			if(A.can_prevent_fall())
				return TRUE
		return FALSE

/obj/mecha/examine(mob/user)
	. = ..(user)
	var/integrity = health/initial(health)*100
	switch(integrity)
		if(85 to 100)
			to_chat(user, "It's fully intact.")
		if(65 to 85)
			to_chat(user, "It's slightly damaged.")
		if(45 to 65)
			to_chat(user, "It's badly damaged.")
		if(25 to 45)
			to_chat(user, "It's heavily damaged.")
		else
			to_chat(user, "It's falling apart.")
	if(equipment && equipment.len)
		to_chat(user, "It's equipped with:")
		for(var/obj/item/mecha_parts/mecha_equipment/ME in equipment)
			to_chat(user, "\icon[ME] [ME]")

/obj/mecha/proc/drop_item()//Derpfix, but may be useful in future for engineering exosuits.
	return

/obj/mecha/hear_talk(mob/M, text, verb, datum/language/speaking, speech_volume)
	if(M == occupant && radio.broadcasting)
		radio.talk_into(M, text, speech_volume = speech_volume)

/obj/mecha/proc/toggle_lights()
	lights = !lights

	if(lights)
		set_light(light_range + lights_power)
	else
		set_light(light_range - lights_power)

	occupant_message("Toggled lights [lights ? "on" : "off"].")
	log_message("Toggled lights [lights ? "on" : "off"].")

/obj/mecha/proc/toggle_internal_tank()
	use_internal_tank = !use_internal_tank
	occupant_message("Now taking air from [use_internal_tank ? "internal airtank" : "environment"].")
	log_message("Now taking air from [use_internal_tank ? "internal airtank" : "environment"].")

/obj/mecha/proc/view_stats(mob/user)
	user << browse(get_stats_html(), "window=exosuit")

////////////////////////////
///// Action processing ////
////////////////////////////

/obj/mecha/proc/click_action(atom/target, mob/user)
	if(!occupant || occupant != user)
		return
	if(user.incapacitated())
		return
	if(phasing)
		occupant_message(SPAN_WARNING("Unable to interact with objects while phasing."))
		return
	if(state)
		occupant_message("<font color='red'>Maintenance protocols in effect.</font>")
		return
	if(!get_charge())
		return
	if(src == target)
		return

	var/dir_to_target = get_dir(src, target)
	if(dir_to_target && !(dir_to_target & dir))
		return

	if(hasInternalDamage(MECHA_INT_CONTROL_LOST))
		target = safepick(view(3,target))
		if(!target)
			return

	if(!target.Adjacent(src))
		if(selected && selected.is_ranged())
			selected.action(target, user)

	else if(selected) // If target is adjacent
		if(istype(selected, /obj/item/mecha_parts/mecha_equipment)) // Check if you're using equipment
			if(istype(target, /mob/living))
				selected.attack(target, user, user.targeted_organ) // Against living targets
			else if(istype(target, /obj/machinery))
				if(user.a_intent == I_HELP) // This allows us to interface on help intent with machinery, so we don't break a computer we're trying to access
					interface_action(target)
				else // If not machinery or help intent, attack
					selected.attack_object(target, user)
			else if(istype(target, /obj/mecha)) // So it can attack mechs
				selected.attack_object(target, user)
			else // If not machinery, not mech or not alive, do the fancy tool uses
				selected.action(target, user)

	else // Empty handed, no equipment selected
		if(user.a_intent == I_HELP && istype(target, /obj/machinery))
			interface_action(target, user)
			return
		else
			melee_action(target)

/obj/mecha/proc/interface_action(obj/machinery/target)
	if(istype(target))
		if(!istype(target, /obj/machinery/computer)) // Computers tend to spam
			occupant_message(SPAN_NOTICE("Interfacing with [target]."))
			log_message("Interfaced with [target].")
		target.attack_hand(occupant)
		return TRUE
	return FALSE

/obj/mecha/contents_nano_distance(src_object, mob/living/user)
	. = user.shared_living_nano_distance(src_object) //allow them to interact with anything they can interact with normally.
	if(. != STATUS_INTERACTIVE)
		//Allow interaction with the mecha or anything that is part of the mecha
		if(src_object == src || (src_object in src))
			return STATUS_INTERACTIVE
		if(Adjacent(src_object))
			occupant_message(SPAN_NOTICE("Interfacing with [src_object]..."))
			log_message("Interfaced with [src_object].")
			return STATUS_INTERACTIVE
		if(src_object in view(2, src))
			return STATUS_UPDATE //if they're close enough, allow the occupant to see the screen through the viewport or whatever.

/obj/mecha/proc/can_melee()
	if(force <= 0)
		return FALSE // We can't do damage at all, why bother?
	// TODO: Cursed
	if(istype(src, /obj/mecha/combat))
		return TRUE // We are a combat mech, we can punch by default
	if(istype(src, /obj/mecha/working) && locate(/obj/item/mecha_parts/mecha_equipment/fist_plating) in equipment)
		return TRUE // We are a worker mech, we need the plating to enable punching
	return FALSE

/obj/mecha/proc/melee_action(atom/target)
	if(!can_melee())
		return
	if(internal_damage & MECHA_INT_CONTROL_LOST)
		target = safepick(oview(1, src))
	if(!melee_can_hit || !istype(target))
		return
	if(isliving(target))
		var/mob/living/M = target
		if(occupant.a_intent == I_HURT)
			playsound(src, 'sound/weapons/punch4.ogg', 50, 1)
			if(damtype == "brute")
				step_away(M, src, 15)

			if(istype(target, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = target

				var/obj/item/organ/external/temp = H.get_organ(pick(BP_CHEST, BP_CHEST, BP_CHEST, BP_HEAD))
				if(temp)
					var/update = 0
					switch(damtype)
						if("brute")
							H.Paralyse(1)
							update |= temp.take_damage(rand(force/2, force), 0)
						if("fire")
							update |= temp.take_damage(0, rand(force/2, force))
						if("tox")
							if(H.reagents)
								if(H.reagents.get_reagent_amount("carpotoxin") + force < force*2)
									H.reagents.add_reagent("carpotoxin", force)
								if(H.reagents.get_reagent_amount("cryptobiolin") + force < force*2)
									H.reagents.add_reagent("cryptobiolin", force)
						else
							return
					if(update)
						H.UpdateDamageIcon()
				H.updatehealth()

			else
				switch(damtype)
					if("brute")
						M.Paralyse(1)
						M.take_overall_damage(rand(force/2, force))
					if("fire")
						M.take_overall_damage(0, rand(force/2, force))
					if("tox")
						if(M.reagents)
							if(M.reagents.get_reagent_amount("carpotoxin") + force < force*2)
								M.reagents.add_reagent("carpotoxin", force)
							if(M.reagents.get_reagent_amount("cryptobiolin") + force < force*2)
								M.reagents.add_reagent("cryptobiolin", force)
					else
						return
				M.updatehealth()
			occupant_message("You hit [target].")
			visible_message("<font color='red'><b>[name] hits [target].</b></font>")
		else
			step_away(M,src)
			occupant_message("You push [target] out of the way.")
			visible_message("[src] pushes [target] out of the way.")

		melee_can_hit = FALSE
		spawn(melee_cooldown)
			melee_can_hit = TRUE
		return

	if(damtype == BRUTE)
		for(var/target_type in destroyable_obj)
			if(istype(target, target_type) && hascall(target, "attackby"))
				occupant_message("You hit [target].")
				visible_message("<font color='red'><b>[name] hits [target]</b></font>")
				if(!istype(target, /turf/simulated/wall))
					target:attackby(src,occupant)
				else if(prob(5))
					target:dismantle_wall(1)
					occupant_message(SPAN_NOTICE("You smash through the wall."))
					visible_message("<b>[name] smashes through the wall</b>")
					playsound(src, 'sound/weapons/smash.ogg', 50, 1)
				melee_can_hit = FALSE
				spawn(melee_cooldown)
					melee_can_hit = TRUE
				break

/obj/mecha/proc/range_action(atom/target)
	return

//////////////////////////////////
////////  Movement procs  ////////
//////////////////////////////////

/obj/mecha/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, glide_size_override = 0)
	. = ..()
	if(.)
		events.fireEvent("onMove", get_turf(src))

/obj/mecha/relaymove(mob/user, direction)
	if(user != occupant) // While not "realistic", this piece is player friendly.
		user.forceMove(get_turf(src))
		to_chat(user, "You climb out from [src]")
		return 0
	if(connected_port)
		if(world.time - last_message > 20)
			occupant_message("Unable to move while connected to the air system port.")
			last_message = world.time
		return 0
	if(state)
		occupant_message(SPAN_WARNING("Maintenance protocols in effect."))
		return
	return do_move(direction)

//This uses a goddamn do_after for movement, this is very bad. Todo: Redesign this in future
/obj/mecha/proc/do_move(direction)
	//If false, it's just moved, or locked down, or disabled or something
	if(can_move >= world.time)
		return 0
	//Currently drifting through space. The iterator that controls this will cancel it if the mech finds
	// things to grip or enables thrusters
	if(inertial_movement)
		return 0
	if(!has_charge(step_energy_drain))
		return 0
	if(defense_mode)
		if(world.time - last_message > 20)
			occupant_message(SPAN_DANGER("Unable to move while in defense mode."))
			last_message = world.time
		return 0
	if(zoom_mode)
		if(world.time - last_message > 20)
			occupant_message(SPAN_DANGER("Unable to move while in zoom mode."))
			last_message = world.time
		return 0

	var/turn = FALSE //If true, we are turning in place instead of moving
	if(dir != direction)
		turn = TRUE

	var/move_result = 0
	var/movemode = MOVEMODE_STEP

	//Alright lets check if we can move
	//If there's no support then we will use the thruster
	if(!check_for_support())
		//Check if the thruster exists, and is able to work. The do_move proc will handle paying gas costs
		if(thruster && thruster.do_move(direction, turn))
			//We pass this into the move procs, prevents stomping sounds
			movemode = MOVEMODE_THRUST

			//The thruster uses power, but far less than moving the legs
			if(!use_power(step_energy_drain*0.1))
				//No movement if power is dead
				return FALSE
		else
			inertial_movement = direction
			log_message("Movement control lost. Inertial movement started.")
			return FALSE
	//There is support, normal movement, normal energy cost
	else
		if(!use_power(step_energy_drain))
			//No movement if power is dead
			return FALSE

	//If we make it to here then we can definitely make a movement

	anchored = FALSE //Unanchor in order to move
	// TODO: Glide size handling in here is fucked,
	// because the timing system uses sleep instead of world.time comparisons/delay controllers
	// At least that's my theory I can't be bothered to investigate fully.
	if(turn)
		move_result = mechturn(direction, movemode)
		//We don't set l_move_time for turning on the spot. it doesnt count as movement
	else if(hasInternalDamage(MECHA_INT_CONTROL_LOST))
		set_glide_size(DELAY2GLIDESIZE(step_in))
		move_result = mechsteprand(movemode)
		if(occupant)
			occupant.l_move_time = world.time
	else
		set_glide_size(DELAY2GLIDESIZE(step_in))
		move_result = mechstep(direction, movemode)
		if(occupant)
			occupant.l_move_time = world.time

	anchored = TRUE //Reanchor after moving
	if(move_result)
		aftermove()
		can_move = world.time + step_in
		return 1
	return 0

/obj/mecha/proc/aftermove()
	if(occupant)
		var/obj/machinery/atmospherics/portables_connector/possible_port = locate() in loc
		if(possible_port)
			var/obj/screen/alert/mech_port_available/A = occupant.throw_alert("mechaport", /obj/screen/alert/mech_port_available)
			if(A)
				A.target = possible_port
		else
			occupant.clear_alert("mechaport")
	if(leg_overload_mode)
		take_damage(1)
		if(health < initial(health) - initial(health) / 3)
			leg_overload_mode = FALSE
			step_in = initial(step_in)
			step_energy_drain = normal_step_energy_drain
			occupant_message(SPAN_DANGER("Leg actuators damage threshold exceded. Disabling overload."))

/obj/mecha/proc/mechturn(direction, movemode = MOVEMODE_STEP)
	//When turning in 0g with a thruster, we do a little airburst to rotate us
	//The thrust happens in the direction we're already facing, to turn us away from that and to a different direction
	if(movemode == MOVEMODE_THRUST)
		thruster.thrust.trail.do_effect(get_step(loc, dir), dir)

	set_dir(direction)

	if(movemode == MOVEMODE_STEP && step_turn_sound)
		playsound(src, step_turn_sound,40,1)

	return 1

/obj/mecha/proc/mechstep(direction, movemode = MOVEMODE_STEP)
	. = step(src, direction)
	if(!.)
		if(phasing && get_charge() >= phasing_energy_drain)
			if(can_move < world.time)
				. = FALSE // We lie to mech code and say we didn't get to move, because we want to handle power usage + cooldown ourself
				flick(phase_state, src)
				var/delay = step_in * 3
				forceMove(get_step(src, dir), glide_size_override = DELAY2GLIDESIZE(delay))
				use_power(phasing_energy_drain)
				if(step_sound)
					playsound(src, step_sound, 40, 1)
				can_move = world.time + delay
	else if(movemode == MOVEMODE_STEP && step_sound)
		playsound(src,step_sound,100,1)


/obj/mecha/proc/mechsteprand(movemode = MOVEMODE_STEP)
	. = step_rand(src)
	if(.)
		if(movemode == MOVEMODE_STEP && step_sound)
			playsound(src,step_sound,100,1)

//Used for jetpacks
/obj/mecha/total_movement_delay()
	return step_in

/obj/mecha/Bump(atom/obstacle)
	if(isobj(obstacle))
		var/obj/O = obstacle
		if(istype(O, /obj/effect/portal)) //derpfix
			anchored = 0
			O.Crossed(src)
			spawn(0)//countering portal teleport spawn(0), hurr
				anchored = 1
		else if(!O.anchored)
			step(obstacle,dir)
		else //I have no idea why I disabled this
			obstacle.Bumped(src)
	else if(ismob(obstacle))
		step(obstacle,dir)
	else
		obstacle.Bumped(src)

/obj/mecha/get_jetpack()
	if(thruster)
		return thruster.thrust

	return null

//Here we hook in any modules that would prevent the mech from falling
//Return false to float in the air, return true to fall
/obj/mecha/can_fall()
	if(thruster)
		if(thruster.thrust.check_thrust() && thruster.thrust.stabilization_on)
			return FALSE
	. = ..()


/*Falling mechas have a similar effect to falling robots. Major devastation to the area and death to
anything directly under them. However, since they are walking vehicles, with legs - and more importantly, knees-
they can absorb most of the shock that would hit themselves, and thusly only take light damage from falling.
This damage is 8% of their max health.
It's still not healthy or recommended in most circumstances, but stomping someone in a mech would be an excellent
assassination method if you time it right*/
/obj/mecha/fall_impact(turf/from, turf/dest)
	anchored = TRUE //We may have set this temporarily false so we could fall
	take_damage(initial(health) * 0.08)

	//Wreck the contents of the tile
	for(var/atom/movable/AM in dest)
		if(AM != src)
			AM.ex_act(3)

	//Damage the tile itself
	dest.ex_act(2)

	//Damage surrounding tiles
	for(var/turf/T in range(1, src))
		if(T == dest)
			continue

		T.ex_act(3)

	//And do some screenshake for everyone in the vicinity
	for(var/mob/M in range(20, src))
		var/dist = get_dist(M, src)
		dist *= 0.5
		if(dist <= 1)
			dist = 1 //Prevent runtime errors

		shake_camera(M, 10/dist, 2.5/dist, 0.12)

	playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)
	spawn(1)
		playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)
	spawn(2)
		playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)

///////////////////////////////////
////////  Internal damage  ////////
///////////////////////////////////

/obj/mecha/proc/check_for_internal_damage(list/possible_int_damage, ignore_threshold=null)
	if(!islist(possible_int_damage) || isemptylist(possible_int_damage))
		return
	if(prob(20))
		if(ignore_threshold || health*100/initial(health)<internal_damage_threshold)
			for(var/T in possible_int_damage)
				if(internal_damage & T)
					possible_int_damage -= T
			var/int_dam_flag = safepick(possible_int_damage)
			if(int_dam_flag)
				setInternalDamage(int_dam_flag)
	if(prob(5))
		if(ignore_threshold || health*100/initial(health)<internal_damage_threshold)
			var/obj/item/mecha_parts/mecha_equipment/destr = safepick(equipment)
			if(destr)
				destr.destroy()

/obj/mecha/proc/hasInternalDamage(int_dam_flag = null)
	return int_dam_flag ? internal_damage&int_dam_flag : internal_damage

/obj/mecha/proc/setInternalDamage(int_dam_flag)
	internal_damage |= int_dam_flag
	log_append_to_last("Internal damage of type [int_dam_flag].",1)
	occupant << sound('sound/machines/warning-buzzer.ogg',wait=0)

/obj/mecha/proc/clearInternalDamage(int_dam_flag)
	internal_damage &= ~int_dam_flag
	switch(int_dam_flag)
		if(MECHA_INT_TEMP_CONTROL)
			occupant_message("<font color='blue'><b>Life support system reactivated.</b></font>")
		if(MECHA_INT_FIRE)
			occupant_message("<font color='blue'><b>Internal fire extinquished.</b></font>")
		if(MECHA_INT_TANK_BREACH)
			occupant_message("<font color='blue'><b>Damaged internal tank has been sealed.</b></font>")


////////////////////////////////////////
////////  Health related procs  ////////
////////////////////////////////////////

/obj/mecha/proc/take_damage(amount, type = "brute", armor_divisor, armor_carry_over)
	if(amount)
		var/damage = absorb_damage(amount,type,armor_divisor,armor_carry_over)
		health -= damage
		update_health()
		log_append_to_last("Took [damage] points of damage. Damage type: \"[type]\".", 1)

/obj/mecha/proc/take_flat_damage(amount, type = "brute")
	if(amount)
		health -= amount
		update_health()
		log_append_to_last("Took [amount] points of damage.", 1)

/obj/mecha/proc/absorb_damage(damage,damage_type,armor_divisor,armor_carry_over)
	if(damage_type == BRUTE || damage_type == ARMOR_MELEE || damage_type == ARMOR_BULLET || damage_type == ARMOR_ENERGY)
		log_append_to_last("damage before math [damage]. Armory carry over [armor_carry_over]. armor divisior [armor_divisor] type: \"[type]\".", 1)
		return max(damage-(listgetindex(damage_absorption,damage_type)+armor_carry_over)/armor_divisor,0)
	return damage*(listgetindex(damage_absorption,damage_type) || 1)

/obj/mecha/proc/hit_damage(damage, type="brute", armor_divisor, is_melee = 0)
	var/power_to_use
	var/armor_carry_over

	if(is_melee)
		power_to_use = mhit_power_use
		armor_carry_over = m_armor_addition
	else
		power_to_use = rhit_power_use
		armor_carry_over = r_armor_addition

	if(power_to_use)
		use_power(power_to_use)

	take_damage(round(damage), type, armor_divisor, armor_carry_over)
	start_booster_cooldown(is_melee)


/obj/mecha/proc/deflect_hit(is_melee=0)
	var/power_to_use
	var/deflect_coeff_to_use

	if(is_melee)
		power_to_use = mhit_power_use
		deflect_coeff_to_use = m_damage_coeff
	else
		power_to_use = rhit_power_use
		deflect_coeff_to_use = r_damage_coeff

	if(power_to_use)
		if(prob(deflect_chance*deflect_coeff_to_use))
			use_power(power_to_use)
			start_booster_cooldown(is_melee)
			return 1
		else
			return 0

	else
		start_booster_cooldown(is_melee)
		if(prob(deflect_chance*deflect_coeff_to_use))
			return 1

	return 0

/obj/mecha/proc/start_booster_cooldown(is_melee)
	for(var/obj/item/mecha_parts/mecha_equipment/armor_booster/B in equipment) //Ideally this would be done by the armor booster itself; attempts weren't great for performance.
		if(B.melee == is_melee && B.equip_ready)
			B.start_cooldown()

/obj/mecha/airlock_crush(var/crush_damage)
	..()
	hit_damage(crush_damage, is_melee=1)
	check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))
	return 1

/obj/mecha/proc/update_health()
	if(health > 0)
		spark_system.start()
	else
		qdel(src)

/obj/mecha/attack_hand(mob/user)
	log_message("Attack by hand/paw. Attacker - [user].",1)

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.species.can_shred(user))
			if(!deflect_hit(is_melee=1))
				hit_damage(damage = 15, is_melee = 1)
				check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))
				playsound(loc, 'sound/weapons/slash.ogg', 50, 1, -1)
				to_chat(user, SPAN_DANGER("You slash at the armored suit!"))
				visible_message(SPAN_DANGER("[user] slashes at [src]'s armor!"))
			else
				log_append_to_last("Armor saved.")
				playsound(loc, 'sound/weapons/slash.ogg', 50, 1, -1)
				to_chat(user, SPAN_DANGER("Your claws had no effect!"))
				occupant_message(SPAN_NOTICE("[user]'s claws are stopped by the armor."))
				visible_message(SPAN_WARNING("[user] rebounds off [src]'s armor!"))
		else
			user.visible_message(SPAN_DANGER("[user] hits [src]. Nothing happens."),SPAN_DANGER("You hit [src] with no visible effect."))
			log_append_to_last("Armor saved.")
	else if((HULK in user.mutations) && !deflect_hit(is_melee=1))
		hit_damage(damage=15, is_melee=1)
		check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))
		user.visible_message(SPAN_DANGER("[user] hits [src], doing some damage."), SPAN_DANGER("You hit [src] with all your might. The metal creaks and bends."))
	else
		user.visible_message(SPAN_DANGER("[user] hits [src]. Nothing happens"), SPAN_DANGER("You hit [src] with no visible effect."))
		log_append_to_last("Armor saved.")

/obj/mecha/hitby(atom/movable/A)
	..()
	log_message("Hit by [A].", 1)
	if(istype(A, /obj/item/mecha_parts/mecha_tracking))
		A.forceMove(src)
		visible_message("[A] fastens firmly to [src].")
		return
	if(deflect_hit(is_melee=0) || ismob(A))
		occupant_message(SPAN_NOTICE("[A] bounces off the armor."))
		visible_message("[A] bounces off [src] armor.")
		log_append_to_last("Armor saved.")
		if(isliving(A))
			var/mob/living/M = A
			M.take_organ_damage(10)
	else if(isobj(A))
		var/obj/O = A
		if(O.throwforce)
			hit_damage(O.throwforce, is_melee = 0)
			check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))

/obj/mecha/bullet_act(obj/item/projectile/Proj)
	if(Proj.firer == occupant) // Pass the projectile through if we fired it.
		return PROJECTILE_CONTINUE

	if(!Proj.testing)
		log_message("Hit by projectile. Type: [Proj.name]([Proj.check_armor]).",1)
		if(deflect_hit(is_melee = 0))
			occupant_message(SPAN_NOTICE("The armor deflects incoming projectile."))
			visible_message("[src]'s armor deflects the projectile.")
			log_append_to_last("Armor saved.")
			return

		if(!Proj.nodamage)
			var/final_penetration = Proj.penetrating ? Proj.penetrating - armor_level : 0
			var/damage_multiplier = final_penetration > 0 ? max(1.5, final_penetration) : 1 // Minimum damage bonus of 50% if you beat the mech's armor
			Proj.penetrating = 0 // Reduce this value to maintain the old penetration loop's behavior
			hit_damage((Proj.damage_types[BRUTE] + Proj.damage_types[BURN]) * damage_multiplier, Proj.check_armor, Proj.armor_divisor, is_melee=0)

			//AP projectiles have a chance to cause additional damage
			if(final_penetration > 0)
				for(var/i in 0 to min(final_penetration, round(Proj.get_total_damage() / 15)))
					if(prob(20))
						occupant_message(SPAN_WARNING("Your armor was penetrated and a component was damaged!."))
						visible_message("Sparks fly from the [name] as the projectile strikes a critical component!")
						spark_system?.start()
						// check_internal_damage rolls a chance to damage again, so do our own critical damage handling here to guarantee that a component is damaged.
						var/list/possible_int_damage = list(MECHA_INT_FIRE,MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST,MECHA_INT_SHORT_CIRCUIT)
						if(prob(90))
							for(var/T in possible_int_damage)
								if(internal_damage & T)
									possible_int_damage -= T
							var/int_dam_flag = safepick(possible_int_damage)
							if(int_dam_flag)
								setInternalDamage(int_dam_flag)
						else
							var/obj/item/mecha_parts/mecha_equipment/destr = safepick(equipment)
							if(destr)
								destr.destroy()
						break // Only allow one critical hit per penetration

					final_penetration--

					if(prob(15))
						break //give a chance to exit early

	. = ..()

/obj/mecha/ex_act(severity)
	log_message("Affected by explosion of severity: [severity].",1)
	if(prob(deflect_chance))
		severity++
		log_append_to_last("Armor saved, changing severity to [severity].")
	// This formula is designed to one-shot anything less armored than a Phazon taking a severity 1 explosion.
	// This formula also does the same raw damage (aside from one-shotting) as the previous formula against a Durand, but deals more final damage due to being unmitigated by damage resistance.
	var/damage_proportion = 1 / max(1, (severity + max(0, armor_level - 2)))
	take_flat_damage(initial(health) * damage_proportion)
	check_for_internal_damage(list(MECHA_INT_FIRE, MECHA_INT_TEMP_CONTROL, MECHA_INT_TANK_BREACH, MECHA_INT_CONTROL_LOST, MECHA_INT_SHORT_CIRCUIT), 1)

/obj/mecha/emp_act(severity)
	if(use_power((cell.charge / 2) / severity))
		take_damage(50 / severity,"energy")
	log_message("EMP detected", 1)
	check_for_internal_damage(list(MECHA_INT_FIRE, MECHA_INT_TEMP_CONTROL, MECHA_INT_CONTROL_LOST, MECHA_INT_SHORT_CIRCUIT), 1)

/obj/mecha/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature>max_temperature)
		log_message("Exposed to dangerous temperature.", 1)
		take_damage(5, "fire")
		check_for_internal_damage(list(MECHA_INT_FIRE, MECHA_INT_TEMP_CONTROL))


//////////////////////
////// AttackBy //////
//////////////////////

/obj/mecha/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

	var/list/usable_qualities = list()
	if(state == 1 || state == 2)
		usable_qualities.Add(QUALITY_BOLT_TURNING)
	if(user.a_intent != I_HURT)
		usable_qualities.Add(QUALITY_WELDING)
	if(hasInternalDamage(MECHA_INT_TEMP_CONTROL) || (state == 3 && cell) || (state == 4 && cell))
		usable_qualities.Add(QUALITY_SCREW_DRIVING)
	if(state == 2 || state == 3)
		usable_qualities.Add(QUALITY_PRYING)
	if((state >= 3 && occupant) || dna)
		usable_qualities.Add(QUALITY_PULSING)

	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)
		if(QUALITY_BOLT_TURNING)
			if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
				to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
				return
			if(state == 1)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You undo the securing bolts and deploy the rollers."))
					state = 2
					anchored = 0
					return
			if(state == 2)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You tighten the securing bolts and undeploy the rollers."))
					state = 1
					anchored = 1
					return
			return

		if(QUALITY_WELDING)
			if(user.a_intent != I_HURT)
				if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
					to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
					return

				if(health >= initial(health))
					to_chat(user, SPAN_NOTICE("The [name] is at full integrity"))
					return

				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					if(hasInternalDamage(MECHA_INT_TANK_BREACH))
						clearInternalDamage(MECHA_INT_TANK_BREACH)
						to_chat(user, SPAN_NOTICE("You repair the damaged gas tank."))
					if(health<initial(health))
						var/missing_health = initial(health) - health
						user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
						var/user_mec = max(0, user.stats.getStat(STAT_MEC))
						if(state == 3)
							to_chat(user, SPAN_NOTICE("You are able to repair more damage to [name] from the inside."))
							health += min(initial(health) * (user_mec / 100), missing_health)
						else
							to_chat(user, SPAN_NOTICE("You repair some damage to [name]."))
							health += min(user.stats.getStat(STAT_MEC) * 2, missing_health)
			return

		if(QUALITY_PRYING)
			if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
				to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
				return

			if(state == 2)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You open the hatch to the power unit."))
					state = 3
					if(!cell)
						state = 4
					return

			if(state == 3)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You close the hatch to the power unit"))
					state = 2
					return
			return

		if(QUALITY_SCREW_DRIVING)
			if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
				to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
				return
			if(hasInternalDamage(MECHA_INT_TEMP_CONTROL))
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You repair the damaged temperature controller."))
					clearInternalDamage(MECHA_INT_TEMP_CONTROL)
					return
			if(state == 3 && cell)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You unscrew and pry out the powercell."))
					cell.forceMove(loc)
					cell = null
					state = 4
					log_message("Powercell removed.")
			if(state == 4 && cell)
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You screw the cell in place."))
					state = 3
					return
			return

		if(QUALITY_PULSING)
			if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
				to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
				return
			if(state >= 3 && occupant)
				to_chat(user, "You attempt to eject the pilot using the maintenance controls.")
				if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
					if(occupant.stat)
						go_out()
						log_message("[occupant] was ejected using the maintenance controls.")
					else
						to_chat(user, SPAN_WARNING("Your attempt is rejected."))
						occupant_message(SPAN_WARNING("An attempt to eject you was made using the maintenance controls."))
						log_message("Eject attempt made using maintenance controls - rejected.")
					return
			if(dna)
				if(I.use_tool(user, src, WORKTIME_LONG, tool_type, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
					dna = null
					to_chat(user, SPAN_WARNING("You have reset the mech's DNA lock forcefuly."))
					log_message("DNA lock was forcefuly removed.")
				else
					to_chat(user, SPAN_WARNING("You failed to reset the mech's DNA lock."))
					log_message("A failed attempt at reseting the DNA lock has been logged.")
			return

		if(ABORT_CHECK)
			return

	if(istype(I, /obj/item/mecha_parts/mecha_equipment))
		if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
			to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
			return

		var/obj/item/mecha_parts/mecha_equipment/E = I
		spawn()
			if(E.can_attach(src))
				user.drop_item()
				E.attach(src)
				user.visible_message("[user] attaches [I] to [src]", "You attach [I] to [src]")
			else
				to_chat(user, "You were unable to attach [I] to [src]")
		return

	var/obj/item/card/id/id_card = I.GetIdCard()
	if(id_card)
		if(add_req_access || maint_access)
			if(internals_access_allowed(usr))
				output_maintenance_dialog(id_card, user)
				return
			else
				to_chat(user, SPAN_WARNING("Invalid ID: Access denied."))
		else
			to_chat(user, SPAN_WARNING("Maintenance protocols disabled by operator."))

	else if(istype(I, /obj/item/stack/cable_coil))
		if(!user.stat_check(STAT_MEC, STAT_LEVEL_ADEPT))
			to_chat(usr, SPAN_WARNING("You lack the mechanical knowledge to do this!"))
			return

		if(state == 3 && hasInternalDamage(MECHA_INT_SHORT_CIRCUIT))
			var/obj/item/stack/cable_coil/CC = I
			if(CC.use(2))
				clearInternalDamage(MECHA_INT_SHORT_CIRCUIT)
				to_chat(user, "You replace the fused wires.")
			else
				to_chat(user, "There's not enough wire to finish the task.")
		return

	else if(istype(I, /obj/item/cell/large))
		if(state == 4 || (state == 3 && !cell))
			if(!cell)
				to_chat(user, "You install the powercell")
				user.drop_item()
				I.forceMove(src)
				cell = I
				log_message("Powercell installed")
				state = 4
			else
				to_chat(user, "There's already a powercell installed.")
		return

	else if(istype(I, /obj/item/mecha_parts/mecha_tracking))
		user.drop_from_inventory(I)
		I.forceMove(src)
		user.visible_message("[user] attaches [I] to [src].", "You attach [I] to [src]")
		return

	else if(istype(I, /obj/item/mech_ammo_box))
		for(var/i = ammo.len to 1 step -1) // Check each spot in the ammobox list
			if(ammo[i] == null) // No box in the way.
				insert_item(I, user)
				ammo[i] = I
				user.visible_message("[user] attaches [I] to [src].", "You attach [I] to [src]")
				log_message("Ammobox [I] inserted by [user]")
		return

	else
		log_message("Attacked by [I]. Attacker - [user]")

		if(deflect_hit(is_melee=1))
			to_chat(user, SPAN_DANGER("\The [I] bounces off [name]."))
			log_append_to_last("Armor saved.")
		else
			occupant_message("<font color='red'><b>[user] hits [src] with [I].</b></font>")
			user.visible_message("<font color='red'><b>[user] hits [src] with [I].</b></font>", "<font color='red'><b>You hit [src] with [I].</b></font>")
			hit_damage(I.force, I.damtype, is_melee = 1)
			check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))

/////////////////////////////////////
////////  Atmospheric stuff  ////////
/////////////////////////////////////

/obj/mecha/proc/get_turf_air()
	var/turf/T = get_turf(src)
	if(T)
		. = T.return_air()
	return

/obj/mecha/remove_air(amount)
	if(use_internal_tank)
		return cabin_air.remove(amount)
	else
		var/turf/T = get_turf(src)
		if(T)
			return T.remove_air(amount)
	return

/obj/mecha/return_air()
	if(use_internal_tank)
		return cabin_air
	return get_turf_air()

/obj/mecha/proc/return_pressure()
	var/datum/gas_mixture/t_air = return_air()
	if(t_air)
		. = t_air.return_pressure()

/obj/mecha/proc/return_temperature()
	var/datum/gas_mixture/t_air = return_air()
	if(t_air)
		. = t_air.temperature

/obj/mecha/proc/connect(obj/machinery/atmospherics/portables_connector/new_port)
	//Make sure not already connected to something else
	if(connected_port || !istype(new_port) || new_port.connected_device)
		return 0

	//Make sure are close enough for a valid connection
	if(new_port.loc != loc)
		return 0

	//Perform the connection
	connected_port = new_port
	connected_port.connected_device = src

	if(occupant)
		occupant.clear_alert("mechaport", TRUE)
		occupant.throw_alert("mechaport_d", /obj/screen/alert/mech_port_disconnect)

	//Actually enforce the air sharing
	var/datum/pipe_network/network = connected_port.return_network(src)
	if(network && !(internal_tank.return_air() in network.gases))
		network.gases += internal_tank.return_air()
		network.update = 1
	log_message("Connected to gas port.")
	return 1

/obj/mecha/proc/disconnect()
	if(!connected_port)
		return 0

	var/datum/pipe_network/network = connected_port.return_network(src)
	if(network)
		network.gases -= internal_tank.return_air()

	connected_port.connected_device = null
	connected_port = null
	log_message("Disconnected from gas port.")
	if(occupant)
		occupant.clear_alert("mechaport_d")
	return 1

/obj/mecha/MouseDrop_T(mob/target, mob/user)
	if(istype(user) && target == user)
		move_inside(user)

/obj/mecha/proc/move_inside(mob/user)
	if(user.incapacitated() || !ishuman(user))
		return

	if(user.buckled)
		to_chat(user, SPAN_WARNING("You can't climb into the exosuit while buckled!"))
		return

	if(istype(user.get_equipped_item(slot_back), /obj/item/rig/hydrogen_knight))
		to_chat(user, SPAN_WARNING("Your armor is too bulky to fit in the exosuit!"))
		return

	log_message("[user] tries to move in.")
	if(occupant)
		user << sound('sound/mecha/UI_SCI-FI_Tone_Deep_Wet_15_stereo_error.ogg',channel = 4, volume = 100)
		to_chat(user, SPAN_DANGER("The [name] is already occupied!"))
		log_append_to_last("Permission denied.")
		return

	var/passed
	if(dna)
		if(user.dna.unique_enzymes == dna)
			passed = 1
	else if(operation_allowed(user))
		passed = 1
	if(!passed)
		user << sound('sound/mecha/UI_SCI-FI_Tone_Deep_Wet_15_stereo_error.ogg',channel = 4, volume = 100)
		to_chat(user, SPAN_WARNING("Access denied"))
		log_append_to_last("Permission denied.")
		return

	for(var/mob/living/carbon/slime/M in range(1,user))
		if(M.Victim == user)
			to_chat(user, "You're too busy getting your life sucked out of you.")
			return

	visible_message(SPAN_NOTICE("\The [user] starts to climb into [name]"))

	if(do_after(usr, 40, target = src))
		if(!occupant)
			moved_inside(user)
		else if(occupant!=user)
			to_chat(user, "[occupant] was faster. Try better next time, loser.")
	else
		to_chat(user, "You stop entering the exosuit.")

/obj/mecha/proc/moved_inside(mob/living/carbon/human/H)
	if(H && H.client && (H in range(1)))
		occupant = H
		H.stop_pulling()
		H.forceMove(src)
		H.reset_view(src)
		add_fingerprint(H)
		GrantActions(H)
		forceMove(loc)
		log_append_to_last("[H] moved in as pilot.")
		update_icon()
		set_dir(dir_in)
		playsound(src, 'sound/machines/windowdoor.ogg', 50, 1)
		if(!hasInternalDamage())
			occupant << sound('sound/mecha/nominal.ogg', volume = 50)
		return 1
	return 0

/obj/mecha/verb/attempt_enter()
	set category = "Object"
	set name = "Enter Exosuit"
	set src in oview(1)

	move_inside(usr)

/obj/mecha/proc/go_out()
	if(!occupant)
		return

	var/atom/movable/mob_container
	occupant.clear_alert("charge")
	occupant.clear_alert("mech damage")
	occupant.clear_alert("mechaport")
	occupant.clear_alert("mechaport_d")
	RemoveActions(occupant)
	occupant.client?.view = world.view
	occupant.client?.apply_clickcatcher()
	zoom_mode = FALSE

	for(var/item in dropped_items)
		var/atom/movable/I = item
		I.forceMove(loc)
	dropped_items.Cut()

	if(occupant.forceMove(loc)) //ejecting mob
		log_message("[mob_container] moved out.")
		occupant.reset_view()
		occupant << browse(null, "window=exosuit")
		occupant = null
		update_icon()
		set_dir(dir_in)

/////////////////////////
////// Access stuff /////
/////////////////////////

/obj/mecha/proc/operation_allowed(mob/living/carbon/human/H)
	for(var/ID in list(H.get_active_hand(), H.wear_id, H.belt))
		if(check_access(ID, operation_req_access))
			return TRUE
	return FALSE

/obj/mecha/proc/internals_access_allowed(mob/living/carbon/human/H)
	for(var/atom/ID in list(H.get_active_hand(), H.wear_id, H.belt))
		if(check_access(ID, internals_req_access))
			return TRUE
	return FALSE

/obj/mecha/proc/dna_reset_allowed(mob/living/carbon/human/H)
	for(var/atom/ID in list(H.get_active_hand(), H.wear_id, H.belt))
		if(check_access(ID, dna_req_access))
			return TRUE
	return FALSE

/obj/mecha/check_access(obj/item/card/id/I, list/access_list)
	if(!istype(access_list))
		return TRUE
	if(!access_list.len) //no requirements
		return TRUE

	var/list/user_access = I ? I.GetAccess() : list()

	if(access_list==operation_req_access)
		for(var/req in access_list)
			if(!(req in user_access)) //doesn't have this access
				return FALSE
	else if(access_list == internals_req_access || access_list == dna_req_access)
		for(var/req in access_list)
			if(req in user_access)
				return TRUE
		return FALSE
	return TRUE


///////////////////////
///// Power stuff /////
///////////////////////

/obj/mecha/proc/has_charge(amount)
	return (get_charge() >= amount)

/obj/mecha/proc/get_charge()
	if(!cell)
		return
	return max(0, cell.charge)

//Attempts to use the given amount of power
/obj/mecha/proc/use_power(amount)
	if(get_charge() >= amount)
		cell.use(amount)
		return TRUE
	return FALSE

/obj/mecha/proc/give_power(amount)
	if(!isnull(get_charge()))
		cell.give(amount)
		return TRUE
	return FALSE


/obj/mecha/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(!damage)
		return 0

	log_message("Attacked. Attacker - [user].",1)

	user.do_attack_animation(src)
	if(!deflect_hit(is_melee=1))
		hit_damage(damage, is_melee=1)
		check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))
		visible_message(SPAN_DANGER("[user] [attack_message] [src]!"))
		user.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [name]</font>")
	else
		log_append_to_last("Armor saved.")
		playsound(loc, 'sound/weapons/slash.ogg', 50, 1, -1)
		occupant_message(SPAN_NOTICE("\The [user]'s attack is stopped by the armor."))
		visible_message(SPAN_NOTICE("\The [user] rebounds off [name]'s armor!"))
		user.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [name]</font>")
	return 1

/obj/mecha/Entered(atom/movable/AM, atom/old_loc, special_event)
	if(MOVED_DROP == special_event)
		dropped_items |= AM
		return ..(AM, old_loc, 0)
	return ..()

/obj/mecha/Exit(atom/movable/AM)
	if(AM in cargo)
		return 0
	return ..()

/obj/mecha/Exited(atom/movable/AM, atom/old_loc, special_event)
	dropped_items -= AM
	return ..()

//////////////////////////////////////////
////////  Mecha global iterators  ////////
//////////////////////////////////////////
/obj/mecha/Process()
	// shitty spacemovement
	do_inertial_movement()
	regulate_temp()
	give_air()
	process_internal_damage()

/obj/mecha/proc/do_inertial_movement()
	if(!inertial_movement)
		return

	anchored = FALSE
	if(!step(src, inertial_movement) || check_for_support() || (thruster && thruster.do_move()))
		inertial_movement = 0
	anchored = TRUE

/obj/mecha/proc/regulate_temp()
	if(hasInternalDamage(MECHA_INT_TEMP_CONTROL))
		return

	if(cabin_air && cabin_air.volume > 0)
		var/delta = cabin_air.temperature - T20C
		cabin_air.temperature -= max(-10, min(10, round(delta/4,0.1)))

/obj/mecha/proc/give_air()
	if(!internal_tank)
		return

	var/datum/gas_mixture/tank_air = internal_tank.return_air()

	var/release_pressure = internal_tank_valve
	var/cabin_pressure = cabin_air.return_pressure()
	var/pressure_delta = min(release_pressure - cabin_pressure, (tank_air.return_pressure() - cabin_pressure)/2)
	var/transfer_moles = 0
	if(pressure_delta > 0) //cabin pressure lower than release pressure
		if(tank_air.temperature > 0)
			transfer_moles = pressure_delta*cabin_air.volume/(cabin_air.temperature * R_IDEAL_GAS_EQUATION)
			var/datum/gas_mixture/removed = tank_air.remove(transfer_moles)
			cabin_air.merge(removed)
	else if(pressure_delta < 0) //cabin pressure higher than release pressure
		var/datum/gas_mixture/t_air = get_turf_air()
		pressure_delta = cabin_pressure - release_pressure
		if(t_air)
			pressure_delta = min(cabin_pressure - t_air.return_pressure(), pressure_delta)
		if(pressure_delta > 0) //if location pressure is lower than cabin pressure
			transfer_moles = pressure_delta*cabin_air.volume/(cabin_air.temperature * R_IDEAL_GAS_EQUATION)
			var/datum/gas_mixture/removed = cabin_air.remove(transfer_moles)
			if(t_air)
				t_air.merge(removed)
			else //just delete the cabin gas, we're in space or some shit
				qdel(removed)

/obj/mecha/proc/process_internal_damage()
	if(!hasInternalDamage())
		return

	if(hasInternalDamage(MECHA_INT_FIRE))
		if(!hasInternalDamage(MECHA_INT_TEMP_CONTROL) && prob(5))
			clearInternalDamage(MECHA_INT_FIRE)
		if(internal_tank)
			if(internal_tank.return_pressure()>internal_tank.maximum_pressure && !(hasInternalDamage(MECHA_INT_TANK_BREACH)))
				setInternalDamage(MECHA_INT_TANK_BREACH)
			var/datum/gas_mixture/int_tank_air = internal_tank.return_air()
			if(int_tank_air && int_tank_air.volume>0) //heat the air_contents
				int_tank_air.temperature = min(6000+T0C, int_tank_air.temperature+rand(10,15))
		if(cabin_air && cabin_air.volume>0)
			cabin_air.temperature = min(6000+T0C, cabin_air.temperature+rand(10,15))
			if(cabin_air.temperature>max_temperature/2)
				take_damage(4/round(max_temperature/cabin_air.temperature,0.1),"fire")

	if(hasInternalDamage(MECHA_INT_TANK_BREACH)) //remove some air from internal tank
		if(internal_tank)
			var/datum/gas_mixture/int_tank_air = internal_tank.return_air()
			var/datum/gas_mixture/leaked_gas = int_tank_air.remove_ratio(0.10)
			if(loc && hascall(loc,"assume_air"))
				loc.assume_air(leaked_gas)
			else
				qdel(leaked_gas)

	if(hasInternalDamage(MECHA_INT_SHORT_CIRCUIT))
		if(get_charge())
			spark_system.start()
			cell.charge -= min(20,cell.charge)
			cell.maxcharge -= min(20,cell.maxcharge)


//Used for generating damaged exosuits.
//This does an individual check for each piece of equipment on the exosuit, and removes it if
//this probability passes a check
/obj/mecha/proc/lose_equipment(probability)
	for(var/obj/item/mecha_parts/mecha_equipment/E in equipment)
		if(prob(probability))
			E.detach(loc)
			qdel(E)

//Does a number of checks at probability, and alters some configuration values if succeeded
/obj/mecha/proc/misconfigure_systems(probability)
	if(prob(probability))
		internal_tank_valve = rand(0,10000) // Screw up the cabin air pressure.
		//This will probably kill the pilot if they dont check it before climbing in

	if(prob(probability))
		use_internal_tank = !use_internal_tank // Flip internal tank mode on or off

	if(prob(probability))
		toggle_lights() // toggle the lights

	if(prob(probability)) // Some settings to screw up the radio
		radio.broadcasting = !radio.broadcasting

	if(prob(probability))
		radio.listening = !radio.listening

	if(prob(probability))
		radio.set_frequency(rand(PUBLIC_LOW_FREQ,PUBLIC_HIGH_FREQ))

	if(prob(probability))
		maint_access = 0 // Disallow maintenance mode
	else
		maint_access = 1 // Explicitly allow maint_access -> Othwerwise we have a stuck mech, as you cant change the state back, if maint_access is 0
		state = 0 // Enable maintenance mode. It won't move.

//Does a random check for each possible type of internal damage, and adds it if it passes
//The probability should be somewhat low unless you just want to saturate it with damage
//Fire is excepted. We're not going to set the exosuit on fire while its in longterm storage
/obj/mecha/proc/random_internal_damage(probability)
	if(prob(probability))
		setInternalDamage(MECHA_INT_TEMP_CONTROL)
	if(prob(probability))
		setInternalDamage(MECHA_INT_SHORT_CIRCUIT)
	if(prob(probability))
		setInternalDamage(MECHA_INT_TANK_BREACH)
	if(prob(probability))
		setInternalDamage(MECHA_INT_CONTROL_LOST)

/obj/mecha/proc/hud_deleted(obj/item/clothing/glasses/hud/source, obj/item/clothing/glasses/hud/placeholder) //2nd arg exists because our signals are outdated
	SIGNAL_HANDLER

	if(hud == source)
		UnregisterSignal(source, COMSIG_HUD_DELETED)
		hud = null

// Helpers for previously subtyped features
/obj/mecha/proc/toggle_defense_mode()
	defense_mode = !defense_mode
	if(defense_mode)
		deflect_chance += defense_mode_boost
		occupant_message(SPAN_NOTICE("You enable [src] defense mode."))
	else
		deflect_chance -= defense_mode_boost
		occupant_message(SPAN_DANGER("You disable [src] defense mode."))
	log_message("Toggled defence mode.")

// Radial UI
/obj/mecha/CtrlClick(mob/living/L)
	if(occupant != L || !istype(L))
		return ..()

	var/list/choices = list("Cancel / No Change" = mutable_appearance(icon = 'icons/mob/screen1.dmi', icon_state = "x2"))
	var/list/choices_to_refs = list()

	for(var/obj/item/mecha_parts/mecha_equipment/MT in equipment)
		if(!MT.selectable || selected == MT)
			continue
		var/mutable_appearance/clean/MA = new(MT)
		choices[MT.name] = MA
		choices_to_refs[MT.name] = MT

	var/choice = show_radial_menu(L, src, choices, radius = 48, custom_check = CALLBACK(src, PROC_REF(check_menu), L))
	if(!check_menu(L) || choice == "Cancel / No Change")
		return

	var/obj/item/mecha_parts/mecha_equipment/new_sel = LAZYACCESS(choices_to_refs, choice)
	if(istype(new_sel))
		selected = new_sel
		occupant_message(SPAN_NOTICE("You switch to [selected]."))
		visible_message("[src] raises [selected]")
		send_byjax(occupant, "exosuit.browser", "eq_list", get_equipment_list())

/obj/mecha/proc/check_menu(mob/living/L)
	if(L != occupant || !istype(L))
		return FALSE
	if(L.incapacitated())
		return FALSE
	return TRUE
