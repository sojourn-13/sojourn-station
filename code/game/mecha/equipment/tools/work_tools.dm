/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/tool
 * /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
 * /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/safety_clamp
 * /obj/item/mecha_parts/mecha_equipment/tool/extinguisher
 * /obj/item/mecha_parts/mecha_equipment/tool/rcd
 * /obj/item/mecha_parts/mecha_equipment/tool/cable_layer
 *
 */

/obj/item/mecha_parts/mecha_equipment/tool
	matter = list(MATERIAL_STEEL = 15)

/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	name = "hydraulic clamp"
	icon_state = "mecha_clamp"
	equip_cooldown = 15
	energy_drain = 10
	tool_qualities = list(QUALITY_CLAMPING = 5,  QUALITY_HAMMERING = 30, QUALITY_PRYING = 30, QUALITY_BOLT_TURNING = 20, QUALITY_EXCAVATION = 20, QUALITY_SHOVELING = 30) // This is a literal industrial clamp
	force = 20
	armor_divisor = ARMOR_PEN_SHALLOW
	var/obj/mecha/cargo_holder
	var/can_load_living = FALSE

/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/can_attach(obj/mecha/M)
	if(M.cargo_capacity == 0)
		return FALSE
	. = ..()

/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/attach(obj/mecha/M)
	. = ..()
	cargo_holder = M

/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/action(atom/A, mob/living/user) // fancy non attackby interactions
	if(!action_checks(A))
		return
	if(!cargo_holder)
		return

	//clamp loading code
	if(isobj(A)) //if it's not an object, don't even bother loading, none of the code beyond here will work with non objects
		var/obj/T = A
		if(T.buckled_mob)
			return
		if(!can_load_living && locate(/mob/living) in T)
			occupant_message(SPAN_WARNING("You can't load living things into the cargo compartment."))
			return
		if(istype(T, /obj/structure/scrap))
			occupant_message(SPAN_NOTICE("[chassis] begins compressing [T] with [src]."))
			if(do_after_cooldown(T))
				if(istype(T, /obj/structure/scrap))
					var/obj/structure/scrap/S = T
					S.make_cube()
					occupant_message(SPAN_NOTICE("[chassis] compresses [T] into a cube with [src]."))
			return
		if(T.anchored && !istype(T, /obj/structure/salvageable))
			attack_object(T, user)
			return
		if(cargo_holder.cargo.len >= cargo_holder.cargo_capacity)
			occupant_message(SPAN_WARNING("Not enough room in cargo compartment."))
			return
		if(user.a_intent == I_HELP) // So, if we want to do something stupid like searching a trash pile or hitting a locker, we can on non help intent
			occupant_message("You lift [T] and start to load it into cargo compartment.")
			playsound(src, 'sound/mecha/hydraulic.ogg',100,1)
			chassis.visible_message("[chassis] lifts [T] and starts to load it into cargo compartment.")
			var/anchor_state_before_load = T.anchored
			T.anchored = TRUE
			if(!do_after_cooldown(T))
				occupant_message(SPAN_WARNING("You must hold still while handling objects."))
				T.anchored = anchor_state_before_load
				return
			cargo_holder.cargo += T
			T.forceMove(chassis)
			T.anchored = FALSE
			occupant_message(SPAN_NOTICE("[T] succesfully loaded."))
			log_message("Loaded [T]. Cargo compartment capacity: [cargo_holder.cargo_capacity - cargo_holder.cargo.len]")
			return
	attack_object(A, user) // If none of these has come to pass, we do normal item interactions

//This is pretty much just for the death-ripley so that it is harmless / MY BROTHER IN CHRIST IT DOES 90 DAMAGE WHAT DO YOU MEAN
/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/safety_clamp
	name = "\improper KILL CLAMP"
	energy_drain = 0
	force = 90 //Lmao, the mech sword deals 60
	armor_divisor = ARMOR_PEN_EXTREME //This thing is hilarious, I'm just adding to it
	can_load_living = TRUE

/obj/item/mecha_parts/mecha_equipment/tool/extinguisher
	name = "extinguisher"
	desc = "Exosuit-mounted extinguisher (Can be attached to: Engineering exosuits)"
	icon_state = "mecha_exting"
	equip_cooldown = 5
	energy_drain = 0
	range = MECHA_MELEE|MECHA_RANGED
	required_type = /obj/mecha/working
	price_tag = 100
	harmful = 0 // to extinguish people
	var/spray_particles = 5
	var/spray_amount = 5	//units of liquid per particle. 5 is enough to wet the floor - it's a big fire extinguisher, so should be fine
	var/max_water = 1000

/obj/item/mecha_parts/mecha_equipment/tool/extinguisher/New()
	. = ..()
	create_reagents(max_water)
	reagents.add_reagent("water", max_water)

/obj/item/mecha_parts/mecha_equipment/tool/extinguisher/action(atom/target) //copypasted from extinguisher. TODO: Rewrite from scratch.
	if(!action_checks(target))
		return
	if(get_dist(chassis, target) > 2)
		return
	if(do_after_cooldown(target))
		if(istype(target, /obj/structure/reagent_dispensers/watertank) && get_dist(chassis,target) <= 1)
			var/obj/o = target
			var/amount = o.reagents.trans_to_obj(src, 200)
			occupant_message(SPAN_NOTICE("[amount] units transferred into internal tank."))
			playsound(chassis, 'sound/effects/refill.ogg', 50, 1, -6)
			return

		if(reagents.total_volume < 1)
			occupant_message(SPAN_WARNING("[src] is empty."))
			return

		playsound(chassis, 'sound/effects/extinguish.ogg', 75, 1, -3)

		var/direction = get_dir(chassis,target)

		var/turf/T = get_turf(target)
		var/turf/T1 = get_step(T,turn(direction, 90))
		var/turf/T2 = get_step(T,turn(direction, -90))

		var/list/the_targets = list(T,T1,T2)

		for(var/a = 1 to 5)
			spawn(0)
				var/obj/effect/effect/water/W = new(get_turf(chassis))
				var/turf/my_target
				if(a == 1)
					my_target = T
				else if(a == 2)
					my_target = T1
				else if(a == 3)
					my_target = T2
				else
					my_target = pick(the_targets)
				W.create_reagents(5)
				if(!W || !src)
					return
				reagents.trans_to_obj(W, spray_amount)
				W.set_color()
				W.set_up(my_target)
		return 1

/obj/item/mecha_parts/mecha_equipment/tool/extinguisher/get_equip_info()
	return "[..()] \[[reagents.total_volume]\]"

/obj/item/mecha_parts/mecha_equipment/tool/extinguisher/on_reagent_change()
	return


/obj/item/mecha_parts/mecha_equipment/tool/rcd
	name = "mounted RCD"
	desc = "An exosuit-mounted Rapid Construction Device. (Can be attached to: Any exosuit)"
	icon_state = "mecha_rcd"
	origin_tech = list(TECH_MATERIAL = 4, TECH_BLUESPACE = 3, TECH_MAGNET = 4, TECH_POWER = 4)
	equip_cooldown = 10
	energy_drain = 250
	range = MECHA_MELEE|MECHA_RANGED
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASMA = 15, MATERIAL_URANIUM = 15)
	price_tag = 1500
	var/mode = 0 //0 - deconstruct, 1 - wall or floor, 2 - airlock.
	var/disabled = 0 //malf

/obj/item/mecha_parts/mecha_equipment/tool/rcd/action(atom/target)
	if(istype(target,/area/shuttle)||istype(target, /turf/space/transit))//>implying these are ever made -Sieve
		disabled = 1
	else
		disabled = 0
	if(!istype(target, /turf) && !istype(target, /obj/machinery/door/airlock))
		target = get_turf(target)
	if(!action_checks(target) || disabled || get_dist(chassis, target) > 3)
		return
	playsound(chassis, 'sound/machines/click.ogg', 50, 1)
	//meh
	switch(mode)
		if(0)
			if(istype(target, /turf/simulated/wall))
				var/turf/simulated/wall/W = target
				occupant_message("Deconstructing [target]...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					chassis.spark_system.start()
					W.ChangeTurf(/turf/simulated/floor/plating)
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					chassis.use_power(energy_drain)
			else if(istype(target, /turf/simulated/floor))
				var/turf/simulated/floor/F = target
				occupant_message("Deconstructing [target]...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					chassis.spark_system.start()
					F.ChangeTurf(get_base_turf_by_area(target))
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					chassis.use_power(energy_drain)
			else if(istype(target, /obj/machinery/door/airlock))
				occupant_message("Deconstructing [target]...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					chassis.spark_system.start()
					qdel(target)
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					chassis.use_power(energy_drain)
		if(1)
			if(istype(target, /turf/space) || istype(target, get_base_turf_by_area(target)))
				var/turf/T = target
				occupant_message("Building Floor...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					T.ChangeTurf(/turf/simulated/floor/plating)
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					chassis.spark_system.start()
					chassis.use_power(energy_drain * 2)
			else if(istype(target, /turf/simulated/floor))
				var/turf/simulated/floor/F = target
				occupant_message("Building Wall...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					F.ChangeTurf(/turf/simulated/wall)
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					chassis.spark_system.start()
					chassis.use_power(energy_drain * 2)
		if(2)
			if(istype(target, /turf/simulated/floor))
				occupant_message("Building Airlock...")
				if(do_after_cooldown(target))
					if(disabled)
						return
					chassis.spark_system.start()
					var/obj/machinery/door/airlock/T = new /obj/machinery/door/airlock(target)
					T.autoclose = 1
					playsound(target, 'sound/items/Deconstruct.ogg', 50, 1)
					playsound(target, 'sound/effects/sparks2.ogg', 50, 1)
					chassis.use_power(energy_drain * 2)


/obj/item/mecha_parts/mecha_equipment/tool/rcd/Topic(href,href_list)
	..()
	if(href_list["mode"])
		mode = text2num(href_list["mode"])
		switch(mode)
			if(0)
				occupant_message("Switched RCD to Deconstruct.")
			if(1)
				occupant_message("Switched RCD to Construct.")
			if(2)
				occupant_message("Switched RCD to Construct Airlock.")

/obj/item/mecha_parts/mecha_equipment/tool/rcd/get_equip_info()
	return "[..()] \[<a href='?src=\ref[src];mode=0'>D</a>|<a href='?src=\ref[src];mode=1'>C</a>|<a href='?src=\ref[src];mode=2'>A</a>\]"


/obj/item/mecha_parts/mecha_equipment/tool/cable_layer
	name = "Cable Layer"
	icon_state = "mecha_wire"
	var/datum/event/event
	var/turf/old_turf
	var/obj/structure/cable/last_piece
	var/obj/item/stack/cable_coil/cable
	var/max_cable = 1000
	required_type = /obj/mecha/working

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/New()
	cable = new(src)
	cable.amount = 0
	. = ..()

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/Destroy()
	QDEL_NULL(cable)
	event = null
	old_turf = null
	last_piece = null
	. = ..()

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/attach()
	. = ..()
	event = chassis.events.addEvent("onMove", src, "layCable")

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/detach()
	chassis.events.clearEvent("onMove", event)
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/destroy()
	chassis.events.clearEvent("onMove", event)
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/action(obj/item/stack/cable_coil/target)
	if(!action_checks(target))
		return

	var/result = load_cable(target)
	var/message
	if(isnull(result))
		message = SPAN_WARNING("Unable to load [target] - no cable found.")
	else if(!result)
		message = "Reel is full."
	else
		message = "[result] meters of cable successfully loaded."
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())

	occupant_message(message)

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/Topic(href,href_list)
	. = ..()
	if(href_list["toggle"])
		set_ready_state(!equip_ready)
		occupant_message("[src] [equip_ready ? "dea" : "a"]ctivated.")
		log_message("[equip_ready ? "Dea" : "A"]ctivated.")
		return

	if(href_list["cut"])
		if(cable && cable.amount)
			var/m = round(input(chassis.occupant, "Please specify the length of cable to cut", "Cut cable", min(cable.amount, 30)) as num, 1)
			m = min(m, cable.amount)
			if(m)
				use_cable(m)
				var/obj/item/stack/cable_coil/CC = new (get_turf(chassis))
				CC.amount = m
		else
			occupant_message("There's no more cable on the reel.")

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/get_equip_info()
	var/output = ..()
	if(output)
		return "[output] \[Cable: [cable ? cable.amount : 0] m\][(cable && cable.amount) ? "- <a href='?src=\ref[src];toggle=1'>[!equip_ready?"Dea":"A"]ctivate</a>|<a href='?src=\ref[src];cut=1'>Cut</a>" : null]"

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/proc/load_cable(obj/item/stack/cable_coil/CC)
	if(istype(CC) && CC.amount)
		var/cur_amount = cable? cable.amount : 0
		var/to_load = max(max_cable - cur_amount,0)
		if(to_load)
			to_load = min(CC.amount, to_load)
			if(!cable)
				cable = new(src)
				cable.amount = 0
			cable.amount += to_load
			CC.use(to_load)
			return to_load
		else
			return 0

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/proc/use_cable(amount)
	if(!cable || cable.amount<1)
		set_ready_state(1)
		occupant_message("Cable depleted, [src] deactivated.")
		log_message("Cable depleted, [src] deactivated.")
		return
	if(cable.amount < amount)
		occupant_message("No enough cable to finish the task.")
		return
	cable.use(amount)
	update_equip_info()
	return 1

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/proc/reset()
	last_piece = null

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/proc/dismantleFloor(turf/new_turf)
	if(istype(new_turf, /turf/simulated/floor))
		var/turf/simulated/floor/T = new_turf
		if(!T.is_plating())
			T.make_plating(!(T.broken || T.burnt))
	return new_turf.is_plating()

/obj/item/mecha_parts/mecha_equipment/tool/cable_layer/proc/layCable(turf/new_turf)
	if(equip_ready || !istype(new_turf) || !dismantleFloor(new_turf))
		return reset()
	var/fdirn = turn(chassis.dir, 180)
	for(var/obj/structure/cable/LC in new_turf)		// check to make sure there's not a cable there already
		if(LC.d1 == fdirn || LC.d2 == fdirn)
			return reset()
	if(!use_cable(1))
		return reset()
	var/obj/structure/cable/NC = new(new_turf)
	NC.cableColor("red")
	NC.d1 = 0
	NC.d2 = fdirn
	NC.updateicon()

	var/datum/powernet/PN
	if(last_piece && last_piece.d2 != chassis.dir)
		last_piece.d1 = min(last_piece.d2, chassis.dir)
		last_piece.d2 = max(last_piece.d2, chassis.dir)
		last_piece.updateicon()
		PN = last_piece.powernet

	if(!PN)
		PN = new()
	PN.add_cable(NC)
	NC.mergeConnectedNetworks(NC.d2)
	last_piece = NC
	return 1

