//A system to manage and display alerts on screen without needing you to do it yourself

//PUBLIC -  call these wherever you want


/**
 * Proc to create or update an alert. Returns the alert if the alert is new or updated, 0 if it was thrown already.
 * Each mob may only have one alert per category.
 *
 * Arguments:
 * * category - a text string corresponding to what type of alert it is
 * * type - a type path of the actual alert type to throw
 * * severity - is an optional number that will be placed at the end of the icon_state for this alert
 *   For example, high pressure's icon_state is "highpressure" and can be serverity 1 or 2 to get "highpressure1" or "highpressure2"
 * * obj/new_master - optional argument. Sets the alert's icon state to "template" in the ui_style icons with the master as an overlay. Clicks are forwarded to master
 * * no_anim - whether the alert should play a small sliding animation when created on the player's screen
 * * icon_override - makes it so the alert is not replaced until cleared by a clear_alert with clear_override, and it's used for hallucinations.
 * * list/alert_args - a list of arguments to pass to the alert when creating it
 */
/mob/proc/throw_alert(category, type, severity, obj/new_master, override = FALSE, timeout_override, no_anim, icon_override, list/alert_args)
	if(!category)
		return

	var/obj/screen/alert/alert = LAZYACCESS(alerts, category)
	if(alert)
		if(alert.override_alerts)
			return 0
		if(new_master && new_master != alert.master)
			WARNING("[src] threw alert [category] with new_master [new_master] while already having that alert with master [alert.master]")
			clear_alert(category)
			return .()
		else if(alert.type != type)
			clear_alert(category)
			return .()
		else if(!severity || severity == alert.severity)
			if(alert.timeout)
				clear_alert(category)
				return .()
			else //no need to update
				return 0
	else
		if(alert_args)
			alert_args.Insert(1, null) // So it's still created in nullspace.
			alert = new type(arglist(alert_args))
		else
			alert = new type()
		alert.override_alerts = override
		if(override)
			alert.timeout = null

		alert.attach_owner(src)

	if(icon_override)
		alert.icon = icon_override

	if(new_master)
		var/old_layer = new_master.layer
		var/old_plane = new_master.plane
		new_master.layer = FLOAT_LAYER
		new_master.plane = FLOAT_PLANE
		alert.overlays += new_master
		new_master.layer = old_layer
		new_master.plane = old_plane
		alert.icon_state = "template" // We'll set the icon to the client's ui pref in reorganize_alerts()
		alert.master = new_master
	else
		alert.icon_state = "[initial(alert.icon_state)][severity]"
		alert.severity = severity

	LAZYSET(alerts, category, alert) // This also creates the list if it doesn't exist
	if(client && hud_used)
		hud_used.reorganize_alerts()

	if(!no_anim)
		alert.transform = matrix(32, 6, MATRIX_TRANSLATE)
		animate(alert, transform = matrix(), time = 2.5, easing = CUBIC_EASING)

	var/timeout = timeout_override || alert.timeout
	if(timeout)
		addtimer(CALLBACK(alert, TYPE_PROC_REF(/obj/screen/alert, do_timeout), src, category), timeout)
		alert.timeout = world.time + timeout - world.tick_lag

	return alert

// Proc to clear an existing alert.
/mob/proc/clear_alert(category, clear_override = FALSE)
	var/obj/screen/alert/alert = LAZYACCESS(alerts, category)
	if(!alert)
		return 0
	if(alert.override_alerts && !clear_override)
		return 0

	alerts -= category
	if(client && hud_used)
		hud_used.reorganize_alerts()
		client.screen -= alert
	qdel(alert)

/obj/screen/alert
	icon = 'icons/mob/screen_alert.dmi'
	icon_state = "default"
	name = "Alert"
	desc = "Something seems to have gone wrong with this alert, so report this bug please"
	mouse_opacity = MOUSE_OPACITY_ICON
	/// How long before this alert automatically clears itself (in deciseconds). If zero, remains until cleared.
	var/timeout = 0
	/// Some alerts may have different icon states based on severity, this adjusts that.
	var/severity = 0
	/// Tool-tip for the alert.
	var/alerttooltipstyle = ""
	/// If true, this should override any other alerts of the same type thrown.
	var/override_alerts = FALSE
	/// The mob that this alert was originally thrown to.
	var/mob/owner

/obj/screen/alert/New()
	// workaround for eris's cursed screen objects
	. = ..(name)

/obj/screen/alert/proc/attach_owner(mob/new_owner)
	owner = new_owner
	RegisterSignal(owner, COMSIG_PARENT_QDELETING, PROC_REF(remove_owner))

/obj/screen/alert/proc/remove_owner(mob/source, force)
	SIGNAL_HANDLER  // COMSIG_PARENT_QDELETING
	if(owner == source && !isnull(owner))
		UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
		owner = null

/obj/screen/alert/Destroy()
	if(owner)
		UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
	owner = null
	severity = 0
	master = null
	screen_loc = ""
	return ..()

/obj/screen/alert/Click(location, control, params)
	..()
	if(!usr || !usr.client)
		return FALSE
	if(usr != owner)
		to_chat(usr, "<span class='notice'>Only [owner] can use that!</span>")
		return FALSE
	var/paramslist = params2list(params)
	if(paramslist["shift"]) // screen objects don't do the normal Click() stuff so we'll cheat
		to_chat(usr, "<span class='boldnotice'>[name]</span> - <span class='info'>[desc]</span>")
		return FALSE
	if(master)
		usr.client.Click(master, location, control, params)
	return TRUE

/obj/screen/alert/MouseEntered(location, control, params)
	. = ..()
	openToolTip(usr, src, params, title = name, content = desc, theme = alerttooltipstyle)


/obj/screen/alert/MouseExited()
	closeToolTip(usr)
	return ..()

/obj/screen/alert/proc/do_timeout(mob/M, category)
	if(!M || !M.alerts)
		return

	if(timeout && M.alerts[category] == src && world.time >= timeout)
		M.clear_alert(category)

//Gas alerts
/obj/screen/alert/not_enough_oxy
	name = "Choking (No O2)"
	desc = "You're not getting enough oxygen. Find some good air before you pass out! The box in your backpack has an oxygen tank and breath mask in it."
	icon_state = "not_enough_oxy"

/obj/screen/alert/too_much_oxy
	name = "Choking (O2)"
	desc = "There's too much oxygen in the air, and you're breathing it in! Find some good air before you pass out!"
	icon_state = "too_much_oxy"

/obj/screen/alert/not_enough_nitro
	name = "Choking (No N2)"
	desc = "You're not getting enough nitrogen. Find some good air before you pass out!"
	icon_state = "not_enough_nitro"

/obj/screen/alert/too_much_nitro
	name = "Choking (N2)"
	desc = "There's too much nitrogen in the air, and you're breathing it in! Find some good air before you pass out!"
	icon_state = "too_much_nitro"

/obj/screen/alert/not_enough_co2
	name = "Choking (No CO2)"
	desc = "You're not getting enough carbon dioxide. Find some good air before you pass out!"
	icon_state = "not_enough_co2"

/obj/screen/alert/too_much_co2
	name = "Choking (CO2)"
	desc = "There's too much carbon dioxide in the air, and you're breathing it in! Find some good air before you pass out!"
	icon_state = "too_much_co2"

/obj/screen/alert/not_enough_tox
	name = "Choking (No Plasma)"
	desc = "You're not getting enough plasma. Find some good air before you pass out!"
	icon_state = "not_enough_tox"

/obj/screen/alert/too_much_tox
	name = "Choking (Plasma)"
	desc = "There's highly flammable, toxic plasma in the air and you're breathing it in. Find some fresh air. The box in your backpack has an oxygen tank and gas mask in it."
	icon_state = "too_much_tox"
//End gas alerts

// Hunger alerts

/obj/screen/alert/hunger
	icon = 'icons/mob/screen_hunger.dmi'

/obj/screen/alert/hunger/fat
	name = "Fat"
	desc = "You ate too much food, lardass. Run around the station and lose some weight."
	icon_state = "fat"

/obj/screen/alert/hunger/full
	name = "Full"
	desc = "You feel full and satisfied, but you shouldn't eat much more."
	icon_state = "full"

/obj/screen/alert/hunger/well_fed
	name = "Well Fed"
	desc = "You feel quite satisfied, but you may be able to eat a bit more."
	icon_state = "well_fed"

/obj/screen/alert/hunger/fed
	name = "Fed"
	desc = "You feel moderately satisfied, but a bit more food may not hurt."
	icon_state = "fed"

/obj/screen/alert/hunger/hungry
	name = "Hungry"
	desc = "Some food would be good right about now."
	icon_state = "hungry"

/obj/screen/alert/hunger/starving
	name = "Starving"
	desc = "You're severely malnourished. The hunger pains make moving around a chore."
	icon_state = "starving"

/// Machine "hunger"
/obj/screen/alert/hunger/fat/machine
	name = "Over Charged"
	desc = "Your cell has excessive charge due to electrical shocks. Run around the station and spend some energy."

/obj/screen/alert/hunger/full/machine
	name = "Full Charge"
	desc = "Your cell is at full charge. Might want to give APCs some space."

/obj/screen/alert/hunger/well_fed/machine
	name = "High Charge"
	desc = "You're almost all charged, but could top up a bit more."

/obj/screen/alert/hunger/fed/machine
	name = "Half Charge"
	desc = "You feel moderately charged, but a bit more juice couldn't hurt."

/obj/screen/alert/hunger/hungry/machine
	name = "Low Charge"
	desc = "Could use a little charging right about now."

/obj/screen/alert/hunger/starving/machine
	name = "Nearly Discharged"
	desc = "You're almost drained. The low power makes moving around a chore."

// End of Machine "hunger"
/obj/screen/alert/hot
	name = "Too Hot"
	desc = "You're flaming hot! Get somewhere cooler and take off any insulating clothing like a fire suit."
	icon_state = "hot"

/obj/screen/alert/hot/robot
	desc = "The air around you is too hot for a humanoid. Be careful to avoid exposing them to this environment."

/obj/screen/alert/cold
	name = "Too Cold"
	desc = "You're freezing cold! Get somewhere warmer and take off any insulating clothing like a space suit."
	icon_state = "cold"

/obj/screen/alert/cold/drask
	name = "Cold"
	desc = "You're breathing supercooled gas! It's stimulating your metabolism to regenerate damaged tissue."

/obj/screen/alert/cold/robot
	desc = "The air around you is too cold for a humanoid. Be careful to avoid exposing them to this environment."

/obj/screen/alert/lowpressure
	name = "Low Pressure"
	desc = "The air around you is hazardously thin. A space suit would protect you."
	icon_state = "lowpressure"

/obj/screen/alert/highpressure
	name = "High Pressure"
	desc = "The air around you is hazardously thick. A fire suit would protect you."
	icon_state = "highpressure"

/obj/screen/alert/lightexposure
	name = "Light Exposure"
	desc = "You're exposed to light."
	icon_state = "lightexposure"

/obj/screen/alert/nolight
	name = "No Light"
	desc = "You're not exposed to any light."
	icon_state = "nolight"

/obj/screen/alert/blind
	name = "Blind"
	desc = "You can't see! This may be caused by a genetic defect, eye trauma, being unconscious, \
or something covering your eyes."
	icon_state = "blind"

/obj/screen/alert/high
	name = "High"
	desc = "Whoa man, you're tripping balls! Careful you don't get addicted... if you aren't already."
	icon_state = "high"

/obj/screen/alert/drunk
	name = "Drunk"
	desc = "All that alcohol you've been drinking is impairing your speech, motor skills, and mental cognition."
	icon_state = "drunk"

/obj/screen/alert/embeddedobject
	name = "Embedded Object"
	desc = "Something got lodged into your flesh and is causing major bleeding. It might fall out with time, but surgery is the safest way. \
			If you're feeling frisky, click yourself in help intent to pull the object out."
	icon_state = "embeddedobject"

// /obj/screen/alert/embeddedobject/Click()
// 	if(isliving(usr) && ..())
// 		var/mob/living/carbon/human/M = usr
// 		return M.help_shake_act(M)

/obj/screen/alert/asleep
	name = "Asleep"
	desc = "You've fallen asleep. Wait a bit and you should wake up. Unless you don't, considering how helpless you are."
	icon_state = "asleep"

/obj/screen/alert/weightless
	name = "Weightless"
	desc = "Gravity has ceased affecting you, and you're floating around aimlessly. You'll need something large and heavy, like a \
wall or lattice, to push yourself off if you want to move. A jetpack would enable free range of motion. A pair of \
magboots would let you walk around normally on the floor. Barring those, you can throw things, use a fire extinguisher, \
or shoot a gun to move around via Newton's 3rd Law of Motion."
	icon_state = "weightless"

/obj/screen/alert/fire
	name = "On Fire"
	desc = "You're on fire. Stop, drop and roll to put the fire out or move to a vacuum area."
	icon_state = "fire"

/obj/screen/alert/fire/Click()
	if(isliving(usr) && ..())
		var/mob/living/L = usr
		return L.resist()

/obj/screen/alert/direction_lock
	name = "Direction Lock"
	desc = "You are facing only one direction, slowing your movement down. Click here to stop the direction lock."
	icon_state = "direction_lock"

/obj/screen/alert/direction_lock/Click()
	if(..())
		return usr.set_face_dir(null)

//SILICONS

/obj/screen/alert/nocell
	name = "Missing Power Cell"
	desc = "Unit has no power cell. No modules available until a power cell is reinstalled. Robotics may provide assistance."
	icon_state = "nocell"

/obj/screen/alert/emptycell
	name = "Out of Power"
	desc = "Unit's power cell has no charge remaining. No modules available until power cell is recharged. \
Recharging stations are available in robotics, the dormitory bathrooms, and the AI satellite."
	icon_state = "emptycell"

/obj/screen/alert/lowcell
	name = "Low Charge"
	desc = "Unit's power cell is running low. Recharging stations are available in robotics, the dormitory bathrooms, and the AI satellite."
	icon_state = "lowcell"

//Need to cover all use cases - emag, illegal upgrade module, malf AI hack, traitor cyborg
/obj/screen/alert/hacked
	name = "Hacked"
	desc = "Hazardous non-standard equipment detected. Please ensure any usage of this equipment is in line with unit's laws, if any."
	icon_state = "hacked"

/obj/screen/alert/locked
	name = "Locked Down"
	desc = "Unit has been remotely locked down. Usage of a Robotics Control Console like the one in the Research Director's \
office by your AI master or any qualified human may resolve this matter. Robotics may provide further assistance if necessary."
	icon_state = "locked"

/obj/screen/alert/newlaw
	name = "Law Update"
	desc = "Laws have potentially been uploaded to or removed from this unit. Please be aware of any changes \
so as to remain in compliance with the most up-to-date laws."
	icon_state = "newlaw"
	timeout = 300

//MECHS
/obj/screen/alert/low_mech_integrity
	name = "Mech Damaged"
	desc = "Mech integrity is low."
	icon_state = "low_mech_integrity"

/obj/screen/alert/mech_port_available
	name = "Connect to Port"
	desc = "Click here to connect to an air port and refill your oxygen!"
	icon_state = "mech_port"
	var/obj/machinery/atmospherics/portables_connector/target = null

/obj/screen/alert/mech_port_available/Destroy()
	target = null
	return ..()

/obj/screen/alert/mech_port_available/Click()
	if(!..())
		return
	if(!ismecha(usr.loc) || !target)
		return
	var/obj/mecha/M = usr.loc
	if(M.connect(target))
		to_chat(usr, SPAN_NOTICE("[M] connects to the port."))
	else
		to_chat(usr, SPAN_NOTICE("[M] failed to connect to the port."))

/obj/screen/alert/mech_port_disconnect
	name = "Disconnect from Port"
	desc = "Click here to disconnect from your air port."
	icon_state = "mech_port_x"

/obj/screen/alert/mech_port_disconnect/Click()
	if(!..())
		return
	if(!ismecha(usr.loc))
		return
	var/obj/mecha/M = usr.loc
	if(M.disconnect())
		to_chat(usr, SPAN_NOTICE("[M] disconnects from the port."))
	else
		to_chat(usr, SPAN_NOTICE("[M] is not connected to a port at the moment."))

/obj/screen/alert/mech_nocell
	name = "Missing Power Cell"
	desc = "Mech has no power cell."
	icon_state = "nocell"

/obj/screen/alert/mech_emptycell
	name = "Out of Power"
	desc = "Mech is out of power."
	icon_state = "emptycell"

/obj/screen/alert/mech_lowcell
	name = "Low Charge"
	desc = "Mech is running out of power."
	icon_state = "lowcell"

/obj/screen/alert/mech_maintenance
	name = "Maintenance Protocols"
	desc = "Maintenance protocols are currently in effect, most actions disabled."
	icon_state = "locked"

/obj/screen/alert/exit_passenger_compartment
	name = "Inside Passenger Compartment"
	desc = "You're currently in a passenger compartment, click the alert to leave!"
	icon_state = "buckled"

/obj/screen/alert/exit_passenger_compartment/Click()
	if(!..())
		return
	var/obj/item/mecha_parts/mecha_equipment/tool/passenger/M = usr.loc
	if(istype(M))
		M.go_out()

//GHOSTS
//TODO: expand this system to replace the pollCandidates/CheckAntagonist/"choose quickly"/etc Yes/No messages
// /obj/screen/alert/notify_cloning
// 	name = "Revival"
// 	desc = "Someone is trying to revive you. Re-enter your corpse if you want to be revived!"
// 	icon_state = "template"
// 	timeout = 300

// /obj/screen/alert/notify_cloning/Click()
// 	if(!..())
// 		return
// 	var/mob/dead/observer/G = usr
// 	G.reenter_corpse()

// /obj/screen/alert/ghost
// 	name = "Ghost"
// 	desc = "Would you like to ghost? You will be notified when your body is removed from the nest."
// 	icon_state = "template"
// 	timeout = 5 MINUTES // longer than any infection should be

// /obj/screen/alert/ghost/Initialize(mapload)
// 	. = ..()
// 	var/image/I = image('icons/mob/mob.dmi', icon_state = "ghost", layer = FLOAT_LAYER, dir = SOUTH)
// 	I.layer = FLOAT_LAYER
// 	I.plane = FLOAT_PLANE
// 	overlays += I

// /obj/screen/alert/ghost/Click()
// 	if(!..())
// 		return
// 	var/mob/living/carbon/human/infected_user = usr
// 	if(!istype(infected_user) || infected_user.stat == DEAD)
// 		infected_user.clear_alert("ghost_nest")
// 		return
// 	var/obj/item/clothing/mask/facehugger/hugger_mask = infected_user.wear_mask
// 	if(!istype(hugger_mask) || !(locate(/obj/item/organ/internal/body_egg/alien_embryo) in infected_user.internal_organs) || hugger_mask.sterile)
// 		infected_user.clear_alert("ghost_nest")
// 		return
// 	infected_user.ghostize(TRUE)

//OBJECT-BASED

/obj/screen/alert/restrained/buckled
	name = "Buckled"
	desc = "You've been buckled to something. Click the alert to unbuckle unless you're handcuffed."
	icon_state = "buckled"

/obj/screen/alert/restrained/handcuffed
	name = "Handcuffed"
	desc = "You're handcuffed and can't act. If anyone drags you, you won't be able to move. Click the alert to free yourself."

/obj/screen/alert/restrained/legcuffed
	name = "Legcuffed"
	desc = "You're legcuffed, which slows you down considerably. Click the alert to free yourself."

/obj/screen/alert/restrained/Click()
	if(!isliving(usr) || !..())
		return
	var/mob/living/L = usr
	return L.resist()

// PRIVATE = only edit, use, or override these if you're editing the system as a whole

// Re-render all alerts - also called in /datum/hud/show_hud() because it's needed there
/datum/hud/proc/reorganize_alerts(mob/viewmob)
	var/mob/screenmob = viewmob || mymob
	if(!screenmob.client)
		return
	var/list/alerts = mymob.alerts
	if(!alerts)
		return FALSE
	var/icon_pref
	// if(!hud_shown)
	// 	for(var/i in 1 to length(alerts))
	// 		screenmob.client.screen -= alerts[alerts[i]]
	// 	return TRUE
	for(var/i in 1 to length(alerts))
		var/obj/screen/alert/alert = alerts[alerts[i]]
		if(alert.icon_state == "template")
			if(!icon_pref)
				icon_pref = ui_style2icon(screenmob.client.prefs.UI_style)
			alert.icon = icon_pref
		switch(i)
			if(1)
				. = ui_alert1
			if(2)
				. = ui_alert2
			if(3)
				. = ui_alert3
			if(4)
				. = ui_alert4
			if(5)
				. = ui_alert5 // Right now there's 5 slots
			else
				. = ""
		alert.screen_loc = .
		screenmob.client.screen |= alert
	// if(!viewmob)
	// 	for(var/viewer in mymob.observers)
	// 		reorganize_alerts(viewer)
	return TRUE
