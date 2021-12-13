/mob/living/carbon/superior_animal/psi_monster/Life()
	. = ..()
	var/turf/L = get_turf(src)
	if(L.get_lumcount() < 0.8)
		heal_overall_damage(healing_factor,healing_factor)
		updatehealth()
/*	if(health >= (maxHealth * 0.9) && (L.get_lumcount() <= 0.8) && stance == HOSTILE_STANCE_IDLE)
		animate(src, alpha = 255, time = 2)
		sleep(2)
		animate(src, alpha = 155, time = 2)
		sleep(2)
		animate(src, alpha = 55, time = 2)
		sleep(2)
		animate(src, alpha = chameleon_skill, time = 2)*/

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
		new /obj/effect/gibspawner/human(src.loc)
		if(prob(50))
			new /obj/effect/gibspawner/human(src.loc)
			new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER("\the [src] looses a terrible scream before journeying to nowhere!"))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		src.forceMove(target)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		if(prob(50))
			new /obj/effect/gibspawner/human(src.loc)
			new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER("\the [src] appears from thin air in a shower of gore, wounded and screaming in rage!"))
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
		new /obj/effect/gibspawner/human(src.loc)
		if(prob(50))
			new /obj/effect/gibspawner/human(src.loc)
			new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER("\the [src] looses an agonized howl before journeying to nowhere!"))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		src.forceMove(target)

		do_sparks(1, 0, src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		new /obj/effect/gibspawner/human(src.loc)
		if(prob(50))
			new /obj/effect/gibspawner/human(src.loc)
			new /obj/effect/gibspawner/human(src.loc)
		src.visible_message(SPAN_DANGER("\the [src] appears from thin air in a shower of gore, gravely injured and howling in agony!"))
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/hallucinations/hell_screech.ogg', 75, 1, 8, 8)

		second_teleport = TRUE

/mob/living/carbon/superior_animal/psi_monster/handle_breath(datum/gas_mixture/breath) //we dont breath, were not even real
	return

/mob/living/carbon/superior_animal/psi_monster/handle_environment(var/datum/gas_mixture/environment) //were made up!
	return

/mob/living/carbon/superior_animal/psi_monster/handle_cheap_breath(datum/gas_mixture/breath as anything)
	return

/mob/living/carbon/superior_animal/psi_monster/handle_cheap_environment(datum/gas_mixture/environment as anything)
	return
