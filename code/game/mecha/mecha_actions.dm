/obj/mecha
	var/datum/action/innate/mecha/mech_eject/eject_action = new
	var/datum/action/innate/mecha/mech_toggle_internals/internals_action = new
	var/datum/action/innate/mecha/mech_toggle_lights/lights_action = new
	var/datum/action/innate/mecha/mech_view_stats/stats_action = new
	var/datum/action/innate/mecha/reload_gun/reload_action = new
	var/datum/action/innate/mecha/mech_defence_mode/defense_action = new

/obj/mecha/proc/GrantActions(mob/living/user)
	eject_action.Grant(user, src)
	internals_action.Grant(user, src)
	lights_action.Grant(user, src)
	stats_action.Grant(user, src)
	reload_action.Grant(user, src)

/obj/mecha/proc/RemoveActions(mob/living/user)
	eject_action.Remove(user)
	internals_action.Remove(user)
	lights_action.Remove(user)
	stats_action.Remove(user)
	reload_action.Remove(user)

/datum/action/innate/mecha
	check_flags = AB_CHECK_RESTRAINED | AB_CHECK_STUNNED | AB_CHECK_ALIVE
	button_icon = 'icons/mob/actions/actions_mecha.dmi'
	var/obj/mecha/chassis

/datum/action/innate/mecha/Grant(mob/living/L, obj/mecha/M)
	if(M)
		chassis = M
	. = ..()

/datum/action/innate/mecha/Destroy()
	chassis = null
	. = ..()

/datum/action/innate/mecha/mech_eject
	name = "Eject From Mech"
	button_icon_state = "mech_eject"

/datum/action/innate/mecha/mech_eject/Activate()
	if(!owner)
		return
	if(!chassis || chassis.occupant != owner)
		return
	chassis.go_out()
	chassis.add_fingerprint(owner)

/datum/action/innate/mecha/mech_toggle_internals
	name = "Toggle Internal Airtank Usage"
	button_icon_state = "mech_internals_off"

/datum/action/innate/mecha/mech_toggle_internals/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	chassis.toggle_internal_tank()
	button_icon_state = "mech_internals_[chassis.use_internal_tank ? "on" : "off"]"
	button?.UpdateIcon()

/datum/action/innate/mecha/mech_toggle_lights
	name = "Toggle Lights"
	button_icon_state = "mech_lights_off"

/datum/action/innate/mecha/mech_toggle_lights/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	chassis.toggle_lights()
	button_icon_state = "mech_lights_[chassis.lights ? "on" : "off"]"
	button?.UpdateIcon()

/datum/action/innate/mecha/mech_view_stats
	name = "View Stats"
	button_icon_state = "mech_view_stats"

/datum/action/innate/mecha/mech_view_stats/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	chassis.view_stats(chassis.occupant)

/datum/action/innate/mecha/reload_gun
	name = "Reload Gun"
	button_icon_state = "mech_reload"

/datum/action/innate/mecha/reload_gun/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	chassis.reload_gun()

/datum/action/innate/mecha/mech_defence_mode
	name = "Toggle Defence Mode"
	button_icon_state = "mech_defense_mode_off"

/datum/action/innate/mecha/mech_defence_mode/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return

	chassis.toggle_defense_mode()
	button_icon_state = "mech_defense_mode_[chassis.defense_mode ? "on" : "off"]"
	button?.UpdateIcon()
