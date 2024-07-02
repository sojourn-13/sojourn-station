/obj/mecha
	var/datum/action/innate/mecha/mech_eject/eject_action = new
	var/datum/action/innate/mecha/mech_toggle_internals/internals_action = new
	var/datum/action/innate/mecha/mech_toggle_lights/lights_action = new
	var/datum/action/innate/mecha/mech_view_stats/stats_action = new
	var/datum/action/innate/mecha/reload_gun/reload_action = new
	var/datum/action/innate/mecha/mech_defence_mode/defense_action = new
	var/datum/action/innate/mecha/mech_overload_mode/overload_action = new
	var/datum/action/innate/mecha/mech_smoke/smoke_action = new
	var/datum/action/innate/mecha/mech_zoom/zoom_action = new
	var/datum/action/innate/mecha/mech_toggle_phasing/phasing_action = new
	var/datum/action/innate/mecha/mech_switch_damtype/switch_damtype_action = new

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


/datum/action/innate/mecha/mech_overload_mode
	name = "Toggle leg actuators overload"
	button_icon_state = "mech_overload_off"

/datum/action/innate/mecha/mech_overload_mode/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	if(chassis.health < initial(chassis.health) - initial(chassis.health) / 3)
		chassis.occupant_message(SPAN_DANGER("The leg actuators are too damaged to overload!"))
		return // Can't activate them if the mech is too damaged
	chassis.leg_overload_mode = !chassis.leg_overload_mode
	button_icon_state = "mech_overload_[chassis.leg_overload_mode ? "on" : "off"]"
	chassis.log_message("Toggled leg actuators overload.")
	if(chassis.leg_overload_mode)
		chassis.leg_overload_mode = 1
		// chassis.bumpsmash = 1
		chassis.step_in = min(1, round(chassis.step_in / 2))
		chassis.step_energy_drain = max(chassis.overload_step_energy_drain_min, chassis.step_energy_drain * chassis.leg_overload_coeff)
		chassis.occupant_message(SPAN_DANGER("You enable leg actuators overload."))
	else
		chassis.leg_overload_mode = 0
		// chassis.bumpsmash = 0
		chassis.step_in = initial(chassis.step_in)
		chassis.step_energy_drain = chassis.normal_step_energy_drain
		chassis.occupant_message(SPAN_NOTICE("You disable leg actuators overload."))
	button?.UpdateIcon()

/datum/action/innate/mecha/mech_smoke
	name = "Smoke"
	button_icon_state = "mech_smoke"

/datum/action/innate/mecha/mech_smoke/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	if(chassis.smoke_ready && chassis.smoke > 0)
		chassis.smoke_system.start()
		chassis.smoke--
		chassis.smoke_ready = 0
		spawn(chassis.smoke_cooldown)
			chassis.smoke_ready = 1
	else
		chassis.occupant_message("<span class='warning'>You are either out of smoke, or the smoke isn't ready yet.</span>")

/datum/action/innate/mecha/mech_zoom
	name = "Zoom"
	button_icon_state = "mech_zoom_off"

/datum/action/innate/mecha/mech_zoom/Activate()
	if(!owner || !chassis || chassis.occupant != owner || !owner.client)
		return

	chassis.zoom_mode = !chassis.zoom_mode
	button_icon_state = "mech_zoom_[chassis.zoom_mode ? "on" : "off"]"
	chassis.log_message("Toggled zoom mode.")
	chassis.occupant_message("<font color='[chassis.zoom_mode ? "blue" : "red"]'>Zoom mode [chassis.zoom_mode ? "en" : "dis"]abled.</font>")
	if(chassis.zoom_mode)
		owner.client.view = 12
		owner.client.apply_clickcatcher()
		SEND_SOUND(owner, sound('sound/mecha/imag_enh.ogg',volume=50))
	else
		owner.client.view = world.view//world.view - default mob view size
		owner.client.apply_clickcatcher()
	button?.UpdateIcon()

/datum/action/innate/mecha/mech_toggle_phasing
	name = "Toggle Phasing"
	button_icon_state = "mech_phasing_off"

/datum/action/innate/mecha/mech_toggle_phasing/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	chassis.phasing = !chassis.phasing
	button_icon_state = "mech_phasing_[chassis.phasing ? "on" : "off"]"
	if(chassis.phasing)
		chassis.occupant_message(SPAN_NOTICE("Enabled phasing."))
	else
		chassis.occupant_message(SPAN_WARNING("Disabled phasing."))
	
	button?.UpdateIcon()


/datum/action/innate/mecha/mech_switch_damtype
	name = "Reconfigure arm microtool arrays"
	button_icon_state = "mech_damtype_brute"

/datum/action/innate/mecha/mech_switch_damtype/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return
	var/new_damtype
	switch(chassis.damtype)
		if(TOX)
			new_damtype = BRUTE
			chassis.occupant_message("Your exosuit's hands form into fists.")
		if(BRUTE)
			new_damtype = BURN
			chassis.occupant_message("A torch tip extends from your exosuit's hand, glowing red.")
		if(BURN)
			new_damtype = TOX
			chassis.occupant_message("A bone-chillingly thick plasteel needle protracts from the exosuit's palm.")
	chassis.damtype = new_damtype
	button_icon_state = "mech_damtype_[new_damtype]"
	playsound(src, 'sound/mecha/mechmove01.ogg', 50, 1)
	button?.UpdateIcon()
