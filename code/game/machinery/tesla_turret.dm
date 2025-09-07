#define TURRET_PRIORITY_TARGET 2
#define TURRET_SECONDARY_TARGET 1
#define TURRET_NOT_TARGET 0

GLOBAL_LIST_INIT(turret_channels, new/list(5))

/datum/turret_network
	var/channel
	var/list/turrets = list()
	var/enabled = FALSE
	var/lethal = FALSE
	var/locked = TRUE
	var/check_arrest = TRUE		//checks if the perp is set to arrest
	var/check_records = TRUE	//checks if a security record exists at all
	var/check_weapons = FALSE	//checks if it can shoot people that have a weapon they aren't authorized to have
	var/check_access = FALSE	//if this is active, the turret shoots everything that does not meet its access requirements
	var/check_anomalies = TRUE	//checks if it can shoot at unidentified lifeforms (ie xenos)
	var/check_synth = FALSE		//if active, will shoot at anything not an AI or cyborg
	var/ailock = FALSE			//Silicons cannot use this
	var/colony_allied_turret = TRUE //If we target friendly to colony critters
	var/list/current_access_list = list(access_moebius, access_robotics, access_security, access_heads)

	var/list/registered_names = list()

/datum/turret_network/proc/update_turrets()
	for(var/obj/machinery/tesla_turret/turret in turrets)
		turret.channel_sync()

/datum/turret_network/New(var/new_channel)
	channel = new_channel
	..()


/obj/machinery/tesla_turret
	name = "Soteria Tesla Coil Turret"
	desc = "An experimental Tesla Coil Turret for point-defense and pest control, developed as Soteria's answer to the Absolute's Obelisks. Bears a Soteria Logo on its central Pylon."
	anchored = TRUE
	density = TRUE
	icon = 'icons/obj/tesla_turret.dmi'
	icon_state = "coil"

	circuit = /obj/item/circuitboard/tesla_turret
	frame_type = FRAME_VERTICAL

	layer = WALL_OBJ_LAYER
	use_power = IDLE_POWER_USE				//this turret uses and requires power
	idle_power_usage = 50		//when inactive, this turret takes up constant 50 Equipment power
	power_channel = STATIC_EQUIP	//drains power from the EQUIPMENT channel

	health = 120			//the turret's health - has more then normal as they do get attacked
	maxHealth = 120		//turrets maximal health.
	var/resistance = RESISTANCE_AVERAGE 		//reduction on incoming damage, were made stronger
	var/locked = TRUE			//if the turret's behaviour control access is locked

	var/damage_cap = 90 // How much damage can the turret do per zap maximum.
	var/power_damage_ratio = 400 // How much power does the machine consume per damage point.

	var/reqpower = 500		//holder for power needed

	var/last_fired = 0		//1: if the turret is cooling down from a shot, 0: turret is ready to fire
	var/shot_delay = 70		//7 seconds between each shot by default, made better with parts
	var/damage_mod = 0.7

	/// How far we will fire at mobs from. 6 by default.
	var/firing_range = 6

	// Used to not target allied mobs
	var/colony_allied_turret = FALSE //Are we allied with the colony?
	var/lethal = FALSE
	var/check_arrest = FALSE	//checks if the perp is set to arrest
	var/check_records = FALSE	//checks if a security record exists at all
	var/check_weapons = FALSE	//checks if it can shoot people that have a weapon they aren't authorized to have
	var/check_access = FALSE	//if this is active, the turret shoots everything that does not meet the access requirements
	var/check_ids = FALSE		//if this is active, the turret shoots everything that does have a valid ID.
	var/check_anomalies = FALSE	//checks if it can shoot at unidentified lifeforms (ie xenos)
	var/check_synth	= FALSE 	//if active, will shoot at anything not an AI or cyborg
	var/ailock = FALSE 			// AI cannot use this

	var/enabled = TRUE				//determines if the turret is on
	var/disabled = FALSE

	var/datum/effect/effect/system/spark_spread/spark_system	//the spark system, used for generating... sparks?

	var/wrenching = FALSE
	var/last_target					//last target fired at, prevents turrets from erratically firing at all valid targets in range

	var/hackfail = FALSE				//if the turret has gotten pissed at someone who tried to hack it, but failed, it will immediately reactivate and target them.
	var/overridden = FALSE				//if the security override is 0, security protocols are on. if 1, protocols are broken.

	var/datum/turret_network/shock_net

	var/obj/machinery/power/apc/apc

/obj/machinery/tesla_turret/New()
	..()
	LAZYNULL(req_access)

	//Sets up a spark system
	spark_system = new /datum/effect/effect/system/spark_spread
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	//Get the turret network, default to channel 1, create the channel if it does not already exist
	if(!GLOB.turret_channels[1])
		shock_net = new /datum/turret_network(1)
		GLOB.turret_channels[1] = shock_net
	else
		shock_net = GLOB.turret_channels[1]
	shock_net.turrets += src
	channel_sync()

	//Includes the Tesla Turret in the running for an individual objective
	var/area/A = get_area(src)
	LEGACY_SEND_SIGNAL(A, COMSIG_TURRENT, src)

	//Now we fuck around with power and find out
	update_power_use()
	apc = current_power_area?.apc

/obj/machinery/tesla_turret/Destroy()
	qdel(spark_system)
	spark_system = null
	shock_net.turrets.Remove(src)
	density = FALSE
	. = ..()

/obj/machinery/tesla_turret/update_icon()
	if(stat & BROKEN)
		icon_state = "coil_broken"
		set_light(0)
	else if(powered() && enabled)
		icon_state = "coil_active"
		set_light(3)
	else
		icon_state = "coil"
		set_light(0)

/obj/machinery/tesla_turret/proc/isLocked(mob/user)
	if(ailock && issilicon(user))
		to_chat(user, SPAN_NOTICE("There seems to be a firewall preventing you from accessing this device."))
		return TRUE

	if(locked && !issilicon(user))
		to_chat(user, SPAN_NOTICE("Access denied."))
		return TRUE

	return FALSE

/obj/machinery/tesla_turret/attack_hand(mob/user)
	if(!emagged && isLocked(user))
		return

	if(!anchored)
		to_chat(user, SPAN_NOTICE("\The [src] has to be secured first!"))
		return
	nano_ui_interact(user)

/obj/machinery/tesla_turret/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]
	data["channel"] = shock_net.channel
	data["access"] = 1 // What does this one do and can we change it to TRUE? -R4d6
	data["enabled"] = shock_net.enabled
	data["is_lethal"] = TRUE
	data["lethal"] = shock_net.lethal
	var/settings[0]
	settings[++settings.len] = list("category" = "Target Unauthorized Weapons", "setting" = "check_weapons", "value" = shock_net.check_weapons)
	settings[++settings.len] = list("category" = "Target Unidentifiable Threats", "setting" = "check_records", "value" = shock_net.check_records)
	settings[++settings.len] = list("category" = "Target Criminals", "setting" = "check_arrest", "value" = shock_net.check_arrest)
	settings[++settings.len] = list("category" = "Target Unauthorized Colonists", "setting" = "check_access", "value" = shock_net.check_access)
	settings[++settings.len] = list("category" = "Target All Synthetics", "setting" = "check_synth", "value" = shock_net.check_synth)
	settings[++settings.len] = list("category" = "Target Fauna", "setting" = "check_anomalies", "value" = shock_net.check_anomalies)
	settings[++settings.len] = list("category" = "Filter out Colony Members", "setting" = "colony_allied_turret", "value" = shock_net.colony_allied_turret)
	settings[++settings.len] = list("category" = "Toggle AI Access", "setting" = "ailock", "value" = shock_net.ailock)
	data["settings"] = settings

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "tesla_turret_control.tmpl", "Tesla Turret Controls", 500, 300)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/tesla_turret/Topic(href, href_list)
	if(..())
		return TRUE

	if(href_list["command"] && href_list["value"])
		var/value = text2num(href_list["value"])
		switch(href_list["command"])
			if("enable")
				shock_net.enabled = value
			if("lethal")
				shock_net.lethal = value
			if("check_synth")
				shock_net.check_synth = value
			if("check_weapons")
				shock_net.check_weapons = value
			if("check_records")
				shock_net.check_records = value
			if("check_arrest")
				shock_net.check_arrest = value
			if("check_access")
				shock_net.check_access = value
			if("check_anomalies")
				shock_net.check_anomalies = value
			if("colony_allied_turret")
				shock_net.colony_allied_turret = value
			if("ailock")
				shock_net.ailock = value

		playsound(loc, 'sound/machines/machine_switch.ogg', 100, 1)

		shock_net.update_turrets()

		return TRUE


/obj/machinery/tesla_turret/power_change()
	if(powered())
		stat &= ~NOPOWER
		update_icon()
	else
		stat |= NOPOWER
		update_icon()


/obj/machinery/tesla_turret/attackby(obj/item/I, mob/user)

	if(istype(I, /obj/item/card/id)||istype(I, /obj/item/modular_computer))
		var/obj/item/card/id/ID = I.GetIdCard()
		if(allowed(user))
			locked = !locked
			to_chat(user, "<span class='notice'>Controls are now [locked ? "locked" : "unlocked"].</span>")
			updateUsrDialog()
		else if(panel_open)
			shock_net.registered_names += ID.registered_name
			to_chat(user, SPAN_NOTICE("You transfer the card's ID code to the turret's list of targetting exceptions."))
		else
			to_chat(user, SPAN_NOTICE("Access denied."))
		return TRUE

	if (user.a_intent == I_HELP)

		var/list/usable_qualities = list()

		if(!locked)
			usable_qualities.Add(QUALITY_SCREW_DRIVING)

		if(panel_open)
			usable_qualities.Add(QUALITY_WIRE_CUTTING)

		if((stat & BROKEN) || (panel_open && circuit))
			usable_qualities.Add(QUALITY_PRYING)

		if(!enabled && !wrenching && !panel_open && (anchored || !isinspace()))
			usable_qualities.Add(QUALITY_BOLT_TURNING)
		if(health != maxHealth)
			usable_qualities.Add(QUALITY_WELDING)

		usable_qualities.Add(QUALITY_PULSING)

		var/tool_type = I.get_tool_type(user, usable_qualities, src)
		switch(tool_type)
			if(QUALITY_PRYING)
				if(stat & BROKEN)
					//If the turret is destroyed, you can remove it with a crowbar to
					//try and salvage its components
					to_chat(user, SPAN_NOTICE("You begin prying the metal coverings off."))
					if(do_after(user, 20, src))
						if(prob(70))
							to_chat(user, SPAN_NOTICE("You remove the turret and salvage some components."))
							new /obj/item/stack/material/steel(loc, rand(1,8))
							for(var/obj/item/stock_parts/capacitor/salvage_capacitor in component_parts)
								if(prob(50))
									salvage_capacitor.forceMove(loc)
						else
							to_chat(user, SPAN_NOTICE("You remove the turret but did not manage to salvage anything."))
						qdel(src) // qdel
					return TRUE //No whacking the turret with tools on help intent
				else
					if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_HARD, required_stat = STAT_MEC))
						to_chat(user, SPAN_NOTICE("You remove the components of \the [src] with [I]."))
						dismantle()

			if(QUALITY_BOLT_TURNING)
				user.visible_message( \
						"<span class='warning'>[user] begins [anchored ? "un" : ""]securing the turret.</span>", \
						"<span class='notice'>You begin [anchored ? "un" : ""]securing the turret.</span>" \
					)

				wrenching = TRUE
				if(do_after(user, 50, src))
					//This code handles moving the turret around. After all, it's a portable turret!
					if(!anchored)
						playsound(loc, 'sound/items/Ratchet.ogg', 100, 1)
						anchored = TRUE
						update_icon()
						to_chat(user, SPAN_NOTICE("You secure the exterior bolts on the turret."))
						if(disabled)
							spawn(200)
								disabled = FALSE
					else if(anchored)
						if(disabled)
							to_chat(user, SPAN_NOTICE("The turret is still recalibrating. Wait some time before trying to move it."))
							return
						playsound(loc, 'sound/items/Ratchet.ogg', 100, 1)
						anchored = FALSE
						disabled = TRUE
						to_chat(user, SPAN_NOTICE("You unsecure the exterior bolts on the turret."))
						update_icon()
				wrenching = FALSE
				return TRUE //No whacking the turret with tools on help intent

			if(QUALITY_SCREW_DRIVING)
				var/used_sound = panel_open ? 'sound/machines/Custom_screwdriveropen.ogg' :  'sound/machines/Custom_screwdriverclose.ogg'
				if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30, forced_sound = used_sound))
					if(panel_open)
						panel_open = FALSE
						to_chat(user, SPAN_NOTICE("You carefully shut the secondary maintenance hatch and screw it back into place."))
					else
						panel_open = TRUE
						to_chat(user, SPAN_NOTICE("You gently unscrew the seconday maintenance hatch, gaining access to the turret's internal circuitry and debug functions."))
					return TRUE //No whacking the turret with tools on help intent

			if(QUALITY_WIRE_CUTTING)
				if(overridden)
					if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30))
						overridden = FALSE
						shock_net.current_access_list = initial(shock_net.current_access_list)
						shock_net.update_turrets()
						to_chat(user, SPAN_WARNING("You reconnect the turret network's security protocol override."))
				else
					switch(I.use_tool_extended(user, src, WORKTIME_NORMAL, QUALITY_WIRE_CUTTING, FAILCHANCE_VERY_HARD,  required_stat = STAT_MEC))
						if(TOOL_USE_SUCCESS)
							to_chat(user, SPAN_NOTICE("You disconnect the turret network's security protocol override!"))
							overridden = TRUE
							shock_net.current_access_list.Cut()
							shock_net.update_turrets()
						if(TOOL_USE_FAIL)
							user.visible_message(
								SPAN_DANGER("[user] cut the wrong wire and tripped the security protocol on the [src]! Run!"),
								SPAN_DANGER("You accidentally cut the wrong wire, tripping the security protocol! Run!")
							)
							enabled = TRUE
							hackfail = TRUE
							sleep(300)
							hackfail = FALSE
				return TRUE //No whacking the turret with tools on help intent

			if(QUALITY_PULSING)
				if(panel_open)
					if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_PULSING, FAILCHANCE_NORMAL,  required_stat = STAT_COG))
						shock_net.registered_names.Cut()
						shock_net.registered_names = list()
						to_chat(user, SPAN_NOTICE("You access the debug board and reset the turret network's access list."))
						return TRUE //No whacking the turret with tools on help intent
				else
					if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30))
						shock_net.turrets -= src
						var/new_channel_num = (shock_net.channel > 4) ? 1 : (shock_net.channel +1)

						if(!GLOB.turret_channels[new_channel_num])
							shock_net = new /datum/turret_network(1)
							GLOB.turret_channels[new_channel_num] = shock_net
						else
							shock_net = GLOB.turret_channels[new_channel_num]
						shock_net.turrets += src
						channel_sync()

			if(QUALITY_WELDING)
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
					health = min(health+40, maxHealth)
					user.visible_message(SPAN_NOTICE("\The [user] repairs the tesla turret."), SPAN_NOTICE("You repair the tesla turret."))

			if(ABORT_CHECK)
				return

	else if(QUALITY_PULSING in I.tool_qualities && user.a_intent != I_HURT)
		if(I.use_tool(user, src, WORKTIME_LONG, QUALITY_PULSING, FAILCHANCE_HARD,  required_stat = STAT_COG))
			if((TOOL_USE_SUCCESS) && (isLocked(user)))
				locked = FALSE
				to_chat(user, SPAN_NOTICE("You manage to hack the ID reader, unlocking the access panel with a satisfying click."))
				updateUsrDialog()
			else if((TOOL_USE_SUCCESS) && (!isLocked(user)))
				locked = TRUE
				to_chat(user, SPAN_NOTICE("You manage to hack the ID reader and the access panel's locking lugs snap shut."))
				updateUsrDialog()
			else if((TOOL_USE_FAIL) && (!overridden) && (min(prob(35 - STAT_COG), 5)))
				enabled = TRUE
				hackfail = TRUE
				user.visible_message(
					SPAN_DANGER("[user] tripped the security protocol on the [src]! Run!"),
					SPAN_DANGER("You trip the security protocol! Run!")
				)
				sleep(300)
				hackfail = FALSE
			else
				to_chat(user, SPAN_WARNING("You fail to hack the ID reader, but avoid tripping the security protocol."))
			return TRUE //No whacking the turret with tools on help intent


	else if (!(I.flags & NOBLUDGEON) && I.force && !(stat & BROKEN))
		//if the turret was attacked with the intention of harming it:
		user.do_attack_animation(src)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

		if (take_damage(I.force * I.structure_damage_factor))
			playsound(src, 'sound/weapons/smash.ogg', 70, 1)
		else
			playsound(src, 'sound/weapons/Genhit.ogg', 25, 1)

		return TRUE
	..()

/obj/machinery/tesla_turret/RefreshParts()
	shot_delay = initial(shot_delay)
	damage_mod = initial(damage_mod)
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		shot_delay -= min((C.rating * 15), 60)

	for(var/obj/item/stock_parts/smes_coil/coil in component_parts)
		damage_mod += (coil.rating * 0.1)

/obj/machinery/tesla_turret/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		//Emagging the turret makes it go bonkers and stun everyone. It also makes
		//the turret shoot much, much faster.
		to_chat(user, SPAN_WARNING("You short out the turret network's id recognition."))
		visible_message("[src] hums oddly...")
		emagged = TRUE
		locked = FALSE
		enabled = FALSE //turns off the turret temporarily
		spawn(60) //6 seconds for the contractor to gtfo of the area before the turret decides to ruin his shit
			enabled = TRUE //turns it back on.
		return TRUE

/obj/machinery/tesla_turret/proc/take_damage(var/force)
	force -= resistance
	if (force <= 0)
		return FALSE

	. = TRUE //Some damage was done
	health -= force
	if (force > 5 && prob(45))
		spark_system.start()
	if(health <= 0)
		die()	//the death process :(

/obj/machinery/tesla_turret/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(!damage)
		return 0
	attack_animation(user)
	take_damage(damage)

/obj/machinery/tesla_turret/bullet_act(obj/item/projectile/Proj)
	var/damage = Proj.get_structure_damage()

	if(!damage)
		if(istype(Proj, /obj/item/projectile/ion))
			Proj.on_hit(loc)
		return

	..()

	if (!(Proj.testing))
		take_damage(damage*Proj.structure_damage_factor)


/obj/machinery/tesla_turret/ex_act(severity)
	switch (severity)
		if (1)
			take_damage(rand(140,300))
		if (2)
			take_damage(rand(80,170))
		if (3)
			take_damage(rand(50,120))

/obj/machinery/tesla_turret/proc/die()	//called when the turret dies, ie, health <= 0
	health = 0
	stat |= BROKEN	//enables the BROKEN bit
	spark_system.start()	//creates some sparks because they look cool
	update_icon()

/obj/machinery/tesla_turret/Process()
	//the main machinery process

	if(stat & (NOPOWER|BROKEN))
		last_target = null
		return

	if(!enabled)
		last_target = null
		return

	var/list/targets = list()			//list of primary targets
	var/list/secondarytargets = list()	//targets that are least important

	for(var/mob/living/M in view(firing_range, src)) //WE USED WORLD.VIEW BEFORE THATS FUCKING PSYCHOPATHIC
		assess_and_assign(M, targets, secondarytargets) //might want to not use a proc due to proc overhead cost

	for(var/atom/A in GLOB.mechas_list)
		if (A.z == z && (get_dist(A, src) < firing_range) && can_see(src, A, firing_range))
			var/obj/mecha/mech = A
			var/mob/living/occupant = mech.get_mob()
			if (occupant)
				assess_and_assign(occupant, targets, secondarytargets)

	if(!tryToShootAt(targets))
		tryToShootAt(secondarytargets) // if no valid targets, go for secondary targets

/obj/machinery/tesla_turret/proc/assess_and_assign(var/mob/living/L, var/list/targets, var/list/secondarytargets)
	switch(assess_living(L))
		if(TURRET_PRIORITY_TARGET)
			targets += L
		if(TURRET_SECONDARY_TARGET)
			secondarytargets += L

/obj/machinery/tesla_turret/proc/assess_living(var/mob/living/L)
	if(!L) // If there's no one to shoot
		return TURRET_NOT_TARGET

	if(!istype(L)) // If it's somehow not a living mob
		return TURRET_NOT_TARGET

	var/obj/item/card/id/id_card = L.GetIdCard() // Copy the target's ID card
	if(id_card && (id_card.registered_name in shock_net.registered_names)) // Check their access
		return TURRET_NOT_TARGET

	if(L.invisibility >= INVISIBILITY_LEVEL_ONE) // Cannot see him. see_invisible is a mob-var
		return TURRET_NOT_TARGET

	if(L.stat)		//if the perp is dead/dying, no need to bother really
		return TURRET_NOT_TARGET	//move onto next potential victim!

	if(get_dist(src, L) > firing_range)	//if it's too far away, why bother?
		return TURRET_NOT_TARGET

	if(colony_allied_turret && L.colony_friend) //Dont target colony pets if were allied with them
		return TURRET_NOT_TARGET

	if(!colony_allied_turret && !L.colony_friend) //If were not allied to the colony we dont attack anything thats against the colony
		return TURRET_NOT_TARGET

	if(colony_allied_turret ^ L.colony_friend) //If were allied with the colony and we attack things that are not are pets
		return TURRET_SECONDARY_TARGET

	if(issilicon(L))
		if(check_synth) // Destroy all impure inhumane detestable irredeemable robots.
			return TURRET_PRIORITY_TARGET
		else
			return TURRET_NOT_TARGET

	if(!check_trajectory(L, src))	//check if we have true line of sight
		return TURRET_NOT_TARGET

	if(hackfail) // Did someone attempted to hack the turret?
		return TURRET_PRIORITY_TARGET

	if(lethal && locate(/mob/living/silicon/ai) in get_turf(L))		//don't accidentally kill the AI!
		return TURRET_NOT_TARGET

	if(isanimal(L) || issmall(L)) // Animals are not so dangerous
		if(colony_allied_turret && L.colony_friend)
			return TURRET_NOT_TARGET
		else
			return check_anomalies ? TURRET_SECONDARY_TARGET : TURRET_NOT_TARGET


	if(ishuman(L))	//if the target is a human, analyze threat level
		if(assess_perp(L) < 4)
			return TURRET_NOT_TARGET	//if threat level < 4, keep going

	if(L.lying)		//if the perp is lying down, it's still a target but a less-important target
		return lethal ? TURRET_SECONDARY_TARGET : TURRET_NOT_TARGET

	return TURRET_PRIORITY_TARGET	//if the perp has passed all previous tests, congrats, it is now a "shoot-me!" nominee

/obj/machinery/tesla_turret/proc/assess_perp(var/mob/living/carbon/human/H)
	if(!H || !istype(H))
		return FALSE
	return H.assess_perp(src, check_access, check_weapons, check_records, check_arrest)

/obj/machinery/tesla_turret/proc/tryToShootAt(var/list/mob/living/targets)
	if(targets.len && last_target && (last_target in targets) && target(last_target))
		return TRUE

	while(targets.len > 0)
		var/mob/living/M = pick(targets)
		targets -= M
		if(target(M))
			return TRUE



/obj/machinery/tesla_turret/proc/target(var/mob/living/target)
	if(disabled)
		return
	if(target)
		last_target = target
		zap(target)
		return TRUE
	return

/obj/machinery/tesla_turret/proc/channel_sync()
	enabled = shock_net.enabled
	lethal = shock_net.lethal
	check_synth = shock_net.check_synth
	check_access = shock_net.check_access
	check_records = shock_net.check_records
	check_arrest = shock_net.check_arrest
	check_weapons = shock_net.check_weapons
	check_anomalies = shock_net.check_anomalies
	ailock = shock_net.ailock
	colony_allied_turret = shock_net.colony_allied_turret

	req_one_access = shock_net.current_access_list


	src.power_change()

/obj/machinery/tesla_turret/proc/zap(mob/living/target)
	if(!apc || !apc.terminal || !apc.terminal.powernet)
		return
	if(last_fired)	//prevents rapid-fire shooting
		return
	last_fired = TRUE
	spawn()
		sleep(shot_delay+rand(0,20))
		last_fired = FALSE

	var/power = min(apc.terminal.powernet.avail*0.25, damage_cap * power_damage_ratio)
	//message_admins("Tesla Turret Power:[power]| apc.terminal.powernet.avail [apc.terminal.powernet.avail]")

	if(power <= 0)
		return

	apc.terminal.powernet.draw_power(power)
	playsound(src, 'sound/effects/lightningshock.ogg', 100, 1, extrarange = 5)

	// The actual Zap
	src.Beam(target, icon_state="lightning[rand(1,12)]", time=5, maxdistance = INFINITY)
	var/zapdir = get_dir(src, target)
	if(zapdir)
		. = zapdir

	var/shock_damage = CLAMP(round((power/400)*damage_mod), 10, 90) + rand(-5, 5)
	if(ishuman(target))
		target.electrocute_act(shock_damage, src, 1, ran_zone())
	else
		target.electrocute_act(shock_damage, src)
	log_game("Tesla Turret([src.x],[src.y],[src.z]) shocked [key_name(target)] for [shock_damage]dmg.")
	//message_admins("Tesla Turret([src.x],[src.y],[src.z]) zapped [key_name_admin(target)] for [shock_damage]dmg!") - In case this needs testing Trilby
	if(issilicon(target))
		var/mob/living/silicon/S = target
		S.emp_act(3 /*EMP_LIGHT*/)


#undef TURRET_PRIORITY_TARGET
#undef TURRET_SECONDARY_TARGET
#undef TURRET_NOT_TARGET
