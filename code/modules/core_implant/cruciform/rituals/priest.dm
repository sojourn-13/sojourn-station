/datum/ritual/cruciform/priest
	name = "priest"
	phrase = null
	desc = ""
	category = "Initiation"

/datum/ritual/targeted/cruciform/priest
	name = "priest targeted"
	phrase = null
	desc = ""
	category = "Initiation"

/*
	Penance
	Deals pain damage to a targeted disciple
*/

/datum/ritual/targeted/cruciform/priest/penance
	name = "Penance"
	phrase = "Mihi vindicta \[Target human]"
	desc = "Imparts extreme pain on the target disciple. Does no actual harm. Use this on someone who performs a heretical act."
	power = 35
	category = "Devotion"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/targeted/cruciform/priest/penance/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances, like if both are inside the same mecha
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of penance")
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	if (do_after(user, 20, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return

		log_and_message_admins(" inflicted pain on [H] with penance litany")
		to_chat(H, SPAN_DANGER("A wave of agony washes over you, the cruciform in your chest searing like a star for a few moments of eternity."))

		H.adjustHalLoss(50)
		var/datum/effect/effect/system/spark_spread/s = new
		s.set_up(1, 1, H.loc)
		s.start()
		return TRUE

/*
	Convalescence
	Heals yourself a fair amount
*/

/datum/ritual/cruciform/priest/selfheal
	name = "Convalescence"
	phrase = "Dominus autem dirigat corda vestra in caritate Dei et patientia deus."
	desc = "Recover from the ravages of wounds and pain."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	power = 35 //Healing yourself is slightly easier than healing someone else
	category = "Vitae"
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/selfheal/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C,list/targets)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	if(H.species?.reagent_tag == IS_SYNTHETIC)
		to_chat(H, SPAN_WARNING("You fail to cast the litany due to your non-organic body..."))
		return FALSE
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
	H.reagents.add_reagent("laudanum", 5)
	H.adjustBruteLoss(-15)
	H.adjustFireLoss(-15)
	H.adjustOxyLoss(-20)
	H.sanity.changeLevel(10)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/priest/heal_other
	name = "Succour"
	phrase = "Venite ad me, omnes qui laboratis, et onerati estis et ego reficiam vos."
	desc = "Restore the sanity of another nearby disciple."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	power = 45
	category = "Vitae"
	nutri_cost = 60
	blood_cost = 60

/datum/ritual/cruciform/priest/heal_other/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances, like if both are inside the same mecha
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of succor")
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (H.species?.reagent_tag == IS_SYNTHETIC)
			to_chat(user, SPAN_DANGER("[H] is synthetic, healing them has no effect!"))
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
		H.reagents.add_reagent("laudanum", 5)
		H.sanity.changeLevel(25)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/priest/heal_heathen
	name = "Divine Hymn"
	phrase = "Ora pro nobis, qui non noverunt viam, hi sunt amissa, sed quia dilexit."
	desc = "Heal every person who can see and hear for a small amount, even if they do not have a cruciform. Can only be done every quarter hour and requires alot of power. Using this prayer prevents other similar prayers from being used for awhile."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "dhymn"
	power = 50
	category = "Vitae"
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/heal_heathen/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/priest/heal_heathen/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain.</span>")
		participant.reagents.add_reagent("laudanum", 5, "bicaridine", 5, "kelotane", 5)
		participant.adjustOxyLoss(-20)
		participant.sanity.changeLevel(15)
		participant.updatehealth()

/*
	Scrying: Remotely look through someone's eyes. Global range, useful to find fugitives or corpses
	Uses all of your power and has a limited duration
*/
/datum/ritual/cruciform/priest/scrying
	name = "Scrying"
	phrase = "Ecce ego ad te et ad caelum. Scio omnes absconditis tuis. Vos can abscondere, tu es coram me: nudus."
	desc = "Look into the world from the eyes of another believer. Strenuous and can only be maintained for half a minute. The target will sense they are being watched, but not by whom. This prayer requires power only primes and crusaders have."
	power = 100
	category = "Devotion"
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/scrying/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)

	if(!user.client)
		return FALSE

	var/mob/living/M = pick_disciple_global(user, TRUE)
	if (!M)
		return

	if(user == M)
		fail("You feel stupid.",user,C,targets)
		return FALSE

	to_chat(M, SPAN_NOTICE("You feel an odd presence in the back of your mind. A lingering sense that someone is watching you..."))

	var/mob/observer/eye/god/eye = new/mob/observer/eye/god(M)
	eye.target = M
	eye.owner_mob = user
	eye.owner_loc = user.loc
	eye.owner = eye
	user.reset_view(eye)

	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)

	//After 30 seconds, your view is forced back to yourself
	addtimer(CALLBACK(user, .mob/proc/reset_view, user), 300)

	return TRUE


/datum/ritual/targeted/cruciform/priest/god_eye/process_target(var/index, var/obj/item/implant/core_implant/target, var/text)
	if(index == 1 && target.address == text && target.active)
		if(target.wearer && target.wearer.stat != DEAD)
			return target

/datum/ritual/cruciform/priest/epiphany
	name = "Epiphany"
	phrase = "In nomine Patris et Filii et Spiritus sancti."
	desc = "The Absolute's principal sacrament is a ritual of baptism and merging with cruciform. A body, relieved of clothes should be placed on Absolute's special altar."
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/priest/epiphany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(CI.activated || CI.active)
		fail("This cruciform already has a soul inside.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("It is too late for this one, the soul has already left the vessel", user, C)
		return FALSE

	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("successfully baptized [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your cruciform vibrates and warms up.</span>")

	CI.activate()

	if(get_storyteller())	//Call objectives update to check inquisitor objective completion
		get_storyteller().update_objectives()

	return TRUE

/* - This will be used later, when new cult arrive.
/datum/ritual/cruciform/banish
	name = "banish"
	phrase = "Et ne inducas nos in tentationem, sed libera nos a malo"
*/

/*
/datum/ritual/cruciform/priest/reincarnation
	name = "Reincarnation"
	phrase = "Vetus moritur et onus hoc levaverit"
	desc = "A reunion of a spirit with it's new body, ritual of activation of a crucifrom, lying on the body. The process requires NeoTheology's special altar on which a body stripped of clothes is to be placed."

/datum/ritual/cruciform/priest/reincarnation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	var/datum/core_module/cruciform/cloning/data = CI.get_module(CRUCIFORM_CLONING)

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(!CI.activated)
		fail("This cruciform doesn't have soul inside.", user, C)
		return FALSE

	if(CI.active)
		fail("This cruciform already activated.", user, C)
		return FALSE

	if(CI.wearer.stat == DEAD)
		fail("Soul cannot move to dead body.", user, C)
		return FALSE

	var/datum/mind/MN = data.mind
	if(!istype(MN, /datum/mind))
		fail("Soul is lost.", user, C)
		return FALSE
	if(MN.active)
		if(data.ckey != ckey(MN.key))
			fail("Soul is lost.", user, C)
			return FALSE
	if(MN.current && MN.current.stat != DEAD)
		fail("Soul is lost.", user, C)
		return FALSE

	var/succ = CI.transfer_soul()

	if(!succ)
		fail("Soul transfer failed.", user, C)
		return FALSE


	return TRUE
*/

/datum/ritual/cruciform/priest/install
	name = "Commitment"
	phrase = "Unde ipse Dominus dabit vobis signum."
	desc = "This litany will command a cruciform attach to person so you can perform an epiphany. Cruciform must lay near them."
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/priest/install/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	if(CI)
		fail("[H] already have a cruciform installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	CI = locate(/obj/item/implant/core_implant/cruciform) in L

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if (H.stat == DEAD)
		fail("It is too late for this one, the soul has already left the vessel", user, C)
		return FALSE

	if(!(H in L))
		fail("Cruciform is too far from [H].", user, C)
		return FALSE

	if(CI.active)
		fail("Cruciform already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	for(var/obj/item/clothing/CL in H)
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE

	if(!CI.install(H, BP_CHEST, user) || CI.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	if(ishuman(H))
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		var/mob/living/carbon/human/M = H
		var/obj/item/organ/external/E = M.organs_by_name[BP_CHEST]
		for (var/i = 0; i < 5;i++)
			E.take_damage(5, sharp = FALSE)
			//Deal 25 damage in five hits. Using multiple small hits mostly prevents internal damage

		M.custom_pain("You feel the nails of the cruciform drive into your ribs!",1)
		M.update_implants()
		M.updatehealth()

	return TRUE

/datum/ritual/cruciform/priest/ejection
	name = "Deprivation"
	phrase = "Et revertatur pulvis in terram suam unde erat et spiritus redeat ad Deum qui dedit illum."
	desc = "This litany will command a cruciform to detach from its bearer, if the one bearing it is dead."
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/priest/ejection/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	var/mob/M = CI.wearer

	if(ishuman(M) && is_dead(M))
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/E = H.organs_by_name[BP_CHEST]
		E.take_damage(15)
		H.custom_pain("You feel the cruciform ripping out of your chest!",1)
		CI.name = "[M]'s Cruciform"
		CI.uninstall()
		return TRUE

	else if(ismob(M) && is_dead(M)) //Cruciforms can't normally be placed on non-humans, but this is still here for sanity purposes.
		CI.name = "[M]'s Cruciform"
		CI.uninstall()
		return TRUE

	else
		fail("Deprivation does not work upon the living.", user, C)
		return FALSE

/datum/ritual/cruciform/priest/unupgrade
	name = "Asacris"
	phrase = "A caelo usque ad centrum."
	desc = "This litany will remove any upgrade from the target's cruciform implant. Usuable only by primes and crusaders."
	power = 100
	category = "Devotion"
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/unupgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI)
		fail("There is no cruciform on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(!istype(CI.upgrades) || length(CI.upgrades) <= 0)
		fail("There is no upgrades on this one.", user, C)
		return FALSE

	for(var/obj/item/coreimplant_upgrade/CU in CI.upgrades)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		CU.remove()
		log_and_message_admins("removed upgrade from [C] cruciform with asacris litany")
		user.sanity.changeLevel(-50)

	return TRUE

/datum/ritual/targeted/cruciform/priest/upgrade_kit
	name = "Curaverunt"
	phrase = "Dominus manum meam pro damnato in ovile redire voluerit."
	desc = "Request an upgrade kit to restore a vector or prime's cruciform to its devout stage. This litany requires you to stand next to an altar."
	power = 50
	success_message = "On the verge of audibility you hear pleasant music, the alter slides open and a devout upgrade circuit slips out."
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/targeted/cruciform/priest/upgrade_kit/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	new /obj/item/coreimplant_upgrade/cruciform/priest(altar.loc)
	set_personal_cooldown(user)

/datum/ritual/cruciform/priest/initiation
	name = "Initiation"
	phrase = "Habe fiduciam in Domino ex toto corde tuo et ne innitaris prudentiae tuae, in omnibus viis tuis cogita illum et ipse diriget gressus tuos."
	desc = "The second stage of granting a promotion to a disciple, upgrading them to a devout. The devout ascension kit is the first step."
	power = 50
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/initiation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found",user,C)
		return FALSE

	if(CI.get_module(CRUCIFORM_PRIEST) || CI.get_module(CRUCIFORM_INQUISITOR))
		fail("The target is already a devout.",user,C)
		return FALSE

	var/datum/core_module/activatable/cruciform/priest_convert/PC = CI.get_module(CRUCIFORM_PRIEST_CONVERT)

	if(!PC)
		fail("Target must have devout upgrade inside his cruciform.",user,C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	PC.activate()
	log_and_message_admins("promoted disciple [C] to devout with initiation litany")

	return TRUE

///////////////////////////////////////
///////////SHORT BOOST LITANIES////////
///////////////////////////////////////

/datum/ritual/cruciform/priest/short_boost
	name = "Short boost ritual"
	phrase = null
	desc = "This litany boosts the stats of everyone who is near you on the short time."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 10 MINUTES
	cooldown_category = "short_boost"
	category = "Words of Power"
	var/list/stats_to_boost = list()
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/short_boost/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, for about ten minutes."

/datum/ritual/cruciform/priest/short_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			give_boost(participant)
			add_effect(participant, FILTER_HOLY_GLOW, 25)
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE

/datum/ritual/cruciform/priest/short_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.addTempStat(stat, amount, effect_time, src.name)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("A wave of dizziness washes over you and your mind is filled with a sudden insight into [get_stats_to_text()]."))

/datum/ritual/cruciform/priest/short_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	to_chat(participant, SPAN_WARNING("Your knowledge of [get_stats_to_text()] feels lessened."))

/datum/ritual/cruciform/priest/short_boost/proc/get_stats_to_text()
	if(stats_to_boost.len == 1)
		return lowertext(stats_to_boost[1])
	var/stats_text = ""
	for(var/i = 1 to stats_to_boost.len)
		var/stat = stats_to_boost[i]
		if(i == stats_to_boost.len)
			stats_text += " and [stat]"
			continue
		if(i == 1)
			stats_text += "[stat]"
		else
			stats_text += ", [stat]"
	return lowertext(stats_text)

/datum/ritual/cruciform/priest/short_boost/mental
	name = "Grace of Perseverance"
	phrase = "Domine petra mea et robur meum et salvator meus Deus meus fortis meus sperabo in eo scutum meum et cornu salutis meae susceptor meus."
	stats_to_boost = list(STAT_MEC = 10, STAT_COG = 10, STAT_BIO = 10)

/datum/ritual/cruciform/priest/short_boost/physical
	name = "Canto of Courage"
	phrase = "In Deo laudabo verbum in Domino praedicabo sermonem in Deo speravi non timebo quid faciat homo mihi."
	stats_to_boost = list(STAT_ROB = 10, STAT_TGH = 10, STAT_VIG = 10)

/datum/ritual/cruciform/priest/records
	name = "Baptismal Record"
	phrase = "Memento nomina."
	desc = "Requests a copy of the churches local parishoner records from your altar."
	power = 30
	success_message = "On the verge of audibility you hear pleasant music, a piece of paper slides out from a slit in the altar."

/datum/ritual/cruciform/priest/records/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		new /obj/item/paper/neopaper(altar.loc, disciples.Join("\n"), "Church Record")
	return TRUE

/datum/ritual/cruciform/priest/new_cruciform
	name = "Prayer of Reunion"
	phrase = "Ego enim scio cogitationes quas cogito super vos, ait Dominus Deus: Non est nocere consilia, ut bene sit tibi, et tu non adflictionis ut dem vobis finem et patientiam."
	desc = "Request a new cruciform in the event someone wishes to join the fold or the one they had was destroyed. Requires the speaker to stand next to an altar."
	power = 50
	success_message = "On the verge of audibility you hear pleasant music, the alter slides open and a new cruciform slips out."
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/new_cruciform/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		var/response = input(user, "Which cruciform do you require?") in list("Lemniscate","Tessellate","Monomial","Divisor","Factorial","No Path","Cancel Litany")
		if (response == "Lemniscate")
			new /obj/item/implant/core_implant/cruciform/lemniscate(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Tessellate")
			new /obj/item/implant/core_implant/cruciform/tessellate(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Monomial")
			new /obj/item/implant/core_implant/cruciform/monomial(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Divisor")
			new /obj/item/implant/core_implant/cruciform/divisor(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Factorial")
			new /obj/item/implant/core_implant/cruciform/factorial(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "No Path")
			new /obj/item/implant/core_implant/cruciform(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Cancel Litany")
			fail("You decide not to obtain a cruciform at this time.", user, C)
			return FALSE

/datum/ritual/cruciform/priest/reactivation
	name = "Reconsecration"
	phrase = "Vetus moritur et onus hoc levaverit."
	desc = "The ritual needed for the reactivation and repair of a cruciform that has been unwillingly separated from the body or destroyed by the bearer's death. The process requires an altar and the cruciform in question to be attached."
	power = 50
	nutri_cost = 50//high cost
	blood_cost = 50//high cost

/datum/ritual/cruciform/priest/reactivation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(CI.active)
		fail("This cruciform is already consecrated.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("The cruciform cannot be bound to a corpse.", user, C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("successfully reconsecrated [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your cruciform vibrates and warms up.</span>")

	CI.activate()

	return TRUE

/datum/ritual/cruciform/priest/accelerated_growth
	name = "Accelerated growth"
	phrase = "Plantae crescere in divinum lumen tua."
	desc = "This litany boosts the growth of all plants in sight for about 5 minutes."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 5 MINUTES
	cooldown_category = "accelerated_growth"
	power = 30
	category = "Vitae"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

	var/boost_value = 1.5  // How much the aging process of the plant is sped up

/datum/ritual/cruciform/priest/accelerated_growth/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)

	var/list/plants_around = list()
	for(var/obj/machinery/portable_atmospherics/hydroponics/H in view(user))
		if(H.seed)  // if there is a plant in the hydroponics tray
			plants_around.Add(H.seed)

	if(plants_around.len > 0)
		if(user.species?.reagent_tag != IS_SYNTHETIC)
			if(user.nutrition >= nutri_cost)
				user.nutrition -= nutri_cost
			else
				to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				user.vessel.remove_reagent("blood",blood_cost)
		to_chat(user, SPAN_NOTICE("You feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/datum/seed/S in plants_around)
			give_boost(S)
		set_global_cooldown()
		return TRUE
	else
		fail("There is no plant around to hear your song.", user, C)
		return FALSE

/datum/ritual/cruciform/priest/accelerated_growth/proc/give_boost(datum/seed/S)
	S.set_trait(TRAIT_BOOSTED_GROWTH, boost_value)
	addtimer(CALLBACK(src, .proc/take_boost, S), effect_time)

/datum/ritual/cruciform/priest/accelerated_growth/proc/take_boost(datum/seed/S, stat, amount)
	// take_boost is automatically triggered by a callback function when the boost ends but the seed
	// may have been deleted during the duration of the boost
	if(S) // check if seed still exist otherwise we cannot read null.stats
		S.set_trait(TRAIT_BOOSTED_GROWTH, 1)

/datum/ritual/cruciform/priest/mercy
	name = "Hand of mercy"
	phrase = "Non est verus dolor."
	desc = "Relieves the pain of a person in front of you."
	power = 50
	category = "Vitae"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/priest/mercy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	to_chat(T, SPAN_NOTICE("You feel slightly better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	T.reagents.add_reagent("anodyne", 10)

	return TRUE

/datum/ritual/cruciform/priest/absolution
	name = "Absolution of wounds"
	phrase = "Surge et ambula."
	desc = "Stabilizes the health of a person in front of you."
	power = 50
	category = "Vitae"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/priest/absolution/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)

	to_chat(T, SPAN_NOTICE("You feel a soothing sensation in your veins."))
	to_chat(user, SPAN_NOTICE("You stabilize [T.name]'s health."))

	var/datum/reagents/R = new /datum/reagents(20, null)
	R.add_reagent("holyinaprovaline", 10)
	R.add_reagent("holydexalinp", 10)
	R.trans_to_mob(T, 20, CHEM_BLOOD)

	return TRUE

/datum/ritual/cruciform/priest/purging
	name = "Words of purging"
	phrase = "Purificati a peccatis et in remissionem peccatorum."
	desc = "Addictions are common afflictions among colony denizens. This litany helps those people by easing or removing their addictions."
	power = 50
	category = "Vitae"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/priest/purging/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	if(T.metabolism_effects.addiction_list.len)
		for(var/addiction in T.metabolism_effects.addiction_list)
			var/datum/reagent/R = addiction
			if(!R)
				T.metabolism_effects.addiction_list.Remove(R)
				continue

			T.metabolism_effects.addiction_list[R] += 15  // increase addiction level by 15
			// target will go through the addiction stages and finally be free from the addiction once it reaches level 40
			// it's a bad moment to go through but after 2 or 3 littany the addiction will be gone
			// psychiatrist RP opportunity -> think about the sins that led you to this addiction

	to_chat(T, SPAN_NOTICE("You feel weird as you progress through your addictions."))
	to_chat(user, SPAN_NOTICE("You help [T.name] get rid of their addictions."))

	T.reagents.add_reagent("laudanum", 10)

	return TRUE

/datum/ritual/cruciform/priest/prosthetic
	name = "Litany of wholeness"
	phrase = "O absolutus! Dona mihi membra novus install a daemone pedisequus vester."
	desc = "This litany summon a prosthetic limb or implant to install on a follower."
	power = 50
	category = "Vitae"
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/priest/prosthetic/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)
	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS
	var/O = "prosthetic limb"
	success_message = "On the verge of audibility you hear pleasant music, the altar slides open and a [O] slips out."

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		var/response = input(user, "What limb do you require?") in list("Right Arm", "Left Arm", "Right Leg", "Left Leg", "Longsword", "Ritual Knife", "Bible", "Cancel Litany")
		if (response == "Right Arm")
			new /obj/item/organ/external/robotic/church/r_arm(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Left Arm")
			new /obj/item/organ/external/robotic/church/l_arm(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Right Leg")
			new /obj/item/organ/external/robotic/church/r_leg(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Left Leg")
			new /obj/item/organ/external/robotic/church/l_leg(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			return TRUE
		if (response == "Longsword")
			new /obj/item/organ_module/active/simple/armblade/longsword(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			O = "longsword"
			return TRUE
		if (response == "Ritual Knife")
			new /obj/item/organ_module/active/simple/armblade/ritual(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			O = "ritual knife"
			return TRUE
		if (response == "Bible")
			new /obj/item/organ_module/active/simple/bible(altar.loc)
			if(user.species?.reagent_tag != IS_SYNTHETIC)
				if(user.nutrition >= nutri_cost)
					user.nutrition -= nutri_cost
				else
					to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
					user.vessel.remove_reagent("blood",blood_cost)
			O = "bible"
			return TRUE
		if (response == "Cancel Litany")
			fail("You decide not to obtain a prosthetic at this time.", user, C)
			return FALSE

/datum/ritual/cruciform/priest/adoption
	name = "Adoption"
	phrase = "Dervans semitas iustitiae et vias sanctorum custodiens."
	desc = "Opens church doors for target disciple."
	power = 15

/datum/ritual/cruciform/priest/adoption/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_COMMON
	return TRUE

/datum/ritual/cruciform/priest/ordination
	name = "Ordination"
	phrase = "Gloriam sapientes possidebunt stultorum exaltatio ignominia."
	desc = "Opens clergy doors for target disciple."
	power = 15

/datum/ritual/cruciform/priest/ordination/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_CLERGY
	return TRUE

/datum/ritual/cruciform/priest/omission
	name = "Omission"
	phrase = "Via impiorum tenebrosa nesciunt ubi corruant."
	desc = "Removes all access from target disciple's cruciform."
	power = 30

/datum/ritual/cruciform/priest/omission/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found", user, C)
		return FALSE

	if(CI.get_module(CRUCIFORM_INQUISITOR))
		fail("You don\'t have the authority for this.", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_NONE
	return TRUE

//Etops

/datum/ritual/cruciform/priest/offering/buy_item
	name = "Order armaments"
	phrase = "Et qui non habet, vendat tunicam suam et emat gladium."
	desc = "Allows you to spend favor to unlock disks from the lower temples through the will of the protector."
	success_message = "Your prayers have been heard."
	fail_message = "Your prayers have not been answered."
	power = 20

/datum/ritual/cruciform/priest/offering/buy_item/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	var/list/OBJS = get_front(H)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Will of the Protector.", H, C)
		return FALSE

	eotp.nano_ui_interact(H)
	return TRUE


/datum/ritual/cruciform/priest/offering
	name = "Offerings"
	category = "Offerings"
	success_message = "Tus plegarais han sido escuchadas."
	fail_message = "Your offerings are not worthy."
	power = 30
	var/list/req_offerings = list()
	var/list/miracles = list(ALERT, INSPIRATION, STAT_BUFF, ENERGY_REWARD)

/datum/ritual/cruciform/priest/offering/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C, targets)
	var/list/OBJS = get_front(H)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Will of the Protector.", H, C)
		return FALSE

	var/list/obj/item/item_targets = list()
	var/turf/source_t = get_turf(EOTP)
	for(var/turf/T in RANGE_TURFS(7, source_t))
		for(var/obj/item/A in T)
			item_targets.Add(A)

	if(!make_offerings(item_targets))
		fail("Your offerings are not worthy.", H, C)
		return FALSE

	EOTP.current_rewards = miracles
	EOTP.armaments_points = min(EOTP.armaments_points + 5, EOTP.max_armaments_points)
	return TRUE

/datum/ritual/cruciform/priest/offering/proc/make_offerings(list/offerings)
	var/num_check = 0
	var/list/true_offerings = list()
	for(var/path in req_offerings)
		var/req_num = req_offerings[path]
		var/num_item = 0
		for(var/obj/item/I in offerings)
			if(istype(I, path))
				if(num_item >= req_num)
					break
				if(istype(I, /obj/item/stack))
					var/obj/item/stack/S = I
					num_item += S.amount
				else
					num_item++
				true_offerings.Add(I)

		if(num_item < req_num)
			break
		else
			num_check++

	if(num_check >= req_offerings.len)
		for(var/path in req_offerings)
			var/req_num = req_offerings[path]
			for(var/obj/item/I in true_offerings)
				if(req_num <= 0)
					break
				if(istype(I, path))
					if(istype(I, /obj/item/stack))
						var/obj/item/stack/S = I
						if(S.amount <= req_num)
							var/num = S.amount
							S.use(num)
							req_num -= num
						else
							S.use(req_num)
							req_num = 0
					else
						qdel(I)
						req_num--
		return TRUE

	return FALSE

/datum/ritual/cruciform/priest/offering/call_for_arms
	name = "Inspiration"
	phrase = "Pater da mihi fortitudinem cladem ad malum."
	desc = "Make an appeal to the Will of the Protector by offering ten plasteel, twenty steel, and sixty biomatter to guide its power towards inspiring disciples. \
	Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/plasteel = 10, /obj/item/stack/material/steel = 20, /obj/item/stack/material/biomatter = 60)
	miracles = list(INSPIRATION)

/datum/ritual/cruciform/priest/offering/divine_intervention
	name = "Divine intervention"
	phrase = "Auxilium instaurarent domum tuam."
	desc = "Make an appeal to the Will of the Protector by offering two hundred and forty biomatter to guide its power towards enhancing the abilities of disciples. \
	Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/biomatter = 240)
	miracles = list(STAT_BUFF)

/datum/ritual/cruciform/priest/offering/holy_guidance
	name = "Holy guidance"
	phrase = "Domine deus, lux via."
	desc = "Make an appeal to the Will of the Protector by offering an oddity and forty grown fruits to guide its power towards enhancing cruciform power restoration among disciples. \
	Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/oddity = 1, /obj/item/reagent_containers/food/snacks/grown = 40)
	miracles = list(ENERGY_REWARD)

/datum/ritual/cruciform/priest/offering/alert
	name = "Discern Malcontents"
	phrase = "E tenebris educ."
	desc = "Make an appeal to the Will of the Protector by offering one hundred and twenty biomatter and twenty grown fruits to guide its power towards potentially discovering evil creatures. \
	Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/biomatter = 120, /obj/item/reagent_containers/food/snacks/grown = 20)
	miracles = list(ALERT)
