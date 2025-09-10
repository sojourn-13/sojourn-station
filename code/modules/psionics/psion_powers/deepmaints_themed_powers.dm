// These powers are obtained by killing bosses/enemies in deep maints and have a scary thematic scheme. Unlike other powers, these are immensely powerful or thematic,

/mob/living/carbon/human/proc/bring_darkness()
	set category = "Psionic powers.Summoning"
	set name = "Bring Darkness (3)"
	set desc = "Spend three psi points to break all the lights connected to the power grid near you. Does not work on independent light sources, sunlight, and doesn't grant you sight in the dark."
	var/psi_point_cost = 3
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(user.loc, 'sound/hallucinations/growl1.ogg', 25,1,8,8)
		var/area/A = get_area(user)
		for(var/obj/machinery/power/apc/apc in A)
			apc.overload_lighting()
		for(var/turf/T in A)
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "The king sends his regards."
			if(prob(5))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "He dreamed of this place."

/mob/living/carbon/human/proc/kings_decorum()
	set category = "Psionic powers.Summoning"
	set name = "Kings Decorum (2)"
	set desc = "Spend two psi points to expel gore, blood, and smoke to decorate the world as the king desires."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/datum/effect/effect/system/smoke_spread/bad/smoke
		smoke = new
		playsound(user, 'sound/effects/smoke.ogg', 50, 1, -3)
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
		new /obj/effect/gibspawner/human(user.loc, user.dna, user.species.flesh_color, user.species.blood_color)
		new /obj/effect/gibspawner/human(user.loc, user.dna, user.species.flesh_color, user.species.blood_color)
		new /obj/effect/gibspawner/human(user.loc, user.dna, user.species.flesh_color, user.species.blood_color)
		for(var/turf/simulated/floor/T in orange(5, user))
			if(prob(20))
				new /obj/effect/gibspawner/human(T, user.dna, user.species.flesh_color, user.species.blood_color)
				new /obj/effect/gibspawner/human(T, user.dna, user.species.flesh_color, user.species.blood_color)
				var/datum/effect/effect/system/smoke_spread/bad/smoke2
				smoke2 = new
				smoke2.set_up(3, 0, T)
				smoke2.attach(T)
				spawn(0)
					smoke.start()
		for(var/turf/simulated/floor/T in orange(7, user))
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = "What a wonderful world..."
				sign.color = user.species.blood_color
		smoke.set_up(3, 0, user.loc)
		smoke.attach(user)
		spawn(0)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()


/mob/living/carbon/human/proc/merge_flesh_and_steel()
	set category = "Psionic powers.Ascension"
	set name = "Merge Flesh and Steel (10)"
	set desc = "Expend a massive pool of ten psi points and your own body to become something greater. To grasp at perfection, one must make sacrifices..."
	var/psi_point_cost = 10
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)


	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(alert(usr, "Are you sure you want to do this? It will absoutely kill you.", "Merge Flesh and Steel", "Yes", "No") == "Yes")
			new /obj/machinery/hivemind_machine/node(user.loc)
			user.gib()
			log_and_message_admins("[user] has merged flesh and steel and become a hivemind node!")


/mob/living/carbon/human/proc/ascend_another()
	set category = "Psionic powers.Ascension"
	set name = "Psionic Ascension (5)"
	set desc = "Spend five psi points to ascend someone standing in front of you, making them a psion. The process is extremely damaging to the mind and you must stand still during it."
	var/psi_point_cost = 5
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	var/mob/living/carbon/human/L = get_front_mob(user)
	if(L)
		if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility(TRUE, L))
			if(istype(L, /mob/living/carbon/human) && L.stat == CONSCIOUS)
				if(L.ckey)
					if(alert(L, "An alien presence touches your mind, offering you power and insight into the very fabric of reality. Do you accept its offer and become a Psion?",
						"Become Psion", "No", "Yes") != "Yes")
						to_chat(user, "They refused your gift!")
						return
					else
						if(L && isliving(L) && !L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC)
							visible_message(
								SPAN_WARNING("[src] grabs [L]! Psionic energy alights [src]'s eyes as they focus intently on [L] !"),
								SPAN_WARNING("You project your psionic essence, turning it towards [L].")
							)
							L.make_psion()
							user.adjustBrainLoss(10)
							to_chat(user, "You feel a horrible splitting migraine as the process ends.")
							to_chat(L, "Your mind is aflame with possibilities! You can see, you can SEE, YOU CAN SEE IT ALL!")
	else
		to_chat(src, "You must face your target!")


/mob/living/carbon/human/proc/cerebral_hemorrhage()
	set category = "Psionic powers.Ascension" //Being fodder for the strong
	set name = "Cerebral Hemorrhage (5)"
	set desc = "Spend five psi points to destroy the brain of anyone you are grappling. Lesser creatures will be instantly slain in a messy fashion, unless they are harmless."
	var/psi_point_cost = 5
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)


	if(PT && PT.pay_power_cost(psi_point_cost))
		var/mob/living/carbon/human/L = get_grabbed_mob(user)
		if(istype(L, /mob/living/carbon/human))
			if(L.psi_blocking >= 10)
				user.stun_effect_act(0, L.psi_blocking * 5, BP_HEAD)
				user.weakened = L.psi_blocking
				usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
				return

			if(L && isliving(L) && !L.get_core_implant(/obj/item/implant/core_implant/cruciform) && L.species?.reagent_tag != IS_SYNTHETIC)
				usr.visible_message(
						SPAN_DANGER("[usr] places a hand on [L], a terrible crackle of psionic energy lancing their eyes!"),
						SPAN_DANGER("You place your hand upon [L], focusing your thoughts before you snuff out their life!")
						)
				L.adjustBrainLoss(60)
		var/mob/living/carbon/superior/S = get_grabbed_mob(user)
		if(istype(S, /mob/living/carbon/superior))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [S], a terrible crackle of psionic energy lancing their eyes before their whole form is overwhelmed!"),
					SPAN_DANGER("You place your hand upon [S], focusing your thoughts before you snuff out their life!")
					)
			S.gib()
		var/mob/living/simple/hostile/A = get_grabbed_mob(user)
		if(istype(A, /mob/living/simple/hostile))
			usr.visible_message(
					SPAN_DANGER("[usr] places a hand on [A], a terrible crackle of psionic energy lancing their eyes before their whole form is overwhelmed!"),
					SPAN_DANGER("You place your hand upon [A], focusing your thoughts before you snuff out their life!")
					)
			A.gib()
		else
			usr.show_message("\blue You are not holding someone you can use this power on.")

