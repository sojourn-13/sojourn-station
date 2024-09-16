/datum/antagonist/inquisitor
	id = ROLE_INQUISITOR
	role_text = "Crusader"
	role_text_plural = "Crusaders"
	bantype = ROLE_BANTYPE_INQUISITOR
	welcome_text = ""
	antaghud_indicator = "hudcyberchristian"

	var/was_priest = FALSE

	survive_objective = /datum/objective/escape

	stat_modifiers = list(
		STAT_TGH = 30,
		STAT_ROB = 30,
		STAT_VIG = 10
	)

/datum/antagonist/inquisitor/can_become_antag(var/datum/mind/M, var/mob/report)
	if(!..())
		if (report)
			to_chat(report, SPAN_NOTICE("Failure: Parent can_become_antag returned false"))
		return FALSE
	if(!M.current.get_core_implant(/obj/item/implant/core_implant/cruciform))
		if (report)
			to_chat(report, SPAN_NOTICE("Failure: [M] does not have a cruciform and this antag requires it"))
		return FALSE
	return TRUE

/datum/antagonist/inquisitor/equip()
	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])

	if(!owner.current)
		return FALSE

	var/obj/item/implant/core_implant/cruciform/C = owner.current.get_core_implant(/obj/item/implant/core_implant/cruciform)

	if(!C)
		return FALSE

	if (is_preacher(owner.current))
		was_priest = TRUE

	C.make_crusader()
	return TRUE

/datum/antagonist/inquisitor/remove_antagonist() //Only use this on people whose cruciforms are active
	var/obj/item/implant/core_implant/cruciform/C = owner.current.get_core_implant(/obj/item/implant/core_implant/cruciform)

	if(!C)
		return
	else
		C.remove_crusader()

	.=..()

/datum/antagonist/inquisitor/greet()
	if(!owner || !owner.current)
		return

	var/mob/player = owner.current

	if (was_priest)
		to_chat(player, "<span class='notice'>You've been promoted...</span>")
		sleep(30)
	// Basic intro text.
	to_chat(player, "<span class='danger'><font size=3>You are a [role_text]!</font></span>")

	to_chat(player, "Crusader is a special protocol within the Church of Absolute.<br>\
	You're cruciform has activated its crusader protocol upon detecting the presence of an active hivemind. You are to do \
	everything in your power to destroy all traces of the hivemind and any infected machines or organics.<br>\
	<br>\
	Any local church staff should aid in goals and other crusaders will announce their presence so you may work together. \
	Remember that your goal is only to destroy the hivemind, once you've completed your task you should return to your regular \
	duties but remain vigilant. Under special circumstances your crusader protocol may have activated to deal with a different threat. \
	Do as befitting of the church and aid the colony in whatever way you can.")

	to_chat(player, "You will need a ritual book to utilise your abilities. They can be found or purchased in the chapel.")


	show_objectives()
	printTip()

	return TRUE

