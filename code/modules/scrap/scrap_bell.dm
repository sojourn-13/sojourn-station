//Copy pasted from scrap_bell

/obj/machinery/scrap_bell
	name = "advanced telebell"
	desc = "An advanced bluespace telebell used for teleporting objects to and from a unfixed location."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad"
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 1000
	circuit = /obj/item/circuitboard/telesci_bell
	var/cooldowns = 15 MINUTES
	var/not_run = TRUE
	var/obj/landmark/scrap_bell/tracked

/obj/item/circuitboard/telesci_bell
	build_name = "Telebell Console (GP Calibrated)"
	build_path = /obj/machinery/scrap_bell
	board_type = "machine"
	origin_tech = list(TECH_DATA = 7, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 6)

	req_components = list(
		/obj/item/bluespace_crystal/artificial = 2,
		/obj/item/stock_parts/capacitor/one_star = 1
	)

/obj/machinery/scrap_bell/Process()
	..()
	if(cooldowns)
		cooldowns -= 1 SECOND
		if(cooldowns < 0)
			cooldowns = 0

/obj/machinery/scrap_bell/attack_hand(mob/user)
	add_fingerprint(user)
	var/user_is_choosing = TRUE

	if(!isliving(user))
		to_chat(user, SPAN_NOTICE("You are unable to use this device."))
		return FALSE

	while(user_is_choosing)
		var/action = alert(user, "Ready to teleport into a GP Scrap yard?", "Teleport to treasure?", "Yes!", "NO!", "Call Additional Scrap")

		switch(action)
			if("Yes!")
				if(!tracked)
					for(var/obj/landmark/scrap_bell/MBM in world)
						if(MBM)
							tracked = MBM
							break
					if(tracked)
						cooldowns = 15 MINUTES
						tracked.add_scrap()

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

				else
					to_chat(user, SPAN_NOTICE("Something is increadibly wrong with the Bell. Contact HC with a report for this"))
					return

				user_is_choosing = FALSE
				return
			if("NO!")
				user_is_choosing = FALSE
				return

			if("Call Additional Scrap")
				if(!tracked)
					for(var/obj/landmark/scrap_bell/MBM in world)
						if(MBM)
							tracked = MBM
							break

				if(!tracked)
					to_chat(user, SPAN_NOTICE("Something is increadibly wrong with the Bell. Contact HC with a report for this"))

				if(!cooldowns)
					cooldowns = 15 MINUTES
					tracked.add_scrap()
				else
					to_chat(user, SPAN_NOTICE("The request for additional scrap so soon is automatically denied."))

	..()

	user_is_choosing = FALSE

/obj/landmark/scrap_bell
	name = "ZXY Scrap Bell Link"

/obj/landmark/scrap_bell/proc/add_scrap()
	var/area/A = get_area(src.loc)
	for(var/turf/simulated/floor/asteroid/MS in A.contents)
		if(prob(5) && MS.name == "coarse sand") //Dont dump this on non-this type of tile
			new /obj/effect/falling_effect(MS, /obj/random/scrap/beacon/moderate_weighted)

