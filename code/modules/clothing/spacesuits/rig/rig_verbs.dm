/obj/item/rig/proc/rig_verb_giveith()
	add_verb(wearer, rig_verbs)

/obj/item/rig/proc/rig_verb_takeith()
	remove_verb(wearer, rig_verbs)

// Interface for humans.
/mob/living/carbon/human/rig/verb/hardsuit_interface()

	set name = "Open Hardsuit Interface"
	set desc = "Open the hardsuit system interface."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back
		wearing_rig.ui_interact(user)

/mob/living/carbon/human/rig/verb/toggle_vision()

	set name = "Toggle Visor"
	set desc = "Turns your rig visor off or on."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_power_cost(user))
			return

		if(wearing_rig.canremove)
			to_chat(usr, SPAN_WARNING("The suit is not active."))
			return

		if(!wearing_rig.check_suit_access(user))
			return

		if(!wearing_rig.visor)
			to_chat(usr, SPAN_WARNING("The hardsuit does not have a configurable visor."))
			return

		if(!wearing_rig.visor.active)
			wearing_rig.visor.activate()
		else
			wearing_rig.visor.deactivate()

/mob/living/carbon/human/rig/verb/toggle_helmet()

	set name = "Toggle Helmet"
	set desc = "Deploys or retracts your helmet."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		// This is not great code, but the previous method made Linter-chan cry, and what I thought to do instead, replace the chest piece by a voidsuit, felt really weird.
		// This is way smaller, more efficient, less loophole-y, and don't give me that weird feeling. -R4d6
		if(istype(wearing_rig, /obj/item/rig/ameridian_knight) && !wearing_rig.active)
			to_chat(user, SPAN_WARNING("The helmet require the rig to be active."))
			return

		if(!wearing_rig.check_suit_access(user))
			return

		wearing_rig.toggle_piece("helmet",user)

/mob/living/carbon/human/rig/verb/toggle_chest()

	set name = "Toggle Chestpiece"
	set desc = "Deploys or retracts your chestpiece."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back


		if(!wearing_rig.check_suit_access(user))
			return

		wearing_rig.toggle_piece("chest",user)

/mob/living/carbon/human/rig/verb/toggle_gauntlets()

	set name = "Toggle Gauntlets"
	set desc = "Deploys or retracts your gauntlets."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_suit_access(user))
			return

		wearing_rig.toggle_piece("gauntlets",user)

/mob/living/carbon/human/rig/verb/toggle_boots()

	set name = "Toggle Boots"
	set desc = "Deploys or retracts your boots."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_suit_access(user))
			return

		wearing_rig.toggle_piece("boots",user)

/mob/living/carbon/human/rig/verb/deploy_suit()

	set name = "Deploy Hardsuit"
	set desc = "Deploys helmet, gloves and boots."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_suit_access(user))
			return

		if(!wearing_rig.check_power_cost(user))
			return

		wearing_rig.deploy(user)

/mob/living/carbon/human/rig/verb/deploynt_suit()

	set name = "Retract Hardsuit"
	set desc = "Retract helmet, gloves and boots."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_suit_access(user))
			return

		if(!wearing_rig.check_power_cost(user))
			return

		wearing_rig.retract(user)

/mob/living/carbon/human/rig/verb/toggle_seals_verb()

	set name = "Toggle Hardsuit"
	set desc = "Activates or deactivates your rig."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(!wearing_rig.check_suit_access(user))
			return

		wearing_rig.toggle_seals(user)

/mob/living/carbon/human/rig/verb/switch_vision_mode()

	set name = "Switch Vision Mode"
	set desc = "Switches between available vision modes."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(!wearing_rig.check_power_cost(user, 0, 0, 0, 0))
			return

		if(wearing_rig.canremove)
			to_chat(user, SPAN_WARNING("The suit is not active."))
			return

		if(!wearing_rig.visor)
			to_chat(user, SPAN_WARNING("The hardsuit does not have a configurable visor."))
			return

		if(!wearing_rig.visor.active)
			wearing_rig.visor.activate()

		if(!wearing_rig.visor.active)
			to_chat(user, SPAN_WARNING("The visor is suffering a hardware fault and cannot be configured."))
			return

		wearing_rig.visor.engage()

/mob/living/carbon/human/rig/verb/alter_voice()

	set name = "Configure Voice Synthesiser"
	set desc = "Toggles or configures your voice synthesizer."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(wearing_rig.canremove)
			to_chat(user, SPAN_WARNING("The suit is not active."))
			return

		if(!wearing_rig.speech)
			to_chat(user, SPAN_WARNING("The hardsuit does not have a speech synthesiser."))
			return

		wearing_rig.speech.engage()

/mob/living/carbon/human/rig/verb/select_module()

	set name = "Select Module"
	set desc = "Selects a module as your primary system."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(!wearing_rig.check_power_cost(user, 0, 0, 0, 0))
			return

		if(wearing_rig.canremove)
			to_chat(usr, SPAN_WARNING("The suit is not active."))
			return

		var/list/selectable = list()
		for(var/obj/item/rig_module/module in wearing_rig.installed_modules)
			if(module.selectable)
				selectable |= module

		var/obj/item/rig_module/module = input("Which module do you wish to select?") as null|anything in selectable

		if(!istype(module))
			wearing_rig.selected_module = null
			to_chat(user, "<font color='blue'><b>Primary system is now: deselected.</b></font>")
			return

		wearing_rig.selected_module = module
		to_chat(user, "<font color='blue'><b>Primary system is now: [wearing_rig.selected_module.interface_name].</b></font>")

/mob/living/carbon/human/rig/verb/toggle_module()

	set name = "Toggle Module"
	set desc = "Toggle a system module."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(!wearing_rig.check_power_cost(user, 0, 0, 0, 0))
			return

		if(wearing_rig.canremove)
			to_chat(user, SPAN_WARNING("The suit is not active."))
			return

		var/list/selectable = list()
		for(var/obj/item/rig_module/module in wearing_rig.installed_modules)
			if(module.toggleable)
				selectable |= module

		var/obj/item/rig_module/module = input("Which module do you wish to toggle?") as null|anything in selectable

		if(!istype(module))
			return

		if(module.active)
			to_chat(user, "<font color='blue'><b>You attempt to deactivate \the [module.interface_name].</b></font>")
			module.deactivate()
		else
			to_chat(user, "<font color='blue'><b>You attempt to activate \the [module.interface_name].</b></font>")
			module.activate()

/mob/living/carbon/human/rig/verb/engage_module()

	set name = "Engage Module"
	set desc = "Engages a system module."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(wearing_rig.canremove)
			to_chat(user, SPAN_WARNING("The suit is not active."))
			return

		if(!wearing_rig.check_power_cost(user, 0, 0, 0, 0))
			return

		var/list/selectable = list()
		for(var/obj/item/rig_module/module in wearing_rig.installed_modules)
			if(module.usable)
				selectable |= module

		var/obj/item/rig_module/module = input("Which module do you wish to engage?") as null|anything in selectable

		if(!istype(module))
			return

		to_chat(user, "<font color='blue'><b>You attempt to engage the [module.interface_name].</b></font>")
		module.engage()

/mob/living/carbon/human/rig/verb/injector_fast_change()

	set name = "Adjust Modular Injectors"
	set desc = "Change the amount of units a modular injector will inject."
	set category = "Hardsuit"
	var/mob/living/carbon/human/user = src

	if(istype(user.back, /obj/item/rig))
		var/obj/item/rig/wearing_rig = user.back

		if(wearing_rig.malfunction_check(user))
			return

		if(wearing_rig.canremove)
			to_chat(user, SPAN_WARNING("The suit is not active."))
			return

		if(!wearing_rig.check_power_cost(user, 0, 0, 0, 0))
			return

		if(!wearing_rig.selected_module)
			to_chat(user, SPAN_WARNING("No selected module!"))
			return

		if(istype(wearing_rig.selected_module, /obj/item/rig_module/modular_injector))
			var/obj/item/rig_module/modular_injector/module = wearing_rig.selected_module
			var/mob/M = user
			to_chat(user, "<font color='blue'><b>You attempt to engage the [module.interface_name].</b></font>")
			module.quick_change(M)
			return
		else
			to_chat(user, SPAN_WARNING("The actively selected module is not a modular injector!"))
		return
