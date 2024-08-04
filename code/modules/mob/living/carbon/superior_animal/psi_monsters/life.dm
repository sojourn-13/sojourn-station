/mob/living/carbon/superior_animal/psi_monster/Life()
	. = ..()
	var/turf/L = get_turf(src)
	if(L && L.get_lumcount() < 0.8 && maxHealth > health) //So were not endlessly healing a full health mob
		heal_overall_damage(healing_factor,healing_factor)
		updatehealth()
	if(health >= (maxHealth * 0.9) && (L && L.get_lumcount() <= 0.8) && stance == HOSTILE_STANCE_IDLE && alpha == 255) //We dont want this triggering 40 times
		//We do if src in case someone has a gun to 1 shot them mid-animation and kills them on the spot.
		if(src) animate(src, alpha = 200, time = 2)
		spawn(3) if(src) animate(src, alpha = 155, time = 2)
		spawn(3) if(src) animate(src, alpha = 55, time = 2)
		spawn(3) if(src) animate(src, alpha = chameleon_skill, time = 2)

	//Deepmaints mobs **can not** survive outside deepmaints, this just codeifies it
	if(!can_leave && !GLOB.deepmaints_data_bool["allow_leaving"])
		var/area/my_area = get_area(src.loc)
		if(!my_area || my_area.name != "Deep Maintenance")
			//We nest this to save on proccessing useless data
			var/turf/simulated/floor/target					//this is where we are teleporting
			var/list/validtargets = list()					//list of valid tiles to teleport to

			for(var/area/A in world)						//Clumbsy, but less intensive than iterating every tile
				if(istype(A, /area/deepmaint))				//First find our deepmaint areas
					for(var/turf/simulated/floor/T in A)	//Pull a list of valid floor tiles from deepmaint
						validtargets += T					//Add them to the list

			target = pick(validtargets)					//Now we pick a target


			//If we cant get a target then were in a test server or something critical wrong has happen!
			if(!target)
				message_admins("[src.name] was unable to find a target and was forcefuly moved outside of deepmaints! Was in [my_area.name]")
				log_game("[src.name] was unable to find a target and was forcefuly moved outside of deepmaints! Was in [my_area.name]")
				psionic_respawn = FALSE
				death() //Your honour, League of Legends
				return
			visible_message("<span class='alert'>[src.name] becomes unstable and droops down before suddenly sinks into the floor howling in pain.</span>")
			forceMove(target)							//Moves the caster


/mob/living/carbon/superior_animal/psi_monster/dreaming_king/Life()
	. = ..()
	//Used for teleports, we grab it here to not repeat same code
	var/turf/simulated/floor/target
	var/list/validtargets = list()
	if(health <= (maxHealth * 0.66) && first_teleport == FALSE)
		if(GLOB.deepmaints_data_bool["king_teleporting"])

			for(var/area/A in world)
				if(istype(A, /area/deepmaint))
					for(var/turf/simulated/floor/T in A)
						validtargets += T
			target = pick(validtargets)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER(first_teleport_callout))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		src.forceMove(target)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		if(dreaming_king)
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, wounded and screaming in rage as his court answers his call!</font><b>"))
			new /mob/living/carbon/superior_animal/psi_monster/mind_gazer/viscount(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/pus_maggot/ash_wendigo/duke(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/cerebral_crusher/marshal(src.loc)
		else if (hound_of_the_crown)
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, wounded and screaming in rage as its pack flocks to its side!</font><b>"))
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
		else
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, wounded and screaming in rage!</font><b>"))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		first_teleport = TRUE

	if(health <= (maxHealth * 0.33) && second_teleport == FALSE)
		if(GLOB.deepmaints_data_bool["king_teleporting"])

			for(var/area/A in world)
				if(istype(A, /area/deepmaint))
					for(var/turf/simulated/floor/T in A)
						validtargets += T
			target = pick(validtargets)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER(second_teleport_callout))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		src.forceMove(target)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		if(dreaming_king)
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, heavily wounded and howling in agony as his court answers his call!</font><b>"))
			new /mob/living/carbon/superior_animal/psi_monster/flesh_behemoth/baron(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/wasonce/crimson_jelly/jester(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/wasonce/crimson_jelly/pitch_horror/steward(src.loc)
		else if (hound_of_the_crown)
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, heavily wounded and howling in agony as its pack flocks to its side!</font><b>"))
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
			new /mob/living/carbon/superior_animal/psi_monster/licker/pack(src.loc)
		else
			src.visible_message(SPAN_DANGER("<b><font size='3px'>\the [src] appears from thin air in a shower of gore, wounded and screaming in rage!</font><b>"))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		second_teleport = TRUE

/mob/living/carbon/superior_animal/psi_monster/handle_breath(datum/gas_mixture/breath) //we dont breath, were not even real
	return

/mob/living/carbon/superior_animal/psi_monster/handle_environment(var/datum/gas_mixture/environment) //were made up!
	return
