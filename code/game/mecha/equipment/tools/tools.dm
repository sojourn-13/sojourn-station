/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/teleporter
 * /obj/item/mecha_parts/mecha_equipment/wormhole_generator
 * /obj/item/mecha_parts/mecha_equipment/gravcatapult
 */

/obj/item/mecha_parts/mecha_equipment/teleporter
	name = "teleporter"
	desc = "An exosuit module that allows exosuits to teleport to any position in view."
	icon_state = "mecha_teleport"
	origin_tech = list(TECH_BLUESPACE = 6)
	equip_cooldown = 150
	energy_drain = 1000
	range = MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/teleporter/action(atom/target)
	if(!action_checks(target))
		return
	var/turf/T = get_turf(target)
	if(T)
		start_cooldown()
		do_teleport(chassis, T, 4)


/obj/item/mecha_parts/mecha_equipment/wormhole_generator
	name = "wormhole generator"
	desc = "An exosuit module that allows generating of small quasi-stable wormholes."
	icon_state = "mecha_wholegen"
	origin_tech = list(TECH_BLUESPACE = 3)
	equip_cooldown = 50
	energy_drain = 300
	range = MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/wormhole_generator/action(atom/target)
	if(!action_checks(target))
		return
	var/list/theareas = list()
	for(var/area/AR in orange(100, chassis))
		if(AR in theareas) continue
		theareas += AR
	if(!theareas.len)
		return
	var/area/thearea = pick(theareas)
	var/list/L = list()
	var/turf/pos = get_turf(src)
	for(var/turf/T in get_area_turfs(thearea.type))
		if(!T.density && pos.z == T.z)
			var/clear = 1
			for(var/obj/O in T)
				if(O.density)
					clear = 0
					break
			if(clear)
				L+=T
	if(!L.len)
		return
	var/turf/target_turf = pick(L)
	if(!target_turf)
		return
	start_cooldown()
	new /obj/effect/portal/wormhole(get_turf(target), rand(150, 300), target_turf)

/obj/item/mecha_parts/mecha_equipment/gravcatapult
	name = "gravitational catapult"
	desc = "An exosuit mounted Gravitational Catapult."
	icon_state = "mecha_teleport"
	origin_tech = list(TECH_BLUESPACE = 2, TECH_MAGNET = 3)
	equip_cooldown = 10
	energy_drain = 100
	range = MECHA_MELEE|MECHA_RANGED
	harmful = 0
	var/atom/movable/locked
	var/mode = 1 //1 - gravsling 2 - gravpush

	var/last_fired = 0  //Concept stolen from guns.
	var/fire_delay = 10 //Used to prevent spam-brute against humans.

/obj/item/mecha_parts/mecha_equipment/gravcatapult/action(atom/movable/target)
	if(world.time >= last_fired + fire_delay)
		last_fired = world.time
	else
		if(world.time % 3)
			occupant_message(SPAN_WARNING("[src] is not ready to fire again!"))
		return 0

	switch(mode)
		if(1)
			if(!action_checks(target) && !locked)
				return
			if(!locked)
				if(!istype(target) || target.anchored)
					occupant_message("Unable to lock on [target]")
					return
				locked = target
				occupant_message("Locked on [target]")
				send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
				return
			else if(target!=locked)
				if(locked in view(chassis))
					locked.throw_at(target, 14, 1.5, chassis)
					locked = null
					send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
					start_cooldown()
				else
					locked = null
					occupant_message("Lock on [locked] disengaged.")
					send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
		if(2)
			if(!action_checks(target))
				return
			var/list/atoms = list()
			if(isturf(target))
				atoms = range(target,3)
			else
				atoms = orange(target,3)
			for(var/atom/movable/A in atoms)
				if(A.anchored)
					continue
				spawn(0)
					var/iter = 5 - get_dist(A,target)
					for(var/i = 0 to iter)
						step_away(A,target)
						sleep(2)
			start_cooldown()

/obj/item/mecha_parts/mecha_equipment/gravcatapult/get_equip_info()
	return "[..()] [mode==1?"([locked||"Nothing"])":null] \[<a href='?src=\ref[src];mode=1'>S</a>|<a href='?src=\ref[src];mode=2'>P</a>\]"

/obj/item/mecha_parts/mecha_equipment/gravcatapult/Topic(href, href_list)
	. = ..()
	if(href_list["mode"])
		mode = text2num(href_list["mode"])
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
