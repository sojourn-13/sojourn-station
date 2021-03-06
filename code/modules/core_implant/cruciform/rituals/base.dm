/datum/ritual/cruciform/base
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	fail_message = "The Cruciform feels cold against your chest."
	category = "Common"


/datum/ritual/targeted/cruciform/base
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	category = "Common"


/datum/ritual/cruciform/base/relief
	name = "Relief"
	phrase = "Et si ambulavero in medio umbrae mortis non timebo mala."
	desc = "A short litany to relieve pain of the afflicted."
	power = 50

/datum/ritual/cruciform/base/relief/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	H.add_chemical_effect(CE_PAINKILLER, 30, TRUE)
	H.apply_effect(-30, AGONY, 0)
	H.apply_effect(-30, HALLOSS, 0)
	H.updatehealth()
	return TRUE


/datum/ritual/cruciform/base/soul_hunger
	name = "Soul Hunger"
	phrase = "Panem nostrum cotidianum da nobis hodie."
	desc = "Litany of pilgrims that helps better withstand hunger."
	power = 50

/datum/ritual/cruciform/base/soul_hunger/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	H.nutrition += 100
	H.adjustToxLoss(5)
	return TRUE

/* -Currently doesn't work, will spend more time fixing it later or replacing it with a more functional method. -Kaz
/datum/ritual/cruciform/base/flare
	name = "Holy Light"
	phrase = "Lucerna pedibus meis verbum tuum, et lumen semitis meis."
	desc = "Litany of pilgrims that creates a small light for some time."
	power = 15 //Cheap but not tooo cheap

/datum/ritual/cruciform/base/flare/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	playsound(src, 'sound/effects/snap.ogg', 50, 1)
	new /obj/effect/sparks(src)
	new /obj/effect/effect/smoke/illumination(src, brightness=max(6), lifetime=30000) //Not as good as a flare or flare shell but its almost free!
	return TRUE
*/

/datum/ritual/cruciform/base/entreaty
	name = "Entreaty"
	phrase = "Deus meus ut quid dereliquisti me."
	desc = "Call for help, allowing other cruciform bearers to hear your cries."
	power = 50

/datum/ritual/cruciform/base/entreaty/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	for(var/mob/living/carbon/human/target in disciples)
		if(target == H)
			continue

		var/obj/item/weapon/implant/core_implant/cruciform/CI = target.get_core_implant()
		var/area/t = get_area(H)

		if((istype(CI) && CI.get_module(CRUCIFORM_PRIEST)) || prob(50))
			to_chat(target, SPAN_DANGER("[H], faithful cruciform follower, cries for salvation at [t.name]!"))
	return TRUE

/datum/ritual/cruciform/base/reveal
	name = "Reveal Adversaries"
	phrase = "Et fumus tormentorum eorum ascendet in saecula saeculorum: nec habent requiem die ac nocte, qui adoraverunt bestiam, et imaginem ejus, et si quis acceperit caracterem nominis ejus."
	desc = "Gain knowledge of your surroundings to reveal evil in people and places. This can tell you about hostile creatures around you, rarely can help you spot traps and sometimes let you sense a monster disguised as a person."
	power = 35

/datum/ritual/cruciform/base/reveal/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	var/was_triggired = FALSE
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
	if (prob(95) && (locate(/obj/structure/wire_splicing || /obj/item/weapon/mine || /obj/item/weapon/mine_old || /obj/item/weapon/spider_shadow_trap || /obj/item/weapon/beartrap) in view(7, H))) //Add more traps later
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
	desc = "Send a message anonymously through the void, straight into the mind of another disciple."
	power = 30

/datum/ritual/cruciform/base/message/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/mob/living/carbon/human/H = pick_disciple_global(user, TRUE)
	if (!H)
		return

	if(user == H)
		fail("You feel stupid.",user,C,targets)
		return FALSE

	var/text = input(user, "What message will you send to the target? The message will be recieved telepathically and they will not know who it is from unless you reveal yourself.", "Sending a message") as text|null
	if (!text)
		return
	to_chat(H, "<span class='notice'><b><font size='3px'><font color='#ffaa00'>A voice speaks in your mind: \"[text]\"</font><b></span>")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	playsound(H, 'sound/machines/signal.ogg', 50, 1)
