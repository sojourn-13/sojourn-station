/obj/item/bolus
	name = "Bolus"
	desc = "A large pill made by strange materals not able to be found normally."
	icon = 'modular_sojourn/bolus_icons.dmi'
	icon_state = "boluse"
	w_class = ITEM_SIZE_SMALL
	var/requires_eating = TRUE
	var/perk = null
	var/same_faction_restiction = FALSE

/obj/item/bolus/attack_self(mob/user as mob)
	..()
	check(user)

//So that we can nom it by attacking areselfs
/obj/item/bolus/attack(mob/M as mob, mob/user as mob, def_zone)
	if(M == user)
		check(user)
		return
	..()


/obj/item/bolus/proc/nom(mob/user)
	if(perk && isliving(user))
		//We buff EVERYONE around us when eating a bolus
		for(var/mob/living/M in view(3,src))
			if(M.stat == DEAD)
				continue
			if(same_faction_restiction)
				if(M.faction != user.faction)
					continue
			if(perk)
				if(isliving(M))
					var/mob/living/L = M
					L.stats.addPerk(perk)

	qdel(src)

/obj/item/bolus/proc/check(mob/user)
	if(isliving(user))
		var/mob/living/L = user

		//Dead cant eat a bolus
		if(L.stat == DEAD)
			return

		//Small check for humans to prevent eating through masks
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(requires_eating)
				var/obj/item/blocked = H.check_mouth_coverage()
				if(blocked)
					to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
					return

		nom(user)

		if(requires_eating)
			to_chat(user, SPAN_NOTICE("You silently pop and shallow the [src]."))
		else
			to_chat(user, SPAN_NOTICE("You crush the bolus in your hand, and feel it appear inside your chest none the less."))
		return

	to_chat(user, SPAN_NOTICE("Only living things can eat a bolus."))

/obj/item/bolus/revival
	name = "Dart Bolus: Their Struggle (他们的奋斗)"
	desc = "A large dart type bolus made by strange materals not able to be found normally. \
	This Bolus once fully processed will revive a dead body. Does not heal wounds and barely stablizes."
	requires_eating = FALSE
	perk = PERK_BOLUS_REVIVE

/obj/item/bolus/revival_mkii
	name = "Dart Bolus: Their Last Stand (他们的最后一战)"
	desc = "A large dart type bolus made by strange materals not able to be found normally. \
	This Bolus once fully processed will revive a dead body and trys to stablize the dead. Only for the user that takes the bolus"
	requires_eating = FALSE
	perk = PERK_BOLUS_REVIVE

/obj/item/bolus/revival_mkii/nom(mob/user)
	..()
	if(isliving(user))
		var/mob/living/L = user
		if(L.stats.getPerk(PERK_BOLUS_REVIVE))
			var/datum/perk/cooldown/bolus_revive/BR = L.stats.getPerk(PERK_BOLUS_REVIVE)
			BR.stage += 1 //We scale endlessly

/obj/item/bolus/cqc
	name = "Dart Bolus: Palm of Iron"
	desc = "A large dart type bolus made by strange materals not able to be found normally. \
	This Bolus will increase the force of attacks in CQC."
	requires_eating = FALSE
	perk = PERK_BOLUS_CQC

/obj/item/bolus/armor
	name = "Dart Bolus: Armor Stand"
	desc = "A large dart type bolus made by strange materals not able to be found normally. \
	This Bolus will greatly increase ones armor, as in the the gear they are wearing, after a short time will then take some damage."
	requires_eating = FALSE
	perk = PERK_BOLUS_ARMOR

/obj/item/bolus/agro
	name = "Dart Bolus: Straw Dummy"
	desc = "A large dart type bolus made by strange materals not able to be found normally. \
	This Bolus will on use make everything able to see you as a threat do so, as well as weaken them."
	requires_eating = FALSE

//This one is uniquic
/obj/item/bolus/agro/nom(mob/user)
	if(isliving(user))
		for(var/mob/M in view(5,src))
			if(M.stat == DEAD)
				continue
			if(M.faction == M.faction)
				continue
			if(issuperioranimal(M))
				var/mob/living/carbon/superior/SA = M
				SA.loseTarget(TRUE,TRUE)
				SA.react_to_attack(SA,src,user)
			if(istype(user, /mob/living/simple/hostile))
				var/mob/living/simple/hostile/H = M
				H.LoseTarget()
				H.stance = HOSTILE_STANCE_ATTACK
			if(isliving(M))
				var/mob/living/L = M
				L.stats.addPerk(PERK_BOLUS_WEAKEN) //Debuff em
		qdel(src)

/obj/item/bolus/slowdown_reduction
	name = "Pill Bolus: Momentium"
	desc = "A pill type bolus that aids the consumer in handling equipment."
	perk = PERK_BOLUS_EQUI_AID

/obj/item/bolus/slowdown_reduction_mkii
	name = "Pill Bolus: Rolling"
	desc = "A pill type bolus that aids the consumer in handling equipment. This is a more advanced verson of the Pill Bolus: Momentium for only the consumer."
	perk = PERK_BOLUS_EQUI_AID

/obj/item/bolus/slowdown_reduction_mkii/nom(mob/user)
	..()
	if(isliving(user))
		var/mob/living/L = user
		if(L.stats.getPerk(PERK_BOLUS_EQUI_AID))
			var/datum/perk/cooldown/bolus_momentiums/TA = L.stats.getPerk(PERK_BOLUS_EQUI_AID)
			TA.stage = 2

/obj/item/bolus/healing
	name = "Pill Bolus: X-92.133333333"
	desc = "A slow working Bolus that heals the consumer greatly after its done."
	perk = PERK_BOLUS_AID

/obj/item/bolus/healing_mkii
	name = "Pill Bolus: Y-1027.711111111"
	desc = "A slow working Bolus that heals the consumer greatly after its done. Type Y enhances the healing process further, but only for the one that consumed the Bolus."
	perk = PERK_BOLUS_AID

/obj/item/bolus/healing_mkii/nom(mob/user)
	..()
	if(isliving(user))
		var/mob/living/L = user
		if(L.stats.getPerk(PERK_BOLUS_AID))
			var/datum/perk/cooldown/bolus_healing/BA = L.stats.getPerk(PERK_BOLUS_AID)
			if(BA.stage < 3) //Dont nerf us if we have a higher value
				BA.stage = 3

/obj/item/bolus/healing_mkiii
	name = "Pill Bolus: Z-29375.09127"
	desc = "A slow working Bolus that heals the consumer greatly after its done. Type Z greatly enhances the healing process further of both Y and X, but only for the one that consumed the Bolus."
	perk = PERK_BOLUS_AID

/obj/item/bolus/healing_mkiii/nom(mob/user)
	..()
	if(isliving(user))
		var/mob/living/L = user
		if(L.stats.getPerk(PERK_BOLUS_AID))
			var/datum/perk/cooldown/bolus_healing/BA = L.stats.getPerk(PERK_BOLUS_AID)
			//If we are already enhanced, just give us the bonus but dont stack past that, small room for 3->7 as a feature
			if(BA.stage > 2)
				BA.stage += 4
			if(BA.stage < 5) //Dont nerf us if we have a higher value
				BA.stage = 5


// STRONGER THEN IT LOOKS: Allows for overcharging points
/obj/item/bolus/core_implants
	name = "Pill Bolus: 3-2"
	desc = "A fast acting bolus that when consumed recharges Psionics and Faithful implants alike."
	var/stage = 5 //How mant psionic/faith points are healed

/obj/item/bolus/core_implants/nom(mob/user)
	if(isliving(user))
		for(var/mob/living/carbon/human/H in view(5,src))
			if(H.stat == DEAD)
				continue
			if(H.faction != H.faction)
				continue

			var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
			if(I && I.active && I.wearer)
				I.power += stage + stage //2x for church as they need more power
				continue

			var/obj/item/organ/internal/psionic_tumor/PT = H.random_organ_by_process(BP_PSION)
			if(PT) // Is the target a psion
				PT.psi_points += stage

		qdel(src)

/obj/item/bolus/core_implants/mkiii
	name = "Pill Bolus: 11-5"
	stage = 30

/obj/item/bolus/core_implants/mkii
	name = "Pill Bolus: 8-4"
	stage = 15
