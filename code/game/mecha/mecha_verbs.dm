
/////////////////////////
////////  Verbs  ////////
/////////////////////////
/obj/mecha/proc/removeVerb(verb_path)
	verbs -= verb_path

/obj/mecha/proc/addVerb(verb_path)
	verbs += verb_path

/obj/mecha/verb/toggle_lights()
	set name = "Toggle Lights"
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0

	if(usr != occupant)
		return

	lights = !lights

	if(lights)
		set_light(light_range + lights_power)
	else
		set_light(light_range - lights_power)

	occupant_message("Toggled lights [lights ? "on" : "off"].")
	log_message("Toggled lights [lights ? "on" : "off"].")


/obj/mecha/verb/toggle_internal_tank()
	set name = "Toggle internal airtank usage."
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0

	if(usr != occupant)
		return

	use_internal_tank = !use_internal_tank
	occupant_message("Now taking air from [use_internal_tank ? "internal airtank" : "environment"].")
	log_message("Now taking air from [use_internal_tank ? "internal airtank" : "environment"].")

/obj/mecha/verb/attempt_enter()
	set category = "Object"
	set name = "Enter Exosuit"
	set src in oview(1)

	move_inside(usr)

/obj/mecha/verb/view_stats()
	set name = "View Stats"
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0

	if(usr != occupant)
		return
	occupant << browse(get_stats_html(), "window=exosuit")

/obj/mecha/verb/reload()
	set name = "Reload Gun"
	set category = "Exosuit Interface"
	set popup_menu = 0
	set src = usr.loc
	if(usr != occupant)
		return
	reload_gun() // Reload the mech's active gun

/obj/mecha/verb/eject()
	set name = "Eject"
	set category = "Exosuit Interface"
	set src = usr.loc
	set popup_menu = 0
	
	if(usr != occupant)
		return

	go_out()
	add_fingerprint(usr)

/obj/mecha/verb/AIeject()
	set name = "AI Eject"
	set category = "Exosuit Interface"
	set popup_menu = 0

	var/atom/movable/mob_container
	if(ishuman(occupant) || isAI(occupant))
		mob_container = occupant

	if(usr != occupant)
		return

	if(isAI(mob_container))
		var/obj/item/mecha_parts/mecha_equipment/tool/ai_holder/AH = locate() in src
		if(AH)
			AH.go_out()
