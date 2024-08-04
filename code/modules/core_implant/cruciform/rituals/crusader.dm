/datum/ritual/cruciform/crusader
	name = "crusader"
	phrase = null
	desc = ""
	category = "Crusader"

/datum/ritual/targeted/cruciform/crusader
	name = "crusader targeted"
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Crusader"

/datum/ritual/cruciform/crusader/heal_other
	name = "Crusader's Balm"
	phrase = "Sit fratribus meis et tibi pax, et domui tuae pax, et omnibus, quaecumque habes, sit pax." //"Long life to you! Good health to you and your household! And good health to all that is yours!"
	desc = "Heal a nearby disciple."
	cooldown = TRUE
	cooldown_time = 100
	power = 35

/datum/ritual/cruciform/crusader/heal_other/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
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

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of convalescence")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		log_and_message_admins(" healed [CI.wearer] with Crusader's Balm litany")
		to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain</span>")
		H.add_chemical_effect(CE_PAINKILLER, 20)
		H.adjustBruteLoss(-30)
		H.adjustFireLoss(-30)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/datum/ritual/cruciform/crusader/brotherhood
	name = "Eternal Brotherhood"
	phrase = "Sicut enim corpus unum est, et membra habet multa, omnia autem membra corporis cum sint multa, unum tamen corpus sunt." //"Just as a body, though one, has many parts, but all its many parts form one body."
	desc = "Reveals other disciples to speaker."
	power = 50

/datum/ritual/cruciform/crusader/brotherhood/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/datum/core_module/cruciform/neotheologyhud/hud_module = C.get_module(/datum/core_module/cruciform/neotheologyhud)
	if(hud_module)
		C.remove_module(hud_module)
	else
		C.add_module(new /datum/core_module/cruciform/neotheologyhud)
	return TRUE

/datum/ritual/cruciform/crusader/battle_call
	name = "Call to Battle"
	phrase = "Si exieritis ad bellum de terra vestra contra hostes qui dimicant adversum vos clangetis ululantibus tubis et erit recordatio vestri coram Domino Deo vestro ut eruamini de manibus inimicorum vestrorum."
	desc = "Inspires the prayer and gives him strength to protect the other disciples. True strength in unity."
	cooldown = TRUE
	cooldown_time = 10 MINUTES
	cooldown_category = "battle call"
	effect_time = 10 MINUTES
	power = 50

/datum/ritual/cruciform/crusader/battle_call/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/count = 0
	for(var/mob/living/carbon/human/brother in view(user))
		if(brother.get_core_implant(/obj/item/implant/core_implant/cruciform))
			count += 2

	user.stats.changeStat(STAT_TGH, count)
	user.stats.changeStat(STAT_ROB, count)
	user.stats.changeStat(STAT_VIG, (count / 2))
	log_and_message_admins("performed a crusade litany")
	to_chat(user, SPAN_NOTICE("You feel an extraordinary burst of energy."))
	set_personal_cooldown(user)
	addtimer(CALLBACK(src, PROC_REF(discard_effect), user, count), src.cooldown_time)
	return TRUE

/datum/ritual/cruciform/crusader/battle_call/proc/discard_effect(mob/living/carbon/human/user, amount)
	user.stats.changeStat(STAT_TGH, -amount)
	user.stats.changeStat(STAT_ROB, -amount)
	user.stats.changeStat(STAT_VIG, -amount / 2)

/datum/ritual/cruciform/crusader/flash
	name = "Searing Revelation"
	phrase = "Per fidem enim ambulamus et non per speciem."
	desc = "Knocks over everybody without cruciform in the view range. The mental pressure is so powerful, the speaker can be knocked down too."
	cooldown = TRUE
	cooldown_time = 2 MINUTES
	cooldown_category = "flash"
	power = 75

/datum/ritual/cruciform/crusader/flash/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	if(prob(100 - user.stats.getStat(STAT_VIG)))
		user.Weaken(10)
		to_chat(user, SPAN_WARNING("The wave knocks you over!"))
	else
		to_chat(user, SPAN_NOTICE("The wave pushes at your will, but you managed to keep focused!"))
	playsound(user.loc, 'sound/effects/cascade.ogg', 65, 1)
	log_and_message_admins("performed a searing revelation litany")
	for(var/mob/living/carbon/human/victim in view(user))
		if(!victim.get_core_implant(/obj/item/implant/core_implant/cruciform))
			if(prob(100 - victim.stats.getStat(STAT_VIG)))
				to_chat(victim, SPAN_WARNING("You feel that your knees bends!"))
				victim.Weaken(5)
			else
				to_chat(victim, SPAN_NOTICE("Your legs feel numb, but you managed to stay on your feet!"))
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/targeted/cruciform/crusader/spawn_item
	name = "Litany of Armaments"
	phrase = "Supra Domini, bona de te peto. Audi me, et libera vocationem ad me munera tua."
	desc = "Request a greatsword, tower shield, and suit of power armor from the church armory to become a real crusader. Establishing the connection takes a lot of power and this litany may only be used once every twelve hours."
	power = 75 //Only usable once per shift anyway, we don't need to use every drop of power the player has
	cooldown = TRUE
	cooldown_time = 12 HOURS
	cooldown_category = "armaments"


/datum/ritual/targeted/cruciform/crusader/spawn_item/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	new /obj/item/tool/sword/crusader(usr.loc)
	new /obj/item/clothing/accessory/holster/saber/greatsword(usr.loc)
	new /obj/item/shield/riot/crusader(usr.loc)
	new /obj/item/storage/belt/security/neotheology(usr.loc)
	new /obj/item/clothing/suit/space/void/crusader(usr.loc)
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/targeted/cruciform/crusader/end_crusade
	name = "End Crusade"
	phrase = "Tempus occidendi, et tempus sanandi; tempus destruendi, et tempus aedificandi." //"A time to kill and a time to heal, a time to tear down and a time to build"
	desc = "Ends your Crusade, returning you to the state you were in when you entered the upper levels."
	power = 5 //This is literally a litany to depower yourself, it shouldn't cost much

/datum/ritual/targeted/cruciform/crusader/end_crusade/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/cruciform/C,list/targets)
	for(var/datum/antagonist/A in user.mind.antagonist)
		if(A.id == ROLE_INQUISITOR)
			A.remove_antagonist()
