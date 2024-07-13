//DO NOT ADD MECHA PARTS TO THE GAME WITH THE DEFAULT "SPRITE ME" SPRITE!
//I'm annoyed I even have to tell you this! SPRITE FIRST, then commit.

// Sprites mostly by - totallynotdedawa2

/obj/item/mecha_parts/mecha_equipment
	name = "mecha equipment"
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_equip"
	force = 10
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MATERIAL_STEEL = 20)
	var/equip_cooldown = 0 //time between 'uses'
	var/equip_ready = 1
	var/energy_drain = 0 //Duh. How much energy is used per shot.
	var/obj/mecha/chassis = null
	var/range = MECHA_MELEE //bitflags
	var/salvageable = 1
	var/selectable = 1	// Set to 0 for passive equipment such as mining scanner or armor plates
	var/required_type = /obj/mecha //may be either a type or a list of allowed types
	var/harmful = 1 //for those tools that you cannot smack people with but still need to click on them to use, aka sleepers
	embed_mult = 0 // Mech mounted equipment, shouldn't ever embed
	var/destroy_sound = 'sound/mecha/critdestr.ogg'

/obj/item/mecha_parts/mecha_equipment/Initialize()
	// Process will kick this off if not used
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/mecha_parts/mecha_equipment/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(chassis)
		chassis.equipment -= src
		listclearnulls(chassis.equipment)
		if(chassis.selected == src)
			chassis.selected = null
		update_chassis_page()
		chassis = null
	return ..()

/obj/item/mecha_parts/mecha_equipment/proc/update_chassis_page()
	if(chassis)
		send_byjax(chassis.occupant, "exosuit.browser", "eq_list", chassis.get_equipment_list())
		send_byjax(chassis.occupant, "exosuit.browser", "equipment_menu", chassis.get_equipment_menu(), "dropdowns")
		return 1
	return

/obj/item/mecha_parts/mecha_equipment/proc/update_equip_info()
	if(chassis)
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
		return 1
	return

/obj/item/mecha_parts/mecha_equipment/proc/destroy()//missiles detonating, teleporter creating singularity?
	if(chassis)
		chassis.occupant_message(SPAN_DANGER("[src] is destroyed"))
		chassis.log_append_to_last("[src] is destroyed.",1)
		chassis.occupant << sound(destroy_sound, volume = 50)

	qdel(src)

/obj/item/mecha_parts/mecha_equipment/proc/critfail()
	if(chassis)
		log_message("Critical failure", 1)

/obj/item/mecha_parts/mecha_equipment/proc/get_equip_info()
	if(!chassis)
		return
	var/txt = "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;"
	if(chassis.selected == src)
		txt += "<b>[name]</b>"
	else if(selectable)
		txt += "<a href='?src=\ref[chassis];select_equip=\ref[src]'>[name]</a>"
	else
		txt += "[name]"

	return txt

/obj/item/mecha_parts/mecha_equipment/proc/is_ranged()//add a distance restricted equipment. Why not?
	return range & MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/proc/is_melee()
	return range & MECHA_MELEE

/obj/item/mecha_parts/mecha_equipment/proc/action_checks(atom/target)
	if(!target)
		return 0
	if(!chassis)
		return 0
	if(!equip_ready)
		return 0
	if(energy_drain && !chassis.has_charge(energy_drain))
		return 0
	return 1

/obj/item/mecha_parts/mecha_equipment/proc/action(atom/target, mob/living/user)
	if(!chassis) //If you're not in the mech
		to_chat(user, SPAN_DANGER("You cannot use this tool by hand!"))
		return FALSE
	return

/obj/item/mecha_parts/mecha_equipment/proc/attack_object(obj/T, mob/living/user) // To prevent having mechs attacking other mechs accidentally attach their weapons on the opposing mech
	if(istype(T,/obj/mecha))
		var/obj/mecha/M = T
		M.log_message("Attacked by [src]. Attacker - [user]")

		if(M.deflect_hit(is_melee=1))
			to_chat(user, SPAN_DANGER("\The [src] bounces off [M.name]."))
			M.log_append_to_last("Armor saved.")
		else
			M.occupant_message("<font color='red'><b>[user] hits [M] with [src].</b></font>")
			user.visible_message("<font color='red'><b>[user] hits [M] with [src].</b></font>", "<font color='red'><b>You hit [M] with [src].</b></font>")
			M.hit_damage(force, damtype, is_melee=1)
			M.check_for_internal_damage(list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH,MECHA_INT_CONTROL_LOST))
			user.setClickCooldown(equip_cooldown)
			user.do_attack_animation(M)
	else
		T.attackby(src, user)

/obj/item/mecha_parts/mecha_equipment/attack(mob/living/M, mob/living/user, target_zone) // Copy of item_attack code, modified to not take into account user stats or health since the mech's doing all the hard work
	if(!user)
		return FALSE

	if(!force || (flags & NOBLUDGEON))
		return FALSE

	if(!chassis) //If you're not in the mech
		to_chat(user, SPAN_DANGER("You cannot manually use this equipment, it belongs on a mech!"))
		return FALSE

	user.lastattacked = M
	M.lastattacker = user

	if(!no_attack_log) // Entirely for logging purposes
		user.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [M.name] ([M.ckey]) with [name] (INTENT: [uppertext(user.a_intent)]) (DAMTYE: [uppertext(damtype)])</font>"
		M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [user.name] ([user.ckey]) with [name] (INTENT: [uppertext(user.a_intent)]) (DAMTYE: [uppertext(damtype)])</font>"
		msg_admin_attack("[key_name(user)] attacked [key_name(M)] with [name] (INTENT: [uppertext(user.a_intent)]) (DAMTYE: [uppertext(damtype)])" )

	if(user.a_intent == I_HELP) // Checks if you have help intent on
		if(!harmful) // If not a harmful tool (aka, a sleeper)
			action(M, user)
		else
			step_away(M, chassis)
			occupant_message("You push [M] out of the way.")
			chassis.visible_message("[chassis] pushes [M] out of the way.")
	else
		var/hit_zone = M.resolve_item_attack(src, user, target_zone) // Zone targetting
		if(hit_zone)
		//	do_attack_animation(chassis) // TODO - Make mech animation happen
			apply_hit_effect(M, user, hit_zone)

	// Mech equipment delay, not going to use click speed for mechs, I don't think it would be too balanced - Wizard
	user.setClickCooldown(equip_cooldown)

	return TRUE

// Called when a mech's melee weapon is used to make a successful melee attack on a mob. Returns the blocked result
/obj/item/mecha_parts/mecha_equipment/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(hitsound)
		playsound(loc, hitsound, 50, 1, -1)

	if(is_hot() >= HEAT_MOBIGNITE_THRESHOLD)
		target.IgniteMob()

	var/power = force
	if(target.faction in effective_faction) // Is the mob's in our list of factions we're effective against?
		power *= damage_mult // Increase the damage
	target.hit_with_weapon(src, user, power, hit_zone)

/obj/item/mecha_parts/mecha_equipment/proc/start_cooldown()
	set_ready_state(0)
	chassis.use_power(energy_drain)
	addtimer(CALLBACK(src, PROC_REF(set_ready_state), 1), equip_cooldown)

/obj/item/mecha_parts/mecha_equipment/proc/do_after_cooldown(atom/target)
	if(!chassis)
		return FALSE
	var/C = chassis.loc
	set_ready_state(0)
	chassis.use_power(energy_drain)
	. = do_after(chassis.occupant, equip_cooldown, target = target)
	set_ready_state(1)
	if(!chassis || chassis.loc != C || src != chassis.selected || !(get_dir(chassis, target) & chassis.dir))
		return FALSE

/obj/item/mecha_parts/mecha_equipment/proc/do_after_mecha(atom/target, delay)
	if(!chassis)
		return FALSE
	var/C = chassis.loc
	. = do_after(chassis.occupant, delay, target = target)
	if(!chassis || 	chassis.loc != C || src != chassis.selected || !(get_dir(chassis, target) & chassis.dir))
		return FALSE

/obj/item/mecha_parts/mecha_equipment/proc/can_attach(obj/mecha/M)
	if(M.equipment.len >= M.max_equip)
		return 0

	if(ispath(required_type))
		return istype(M, required_type)

	for(var/path in required_type)
		if(istype(M, path))
			return 1

	return 0

/obj/item/mecha_parts/mecha_equipment/proc/attach(obj/mecha/M)
	M.equipment += src
	chassis = M
	loc = M
	M.log_message("[src] initialized.")
	if(!M.selected)
		M.selected = src
	update_chassis_page()

/obj/item/mecha_parts/mecha_equipment/proc/detach(atom/moveto=null)
	moveto = moveto || get_turf(chassis)
	if(Move(moveto))
		chassis.equipment -= src
		if(chassis.selected == src)
			chassis.selected = null
		update_chassis_page()
		chassis.log_message("[src] removed from equipment.")
		chassis = null
		set_ready_state(1)


/obj/item/mecha_parts/mecha_equipment/Topic(href, href_list)
	. = ..()
	if(href_list["detach"])
		detach()

/obj/item/mecha_parts/mecha_equipment/proc/set_ready_state(state)
	equip_ready = state
	if(chassis)
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())

/obj/item/mecha_parts/mecha_equipment/proc/occupant_message(message)
	if(chassis)
		chassis.occupant_message("\icon[src] [message]")

/obj/item/mecha_parts/mecha_equipment/proc/log_message(message)
	if(chassis)
		chassis.log_message("<i>[src]:</i> [message]")
