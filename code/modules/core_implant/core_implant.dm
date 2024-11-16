/obj/item/implant/core_implant
	name = "core implant"
	icon = 'icons/obj/device.dmi'
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 9, TECH_BIO = 9, TECH_DATA = 9, TECH_ENGINEERING = 12, TECH_COMBAT = 8, TECH_BLUESPACE  = 7, TECH_PLASMA = 6)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_GOLD = 4, MATERIAL_SILVER = 4, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 3, MATERIAL_URANIUM = 5, MATERIAL_GLASS = 1, MATERIAL_BIOMATTER = 3, MATERIAL_DIAMOND = 10)
	external = TRUE
	var/implant_type = /obj/item/implant/core_implant
	var/active = FALSE
	var/activated = FALSE			//true, if cruciform was activated once

	var/security_clearance = CLEARANCE_NONE
	var/address = null
	var/power = 0
	var/max_power = 0
	var/power_regen = 0.5
	var/success_modifier = 1
	var/list/known_rituals = list() //A list of names of rituals which are recorded in this cruciform
	//These are used to retrieve the actual ritual datums from the global all_rituals list

	var/list/modules = list()
	var/list/upgrades = list()

	var/list/access = list()	// Core implant can grant access levels to its user
	var/path = ""


/obj/item/implant/core_implant/Destroy()
	STOP_PROCESSING(SSobj, src)
	deactivate()
	. = ..()

/obj/item/implant/core_implant/uninstall()
	if(active)
		hard_eject()
		deactivate()
	..()

/obj/item/implant/core_implant/activate()
	if(!wearer || active)
		return
	active = TRUE
	activated = TRUE
	add_ritual_verbs()
	update_rituals()
	START_PROCESSING(SSobj, src)
	add_hearing()

/obj/item/implant/core_implant/deactivate()
	if(!active)
		return
	remove_hearing()
	active = FALSE
	remove_ritual_verbs()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/core_implant/proc/update_rituals()
	known_rituals = list()
	for(var/datum/core_module/rituals/M in modules)
		if(istype(src,M.implant_type))
			for(var/R in M.module_rituals)
				known_rituals |= R

/obj/item/implant/core_implant/proc/add_ritual_verbs()
	if(!wearer || !active)
		return

	for(var/r in known_rituals)
		if(ispath(r,/datum/ritual/mind))
			var/datum/ritual/mind/m = r
			add_verb(wearer, initial(m.activator_verb))

/obj/item/implant/core_implant/proc/remove_ritual_verbs()
	if(!wearer || !active)
		return

	for(var/r in known_rituals)
		if(ispath(r,/datum/ritual/mind))
			var/datum/ritual/mind/m = r
			remove_verb(wearer, initial(m.activator_verb))

/obj/item/implant/core_implant/malfunction()
	hard_eject()

/obj/item/implant/core_implant/proc/hard_eject()
	return

/obj/item/implant/core_implant/proc/update_address()
	if(!loc)
		address = null
		return

	if(wearer)
		address = wearer.real_name
		return

	var/area/A = get_area(src)
	if(istype(loc, /obj/machinery/neotheology))
		address = "[loc.name] in [strip_improper(A.name)]"
		return

	address = null

/obj/item/implant/core_implant/GetAccess()
	if(!activated) // A brand new implant can't be used as an access card, but one pulled from a corpse can.
		return list()

	var/list/L = access.Copy()
	for(var/m in modules)
		var/datum/core_module/M = m
		L |= M.GetAccess()
	return L

/obj/item/implant/core_implant/hear_talk(mob/living/carbon/human/H, message, verb, datum/language/speaking, speech_volume, message_pre_problems)
	var/group_ritual_leader = FALSE
	for(var/datum/core_module/group_ritual/GR in src.modules)
		GR.hear(H, message)
		group_ritual_leader = TRUE

	if(wearer != H)
		if(H.get_core_implant() && !group_ritual_leader)
			addtimer(CALLBACK(src, PROC_REF(hear_other), H, message), 0) // let H's own implant hear first
	else
		for(var/RT in known_rituals)
			var/datum/ritual/R = GLOB.all_rituals[RT]
			var/ture_message = message
			if(R.ignore_stuttering)
				ture_message = message_pre_problems
			if(R.compare(ture_message))
				if(R.power > src.power && !(power >= max_power))
					to_chat(H, SPAN_DANGER("Not enough energy for the [R.name]."))
					return
				if(!R.is_allowed(src))
					to_chat(H, SPAN_DANGER("You are not allowed to perform [R.name]."))
					return
				R.activate(H, src, R.get_targets(ture_message))
				return

/obj/item/implant/core_implant/proc/hear_other(mob/living/carbon/human/H, message)
	var/datum/core_module/group_ritual/GR = H.get_core_implant().get_module(/datum/core_module/group_ritual)
	if(GR?.ritual.name in known_rituals)
		if(message == GR.phrases[1])
			if(do_after(wearer, length(message)*0.25))
				if(GR)
					GR.ritual.set_personal_cooldown(wearer)
				wearer.say(message)


/obj/item/implant/core_implant/proc/use_power(var/value)
	power -= value

/obj/item/implant/core_implant/proc/restore_power(var/value)
	power = min(max_power, power + value)

/obj/item/implant/core_implant/Process()
	if(!active)
		return
	if((!wearer || loc != wearer) && active)
		remove_hearing()
		active = FALSE
		STOP_PROCESSING(SSobj, src)
	restore_power(power_regen)

/obj/item/implant/core_implant/proc/get_module(var/m_type)
	if(!ispath(m_type))
		return
	for(var/datum/core_module/CM in modules)
		if(istype(CM,m_type))
			return CM
	process_modules()

/obj/item/implant/core_implant/proc/add_module(var/datum/core_module/CM)
	if(!istype(src,CM.implant_type))
		return FALSE

	if(!CM.can_install(src))
		return FALSE

	if(CM.unique)
		for(var/datum/core_module/EM in modules)
			if(EM.type == CM.type)
				return FALSE

	CM.implant = src
	CM.set_up()
	CM.install_time = world.time
	CM.preinstall()
	modules.Add(CM)
	CM.install()
	return TRUE

/obj/item/implant/core_implant/proc/remove_module(var/datum/core_module/CM)
	if(istype(CM) && CM.implant == src)
		CM.uninstall()
		modules.Remove(CM)
		CM.implant = null
		qdel(CM)

/obj/item/implant/core_implant/proc/remove_modules(var/m_type)
	if(!ispath(m_type))
		return
	for(var/datum/core_module/CM in modules)
		if(istype(CM,m_type))
			remove_module(CM)

/obj/item/implant/core_implant/proc/install_default_modules_by_job(datum/job/J)
	for(var/module_type in J.core_upgrades)
		add_module(new module_type)

/obj/item/implant/core_implant/proc/install_default_modules_by_path(/obj/item/implant/core_implant/cruciform)
	if(path == "tess")
		add_module(new CRUCIFORM_TESS)
	else if(path == "lemn")
		add_module(new CRUCIFORM_LEMN)
	else if(path == "mono")
		add_module(new CRUCIFORM_MONO)
	else if(path == "divi")
		add_module(new CRUCIFORM_DIVI)
	else if(path == "fact")
		add_module(new CRUCIFORM_FACT)
	else if(path == "omni")
		add_module(new CRUCIFORM_OMNI)

/obj/item/implant/core_implant/proc/process_modules()
	for(var/datum/core_module/CM in modules)
		if(CM.time > 0 && CM.install_time + CM.time <= world.time)
			CM.uninstall()

/obj/item/implant/core_implant/proc/get_rituals()
	return known_rituals
