//Contains the rapid construction device.
/obj/item/rcd
	name = "rapid construction device"
	desc = "A device used by engineers for compact and fast construction. This one is a civilian grade version and lacks ability to deconstruct reinforced objects."
	icon = 'icons/obj/tools.dmi'
	icon_state = "rcd"
	opacity = 0
	density = 0
	anchored = 0.0
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASMA = 10, MATERIAL_URANIUM = 10)
	price_tag = 1000
	var/max_stored_matter = 60
	var/datum/effect/effect/system/spark_spread/spark_system
	var/stored_matter = 0
	var/working = 0
	var/mode = 1
	var/list/modes = list("Floor & Walls","Low wall","Window","reinforced window","electrochromic window","Grille","Airlock","Machine Frame","Computer Frame","Deconstruct")
	var/canRwall = 0
	var/disabled = 0
	var/construction_speed = 1 //RCD's workspeed based on the device, divides by said value
	var/construction_efficiency = 0 //How much it costs to construct/deconstruct based on the device (higher values = cheaper)

/obj/item/rcd/attack()
	return 0

/obj/item/rcd/proc/can_use(var/mob/user,var/turf/T)
	return (user.Adjacent(T) && user.get_active_hand() == src && !user.stat && !user.restrained())

/obj/item/rcd/examine()
	..()
	if(src.type == /obj/item/rcd && loc == usr)
		to_chat(usr, "It currently holds [stored_matter]/[max_stored_matter] matter-units.")

/obj/item/rcd/New()
	..()
	src.spark_system = new /datum/effect/effect/system/spark_spread
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	update_icon()	//Initializes the fancy ammo counter

/obj/item/rcd/Destroy()
	qdel(spark_system)
	spark_system = null
	return ..()

/obj/item/rcd/attackby(obj/item/W, mob/user)
	var/obj/item/stack/material/M = W
	if(istype(M) && M.material.name == MATERIAL_COMPRESSED_MATTER)
		var/amount = min(M.get_amount(), round(max_stored_matter - stored_matter))
		if(M.use(amount) && stored_matter < max_stored_matter)
			stored_matter += amount
			playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You load [amount] Compressed Matter into \the [src].</span>. The RCD now holds [stored_matter]/[max_stored_matter] matter-units.")
			update_icon()	//Updates the ammo counter
		if (M.use(amount) && stored_matter >= max_stored_matter)
			to_chat(user, "<span class='notice'>The RCD is full.")
	else
		..()


/obj/item/rcd/attack_self(mob/user)
	//Change the mode
	if(++mode > modes.len) mode = 1
	to_chat(user, SPAN_NOTICE("Changed mode to '[modes[mode]]'"))
	playsound(src.loc, 'sound/effects/pop.ogg', 50, 0)
	if(prob(20)) src.spark_system.start()

/obj/item/rcd/afterattack(atom/A, mob/user, proximity)
	if(!proximity) return
	if(disabled && !isrobot(user))
		return 0
	if(istype(get_area(A),/area/shuttle)||istype(get_area(A),/turf/space/transit))
		return 0
	return alter_turf(A,user)

/obj/item/rcd/proc/useResource(var/amount, var/mob/user, var/checkOnly)
	if(stored_matter < amount)
		return 0
	if (!checkOnly)
		stored_matter -= amount
		update_icon()	//Updates the ammo counter if ammo is succesfully used
	return 1

/obj/item/rcd/proc/alter_turf(var/T,var/mob/user)

	var/build_cost = 0
	var/build_type
	var/build_turf
	var/build_object
	var/build_delay

	if(working == 1)
		return 0
	var/turf/local_turf = T
	if(!T)
		local_turf = get_turf(T)
	var/gotFloor = istype(local_turf,/turf/simulated/floor)
	var/gotSpace = (istype(local_turf,/turf/space) || istype(local_turf,get_base_turf(local_turf.z)))
	var/gotBlocked = (istype(T, /obj/machinery) || istype(T, /obj/structure/low_wall))

	switch(mode)
		if(1)
			if(gotSpace)
				build_cost =  1
				build_type =  "floor"
				build_turf =  /turf/simulated/floor/airless
			if(gotFloor)
				build_delay = 40 /construction_speed
				build_cost =  3
				build_type =  "wall"
				build_turf =  /turf/simulated/wall

		if(2)
			if(gotBlocked)
				return 0
			if(gotSpace)
				return 0
			if(gotFloor)
				build_type = "low wall"
				build_object = /obj/structure/low_wall
				build_delay = 30 / construction_speed
				build_cost =  2

		if(3)
			if(gotSpace)
				return 0
			if(gotFloor)
				build_type = "window"
				build_object = /obj/structure/window/basic/full
				build_delay = 30 / construction_speed
				build_cost =  2

		if(4)
			if(gotSpace)
				return 0
			if(gotFloor)
				build_type = "reinforced window"
				build_object = /obj/structure/window/reinforced/full
				build_delay = 30 / construction_speed
				build_cost =  3

		if(5)
			if(gotSpace)
				return 0
			if(gotFloor)
				build_type = "electrochromic window"
				build_object = /obj/structure/window/reinforced/polarized/full
				build_delay = 30 / construction_speed
				build_cost =  3

		if(6)
			if(gotBlocked)
				return 0
			if(gotSpace)
				build_delay = 30 / construction_speed
				build_cost = 3
				build_turf = /turf/simulated/floor/airless //there is always floor under low wall
				build_type = "grille"
				build_object = /obj/structure/grille
			if(gotFloor)
				build_type = "grille"
				build_object = /obj/structure/grille
				build_delay = 30 / construction_speed
				build_cost =  2

		if(7)
			if(gotBlocked)
				return 0
			if(gotSpace)
				build_type = "airlock"
				build_cost =  7 - construction_efficiency
				build_delay = 50 / construction_speed
				build_turf =  /turf/simulated/floor/airless
				build_object = /obj/machinery/door/airlock
			if(gotFloor)
				build_type = "airlock"
				build_cost =  6 - construction_efficiency
				build_delay = 40 / construction_speed
				build_object = /obj/machinery/door/airlock

		if(8)
			if(gotBlocked)
				return 0
			if(gotSpace)
				build_type = "machine frame"
				build_cost =  7 - construction_efficiency
				build_delay = 50 / construction_speed
				build_turf =  /turf/simulated/floor/airless
				build_object = /obj/machinery/constructable_frame/machine_frame
			if(gotFloor)
				build_type = "machine frame"
				build_cost =  6 - construction_efficiency
				build_delay = 40
				build_object = /obj/machinery/constructable_frame/machine_frame

		if(9)
			if(gotBlocked)
				return 0
			if(gotSpace)
				build_type = "computer frame"
				build_cost =  7 - construction_efficiency
				build_delay = 50 / construction_speed
				build_turf =  /turf/simulated/floor/airless
				build_object = /obj/structure/computerframe
			if(gotFloor)
				build_type = "computer frame"
				build_cost =  6 - construction_efficiency
				build_delay = 40 / construction_speed
				build_object = /obj/structure/computerframe

		if(10)
			build_type =  "deconstruct"
			if(gotFloor)
				build_cost =  5 - construction_efficiency
				build_delay = 50 / construction_speed
				build_turf = get_base_turf_by_area(local_turf)
			else if(istype(T,/obj/structure/low_wall))
				build_delay = 40 / construction_speed
				build_cost =  5 - construction_efficiency
			else if(istype(T,/turf/simulated/wall))
				var/turf/simulated/wall/W = T
				build_delay = 40 / construction_speed
				build_cost =  (W.reinf_material) ? 10 : 5
				build_type =  (!canRwall && W.reinf_material) ? null : "deconstruct"
				build_turf =  /turf/simulated/floor
			else if(istype(T,/obj/machinery/door/airlock))
				build_cost =  10 - construction_efficiency
				build_delay = 50 / construction_speed
			else if(istype(T,/obj/structure/window))
				build_cost =  5 - construction_efficiency
				build_delay = 40 / construction_speed
			else if(istype(T,/obj/machinery/constructable_frame))
				build_cost =  10 - construction_efficiency
				build_delay = 50 / construction_speed
			else if(istype(T,/obj/structure/computerframe))
				build_cost =  10 - construction_efficiency
				build_delay = 50 / construction_speed
			else
				build_type =  ""
	if(!build_type)
		working = 0
		return 0

	if(!useResource(build_cost, user, 1))
		to_chat(user, "The \'Low Ammo\' light on the device blinks yellow.")
		flick("[icon_state]-empty", src)
		return 0

	playsound(src.loc, 'sound/machines/click.ogg', 50, 1)

	working = 1
	to_chat(user, "[(mode==modes.len ? "Deconstructing" : "Building [build_type]")]...")

	if(build_delay && !do_after(user, build_delay, src))
		working = 0
		return 0

	working = 0
	if(build_delay && !can_use(user,T))
		return 0

	if(!useResource(build_cost, user))
		to_chat(user, "The \'Low Ammo\' light on the device blinks yellow.")
		flick("[icon_state]-empty", src)
		return 0

	if(build_turf)
		local_turf.ChangeTurf(build_turf)
	if(build_object)
		new build_object(local_turf)

	if(build_type == "deconstruct")
		qdel(T)

	playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
	return 1

/obj/item/rcd/update_icon()	//For the fancy "ammo" counter
	cut_overlays()

	var/ratio = 0
	ratio = stored_matter / max_stored_matter
	ratio = max(round(ratio, 0.10) * 100, 10)

	add_overlay("[icon_state]-[ratio]")

/obj/item/rcd/borg
	canRwall = 1

/obj/item/rcd/borg/useResource(var/amount, var/mob/user, var/checkOnly)
	if(isrobot(user))
		var/mob/living/silicon/robot/R = user
		if(R.cell)
			var/cost = amount*30
			if(R.cell.charge >= cost)
				if (!checkOnly)
					R.cell.use(cost)
				return 1
	return 0

/obj/item/rcd/borg/attackby()
	return

/obj/item/rcd/borg/can_use(var/mob/user,var/turf/T)
	return (user.Adjacent(T) && !user.stat)

/obj/item/rcd/mounted/useResource(var/amount, var/mob/user, var/checkOnly)
	var/cost = amount*130 //so that a rig with default powercell can build ~2.5x the stuff a fully-loaded RCD can.
	if(istype(loc,/obj/item/rig_module))
		var/obj/item/rig_module/module = loc
		if(module.holder && module.holder.cell)
			if(module.holder.cell.charge >= cost)
				if (!checkOnly)
					module.holder.cell.use(cost)
				return 1
	return 0

/obj/item/rcd/mounted/attackby()
	return

/obj/item/rcd/mounted/can_use(var/mob/user,var/turf/T)
	return (user.Adjacent(T) && !user.stat && !user.restrained())

/obj/item/rcd/industrial
	name = "industrial rapid construction device"
	desc = "A device used by engineers for compact and fast construction. This one is an industrial grade version featuring more capacity and higher work speed all while not being held back by drawbacks of it's predecesor."
	icon_state = "rcd_industrial"
	max_stored_matter = 120
	canRwall = 1
	construction_speed = 1.5
	construction_efficiency = 1
	price_tag = 2000

/obj/item/rcd/industrial/examine()
	..()
	if(src.type == /obj/item/rcd/industrial && loc == usr)
		to_chat(usr, "It currently holds [stored_matter]/[max_stored_matter] matter-units.")

/obj/item/rcd/excelsior
	name = "excelsior rapid construction device"
	desc = "A device used by engineers for compact and fast construction. This one seems to be excelsior design far superior than anything else available on the market giving 'Sieze the means of production' new meaning."
	icon_state = "rcd_excelsior"
	max_stored_matter = 240
	canRwall = 1
	construction_speed = 2
	construction_efficiency = 3
	price_tag = 4000

/obj/item/rcd/excelsior/examine()
	..()
	if(src.type == /obj/item/rcd/excelsior && loc == usr)
		to_chat(usr, "It currently holds [stored_matter]/[max_stored_matter] matter-units.")