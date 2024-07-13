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
	phrase = "Tribulationes cordis mei multiplicatae sunt: de necessitatibus meis erue me." //"Relieve the troubles of my heart and free me from my anguish."
	desc = "A short litany to relieve the pain of the speaker."
	power = 50
	ignore_stuttering = TRUE

/datum/ritual/cruciform/base/relief/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	H.reagents.add_reagent("laudanum", 10)
	H.updatehealth()
	return TRUE

/datum/ritual/cruciform/base/soul_hunger
	name = "Soul Hunger"
	phrase = "Panem nostrum cotidianum da nobis hodie." //"Give us this day our daily bread."
	desc = "Litany of pilgrims that helps withstand hunger. Causes some mild poisoning, which can be relieved with Cahors."
	power = 20

/datum/ritual/cruciform/base/soul_hunger/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	H.nutrition += 50
	H.reagents.add_reagent("wormwood", 5)
	return TRUE

/datum/ritual/cruciform/base/glow_book
	name = "Word of Guidance"
	phrase = "Lucerna pedibus meis verbum tuum, et lumen semitis meis." //"Your word is a lamp for my feet, a light on my path."
	desc = "A prayer to light your way. It makes the ritual book you're holding glow brightly for ten minutes. "
	power = 10 //Cost correlates to duration
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "bglow"

/datum/ritual/cruciform/base/glow_book/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	if (istype(H.get_active_hand(), /obj/item/book/ritual/cruciform))
		var/obj/item/book/ritual/cruciform/M = H.get_active_hand()
		M.set_light(5) //Slightly better than as a lantern since you can only hold it in hand or within the belt slot.
		playsound(H.loc, 'sound/ambience/ambicha2.ogg', 75, 1)
		H.visible_message(
			SPAN_NOTICE("The ritual book [H] is holding begins to emit light."),
			SPAN_NOTICE("The ritual book you're holding begins to glow brightly.")
		)
		addtimer(CALLBACK(M, TYPE_PROC_REF(/obj/item/book/ritual/cruciform, glowient)), 6000)
		set_personal_cooldown(H)
		return TRUE
	else
		to_chat(H, SPAN_DANGER("You need to be holding a ritual book to perfom this rite."))
		return FALSE

/obj/item/book/ritual/cruciform/proc/glowient()
	set_light(0)

/datum/ritual/cruciform/base/flare
	name = "Holy Light"
	phrase = "Legem pone mihi, Domine, in via tua, et dirige me in semitam rectam, propter inimicos meos."  //"Teach me your way, Lord; lead me in a straight path because of my oppressors."
	desc = "Litany of pilgrims that creates a small light at your feet for twenty minutes."
	power = 20 //Cost correlates to duration.
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "flare"

/datum/ritual/cruciform/base/flare/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	playsound(H.loc, 'sound/effects/snap.ogg', 50, 1)
	new /obj/effect/sparks(H.loc)
	new /obj/effect/effect/smoke/illumination(H.loc, brightness=max(7), lifetime=12000) //Very bright light.
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/base/entreaty
	name = "Entreaty"
	phrase = "Deus meus ut quid dereliquisti me." //"My God, why have you forsaken me?"
	desc = "Call for help, allowing other cruciform bearers to hear your cries."
	power = 25
	ignore_stuttering = TRUE

/datum/ritual/cruciform/base/entreaty/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	for(var/mob/living/carbon/human/target in disciples)
		if(target == H)
			continue

		var/obj/item/implant/core_implant/cruciform/CI = target.get_core_implant()
		var/area/t = get_area(H)

		if((istype(CI)))
			to_chat(target, SPAN_DANGER("[H], faithful cruciform follower, cries for salvation at [t.name]!"))
	return TRUE

/datum/ritual/cruciform/base/reveal
	name = "Reveal Adversaries"
	phrase = "Et fumus tormentorum eorum ascendet in saecula saeculorum: nec habent requiem die ac nocte, qui adoraverunt bestiam, et imaginem ejus, et si quis acceperit caracterem nominis ejus." //"And the smoke of their torment will rise for ever and ever. There will be no rest day or night for those who worship the beast and its image, or for anyone who receives the mark of its name."
	desc = "Gain knowledge of your surroundings to reveal evil in people and places. This litany is imprecise, but can warn you of danger you don't see."
	power = 35

/datum/ritual/cruciform/base/reveal/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	var/was_triggired = FALSE
	log_and_message_admins("[H.real_name] performed reveal litany")
	if(prob(5)) //Additional fail chance that hidded from user
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
					to_chat(H, SPAN_DANGER("Adversaries are near. You can feel something nasty and hostile.")) //Non-divisors don't get any extra information beyond presence or absence of badness
				was_triggired = TRUE
				break
	if (!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing here. You feel safe."))
	return TRUE

/datum/ritual/cruciform/base/message
	name = "Sending"
	phrase = "Euntes autem praedicate, dicentes: Quia appropinquavit regnum caelorum." //"As you go, proclaim this message: ‘The kingdom of heaven has come near.’"
	desc = "Send a message through the communion of believers, straight into the mind of another disciple."
	power = 30

/datum/ritual/cruciform/base/message/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	var/mob/living/carbon/human/H = pick_disciple_global(user, TRUE)
	if (!H)
		return TRUE //You pay even if you don't actually talk to anyone. Sending shouldn't be a free version of Baptismal Record.

	if(user == H)
		fail("You feel stupid.",user,C,targets)
		return TRUE //You pay even if you don't actually talk to anyone. Sending shouldn't be a free version of Baptismal Record.

	var/text = input(user, "What message will you send to the target? The message will be recieved telepathically.", "Sending a message") as text|null
	if (!text)
		return TRUE //You pay even if you don't actually talk to anyone. Sending shouldn't be a free version of Baptismal Record.
	to_chat(H, "<span class='notice'><b><font size='3px'><font color='#ffaa00'>[user.real_name]'s voice speaks in your mind: \"[text]\"</font><b></span>")
	to_chat(user, "<span class='info'><font color='#ffaa00'>You say to [H]: \"[text]\"</font></span>")
	log_and_message_admins("[user.real_name] sent a message to [H] with text \"[text]\"")
	playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
	playsound(H, 'sound/machines/signal.ogg', 50, 1)
	for(var/mob/observer/ghost/G in world)
		if(G.get_preference_value(/datum/client_preference/ghost_ears_plus) == GLOB.PREF_YES)
			G.show_message("<i>Cruciform Sending message from <b>[user]</b> to <b>[H]</b>: [text]</i>")

	return TRUE


/datum/ritual/cruciform/base/revelation
	name = "Revelation"
	phrase = "Mysterium, quod absconditum fuit a saeculis, et generationibus, nunc autem manifestatum est sanctis ejus." //"The mystery that has been kept hidden for ages and generations, but is now disclosed to the Lord’s people."
	desc = "A person close to you will have a vision that could stabilize their mind... or that's what you hope will happen."
	power = 30

/datum/ritual/cruciform/base/revelation/perform(mob/living/carbon/human/H, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(H, 4)
	log_and_message_admins("performed Revelation litany (makes people drugged/hallucinate)")

	if(!T)
		fail("No target.", H, C)
		return FALSE
	T.hallucination(50,100)
	var/sanity_lost = rand(-5,10)
	T.druggy = max(T.druggy, 10)
	T.sanity.changeLevel(sanity_lost)
	LEGACY_SEND_SIGNAL(H, COMSIG_RITUAL, src, T)
	return TRUE

/datum/ritual/cruciform/base/install_upgrade
	name = "Install Cruciform Upgrade"
	phrase = "Omne datum optimum, et omne donum perfectum desursum est, descendens a Patre luminum, apud quem non est transmutatio, nec vicissitudinis obumbratio." //"Every good and perfect gift is from above, coming down from the Father of the heavenly lights, who does not change like shifting shadows."
	desc = "This litany will command a cruciform upgrade to attach to follower's cruciform. They must lie on an altar with the upgrade near them."
	power = 20

/datum/ritual/cruciform/base/install_upgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)
	if(!CI)
		fail("[H] doesn't have a cruciform installed.", user, C)
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

/* // Getting naked for a common upgrade is just annoying, not exactly thematic. -Kaz
	for(var/obj/item/clothing/CL in H)
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE
*/


	if(!CU.install(H, CI) || CU.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE

/datum/ritual/cruciform/base/uninstall_upgrade
	name = "Uninstall Cruciform Upgrade"
	phrase = "Omnia tempus habent, et suis spatiis transeunt universa sub caelo." //"There is a time for everything, and a season for every activity under the heavens"
	desc = "This litany will command a cruciform upgrade to detach from a cruciform."
	power = 20

/datum/ritual/cruciform/base/uninstall_upgrade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C)
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

//Give powah

/datum/ritual/cruciform/base/recharge_others
	name = "Empower"
	phrase = "Alter alterius onera portate." //"Carry each other’s burdens."
	desc = "This ritual gifts some of your faith to another disciple."
	power = 15
	ignore_stuttering = TRUE

/datum/ritual/cruciform/base/recharge_others/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
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
		return FALSE

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of succor")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		to_chat(H, "<span class='info'>Your cruciform sings a small tune as it gets charged.</span>")

		CI.restore_power(10)

		return TRUE
