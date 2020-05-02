/datum/ritual/cruciform/priest
	name = "priest"
	phrase = null
	desc = ""
	category = "Devout"

/datum/ritual/targeted/cruciform/priest
	name = "priest targeted"
	phrase = null
	desc = ""
	category = "Devout"


/*
	Penance
	Deals pain damage to a targeted disciple
*/
/datum/ritual/targeted/cruciform/priest/penance
	name = "Penance"
	phrase = "Mihi vindicta \[Target human]"
	desc = "Imparts extreme pain on the target disciple. Does no actual harm."
	power = 35

/datum/ritual/targeted/cruciform/priest/penance/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	if(!targets.len)
		fail("Target not found.",user,C,targets)
		return FALSE

	var/obj/item/weapon/implant/core_implant/CI = targets[1]

	if(!CI.active || !CI.wearer)

		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/M = CI.wearer

	log_and_message_admins(" inflicted pain on [CI.wearer] with penance litany")
	to_chat(M, SPAN_DANGER("A wave of agony washes over you, the cruciform in your chest searing like a star for a few moments of eternity."))


	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(1, 1, M.loc)
	s.start()

	M.apply_effect(50, AGONY, 0)

	return TRUE

/datum/ritual/targeted/cruciform/priest/penance/process_target(var/index, var/obj/item/weapon/implant/core_implant/target, var/text)
	target.update_address()
	if(index == 1 && target.address == text)
		if(target.wearer && (target.loc && (target.locs[1] in view())))
			return target

/*
	Convalescence
	Heals yourself a fair amount
*/
/datum/ritual/cruciform/priest/selfheal
	name = "Convalescence"
	phrase = "Dominus autem dirigat corda vestra in caritate Dei et patientia deus."
	desc = "Recover from the ravages of wounds and pain."
	cooldown = TRUE
	cooldown_time = 300
	power = 35 //Healing yourself is slightly easier than healing someone else

/datum/ritual/cruciform/priest/selfheal/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C,list/targets)
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain</span>")
	H.add_chemical_effect(CE_PAINKILLER, 20)
	H.adjustBruteLoss(-20)
	H.adjustFireLoss(-20)
	H.adjustToxLoss(-20)
	H.adjustOxyLoss(-40)
	H.adjustBrainLoss(-5)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE


/datum/ritual/cruciform/priest/heal_other
	name = "Succour"
	phrase = "Venite ad me, omnes qui laboratis, et onerati estis et ego reficiam vos."
	desc = "Heal another nearby disciple."
	cooldown = TRUE
	cooldown_time = 300
	power = 45

/datum/ritual/cruciform/priest/heal_other/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform)

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
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain</span>")
		H.add_chemical_effect(CE_PAINKILLER, 20)
		H.adjustBruteLoss(-20)
		H.adjustFireLoss(-20)
		H.adjustToxLoss(-20)
		H.adjustOxyLoss(-40)
		H.adjustBrainLoss(-5)
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

/datum/ritual/cruciform/priest/heal_heathen/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/list/people_around = list()
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)

	if(people_around.len > 0)
		to_chat(user, SPAN_NOTICE("Your feel the air thrum with an inaudible vibration."))
		playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You hear a silent signal..."))
			heal_other(participant)
		set_personal_cooldown(user)
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE


/datum/ritual/cruciform/priest/heal_heathen/proc/heal_other(mob/living/carbon/human/participant)
		to_chat(participant, "<span class='info'>A sensation of relief bathes you, washing away your some of your pain</span>")
		participant.add_chemical_effect(CE_PAINKILLER, 15)
		participant.adjustBruteLoss(-15)
		participant.adjustFireLoss(-15)
		participant.adjustToxLoss(-15)
		participant.adjustOxyLoss(-30)
		participant.adjustBrainLoss(-5)
		participant.updatehealth()


/*
	Scrying: Remotely look through someone's eyes. Global range, useful to find fugitives or corpses
	Uses all of your power and has a limited duration
*/
/datum/ritual/cruciform/priest/scrying
	name = "Scrying"
	phrase = "Ecce ego ad te et ad caelum. Scio omnes absconditis tuis. Vos can abscondere, tu es coram me: nudus."
	desc = "Look into the world from the eyes of another believer. Strenuous and can only be maintained for half a minute. The target will sense they are being watched, but not by whom. This prayer requires power only primes and crusaders have."
	power = 80

/datum/ritual/cruciform/priest/scrying/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)

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

	//After 30 seconds, your view is forced back to yourself
	addtimer(CALLBACK(user, .mob/proc/reset_view, user), 300)

	return TRUE


/datum/ritual/targeted/cruciform/priest/god_eye/process_target(var/index, var/obj/item/weapon/implant/core_implant/target, var/text)
	if(index == 1 && target.address == text && target.active)
		if(target.wearer && target.wearer.stat != DEAD)
			return target




/datum/ritual/cruciform/priest/epiphany
	name = "Epiphany"
	phrase = "In nomine Patris et Filii et Spiritus sancti."
	desc = "The Absolute's principal sacrament is a ritual of baptism and merging with cruciform. A body, relieved of clothes should be placed on Absolute's special altar."

/datum/ritual/cruciform/priest/epiphany/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)

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

/datum/ritual/cruciform/priest/reincarnation/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)

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

/datum/ritual/cruciform/priest/install/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)
	if(CI)
		fail("[H] already have a cruciform installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	CI = locate(/obj/item/weapon/implant/core_implant/cruciform) in L

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
	desc = "This litany will command cruciform to detach from bearer, if the one bearing it is dead."

/datum/ritual/cruciform/priest/ejection/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	var/mob/M = CI.wearer

	if(ishuman(M) && M.is_dead())
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/E = H.organs_by_name[BP_CHEST]
		E.take_damage(15)
		H.custom_pain("You feel the cruciform ripping out of your chest!",1)
		CI.name = "[M]'s Cruciform"
		CI.uninstall()
		return TRUE

	else if(ismob(M) && M.is_dead()) //Cruciforms can't normally be placed on non-humans, but this is still here for sanity purposes.
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
	power = 80

/datum/ritual/cruciform/priest/unupgrade/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform)

	if(!CI)
		fail("There is no cruciform on this one.", user, C)
		return FALSE

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(!istype(CI.upgrades) || length(CI.upgrades) <= 0)
		fail("here is no upgrades on this one.", user, C)
		return FALSE

	for(var/obj/item/weapon/coreimplant_upgrade/CU in CI.upgrades)
		CU.remove()
		log_and_message_admins("removed upgrade from [C] cruciform with asacris litany")

	return TRUE

/datum/ritual/targeted/cruciform/priest/upgrade_kit
	name = "Curaverunt"
	phrase = "Dominus manum meam pro damnato in ovile redire voluerit."
	desc = "Request an upgrade kit to restore a vector or prime's cruciform to its devout stage."
	power = 50

/datum/ritual/targeted/cruciform/priest/upgrade_kit/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	new /obj/item/weapon/coreimplant_upgrade/cruciform/priest(usr.loc)
	set_personal_cooldown(user)

/datum/ritual/cruciform/priest/initiation
	name = "Initiation"
	phrase = "Habe fiduciam in Domino ex toto corde tuo et ne innitaris prudentiae tuae, in omnibus viis tuis cogita illum et ipse diriget gressus tuos."
	desc = "The second stage of granting a promotion to a disciple, upgrading them to a devout. The devout ascension kit is the first step."
	power = 50

/datum/ritual/cruciform/priest/initiation/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/obj/item/weapon/implant/core_implant/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform)

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

	PC.activate()
	log_and_message_admins("promoted disciple [C] to devout with initiation litany")

	return TRUE



///////////////////////////////////////
///////////SHORT BOOST LITANIES////////
///////////////////////////////////////

/datum/ritual/cruciform/priest/short_boost
	name = "Short boost ritual"
	phrase = null
	desc = "This litany boosts mechanical stats of everyone who's hear you on the short time. "
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	effect_time = 10 MINUTES
	cooldown_category = "short_boost"
	var/list/stats_to_boost = list()

	New()
		..()
		desc = "This litany boosts [get_stats_to_text()] stats of everyone who hears you, lasts about ten minutes."


/datum/ritual/cruciform/priest/short_boost/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
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
		set_global_cooldown()
		return TRUE
	else
		fail("Your cruciform sings, alone, unto the void.", user, C)
		return FALSE


/datum/ritual/cruciform/priest/short_boost/proc/give_boost(mob/living/carbon/human/participant)
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		participant.stats.changeStat(stat, amount)
		addtimer(CALLBACK(src, .proc/take_boost, participant, stat, amount), effect_time)
	spawn(30)
		to_chat(participant, SPAN_NOTICE("A wave of dizziness washes over you and your mind is filled with a sudden insight into [get_stats_to_text()]."))


/datum/ritual/cruciform/priest/short_boost/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	participant.stats.changeStat(stat, -amount)
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


/datum/ritual/cruciform/priest/short_boost/mechanical
	name = "Pounding Whisper"
	phrase = "Vocavitque nomen eius Noe dicens iste consolabitur nos ab operibus et laboribus manuum nostrarum in terra cui maledixit Dominus."
	stats_to_boost = list(STAT_MEC = 10)

/datum/ritual/cruciform/priest/short_boost/cognition
	name = "Revelation of Secrets"
	phrase = "Quia Dominus dat sapientiam et ex ore eius scientia et prudentia."
	stats_to_boost = list(STAT_COG = 10)

/datum/ritual/cruciform/priest/short_boost/biology
	name = "Lisp of Vitae"
	phrase = "Ecce ego obducam ei cicatricem et sanitatem et curabo eos et revelabo illis deprecationem pacis et veritatis."
	stats_to_boost = list(STAT_BIO = 10)

/datum/ritual/cruciform/priest/short_boost/courage
	name = "Canto of Courage"
	phrase = "Huic David ad te Domine clamabo Deus meus ne sileas a me nequando taceas a me et adsimilabor descendentibus in lacum."
	stats_to_boost = list(STAT_ROB = 10, STAT_TGH = 10)

/datum/ritual/cruciform/priest/short_boost/vigilance
	name = "Commitment to Determination"
	phrase = "Cor meum et caro mea, potest deficere, sed non in viribus Deus cordis mei et pars mea Deus in aeternum."
	stats_to_boost = list(STAT_VIG = 10)

/datum/ritual/targeted/cruciform/priest/atonement
	name = "Atonement"
	phrase = "Piaculo sit \[Target human]!"
	desc = "Imparts extreme pain on the target disciple, but does no actual harm. Use this if someone who performs a heretical act."
	power = 45

/datum/ritual/targeted/cruciform/priest/atonement/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	if(!targets.len)
		fail("Target not found.",user,C,targets)
		return FALSE

	var/obj/item/weapon/implant/core_implant/CI = targets[1]

	if(!CI.active || !CI.wearer)

		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/M = CI.wearer
	log_and_message_admins("inflicted pain on [C] with atonement litany")
	to_chat(M, SPAN_DANGER("A wave of agony washes over you, the cruciform in your chest searing like a star for a few moments of eternity."))


	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(1, 1, M.loc)
	s.start()

	M.apply_effect(50, AGONY, 0)

	return TRUE

/datum/ritual/targeted/cruciform/priest/atonement/process_target(var/index, var/obj/item/weapon/implant/core_implant/target, var/text)
	target.update_address()
	if(index == 1 && target.address == text)
		if(target.wearer && (target.loc && (target.locs[1] in view())))
			return target

/datum/ritual/cruciform/priest/records
	name = "Baptismal Record"
	phrase = "Memento nomina..."
	desc = "Requests a copy of the churches local parishoner records from your altar."
	power = 30
	success_message = "On the verge of audibility you hear pleasant music, a piece of paper slides out from a slit in the altar."

/datum/ritual/cruciform/priest/records/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		new /obj/item/weapon/paper/neopaper(altar.loc, disciples.Join("\n"), "Church Record")
	return TRUE

/datum/ritual/cruciform/priest/new_cruciform
	name = "Prayer of Reunion"
	phrase = "Ego enim scio cogitationes quas cogito super vos, ait Dominus Deus: Non est nocere consilia, ut bene sit tibi, et tu non adflictionis ut dem vobis finem et patientiam. Requires the speaker to stand next to an altar."
	desc = "Request a new cruciform in the event someone wishes to join the fold or the one they had was destroyed."
	power = 50
	success_message = "On the verge of audibility you hear pleasant music, the alter slides open and a new cruciform slips out."

/datum/ritual/cruciform/priest/new_cruciform/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/optable/altar = locate(/obj/machinery/optable/altar) in OBJS

	if(!altar)
		fail("This is not your altar, the litany is useless.", user, C)
		return FALSE

	if(altar)
		new /obj/item/weapon/implant/core_implant/cruciform(altar.loc)
	return TRUE

