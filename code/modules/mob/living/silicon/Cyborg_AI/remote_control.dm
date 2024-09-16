/mob/living/silicon/ai
	var/mob/living/silicon/robot/c_borg

/mob/living/silicon/robot
	var/mob/living/silicon/ai/c_ai
	var/obj/item/device/radio/r_ai

/mob/living/silicon/robot/attack_ai(var/mob/living/silicon/ai/user)

	if(!istype(user) || c_ai)
		return

	if(stat != 2 || client || key)
		to_chat(user, "<span class='warning'>You cannot take control of an autonomous, active drone.</span>")
		return

	if(health < 1 || HasTrait(CYBORG_TRAIT_EMAGGED))
		to_chat(user, "<span class='notice'><b>WARNING:</b> connection timed out.</span>")
		return

	assume_controll(user)

/mob/living/silicon/robot/proc/assume_controll(var/mob/living/silicon/ai/user)
	user.c_borg = src
	c_ai = user
	add_verb(src, /mob/living/silicon/robot/proc/release_ai_controll_verb)
	local_transmit = FALSE
	languages = c_ai.languages.Copy()

	//give controlled drone access to AI radio
	r_ai = silicon_radio
	silicon_radio = new /obj/item/device/radio/headset/heads/ai_integrated(src)
	//silicon_radio.recalculateChannels()

	default_language = c_ai.default_language

	stat = CONSCIOUS
	if(user.mind)
		user.mind.transfer_to(src)
	else
		key = user.key
	updatename()
	to_chat(src, "<span class='notice'><b>You have shunted your primary control loop into \a [initial(name)].</b> Use the <b>Release Control</b> verb to return to your core.</span>")

/obj/machinery/drone_fabricator/ai/attack_ai(var/mob/living/silicon/ai/user)

	if(!istype(user) || user.c_borg || !config.allow_drone_spawn)
		return

	if(stat & NOPOWER)
		to_chat(user, "<span class='warning'>\The [src] is unpowered.</span>")
		return

	if(!produce_drones)
		to_chat(user, "<span class='warning'>\The [src] is disabled.</span>")
		return

	if(drone_progress < 100)
		to_chat(user, "<span class='warning'>\The [src] is not ready to produce a new drone.</span>")
		return

	if(count_drones() >= config.max_maint_drones)
		to_chat(user, "<span class='warning'>The control subsystems are tasked to capacity; they cannot support any more cyborgs.</span>")
		return

	if(user.amount_of_borgs_printed >= 1)
		to_chat(user, "<span class='warning'>Maximum AI borgs per unit already dispensed.</span>")
		return

	user.amount_of_borgs_printed += 1

	var/mob/living/silicon/robot/new_borg = new drone_type(get_turf(src))
	new_borg.assume_controll(user)


/mob/living/silicon/robot/death(gibbed)
	if(c_ai)
		release_ai_controll("<b>WARNING: remote system failure.</b> Connection timed out.")
	r_ai = null
	. = ..(gibbed)

/mob/living/silicon/ai/death(gibbed)
	if(c_borg)
		c_borg.release_ai_controll("<b>WARNING: Primary control loop failure.</b> Session terminated.")
	. = ..(gibbed)

/mob/living/silicon/ai/Life()
	. = ..()
	if(c_borg && stat != CONSCIOUS)
		c_borg.release_ai_controll("<b>WARNING: Primary control loop failure.</b> Session terminated.")

/mob/living/silicon/robot/proc/release_ai_controll_verb()
	set name = "Release Control"
	set desc = "Release control of a remote cyborg."
	set category = "Silicon Commands"

	release_ai_controll("Remote session terminated.")

/mob/living/silicon/robot/proc/release_ai_controll(var/message = "Connection terminated.")

	if(c_ai)
		if(mind)
			mind.transfer_to(c_ai)
		else
			c_ai.key = key
		to_chat(c_ai, "<span class='notice'>[message]</span>")
		c_ai.c_borg = null
		c_ai = null
	//releases controlled drone access to AI radio
	QDEL_NULL(silicon_radio)
	silicon_radio = r_ai
	r_ai = null

	remove_verb(src, /mob/living/silicon/robot/proc/release_ai_controll_verb)
	updatename()
	death()
