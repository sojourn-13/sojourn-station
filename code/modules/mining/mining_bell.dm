/obj/machinery/mining_bell
	name = "advanced telebell"
	desc = "An advanced bluespace telebell used for teleporting objects to and from a unfixed location."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad"
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 1000
	circuit = /obj/item/circuitboard/telesci_bell
	var/cooldowns = 15 MINUTES
	var/cooldowns_tele = 0
	var/not_run = TRUE
	var/obj/landmark/mining_bell/tracked
	var/rampdown = 0

/obj/item/circuitboard/telesci_bell
	build_name = "Telebell Console"
	build_path = /obj/machinery/mining_bell
	board_type = "machine"
	origin_tech = list(TECH_DATA = 6, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 6)

	req_components = list(
		/obj/item/bluespace_crystal/artificial = 2,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/machinery/mining_bell/attack_hand(mob/user)
	add_fingerprint(user)
	var/user_is_choosing = TRUE

	if(!isliving(user))
		to_chat(user, SPAN_NOTICE("You are unable to use this device."))
		return FALSE

	//You get 5 mins to join your mining crew friends
	if(cooldowns && cooldowns_tele > world.time && world.time > rampdown)
		to_chat(user, SPAN_NOTICE("The bell is not ready for rapid deployment so soon."))
		return FALSE

	while(user_is_choosing)
		var/action = alert(user, "Ready to Dive into a Cave?", "Diving into a cave?", "Yes!", "NO!")

		switch(action)
			if("Yes!")
				if(cooldowns)
					cooldowns_tele = cooldowns + world.time
					if(!rampdown)
						rampdown = cooldowns - 5 MINUTES + world.time
				//Make sure are rampdown properly gets set
				if(world.time < rampdown)
					rampdown = cooldowns - 5 MINUTES + world.time
				if(!tracked && not_run)
					not_run = FALSE
					for(var/obj/landmark/mining_bell/MBM in world)
						if(MBM)
							tracked = MBM
							break

				if(tracked)
					var/mob/living/L = user
					L.stats.addPerk(PERK_BLUESPACE_BELLCLOCK)
					spawn(2)//give a perk some time to do its thing
						var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
						sparks.set_up(5, 0, get_turf(user))
						sparks.start()
						playsound(src.loc, "sparks", 50, 1)
						playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)
						go_to_bluespace(src.loc, 0, TRUE, L, tracked)
						if(!tracked.is_clearing)
							tracked.is_clearing = TRUE
							addtimer(CALLBACK(tracked, TYPE_PROC_REF(/obj/landmark/mining_bell, regenerate_map)), 8 MINUTES)

				else
					to_chat(user, SPAN_NOTICE("Something is increadibly wrong with the Bell. Contact HC with a report for this"))
					return

				user_is_choosing = FALSE
				return
			if("NO!")
				user_is_choosing = FALSE
				return

	..()

	user_is_choosing = FALSE

/obj/landmark/mining_bell
	name = "ZXY Mining Bell Link"
	var/is_clearing = FALSE

/obj/landmark/mining_bell/proc/regenerate_map()
	is_clearing = FALSE

	//First remove every item other then areselfs of corse
	var/area/A = get_area(src.loc)
	var/mask = /turf/unsimulated/mask

	for(var/turf/simulated/mineral/M in A)
		if(M)
			M.GetDrilled(artifact_fail = 0, give_minerals = FALSE, fast_drill = TRUE)

	for(var/mob/smuck in A)
		//If we are a human we likely did this to areselfs and found a way past all the safty checks.
		if(ishuman(smuck))
			var/mob/living/carbon/human/H = smuck
			//if we have the perk no point in killing them
			if(H.stats.getPerk(PERK_BLUESPACE_BELLCLOCK))
				smuck.loc = null
			else
				qdel(H)
		else
			qdel(smuck)


	for(var/atom/item in A)
		if(item != src)
			qdel(item)

	//Now we need to replace every turf to mask
	for(var/turf/simulated/floor/asteroid/floor in A)
		if(floor)
			floor.ChangeTurf(mask)

	//Get back are safe spot

	var/turf/simulated/floor/asteroid/N
	var/turf/T = src.loc
	T.ChangeTurf(N)

	new /datum/random_map/automata/cave_system(null, 1, 1, src.z, world.maxx, world.maxy)
	new /datum/random_map/noise/ore(null, 1, 1, src.z, world.maxx, world.maxy)