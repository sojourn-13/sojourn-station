/datum/ritual/cruciform/base
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	fail_message = "The Cruciform feels cold against your chest."
	category = "Common"

/datum/ritual/targeted/cruciform/base
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Common"

/datum/ritual/cruciform/base/relief
	name = "Relief"
	phrase = "Et si ambulavero in medio umbrae mortis non timebo mala."
	desc = "A short litany to relieve pain of the afflicted."
	power = 50
	ignore_stuttering = TRUE
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/base/relief/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	//var/datum/reagent/bloodhold
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	H.reagents.add_reagent("laudanum", 10)
	H.apply_effect(-30, AGONY, 0)
	H.apply_effect(-30, HALLOSS, 0)
	H.updatehealth()
	return TRUE

/datum/ritual/cruciform/base/soul_hunger
	name = "Soul Hunger"
	phrase = "Panem nostrum cotidianum da nobis hodie."
	desc = "Litany of pilgrims that helps better withstand hunger."
	power = 50

/datum/ritual/cruciform/base/soul_hunger/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	H.nutrition += 100
	H.adjustToxLoss(5)
	return TRUE

/datum/ritual/cruciform/base/glow_book
	name = "Word of Guidance"
	phrase = "Legem pone mihi, Domine, in via tua, et dirige me in semitam rectam, propter inimicos meos."
	desc = "A prayer to light your way. It makes the ritual book you're holding glow brightly for ten minutes. "
	power = 10 //Cost correlates to duration
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "bglow"
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/base/glow_book/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/successful = FALSE
	if (istype(H.get_active_hand(), /obj/item/book/ritual/cruciform))
		if(H.species?.reagent_tag != IS_SYNTHETIC)
			if(H.nutrition >= nutri_cost)
				H.nutrition -= nutri_cost
			else
				to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
				H.vessel.remove_reagent("blood",blood_cost)
		var/obj/item/book/ritual/cruciform/M = H.get_active_hand()
		M.set_light(5) //Slightly better than as a lantern since you can only hold it in hand or within the belt slot.
		playsound(H.loc, 'sound/ambience/ambicha2.ogg', 75, 1)
		H.visible_message(
			SPAN_NOTICE("The ritual book [H] is holding begins to emit light."),
			SPAN_NOTICE("The ritual book you're holding begins to glow brightly.")
		)
		spawn(6000) M.set_light(0)
		successful = TRUE
		set_personal_cooldown(H)
	else
		to_chat(H, SPAN_DANGER("You need to be holding a ritual book to perfom this rite."))
	return successful

/datum/ritual/cruciform/base/flare
	name = "Holy Light"
	phrase = "Lucerna pedibus meis verbum tuum, et lumen semitis meis."
	desc = "Litany of pilgrims that creates a small light for about twenty minutes."
	power = 20 //Cost correlates to duration.
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "flare"
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/base/flare/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	playsound(H.loc, 'sound/effects/snap.ogg', 50, 1)
	new /obj/effect/sparks(H.loc)
	new /obj/effect/effect/smoke/illumination(H.loc, brightness=max(7), lifetime=12000) //Very bright light.
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/base/entreaty
	name = "Entreaty"
	phrase = "Deus meus ut quid dereliquisti me."
	desc = "Call for help, allowing other cruciform bearers to hear your cries."
	power = 25
	ignore_stuttering = TRUE
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/base/entreaty/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	for(var/mob/living/carbon/human/target in disciples)
		if(target == H)
			continue

		var/obj/item/implant/core_implant/cruciform/CI = target.get_core_implant()
		var/area/t = get_area(H)

		if((istype(CI) && CI.get_module(CRUCIFORM_PRIEST)) || prob(50))
			to_chat(target, SPAN_DANGER("[H], faithful cruciform follower, cries for salvation at [t.name]!"))
	return TRUE

/datum/ritual/cruciform/base/reveal
	name = "Reveal Adversaries"
	phrase = "Et fumus tormentorum eorum ascendet in saecula saeculorum: nec habent requiem die ac nocte, qui adoraverunt bestiam, et imaginem ejus, et si quis acceperit caracterem nominis ejus."
	desc = "Gain knowledge of your surroundings to reveal evil in people and places. This can tell you about hostile creatures around you, rarely can help you spot traps and sometimes let you sense a monster disguised as a person."
	power = 35
	nutri_cost = 25//med cost
	blood_cost = 25//med cost

/datum/ritual/cruciform/base/reveal/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/was_triggired = FALSE
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("performed reveal litany")
	if(prob(5)) //Aditional fail chance that hidded from user
		to_chat(H, SPAN_NOTICE("There is nothing there. You feel safe."))
		return TRUE
	for (var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
			was_triggired = TRUE
			break

	if (!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H))
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
				was_triggired = TRUE
				break
	if (prob(95) && (locate(/obj/structure/wire_splicing || /obj/item/mine || /obj/item/mine_old || /obj/item/spider_shadow_trap || /obj/item/beartrap) in view(7, H))) //Add more traps later
		to_chat(H, SPAN_WARNING("Something is wrong with this area. Tread carefully."))
		was_triggired = TRUE
	if (prob(80))
		for(var/mob/living/carbon/human/target in range(14, H))
			for(var/organ in target.organs)
				if (organ in subtypesof(/obj/item/organ/internal/carrion))
					to_chat(H, SPAN_DANGER("A black terrible evil brushes against your mind suddenly, a horrible monstrous entity who's mere glancing ire is enough to leave you in a breathless cold sweat..."))
				was_triggired = TRUE
				break
	if (!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))
	return TRUE

/datum/ritual/cruciform/base/message
	name = "Sending"
	phrase = "Audit, me audit vocationem. Ego nuntius vobis."
	desc = "Send a message through the void, straight into the mind of another disciple."
	power = 30
	nutri_cost = 10//low cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/base/message/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/mob/living/carbon/human/H = pick_disciple_global(user, TRUE)
	if(user.species?.reagent_tag != IS_SYNTHETIC)
		if(user.nutrition >= nutri_cost)
			user.nutrition -= nutri_cost
		else
			to_chat(user, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			user.vessel.remove_reagent("blood",blood_cost)
	if (!H)
		return

	if(user == H)
		fail("You feel stupid.",user,C,targets)
		return FALSE

	var/text = input(user, "What message will you send to the target? The message will be recieved telepathically and they will not know who it is from unless you reveal yourself.", "Sending a message") as text|null
	if (!text)
		return
	to_chat(H, "<span class='notice'><b><font size='3px'><font color='#ffaa00'>[user.real_name]'s voice speaks in your mind: \"[text]\"</font><b></span>")
	log_and_message_admins("[user.real_name] sent a message to [H] with text \"[text]\"")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	playsound(H, 'sound/machines/signal.ogg', 50, 1)


/datum/ritual/cruciform/base/revelation
	name = "Revelation"
	phrase = "Patris ostendere viam"
	desc = "A person close to you will have a vision that could increase ther faith... or that's what you hope will happen."
	power = 50
	nutri_cost = 50//high cost
	blood_cost = 10//low cost

/datum/ritual/cruciform/base/revelation/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(H, 4)
	//if(!T || !T.client)
	if(H.species?.reagent_tag != IS_SYNTHETIC)
		if(H.nutrition >= nutri_cost)
			H.nutrition -= nutri_cost
		else
			to_chat(H, SPAN_WARNING("You manage to cast the litany at a cost. The physical body consumes itself..."))
			H.vessel.remove_reagent("blood",blood_cost)
	log_and_message_admins("performed Revelation litany (makes people drugged/hallucinate)")

	if(!T)
		fail("No target.", H, C)
		return FALSE
	T.hallucination(50,100)
	//var/sanity_lost = rand(-10,10) no thanks
	T.druggy = max(T.druggy, 10)
	//T.sanity.changeLevel(sanity_lost) //no thanks
	SEND_SIGNAL(H, COMSIG_RITUAL, src, T)
	return TRUE

/datum/ritual/cruciform/base/install_upgrade
	name = "Install Cruciform Upgrade"
	phrase = "Deum benedicite mihi voluntas in suum donum"
	desc = "This litany will command a cruciform upgrade to attach to follower's cruciform. They must lie on an altar with the upgrade must be near them."
	power = 20

/datum/ritual/cruciform/base/install_upgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	if(!CI)
		fail("[H] don't have a cruciform installed.", user, C)
		return FALSE
	if(CI.upgrade)
		fail("Cruciform already has an upgrade installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	var/obj/item/cruciform_upgrade/CU = locate(/obj/item/cruciform_upgrade) in L

	if(!CU)
		fail("There is no cruciform upgrade nearby.", user, C)
		return FALSE

	if(!(H in L))
		fail("Cruciform upgrade is too far from [H].", user, C)
		return FALSE

	if(CU.active)
		fail("Cruciform upgrade is already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	for(var/obj/item/clothing/CL in H)
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE



	if(!CU.install(H, CI) || CU.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE

/datum/ritual/cruciform/base/uninstall_upgrade
	name = "Uninstall Cruciform Upgrade"
	phrase = "Deus meus ut quid habebant affectus."
	desc = "This litany will command a cruciform uprgrade to detach from a cruciform."
	power = 20

/datum/ritual/cruciform/base/uninstall_upgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	var/list/L = get_front(user)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if(!CI.upgrade)
		fail("Cruciform upgrade is not installed.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	if(CI.upgrade.uninstall() || CI.upgrade)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE
