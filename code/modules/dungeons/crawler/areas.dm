/area/crawler
	name = "Dungeon"
	icon_state = "start"
	has_gravity = 1
	requires_power = 0
	var/room_controllers = list()
	dynamic_lighting = FALSE
	var/has_late_game_spawned_for_folks = FALSE
	var/level_of_threat = 0
	var/robo_deaths = 0

/area/crawler/Entered(A)
	..()
	if(has_late_game_spawned_for_folks)
		return
	if(!ishuman(A))
		return
	has_late_game_spawned_for_folks = TRUE
	for(var/obj/random/mob/roomba/spawners in src)
		spawners.late_handling()

//Shut down the power,
/area/crawler/proc/convert_to_lighting_build_overlays()
	dynamic_lighting = TRUE
	for(var/turf/T in contents)
		T.lighting_build_overlay()
	lampification(1)

/area/crawler/proc/raise_threat(lot)
	if(level_of_threat >= lot)
		return
	level_of_threat += 1
	if(level_of_threat >= 1 && !dynamic_lighting)
		convert_to_lighting_build_overlays(level_of_threat)

	//Call in some backup, not a lot! After all we are dealing with a threat
	if(level_of_threat == 3)
		//Basically "10%" more mobs being after the 150th kill
		for(var/mob/living/carbon/superior/robot/gp/reroll in contents)
			new /obj/random/mob/roomba/combat_class/low(reroll.loc)

	if(level_of_threat >= 4)
		for(var/mob/living/carbon/superior/robot/gp/reroll in contents)
			new /obj/random/mob/roomba/combat_class(reroll.loc)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(3, 1, reroll)
			s.start()
			qdel(reroll) //Get them out of their!

	if(level_of_threat >= 2)
		lampification(level_of_threat)


/area/crawler/proc/lampification(level)
	switch(level)
		if(1) //Level 1 threat, likely nothing to worry about!
			for(var/mob/living/carbon/superior/robot/gp/lamp in contents)
				lamp.light_color = COLOR_LIGHTING_GREEN_MACHINERY
				lamp.light_range = 4
				lamp.light_power = 3
		if(2)//Level 2 threat, something to keep an eye out for
			for(var/mob/living/carbon/superior/robot/gp/lamp in contents)
				lamp.light_color = COLOR_LIGHTING_BLUE_MACHINERY
				lamp.light_range = 5
				lamp.light_power = 4
		if(3)//Level 3 threat, something... to not get attention to...
			for(var/mob/living/carbon/superior/robot/gp/lamp in contents)
				lamp.light_color = COLOR_LIGHTING_ORANGE_MACHINERY
				lamp.light_range = 1
				lamp.light_power = 2
		if(4)//Level 4 threat, hide are lighting, attack in darkness, its a threat.
			for(var/mob/living/carbon/superior/robot/gp/lamp in contents)
				lamp.light_color = COLOR_LIGHTING_RED_MACHINERY
				lamp.light_range = 0
				lamp.light_power = 0