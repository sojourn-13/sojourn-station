/datum/ritual/cruciform/priest
	name = "priest"
	phrase = null //An asterisk after the translated quote means it's original via Google Translate, not Scripture taken from the NIV.
	desc = ""
	category = "Clerical"

/datum/ritual/targeted/cruciform/priest
	name = "priest targeted"
	phrase = null
	desc = ""
	category = "Clerical"

/*
	Penance
	Deals pain damage to a targeted disciple
*/

/datum/ritual/targeted/cruciform/priest/penance
	name = "Penance"
	phrase = "Dolor est dolor." //"Pain is just pain."*
	desc = "Imparts extreme pain on the target disciple, but does no actual harm. Use this as part of Church discipline."
	power = 35

/datum/ritual/targeted/cruciform/priest/penance/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
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
	phrase = "Sana me, Domine, et sanabor: salvum me fac, et salvus ero: quoniam laus mea tu es." //"Heal me, Lord, and I will be healed; save me and I will be saved, for you are the one I praise."
	desc = "Recover from the ravages of wounds and pain, healing yourself a moderate amount."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "selfheal"
	power = 35 //Healing yourself is slightly easier than healing someone else
	category = "Vitae"

/datum/ritual/cruciform/priest/selfheal/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C,list/targets)
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
	phrase = "Venite ad me, omnes qui laboratis, et onerati estis et ego reficiam vos." //"Come to me, all you who are weary and burdened, and I will give you rest."
	desc = "Restore the sanity of another nearby disciple."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "succour"
	power = 45
	category = "Vitae"

/datum/ritual/cruciform/priest/heal_other/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
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
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (H.species?.reagent_tag == IS_SYNTHETIC)
			to_chat(user, SPAN_DANGER("[H] is synthetic, healing them has no effect!"))
			return FALSE
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return FALSE
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
		H.reagents.add_reagent("laudanum", 5)
		H.sanity.changeLevel(25)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/priest/heal_heathen
	name = "Divine Hymn"
	phrase = "Et circuibat Jesus omnes civitates, et castella, docens in synagogis eorum, et praedicans Evangelium regni, et curans omnem languorem, et omnem infirmitatem." //"Jesus went through all the towns and villages, teaching in their synagogues, proclaiming the good news of the kingdom and healing every disease and sickness."
	desc = "Heal every person who can see and hear for a small amount, even if they do not have a cruciform. Can only be done every quarter hour and requires alot of power. Using this prayer prevents other similar prayers from being used for awhile."
	cooldown = TRUE
	cooldown_time = 15 MINUTES
	cooldown_category = "dhymn"
	power = 50
	category = "Vitae"

/datum/ritual/cruciform/priest/heal_heathen/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user)
			people_around.Add(H)

	if(people_around.len > 0)
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
		participant.reagents.add_reagent("laudanum", 5)
		participant.adjustBruteLoss(-10)
		participant.adjustFireLoss(-10)
		participant.adjustOxyLoss(-20)
		participant.updatehealth()

/*
	Scrying: Remotely look through someone's eyes. Global range, useful to find fugitives or corpses
	Uses all of your power and has a limited duration
*/
/datum/ritual/cruciform/priest/scrying
	name = "Scrying"
	phrase = "Quo ibo a spiritu tuo? et quo a facie tua fugiam?" //"Where can I go from your Spirit? Where can I flee from your presence?"
	desc = "Look into the world from the eyes of another believer. Strenuous and can only be maintained for half a minute. The target will sense they are being watched, but not by whom. Requires power that only Primes and Crusaders possess."
	power = 100
	category = "Episcopal"

/datum/ritual/cruciform/priest/scrying/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C, list/targets)

	if(!user.client)
		return FALSE

	if(!C.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR) && !C.get_module(CRUCIFORM_CRUSADER))
		fail("Only Primes and Crusaders have the authority to Scry.", user, C)
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


	//After 30 seconds, your view is forced back to yourself
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob, reset_view), user), 300)

	return TRUE


/datum/ritual/targeted/cruciform/priest/god_eye/process_target(var/index, var/obj/item/implant/core_implant/target, var/text)
	if(index == 1 && target.address == text && target.active)
		if(target.wearer && target.wearer.stat != DEAD)
			return target

/datum/ritual/cruciform/priest/install
	name = "Commitment"
	phrase = "Iter tuum para." //"Prepare for your journey."*
	desc = "This litany will command a cruciform attach to person. Cruciform and the individual must lay on an altar."
	power = 25

/datum/ritual/cruciform/priest/install/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
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

	/*for(var/obj/item/clothing/CL in H)     We don't need people naked for their baptisms
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE */

	if(!CI.install(H, BP_CHEST, user) || CI.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	if(ishuman(H))
		var/mob/living/carbon/human/M = H
		/*var/obj/item/organ/external/E = M.organs_by_name[BP_CHEST]  We also don't need baptisms causing internal damage
		for (var/i = 0; i < 5;i++)
			E.take_damage(5, sharp = FALSE)
			//Deal 25 damage in five hits. Using multiple small hits mostly prevents internal damage

		M.custom_pain("You feel the nails of the cruciform drive into your ribs!",1) */
		to_chat(M, "You feel a commection to something larger than yourself, divine power flowing into your body.")
		M.update_implants()
		M.updatehealth()

	return TRUE

/datum/ritual/cruciform/priest/epiphany
	name = "Epiphany"
	phrase = "Satus iter ad infinitum." //"Begin your journey to infinity."*
	desc = "The Absolute's principal sacrament is a ritual of baptism and merging with cruciform. A person with a cruciform attached by Commitment must be placed on an altar."
	power = 25

/datum/ritual/cruciform/priest/epiphany/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
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

	log_and_message_admins("successfully baptized [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your cruciform vibrates and warms up.</span>")

	CI.activate()

	if(get_storyteller())	//Call objectives update to check inquisitor objective completion
		get_storyteller().update_objectives()

	return TRUE

/datum/ritual/cruciform/priest/ejection
	name = "Deprivation"
	phrase = "Et revertatur pulvis in terram suam unde erat et spiritus redeat ad Deum qui dedit illum." //"and the dust returns to the ground it came from, and the spirit returns to God who gave it."
	desc = "This litany will command a cruciform to detach from its bearer, if the one bearing it is dead."
	power = 10

/datum/ritual/cruciform/priest/ejection/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	var/mob/M = CI.wearer

	if(ishuman(M) && is_dead(M))
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
	power = 50
	category = "Words of Power"
	var/list/stats_to_boost = list()

/datum/ritual/cruciform/priest/short_boost/New()
	..()
	desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, for about ten minutes."

/datum/ritual/cruciform/priest/short_boost/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
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
		addtimer(CALLBACK(src, PROC_REF(take_boost), participant, stat, amount), effect_time)
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
	phrase = "Patientia autem opus perfectum habet: ut sitis perfecti et integri in nullo deficientes." //"Let perseverance finish its work so that you may be mature and complete, not lacking anything."
	stats_to_boost = list(STAT_MEC = 10, STAT_COG = 10, STAT_BIO = 10)

/datum/ritual/cruciform/priest/short_boost/physical
	name = "Canto of Courage"
	phrase = "Ecce praecipio tibi: confortare, et esto robustus. Noli metuere, et noli timere: quoniam tecum est Dominus Deus tuus in omnibus ad quaecumque perrexeris." //"Have I not commanded you? Be strong and courageous. Do not be afraid; do not be discouraged, for the Lord your God will be with you wherever you go."
	stats_to_boost = list(STAT_ROB = 10, STAT_TGH = 10, STAT_VIG = 10)

/datum/ritual/cruciform/priest/records
	name = "Baptismal Record"
	phrase = "Memento nomina." //"Remember the names."*
	desc = "Requests a copy of the churches local parishoner records from your altar."
	power = 10
	success_message = "On the verge of audibility you hear pleasant music, a piece of paper slides out from a slit in the altar."

/datum/ritual/cruciform/priest/records/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		new /obj/item/paper/neopaper(altar.loc, disciples.Join("\n"), "Church Record")
	return TRUE

/datum/ritual/cruciform/priest/new_cruciform
	name = "Request Cruciform"
	phrase = "Cartographus, cruciformem da nobis." //"Cartographer, give us a cruciform"*
	desc = "Request a new cruciform in the event someone wishes to join the fold or the one they had was destroyed. Requires the speaker to stand next to an altar."
	power = 50
	success_message = "On the verge of audibility you hear pleasant music, the alter slides open and a new cruciform slips out."

/datum/ritual/cruciform/priest/new_cruciform/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar/altar = locate(/obj/machinery/optable/altar) in OBJS
	var/altar_cooldown = 10 MINUTES //How long we're going to make the altar wait before doing this again

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		if(altar.request_cooldown)
			fail("This altar cannot provide another item yet.", user, C)
			return FALSE
		var/response = input(user, "Which cruciform do you require?") in list("Lemniscate","Tessellate","Monomial","Divisor","Factorial","No Path","Cancel Litany")
		if (response == "Lemniscate")
			new /obj/item/implant/core_implant/cruciform/lemniscate(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Tessellate")
			new /obj/item/implant/core_implant/cruciform/tessellate(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Monomial")
			new /obj/item/implant/core_implant/cruciform/monomial(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Divisor")
			new /obj/item/implant/core_implant/cruciform/divisor(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Factorial")
			new /obj/item/implant/core_implant/cruciform/factorial(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "No Path")
			new /obj/item/implant/core_implant/cruciform(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Cancel Litany")
			fail("You decide not to obtain a cruciform at this time.", user, C)
			return FALSE

/datum/ritual/cruciform/priest/reactivation
	name = "Rededication"
	phrase = "Revertere ad nos." //"Come back to us."*
	desc = "Reactivates and repair of a cruciform that has been unwillingly separated from the body or destroyed by the bearer's death. The process requires an altar and the cruciform in question to be attached."
	power = 30

/datum/ritual/cruciform/priest/reactivation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(CI.active)
		fail("This cruciform is already active.", user, C)
		return FALSE

	if (CI.wearer.stat == DEAD)
		fail("The cruciform cannot be bound to a corpse.", user, C)
		return FALSE
	log_and_message_admins("successfully reactivated the cruciform of [CI.wearer]")
	to_chat(CI.wearer, "<span class='info'>Your cruciform vibrates and warms up.</span>")

	CI.activate()

	return TRUE

/datum/ritual/cruciform/priest/accelerated_growth
	name = "Accelerated Growth"
	phrase = "Itaque neque qui plantat est aliquid, neque qui rigat: sed qui incrementum dat, Deus." //"So neither the one who plants nor the one who waters is anything, but only God, who makes things grow."
	desc = "This litany boosts the growth of all plants in sight for about 5 minutes."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 5 MINUTES
	cooldown_category = "accelerated_growth"
	power = 30
	category = "Vitae"

	var/boost_value = 1.5  // How much the aging process of the plant is sped up

/datum/ritual/cruciform/priest/accelerated_growth/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)

	var/list/plants_around = list()
	for(var/obj/machinery/portable_atmospherics/hydroponics/H in view(user))
		if(H.seed)  // if there is a plant in the hydroponics tray
			plants_around.Add(H.seed)

	if(plants_around.len > 0)
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
	addtimer(CALLBACK(src, PROC_REF(take_boost), S), effect_time)

/datum/ritual/cruciform/priest/accelerated_growth/proc/take_boost(datum/seed/S, stat, amount)
	// take_boost is automatically triggered by a callback function when the boost ends but the seed
	// may have been deleted during the duration of the boost
	if(S) // check if seed still exist otherwise we cannot read null.stats
		S.set_trait(TRAIT_BOOSTED_GROWTH, 1)

/datum/ritual/cruciform/priest/mercy
	name = "Words of Mercy"
	phrase = "Consolarer et ego vos sermonibus, et moverem caput meum super vos." //"But my mouth would encourage you; comfort from my lips would bring you relief."
	desc = "Relieves the pain of a person in front of you."
	power = 40 //It's just pain relief
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "wmercy"
	category = "Vitae"

/datum/ritual/cruciform/priest/mercy/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE
	to_chat(T, SPAN_NOTICE("You feel slightly better as your pain eases."))
	to_chat(user, SPAN_NOTICE("You ease the pain of [T.name]."))

	T.reagents.add_reagent("anodyne", 10)

	return TRUE

/datum/ritual/cruciform/priest/absolution
	name = "Absolution of Wounds"
	phrase = "Surge, tolle grabatum tuum et ambula." //“Get up! Pick up your mat and walk.”
	desc = "Stabilizes the health of a person in front of you."
	power = 50
	category = "Vitae"

/datum/ritual/cruciform/priest/absolution/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	to_chat(T, SPAN_NOTICE("You feel a soothing sensation in your veins."))
	to_chat(user, SPAN_NOTICE("You stabilize [T.name]'s health."))

	var/datum/reagents/R = new /datum/reagents(20, null)
	R.add_reagent("holyinaprovaline", 10)
	R.add_reagent("holydexalinp", 10)
	R.trans_to_mob(T, 20, CHEM_BLOOD)

	return TRUE

/datum/ritual/cruciform/priest/purging
	name = "Words of purging"
	phrase = "Noli regibus dare vinum, quia nullum secretum est ubi regnat ebrietas." //"It is not for kings to drink wine, not for rulers to crave beer."
	desc = "Addictions are common afflictions among colony denizens. This litany helps those people by pushing them through their addictions. Usually needs to be spoken multiple times."
	power = 20 //Usually needs to be spoken multiple times, so allow that.
	category = "Vitae"

/datum/ritual/cruciform/priest/purging/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

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
	phrase = "O Absolutus! Improve corpus nostrum." //"O absolute! Improve our body"
	desc = "This litany summon a prosthetic limb or implant to install on a follower."
	power = 50
	category = "Vitae"

/datum/ritual/cruciform/priest/prosthetic/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/list/OBJS = get_front(user)
	var/obj/machinery/optable/altar/altar = locate(/obj/machinery/optable/altar) in OBJS
	var/O = "prosthetic limb"
	var/altar_cooldown = 10 MINUTES
	success_message = "On the verge of audibility you hear pleasant music, the altar slides open and a [O] slips out."

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		if(altar.request_cooldown)
			fail("This altar cannot provide another item yet.", user, C)
			return FALSE
		var/response = input(user, "What limb do you require?") in list("Right Arm", "Left Arm", "Right Leg", "Left Leg", "Longsword", "Ritual Knife", "Bible", "Cancel Litany")
		if (response == "Right Arm")
			new /obj/item/organ/external/robotic/church/r_arm(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Left Arm")
			new /obj/item/organ/external/robotic/church/l_arm(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Right Leg")
			new /obj/item/organ/external/robotic/church/r_leg(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Left Leg")
			new /obj/item/organ/external/robotic/church/l_leg(altar.loc)
			altar.cooldown(altar_cooldown)
			return TRUE
		if (response == "Longsword")
			new /obj/item/organ_module/active/simple/armblade/longsword(altar.loc)
			altar.cooldown(altar_cooldown)
			O = "longsword"
			return TRUE
		if (response == "Ritual Knife")
			new /obj/item/organ_module/active/simple/armblade/ritual(altar.loc)
			altar.cooldown(altar_cooldown)
			O = "ritual knife"
			return TRUE
		if (response == "Bible")
			new /obj/item/organ_module/active/simple/bible(altar.loc)
			altar.cooldown(altar_cooldown)
			O = "bible"
			return TRUE
		if (response == "Cancel Litany")
			fail("You decide not to obtain a prosthetic at this time.", user, C)
			return FALSE

//Promotions and Access litanies
/datum/ritual/targeted/cruciform/priest/upgrade_kit
	name = "Prepare the Way"
	phrase = "Vox clamantis in deserto: Parate viam Domini, rectas facite in solitudine semitas Dei nostri." //"A voice of one calling: 'In the wilderness prepare the way for the Lord; make straight in the desert a highway for our God.'"
	desc = "Request an upgrade kit that enables a cruciform to be Consecrated, elevating the individual to a Prime. The actual ritual of Consecration must be performed by a Prime."
	power = 50 //You can have a Vector get you the upgrade as part of preparing for a consecration.
	success_message = "On the verge of audibility you hear pleasant music, the alter slides open and a devout upgrade circuit slips out."

/datum/ritual/targeted/cruciform/priest/upgrade_kit/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar/altar = locate(/obj/machinery/optable/altar) in OBJS
	var/altar_cooldown = 10 MINUTES

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE
	if(altar.request_cooldown)
		fail("This altar cannot provide another item yet.", user, C)
		return FALSE
	new /obj/item/coreimplant_upgrade/cruciform/priest(altar.loc)
	altar.cooldown(altar_cooldown)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/priest/initiation
	name = "Consecration"
	phrase = "Sollicite cura teipsum probabilem exhibere Deo, operarium inconfusibilem, recte tractantem verbum veritatis." //"Do your best to present yourself to God as one approved, a worker who does not need to be ashamed and who correctly handles the word of truth."
	desc = "The second stage of granting a promotion to a disciple, upgrading them to a Prime. The devout ascension kit is the first step. This litany requires power that only Primes and Crusaders have."
	power = 100
	category = "Episcopal"

/datum/ritual/cruciform/priest/initiation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.",user,C)
		return FALSE

	if(!C.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR) && !C.get_module(CRUCIFORM_CRUSADER))
		fail("Only Primes and Crusaders have the authority to Consecrate.", user, C)
		return FALSE

	if(CI.get_module(CRUCIFORM_PRIME))
		fail("The target is already a Prime.",user,C)
		return FALSE

	var/datum/core_module/activatable/cruciform/priest_convert/PC = CI.get_module(CRUCIFORM_PRIEST_CONVERT)

	if(!PC)
		fail("Target must have devout upgrade inside his cruciform.",user,C)
		return FALSE
	PC.activate()
	log_and_message_admins("promoted disciple [CI.wearer] to devout with the Consecration litany")

	return TRUE

/datum/ritual/cruciform/priest/ordination
	name = "Ordination"
	phrase = "Si quis episcopatum desiderat, bonum opus desiderat." //"Whoever aspires to be an overseer desires a noble task."
	desc = "Grants target disciple access to Vector litanies. Should be accompanied by Adoption in the case of full promotions."
	power = 50

/datum/ritual/cruciform/priest/ordination/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(CI.get_module(CRUCIFORM_CLERGY))
		fail("Disciple is already a Vector.", user, C)
		return FALSE
	else
		CI.make_vector()
		to_chat(H, SPAN_NOTICE("You feel divine power growing within your cruciform as you are ordained."))
		to_chat(user, SPAN_NOTICE("The cruciform of [H] thrums with a power only you can feel as they are ordained."))
		log_and_message_admins("[user] has given [H] access to Vector litanies with Ordination.")
	return TRUE

/datum/ritual/cruciform/priest/reduction
	name = "Reduction"
	phrase = "Nolite plures magistri fieri fratres mei, scientes quoniam majus judicium sumitis." //"Not many of you should become teachers, my fellow believers, because you know that we who teach will be judged more strictly."
	desc = "Returns a Vector or Prime cruciform to its lay state. Can only be performed by Primes and Inquisitors. Reducing a Prime can only be done by an Inquisitor."
	power = 100
	category = "Episcopal"

/datum/ritual/cruciform/priest/reduction/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.", user, C)
		return FALSE

	if(!C.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR)) //Power requirement *and* status check because we don't want Crusaders using this
		fail("Only Primes have the authority to perform Reduction.", user, C)

	if(CI.get_module(CRUCIFORM_INQUISITOR) && !C.get_module(CRUCIFORM_OMNI)) //Considering both Inquisitors and Omnis should be admin-spawn only I don't know why this would ever pass, but here it is
		fail("Only the Cartographer and the Fundamentals may reduce an Inquisitor.", user, C)
		return FALSE

	if(!CI.get_module(CRUCIFORM_PRIME) && !CI.get_module(CRUCIFORM_CLERGY))
		fail("Target is already a layperson.", user, C)
		return FALSE
	else if (CI.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR))
		fail("Only an Inquisitor may reduce another Prime.", user, C)
		return FALSE
	else
		CI.make_common()
		return TRUE

/datum/ritual/cruciform/priest/separation
	name = "Separation"
	phrase = "Si autem ecclesiam non audierit, sit tibi sicut ethnicus et publicanus." //"If they refuse to listen even to the church, treat them as you would a pagan or a tax collector."
	desc = "Deactivates and removes a cruciform from the target. Can only be performed by Primes and Inquisitors. Separating a Prime can only be done by an Inquisitor."
	power = 100
	category = "Episcopal"

/datum/ritual/cruciform/priest/separation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)
	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.", user, C)
		return FALSE
	var/mob/living/carbon/human/H = CI.wearer
	if(!C.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR)) //Power requirement *and* status check because we don't want Crusaders using this
		fail("Only Primes have the authority to perform Separation.", user, C)
		return FALSE
	else if (CI.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR))
		fail("Only Inquisitors have the authority to perform Separation on another Prime.", user, C)
	else
		CI.name = "[H]'s Cruciform"
		CI.deactivate()
		CI.uninstall()
		to_chat(H, SPAN_DANGER("You feel a cold emptiness as you are cut off from the Absolute and the faithful. Your cruciform falls from your chest and down to the floor, lifeless."))
		H.visible_message("The cruciform of [H] falls to the ground, inactive.")
		log_and_message_admins("removed [H]'s cruciform with the Separation litany.")
		return TRUE

/datum/ritual/cruciform/priest/adoption
	name = "Adoption"
	phrase = "In domo Patris mei mansiones multae sunt; si quominus dixissem vobis: quia vado parare vobis locum." //"My Father’s house has many rooms; if that were not so, would I have told you that I am going there to prepare a place for you?"
	desc = "Opens church doors for target disciple."
	power = 25

/datum/ritual/cruciform/priest/adoption/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	var/designation = alert("Do you wish to give access to common or clergy (Prime) doors?", "Litany of Adoption", "Common","Clergy")
	if(designation == "Common")
		CI.security_clearance = CLEARANCE_COMMON
		to_chat(H, SPAN_NOTICE("You feel paths open before you as you are granted access to the common doors of the Church."))
		log_and_message_admins("[user] has given [H] access to common Church doors with Adoption.")
	else if(designation == "Clergy")
		if(C.security_clearance < CLEARANCE_CLERGY) //No more Vectors letting each other into the Prime's office
			fail("You cannot give access to doors you yourself lack access to.", user, C)
			return FALSE
		else
			CI.security_clearance = CLEARANCE_CLERGY
			to_chat(H, SPAN_NOTICE("You feel paths open before you as you are granted access to the clergy doors of the Church."))
			log_and_message_admins("[user] has given [H] access to clergy Church doors with Adoption.")
	return TRUE


/datum/ritual/cruciform/priest/omission
	name = "Omission"
	phrase = "Et clausa est janua." //"And the door was shut."
	desc = "Removes all access from target disciple's cruciform. Cannot be used on those of the same or higher rank."
	power = 25

/datum/ritual/cruciform/priest/omission/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)
		fail("Cruciform not found.", user, C)
		return FALSE

	if((CI.get_module(CRUCIFORM_CLERGY) && !C.get_module(CRUCIFORM_PRIME)) || (CI.get_module(CRUCIFORM_PRIME) && !C.get_module(CRUCIFORM_INQUISITOR)) || (CI.get_module(CRUCIFORM_INQUISITOR) && !C.get_module(CRUCIFORM_OMNI))) //This can't be used on someone of the same or higher rank. Vectors can't use it on each other, only Inquisitors can use it on Primes, and only Apostles can use it on inquisitors
		fail("You lack the authority to perform this on this person.", user, C)
		return FALSE

	CI.security_clearance = CLEARANCE_NONE
	log_and_message_admins("removed Church door access from [CI.wearer].")
	return TRUE

//Will of the Protector litanies

/datum/ritual/cruciform/priest/offering/buy_item
	name = "Order armaments"
	phrase = "Induite vos armaturam Dei, ut possitis stare adversus insidias diaboli." //"Put on the full armor of God, so that you can take your stand against the devil’s schemes."
	desc = "Allows you to spend favor to unlock disks from the lower temples through the will of the protector."
	success_message = "Your prayers have been heard."
	fail_message = "Your prayers have not been answered."
	power = 20

/datum/ritual/cruciform/priest/offering/buy_item/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C, targets)
	var/list/OBJS = get_front(H)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Will of the Protector.", H, C)
		return FALSE

	eotp.nano_ui_interact(H)
	return TRUE


/datum/ritual/cruciform/priest/offering
	name = "Offering"
	category = "Offering"
	success_message = "Your prayers were heard."
	fail_message = "Your offerings are not worthy."
	power = 30
	var/list/req_offerings = list()
	var/list/miracles = list(ALERT, INSPIRATION, STAT_BUFF, ENERGY_REWARD)

/datum/ritual/cruciform/priest/offering/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C, targets)
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
	phrase = "Tollite jugum meum super vos, et discite a me, quia mitis sum, et humilis corde: et invenietis requiem animabus vestris." //"Take my yoke upon you and learn from me, for I am gentle and humble in heart, and you will find rest for your souls."
	desc = "Make an appeal to the Will of the Protector by offering ten plasteel, twenty steel, and sixty biomatter to guide its power towards inspiring disciples.	Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/plasteel = 10, /obj/item/stack/material/steel = 20, /obj/item/stack/material/biomatter = 60)
	miracles = list(INSPIRATION)

/datum/ritual/cruciform/priest/offering/divine_intervention
	name = "Divine Intervention"
	phrase = "Si quis autem vestrum indiget sapientia, postulet a Deo, qui dat omnibus affluenter, et non improperat: et dabitur ei." //"If any of you lacks wisdom, you should ask God, who gives generously to all without finding fault, and it will be given to you."
	desc = "Make an appeal to the Will of the Protector by offering two hundred and forty biomatter to guide its power towards enhancing the abilities of disciples. Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/biomatter = 240)
	miracles = list(STAT_BUFF)

/datum/ritual/cruciform/priest/offering/holy_guidance
	name = "Holy Guidance"
	phrase = "Fortitudo mea, et laus mea Dominus, et factus est mihi in salutem." //"The Lord is my strength and my defense; he has become my salvation."
	desc = "Make an appeal to the Will of the Protector by offering an oddity and forty grown fruits to guide its power towards enhancing cruciform power restoration among disciples. Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/oddity = 1, /obj/item/reagent_containers/food/snacks/grown = 40)
	miracles = list(ENERGY_REWARD)

/datum/ritual/cruciform/priest/offering/alert
	name = "Discern Malcontents"
	phrase = "Nam etsi ambulavero in medio umbrae mortis, non timebo mala, quoniam tu mecum es. Virga tua, et baculus tuus, ipsa me consolata sunt." //"Even though I walk through the darkest valley, I will fear no evil, for you are with me; your rod and your staff, they comfort me."
	desc = "Make an appeal to the Will of the Protector by offering one hundred and twenty biomatter and twenty grown fruits to guide its power towards potentially discovering evil creatures. Your offering also increases the protectors armanents reserves."
	req_offerings = list(/obj/item/stack/material/biomatter = 120, /obj/item/reagent_containers/food/snacks/grown = 20)
	miracles = list(ALERT)
