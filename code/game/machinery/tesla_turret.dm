/*
Defensive Tesla Coil Turret: Defensive machinery built into tall frame, obligatorily on top of cable connected to powernet.
Comes with lockable by TMs panel which allows for selection of targets: animals, silicons, humans (depending on ID).
Will blast electricity at any target within 5 tiles radius matching criteria chosen.
*/

#define HUMAN /mob/living/carbon/human
#define SILICON /mob/living/silicon
#define SUPERIOR_ANIMAL /mob/living/carbon/superior_animal
#define SIMPLE_ANIMAL /mob/living/simple_animal

/obj/machinery/power/tesla_turret
	name = "Defensive Tesla Coil Turret"
	desc = ""
	anchored = FALSE
	density = TRUE
	icon = 'icons/obj/tesla_turret.dmi'
	icon_state = "coil"
	circuit = /obj/item/weapon/circuitboard/tesla_turret
	frame_type = FRAME_VERTICAL
	var/active = FALSE
	var/locked = FALSE
	var/zap_cooldown = 100
	var/last_zap = 0
	var/list/possible_targets = list(HUMAN, SILICON, SIMPLE_ANIMAL, SUPERIOR_ANIMAL)
	var/current_target = null

/obj/machinery/power/tesla_turret/anchored
	anchored = TRUE

/obj/machinery/power/tesla_turret/Initialize()
	..()
	if(anchored)
		connect_to_network()

/obj/machinery/power/tesla_turret/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The turret is [active ? "on" : "off"].")) // Is the generator on?

/obj/machinery/power/tesla_turret/attackby(obj/item/weapon/W, mob/user)

	if(default_deconstruction(W, user))
		return

	if(default_part_replacement(W, user))
		return

	if(istype(W, /obj/item/weapon/card/id))
		var/obj/item/weapon/card/id/C = W // New var to use ID-only vars.
		if(!access_construction in C.access)
			to_chat(user, "You do not have the required access to lock the turret.")
			return
		user.visible_message(
							SPAN_NOTICE("[user] [locked ? "un" : ""]lock the [src.name]."),
							SPAN_NOTICE("You [locked ? "un" : ""]lock the [src.name].")
							)
		locked = !locked
		return

	if(active)
		to_chat(user, SPAN_NOTICE("You can't work with [src] while its running!"))
	else
		var/list/usable_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING)
		var/tool_type = W.get_tool_type(user, usable_qualities, src)
		switch(tool_type)
			if(QUALITY_BOLT_TURNING)
				if(istype(get_turf(src), /turf/space) && !anchored)
					to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
					return
				if(W.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You [anchored ? "un" : ""]anchor the brace with [W]."))
					anchored = !anchored
					if(anchored)
						connect_to_network()
					else
						disconnect_from_network()
					return
			if(QUALITY_PULSING)
				if(locked)
					to_chat(user, SPAN_NOTICE("The [src.name]'s panel is locked."))
					return
				current_target = input(usr, "What do you want the turret to target?", ANIMAL) as null|anything in possible_targets

			if(ABORT_CHECK)
				return

	..()

/obj/machinery/power/tesla_turret/RefreshParts()
	zap_cooldown = initial(zap_cooldown)
	for(var/obj/item/weapon/stock_parts/capacitor/C in component_parts)
		zap_cooldown -= (C.rating * 15)

/obj/machinery/power/tesla_turret/attack_hand(mob/user)
	..()
	if (!anchored)
		to_chat(user, SPAN_NOTICE("Anchor the [src.name] first!"))
		return
	SwitchOnOff(user) // Switch the generator on or off

/obj/machinery/power/tesla_turret/proc/SwitchOnOff(mob/user)
	active = !active // Switch the generator either on or off.
	user.visible_message(
							SPAN_NOTICE("[user] turn the [src.name] [active ? "on" : "off"]."),
							SPAN_NOTICE("You turn the [src.name] [active ? "on" : "off"].")
							)
	update_icon()

/obj/machinery/power/tesla_turret/Process()
	..()
	if(active)
		for(var/mob/M in view(5, src))
			if(istype(M, current_target))
				zap(M)

/obj/machinery/power/tesla_turret/update_icon()
	..()
	if(active)
		icon_state = "coil_active"
	else
		icon_state = "coil"


/obj/machinery/power/tesla_turret/proc/zap(mob/living/target)
	if((last_zap + zap_cooldown) > world.time || !powernet)
		return FALSE
	last_zap = world.time
	var/power = (powernet.avail/2)
	draw_power(power)
	playsound(src, 'sound/effects/lightningshock.ogg', 100, 1, extrarange = 5)

	// The actual Zap
	src.Beam(target, icon_state="lightning[rand(1,12)]", time=5, maxdistance = INFINITY)
	var/zapdir = get_dir(src, target)
	if(zapdir)
		. = zapdir

	var/shock_damage = CLAMP(round(power/400), 10, 90) + rand(-5, 5)
	target.electrocute_act(shock_damage, src)
	log_game("Tesla Turret([src.x],[src.y],[src.z]) shocked [key_name(target)] for [shock_damage]dmg.")
	message_admins("Tesla Turret([src.x],[src.y],[src.z]) zapped [key_name_admin(target)] for [shock_damage]dmg!")
	if(issilicon(target))
		var/mob/living/silicon/S = target
		S.emp_act(3 /*EMP_LIGHT*/)


#undef HUMAN
#undef SILICON
#undef SUPERIOR_ANIMAL
#undef SIMPLE_ANIMAL
