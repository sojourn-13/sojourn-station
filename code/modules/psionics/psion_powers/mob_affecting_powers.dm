
// Powers that affect Simple/Super Mobs

/mob/living/carbon/human/proc/psychic_call()
	set category = "Psionic powers"
	set name = "Psychic Call (2)"
	set desc = "Expend two points of your psi essence to call creatures from nearby burrows. They are not inherently friendly to you. Use at your own risks."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[user] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.distress(TRUE)
	else
		to_chat(user, "You lack enough psi essence to call creatures from burrows.")

/mob/living/carbon/human/proc/psychic_banish()
	set category = "Psionic powers"
	set name = "Psychic Banish (4)"
	set desc = "Expend four points of your psi essence to banish nearby creatures capable of burrowing back into the holes from whence they came. Effected creatures must be able to burrow and may \
	resist your psychic influence."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[user] emits a haunting scream as it turns to flee, taking the nearby horde with it...."))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.evacuate()
	else
		to_chat(user, "You lack enough psi essence to banish nearby creatures.")

/mob/living/carbon/human/proc/mind_jack()
	set category = "Psionic powers"
	set name = "Mindjack (3)"
	set desc = "Expend three psi points to force a lesser creature to ally with you, changing it to not only ally with colonists but to turn on its former friends. Does not work on creatures \
	incapable of proper violence, such as rats."
	var/psi_point_cost = 3
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/mob/living/carbon/superior_animal/S = get_grabbed_mob(user)
		if(istype(S, /mob/living/carbon/superior_animal))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [S], a ripple of psionic energy blasting through the air as its forced to serve!"),
					SPAN_DANGER("You place your hand upon [S], focusing your will and making this creature serve!")
					)
			S.faction = "mindjacked"
			S.colony_friend = TRUE
			S.friendly_to_colony = TRUE
			S.loseTarget()
		var/mob/living/simple_animal/hostile/A = get_grabbed_mob(user)
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

/mob/living/carbon/human/proc/seek_the_dream()
	set category = "Psionic powers"
	set name = "Seek the Dream (5)"
	set desc = "Expend five psi points and wither your body and mind to call three dreaming daemons from somewhere else. They are not inherently allied to you."
	var/psi_point_cost = 5
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.stats.changeStat(STAT_TGH, -20)
		user.stats.changeStat(STAT_VIG, -20)
		user.stats.changeStat(STAT_ROB, -20)
		user.stats.changeStat(STAT_COG, -20)
		user.stats.changeStat(STAT_BIO, -20)
		user.stats.changeStat(STAT_MEC, -20)
		visible_message(
			SPAN_DANGER("[user] lets out a blood-curdling wail and drops to their knees as the ground quakes!"),
			SPAN_DANGER("You let out a cry to bring them forth, your body withering as your call is answered!")
		)
		sleep(9)
		for(var/mob/M in range(10, user))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(user.loc, 'sound/voice/shriek1.ogg', 20, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, user))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(user.loc, 'sound/voice/shriek1.ogg', 60, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, user))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(user.loc, 'sound/voice/shriek1.ogg', 80, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, user))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(user.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(user.loc)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(user.loc)
		new /mob/living/simple_animal/hostile/nightmare/dream_daemon(user.loc)

/mob/living/carbon/human/proc/psionic_swarm()
	set category = "Psionic powers"
	set name = "Psionic Swarm (2)"
	set desc = "Spend two psionic essence to call forth a psionic energy cloud that will rip at foes and protect you for a short time."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.visible_message(
			"[user] summons forth a swarm of swirling crackling blue energies!",
			"You summon forth a psionic swarm around you!"
			)
		playsound(usr.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
		new /mob/living/simple_animal/hostile/viscerator/psionic(user.loc)
