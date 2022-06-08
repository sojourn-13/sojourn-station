// These powers are obtained by killing bosses/enemies in deep maints and have a scary thematic scheme. Unlike other powers, these are immensely powerful or thematic,
/obj/item/organ/internal/psionic_tumor/proc/nightmare_mind()
	set category = "Psionic powers"
	set name = "Nightmarish Mind (1)"
	set desc = "Expend a single psi point to realign your mind to that of nightmare stalkers, causing them to not react to your presence, even when you attack them. May have unforseen consequences."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		owner.faction = "stalker"
		usr.show_message("\blue How easy it would be, to peel back the skin, to see the flesh writhe and bleed as tendons were cut and viscera sliced out with your claws.")


/obj/item/organ/internal/psionic_tumor/proc/bring_darkness()
	set category = "Psionic powers"
	set name = "Bring Darkness (3)"
	set desc = "Expend three psi points to break all the lights connected to the power grid near you. Does not work on independent light sources, sunlight, or grant you sight in darkness."
	psi_point_cost = 3

	if(pay_power_cost(psi_point_cost))
		playsound(owner.loc, 'sound/hallucinations/growl1.ogg', 25,1,8,8)
		var/area/A = get_area(owner)
		for(var/obj/machinery/power/apc/apc in A)
			apc.overload_lighting()
		for(var/turf/T in A)
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "The king sends his regards."
			if(prob(5))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "He dreamed of this place."


/obj/item/organ/internal/psionic_tumor/proc/rust()
	set category = "Psionic powers"
	set name = "Rust (1)"
	set desc = "Expend a single psi point to wither an object, making it rust away and weaken."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		if(owner.get_active_hand())
			var/obj/A = owner.get_active_hand()
			A.make_old()
		else
			to_chat(owner, "You must hold an item in your active hand to wither it.")


/obj/item/organ/internal/psionic_tumor/proc/decay()
	set category = "Psionic powers"
	set name = "Decay (2)"
	set desc = "Expend two psi points to wither and rust every object a person you are grabbing is holding or wearing, rendering each object worse and weaker."
	psi_point_cost = 2

	if(get_grabbed_mob(owner))
		if(pay_power_cost(psi_point_cost))
			var/mob/living/L
			L = get_grabbed_mob(owner)
			if(istype(L, /mob/living/carbon))
				for(var/obj/objects in L.contents)
					if(istype(objects, /obj/item/organ))
						continue
					if(istype(objects, /obj/parallax))
						continue
					if(istype(objects, /obj/item/grab))
						continue
					else
						objects.make_old()
						visible_message(
						SPAN_DANGER("[objects] rusts and decays!"),
						)
	else
		to_chat(src, "You must grab your target!")


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


/obj/item/organ/internal/psionic_tumor/proc/kings_decorum()
	set category = "Psionic powers"
	set name = "Kings Decorum (2)"
	set desc = "Expend two psi points to expel gore, blood, and smoke to decorate the world as the king desires."
	psi_point_cost = 2

	if(pay_power_cost(psi_point_cost))
		var/datum/effect/effect/system/smoke_spread/bad/smoke
		smoke = new
		playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
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
		new /obj/effect/gibspawner/human(owner.loc, owner.dna, owner.species.flesh_color, owner.species.blood_color)
		new /obj/effect/gibspawner/human(owner.loc, owner.dna, owner.species.flesh_color, owner.species.blood_color)
		new /obj/effect/gibspawner/human(owner.loc, owner.dna, owner.species.flesh_color, owner.species.blood_color)
		for(var/turf/simulated/floor/T in orange(5, owner))
			if(prob(20))
				new /obj/effect/gibspawner/human(T, owner.dna, owner.species.flesh_color, owner.species.blood_color)
				new /obj/effect/gibspawner/human(T, owner.dna, owner.species.flesh_color, owner.species.blood_color)
				var/datum/effect/effect/system/smoke_spread/bad/smoke2
				smoke2 = new
				smoke2.set_up(3, 0, T)
				smoke2.attach(T)
				spawn(0)
					smoke.start()
		for(var/turf/simulated/floor/T in orange(7, owner))
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "What a wonderful world..."
				sign.color = owner.species.blood_color
		smoke.set_up(3, 0, owner.loc)
		smoke.attach(owner)
		spawn(0)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()


/obj/item/organ/internal/psionic_tumor/proc/merge_flesh_and_steel()
	set category = "Psionic powers"
	set name = "Merge Flesh and Steel (10)"
	set desc = "Expend a massive pool of ten psi points and your own body to become something greater. To grasp at perfection, one must make sacrifices..."
	psi_point_cost = 10

	if(alert(usr, "Are you sure you want to do this? It will absoutely kill you.", "Merge Flesh and Steel", "Yes", "No") == "Yes" && pay_power_cost(psi_point_cost))
		new /obj/machinery/hivemind_machine/node(owner.loc)
		owner.gib()
		log_and_message_admins("[owner] has merged flesh and steel and become a hivemind node!")


/obj/item/organ/internal/psionic_tumor/proc/ascend_another()
	set category = "Psionic powers"
	set name = "Psionic Ascension (5)"
	set desc = "Expend five psi points to ascend someone standing in front of you, making them a psion. The process is extremely damaging to the mind and you must stand still during it."
	psi_point_cost = 5

	if(get_front_mob(owner))
		var/mob/living/carbon/human/L = get_front_mob(owner)
		if(istype(L, /mob/living/carbon/human) && L.stat == CONSCIOUS)
			if(L.ckey)
				if(alert(L, "An alien presence touches your mind, offering you power and insight into the very fabric of reality. Do you accept its offer and become a Psion?",
					"Become Psion", "No", "Yes") != "Yes")
					to_chat(owner, "They refused your gift!")
					return
				else
					if(L && isliving(L) && !L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
						visible_message(
							SPAN_WARNING("[src] grabs [L]! Psionic energy alights [src]'s eyes as they focus intently on [L] !"),
							SPAN_WARNING("You project your psionic essence, turning it towards [L].")
						)
						L.make_psion()
						owner.adjustBrainLoss(10)
						to_chat(owner, "You feel a horrible splitting migraine as the process ends.")
						to_chat(L, "Your mind is aflame with possibilities! You can see, you can SEE, YOU CAN SEE IT ALL!")
	else
		to_chat(src, "You must face your target!")


/obj/item/organ/internal/psionic_tumor/proc/cerebral_hemorrhage()
	set category = "Psionic powers"
	set name = "Cerebral Hemorrhage (5)"
	set desc = "Expend five psi points to destroy the brain of anyone you are grappling. Lesser creatures will be instantly slain in a messy fashion, unless they are harmless."
	psi_point_cost = 5

	var/mob/living/carbon/human/L = get_grabbed_mob(owner)
	if(istype(L, /mob/living/carbon/human))
		if(L && isliving(L) && !L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(psi_point_cost))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [L], a terrible crackle of psionic energy lancing their eyes!"),
					SPAN_DANGER("You place your hand upon [L], focusing your thoughts before you snuff out their life!")
					)
			L.adjustBrainLoss(60)
	var/mob/living/carbon/superior_animal/S = get_grabbed_mob(owner)
	if(istype(S, /mob/living/carbon/superior_animal) && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand on [S], a terrible crackle of psionic energy lancing their eyes before their whole form is overwhelmed!"),
				SPAN_DANGER("You place your hand upon [S], focusing your thoughts before you snuff out their life!")
				)
		S.gib()
	var/mob/living/simple_animal/hostile/A = get_grabbed_mob(owner)
	if(istype(A, /mob/living/simple_animal/hostile) && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand on [A], a terrible crackle of psionic energy lancing their eyes before their whole form is overwhelmed!"),
				SPAN_DANGER("You place your hand upon [A], focusing your thoughts before you snuff out their life!")
				)
		A.gib()
	else
		usr.show_message("\blue You are not holding someone you can use this power on.")


/obj/item/organ/internal/psionic_tumor/proc/mind_jack()
	set category = "Psionic powers"
	set name = "Mindjack (3)"
	set desc = "Expend three psi points to force a lesser creature to ally with you, changing it to not only ally with colonists but to turn on its former friends. Does not work on creatures \
	incapable of proper violence, such as rats."
	psi_point_cost = 3

	var/mob/living/carbon/superior_animal/S = get_grabbed_mob(owner)
	if(istype(S, /mob/living/carbon/superior_animal) && pay_power_cost(psi_point_cost))
		usr.visible_message(
				SPAN_DANGER("[usr] places a hand on [S], a ripple of psionic energy blasting through the air as its forced to serve!"),
				SPAN_DANGER("You place your hand upon [S], focusing your will and making this creature serve!")
				)
		S.faction = "mindjacked"
		S.colony_friend = TRUE
		S.friendly_to_colony = TRUE
		S.loseTarget()
	var/mob/living/simple_animal/hostile/A = get_grabbed_mob(owner)
	if(istype(A, /mob/living/simple_animal/hostile) && pay_power_cost(psi_point_cost))
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