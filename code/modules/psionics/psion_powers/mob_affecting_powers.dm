
// Powers that affect Simple/Super Mobs

/obj/item/organ/internal/psionic_tumor/proc/psychic_call()
	set category = "Psionic powers"
	set name = "Psychic Call (2)"
	set desc = "Expend two points of your psi essence to call creatures from nearby burrows. They are not inherently friendly to you. Use at your own risks."
	psi_point_cost = 2

	if(pay_power_cost(psi_point_cost))
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[owner] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.distress(TRUE)
	else
		to_chat(owner, "You lack enough psi essence to call creatures from burrows.")

/obj/item/organ/internal/psionic_tumor/proc/psychic_banish()
	set category = "Psionic powers"
	set name = "Psychic Banish (4)"
	set desc = "Expend four points of your psi essence to banish nearby creatures capable of burrowing back into the holes from whence they came. Effected creatures must be able to burrow and may \
	resist your psychic influence."
	psi_point_cost = 4

	if(pay_power_cost(psi_point_cost))
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[owner] emits a haunting scream as it turns to flee, taking the nearby horde with it...."))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.evacuate()
	else
		to_chat(owner, "You lack enough psi essence to banish nearby creatures.")

/obj/item/organ/internal/psionic_tumor/proc/mind_jack()
	set category = "Psionic powers"
	set name = "Mindjack (3)"
	set desc = "Expend three psi points to force a lesser creature to ally with you, changing it to not only ally with colonists but to turn on its former friends. Does not work on creatures \
	incapable of proper violence, such as rats."
	psi_point_cost = 3

	if(pay_power_cost(psi_point_cost))
		var/mob/living/carbon/superior_animal/S = get_grabbed_mob(owner)
		if(istype(S, /mob/living/carbon/superior_animal))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [S], a ripple of psionic energy blasting through the air as its forced to serve!"),
					SPAN_DANGER("You place your hand upon [S], focusing your will and making this creature serve!")
					)
			S.faction = "mindjacked"
			S.colony_friend = TRUE
			S.friendly_to_colony = TRUE
			S.loseTarget()
		var/mob/living/simple_animal/hostile/A = get_grabbed_mob(owner)
		if(istype(A, /mob/living/simple_animal/hostile))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [A], a ripple of psionic energy blasting through the air as its forced to serve!"),
					SPAN_DANGER("You place your hand upon [A], focusing your will and making this creature serve!")
					)
			A.faction = "mindjacked"
			A.colony_friend = TRUE
			A.friendly_to_colony = TRUE
			A.LoseTarget()
		else
			usr.show_message("\blue You are not holding someone you can use this power on.")

/obj/item/organ/internal/psionic_tumor/proc/seek_the_dream()
	set category = "Psionic powers"
	set name = "Seek the Dream (5)"
	set desc = "Expend five psi points and wither your body and mind to call three dreaming daemons from somewhere else. They are not inherently allied to you."
	psi_point_cost = 5

	if(pay_power_cost(psi_point_cost))
		owner.stats.changeStat(STAT_TGH, -20)
		owner.stats.changeStat(STAT_VIG, -20)
		owner.stats.changeStat(STAT_ROB, -20)
		owner.stats.changeStat(STAT_COG, -20)
		owner.stats.changeStat(STAT_BIO, -20)
		owner.stats.changeStat(STAT_MEC, -20)
		visible_message(
			SPAN_DANGER("[owner] lets out a blood-curdling wail and drops to their knees as the ground quakes!"),
			SPAN_DANGER("You let out a cry to bring them forth, your body withering as your call is answered!")
		)
		sleep(9)
		for(var/mob/M in range(10, owner))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(owner.loc, 'sound/voice/shriek1.ogg', 20, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, owner))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(owner.loc, 'sound/voice/shriek1.ogg', 60, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, owner))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(owner.loc, 'sound/voice/shriek1.ogg', 80, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, owner))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(owner.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(owner.loc)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(owner.loc)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(owner.loc)

