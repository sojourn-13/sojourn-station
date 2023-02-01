/mob/living/carbon/superior_animal/psi_monster/Life()
	. = ..()
	var/turf/L = get_turf(src)
	if(L.get_lumcount() < 0.8 && maxHealth > health) //So were not endlessly healing a full health mob
		heal_overall_damage(healing_factor,healing_factor)
		updatehealth()
	if(health >= (maxHealth * 0.9) && (L.get_lumcount() <= 0.8) && stance == HOSTILE_STANCE_IDLE && alpha == 255) //We dont want this triggering 40 times
		//We do if src in case someone has a gun to 1 shot them mid-animation and kills them on the spot.
		if(src) animate(src, alpha = 200, time = 2)
		spawn(3) if(src) animate(src, alpha = 155, time = 2)
		spawn(3) if(src) animate(src, alpha = 55, time = 2)
		spawn(3) if(src) animate(src, alpha = chameleon_skill, time = 2)

/mob/living/carbon/superior_animal/psi_monster/dreaming_king/Life()
	. = ..()
	if(health <= (maxHealth * 0.66) && first_teleport == FALSE)
		var/turf/simulated/floor/target
		var/list/validtargets = list()

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
		var/turf/simulated/floor/target
		var/list/validtargets = list()

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
