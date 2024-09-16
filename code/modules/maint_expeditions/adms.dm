/obj/machinery/exploration
	icon = 'icons/obj/adms.dmi'
	anchored = FALSE
	use_power = NO_POWER_USE //The exploration items take power directly from a cell.
	density = TRUE

/obj/machinery/exploration/adms
	name = "\improper Anomalous Data Measurement System"
	desc = "A large piece of equipment for gathering data from anomalous regions. It has an habit of angering the local population pest."
	icon_state = "adms"

	circuit = /obj/item/circuitboard/adms
	var/soundcooldown = 2
	var/active = FALSE
	var/obj/item/computer_hardware/hard_drive/portable/inserted_disk //Any portable drive works. When inserted, the adms installs the research point program
	var/datum/computer_file/binary/research_points/inserted_disk_file //A ref to the research_points program
	var/obj/item/cell/large/cell
	//Upgrades
	var/harvest_speed = 0 //Modified by internal scanner and laser
	var/charge_use = 50 //modified by capacitor. Better capacitor = slower cell drain
	emagged = FALSE
	var/list/monster_list = list("Roaches", "Spiders")
	var/ping_sound = 'sound/ambience/sonar2.ogg'

/obj/machinery/exploration/adms/examine(mob/user)
	. = ..()
	if(inserted_disk)
		to_chat(user, SPAN_NOTICE("It has a disk inserted."))
	else
		to_chat(user, SPAN_NOTICE("The disk drive is empty!"))

/obj/machinery/exploration/adms/emag_act(mob/user)
	if(!emagged)
		emagged = TRUE
		playsound(loc, "sparks", 75, 1, -1)
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [name]."))

/obj/machinery/exploration/adms/New()
	set_light(l_color=COLOR_RED)
	..()

/obj/machinery/exploration/adms/Process()//Harvest speed values may need tweaking. Needs testing in live environment
	if(!active)
		set_light(0,0)
		return

	if(!use_cell_power())
		system_error("Charge error")//If the battery is dead, shut it down
		return

	if(!inserted_disk)
		system_error("No disk found")
		return

	if(locate(/turf/simulated/open) in range(5, src))
		system_error("Surface unsteady")
		return

	if(inserted_disk.used_capacity >= inserted_disk.max_capacity)
		system_error("Disk full")
		return

	set_light(2,1)

	if(soundcooldown > 0)
		soundcooldown--

	if(soundcooldown <= 0)
		playsound(src.loc, ping_sound, 60, 1, 8, 8)
		soundcooldown = initial(soundcooldown)


	var/area = get_area(src)
	if(istype(area, /area/deepmaint))
		give_points(1.2) //1000 research points PER size. 300 points per tick per tier of laser. ~1,000-5,000 before mobs spawn.
		if(prob(3))
			spawn_monsters(4) //Full Furher retinue

	else if(istype(area, /area/mine/unexplored))
		give_points(0.4) //100 points per tick per tier of laser
		if(prob(2))
			spawn_monsters(2) //Fewer than deepmaint, since this area is not as dangerous. Need to make a new spacemob spawner!

	else if(istype(area, /area/awaymission))
		give_points(0.8) //200 points per tick per tier of laser
		if(prob(1))
			spawn_monsters(2)

	else if(istype(area, /area/nadezhda/rnd))
		give_points(0.1) //Anti-Cheese
		if(prob(10))
			spawn_monsters(5)
			spawn_monsters(1) //Some infighting
			spawn_monsters(1) //Some infighting

	else
		give_points(0.2)
		if(prob(10))
			src.spawn_monsters(1)//On the station is just calls groups of roaches!

/obj/machinery/exploration/adms/Destroy()
	for(var/obj/A in contents)
		A.forceMove(loc)
		if(A in component_parts)
			component_parts -= A
		if(A in contents)
			component_parts -= A
	spawn(5)
		..()

// Proc to add more points in the data disk.
/obj/machinery/exploration/adms/proc/give_points(var/amount)
	inserted_disk_file.size += amount * harvest_speed // The point given by the file is determined by the size of the file.
	inserted_disk.recalculate_size() // Update the disk so that it know if if the file's too big.

/obj/machinery/exploration/adms/proc/spawn_monsters(var/number, var/tag = "Random")
	system_error("hostiles detected")
	playsound(loc, "robot_talk_heavy", 100, 0, 0)
	var/list/turf/candidatetiles = list()
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 20, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 60, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 80, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
	if(emagged)
		new /mob/living/carbon/superior_animal/roach/kaiser(src.loc)
		visible_message(SPAN_DANGER("[src] get destroyed as a Kaiser emerge from underneath it!"))
		Destroy()
		return
	for(var/turf/simulated/floor/F in orange(src.loc, 5))
		if(F.is_wall)
			continue
		if(locate(/obj/machinery/door) in F)
			continue
		if (locate(/obj/structure/multiz) in F)
			continue
		candidatetiles += F

	update_monster_list()

	if(tag == "Random")
		tag = pick(monster_list)

	for(number, number > 0, number--)
		var/turf/simulated/floor/burstup = pick(candidatetiles)
		//spawn some rubble too!
		for (var/turf/simulated/floor/FL in view(burstup, 1))
			if (FL.is_wall)
				continue
			if (locate(/obj/effect/decal/cleanable/rubble) in FL)
				continue
			new /obj/effect/decal/cleanable/rubble(FL)
		switch(tag)
			if("Roaches")
				new /obj/random/cluster/roaches_hoard(burstup)
			if("Spiders")
				new /obj/random/cluster/spiders(burstup)
			if("Xenomorph")
				new /obj/random/cluster/xenomorphs(burstup)
			if("Underground")
				new /obj/random/mob/undergroundmob(burstup)
			if("Termite")
				new /obj/random/cluster/termite_no_despawn_hoard(burstup)
	return

/obj/item/computer_hardware/hard_drive/portable/research_points/adms //any research disk works in the adms, but it starts with an empty one!
	min_points = 0
	max_points = 0

/obj/machinery/exploration/adms/proc/update_monster_list()
	monster_list = list("Roaches", "Spiders")

	var/area = get_area(src)
	if(istype(area, /area/deepmaint))
		monster_list.Add("Xenomorph")
	if(istype(area, /area/mine/unexplored))
		monster_list.Add("Underground")

/obj/machinery/exploration/adms/proc/system_error(var/error)
	if(error)
		visible_message(SPAN_NOTICE("\The [src] flashes a '[error]' warning."))
	playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
	active = FALSE
	set_light(0,0)
	update_icon()

/obj/machinery/exploration/adms/proc/use_cell_power()
	if(!cell)
		return FALSE
	if(cell.checked_use(charge_use))
		return TRUE
	return FALSE

/obj/item/circuitboard/adms
	name = "Anomalous Data Measurement System"
	build_path = /obj/machinery/exploration/adms
	board_type = "machine"
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	req_components = list(
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/cell/large = 1
	)

/obj/machinery/exploration/adms/RefreshParts()
	..()
	harvest_speed = initial(harvest_speed)
	charge_use = initial(charge_use)

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/micro_laser))
			harvest_speed = P.rating
		if(istype(P, /obj/item/stock_parts/capacitor))
			charge_use -= 10 * (P.rating - harvest_speed)
			charge_use = max(charge_use, 0)
		if(istype(P, /obj/item/stock_parts/scanning_module))
			harvest_speed += P.rating
		harvest_speed = harvest_speed/2
	cell = locate(/obj/item/cell/large) in component_parts

/obj/machinery/exploration/adms/attackby(obj/item/I, mob/user as mob)
	..()
	if(istype(I, /obj/item/computer_hardware/hard_drive/portable))//if the item is a portable disk
		if(inserted_disk)//and we already have a portable disk
			to_chat(user, "The adms already has a disk inserted.")//fail out
		else
			user.drop_item()
			I.loc = src
			inserted_disk = I
			component_parts += I
			to_chat(user, "You insert \the [I].")

			for(var/datum/computer_file/binary/P in inserted_disk.stored_files)
				if(istype(P, /datum/computer_file/binary/research_points))
					inserted_disk_file = P
					return
			inserted_disk_file = new/datum/computer_file/binary/research_points()
			inserted_disk_file.size = 0
			inserted_disk.store_file(inserted_disk_file)
	if(!active)
		if(default_deconstruction(I, user))
			return

		if(default_part_replacement(I, user))
			return

	if(!panel_open || active)
		return ..()

	if(istype(I, /obj/item/cell/large))
		if(cell)
			to_chat(user, "The adms already has a cell installed.")
		else
			insert_item(I, user)
			cell = I
			component_parts += I
			to_chat(user, "You install \the [I].")
		return

/obj/machinery/exploration/adms/attack_hand(mob/user as mob)
	if (panel_open && cell)
		eject_item(cell, user)
		component_parts -= cell
		cell = null
		return
	else if(!inserted_disk)
		system_error("no data disk")//You need to have a disk inserted!
	else if(!panel_open)
		if(use_cell_power())
			active = !active
			if(active)
				visible_message(SPAN_NOTICE("\The [src] pings loudly, the sound echoing in the distance."))
				playsound(src.loc, ping_sound, 60, 1, 8, 8)
				soundcooldown = initial(soundcooldown)
			else
				visible_message(SPAN_NOTICE("\The [src] falls silent."))
		else
			system_error("charge error")
	else
		system_error("maintainence protocols enabled")//You must have the peanel closed

	update_icon()


//Handles ejecting the data disk, when able, will place and hand
/obj/machinery/exploration/adms/proc/eject_disk_action(mob/living/user)
	if(!inserted_disk)
		to_chat(usr, SPAN_NOTICE("No disk is inside."))
		return

	inserted_disk.forceMove(drop_location())
	component_parts -= inserted_disk
	to_chat(usr, SPAN_NOTICE("You remove \the [inserted_disk] from \the [src]."))

	inserted_disk = null
	inserted_disk_file = null

/obj/machinery/exploration/adms/verb/eject_disk()
	set name = "Eject Disk"
	set category = "Object"
	set src in view(1)
	if(inserted_disk)
		eject_disk_action()
	else
		to_chat(usr, SPAN_NOTICE("No disk is inside."))

/obj/machinery/exploration/adms/update_icon()
	if(active)
		icon_state = "adms-on"
	else
		icon_state = "adms"
	return

/datum/design/research/circuit/adms
	name = "Anomalous Data Measurement System"
	build_path = /obj/item/circuitboard/adms
	category = CAT_COMP
