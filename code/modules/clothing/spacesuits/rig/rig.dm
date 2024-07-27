#define ONLY_DEPLOY 1
#define ONLY_RETRACT 2
#define SEAL_DELAY 25


#define RIG_SECURITY 1
#define RIG_AI_OVERRIDE 2
#define RIG_SYSTEM_CONTROL 4
#define RIG_INTERFACE_LOCK 8
#define RIG_INTERFACE_SHOCK 16
/*
 * Defines the behavior of hardsuits/rigs/power armour.
 */

/obj/item/rig
	name = "hardsuit control module"
	icon = 'icons/obj/rig_modules.dmi'
	desc = "A back-mounted hardsuit deployment and control mechanism."
	slot_flags = SLOT_BACK
	req_one_access = null
	req_access = null
	w_class = ITEM_SIZE_BULKY
	item_flags = DRAG_AND_DROP_UNEQUIP|EQUIP_SOUNDS
	price_tag = 1500

	// These values are passed on to all component pieces.
	armor = list(
		melee = 7,
		bullet = 5,
		energy = 5,
		bomb = 25,
		bio = 100,
		rad = 50
	)
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.1
	permeability_coefficient = 0.1
	unacidable = 1
	slowdown = 0
	stiffness = LIGHT_STIFFNESS
	obscuration = LIGHT_OBSCURATION
	var/ablative_armor = 0
	var/ablative_max = 0
	var/ablation = ABLATION_SOFT
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1
	blacklist_upgrades = list(
							/obj/item/tool_upgrade/augment = TRUE,
							/obj/item/tool_upgrade/refinement = TRUE,
							/obj/item/gun_upgrade = TRUE, // No tacticool rigs
							/obj/item/tool_upgrade/artwork_tool_mod = TRUE)
	var/interface_path = "RIGSuit"
	var/ai_interface_path = "RIGSuit"
	var/interface_title = "Hardsuit Controller"
	var/wearer_move_delay //Used for AI moving.
	var/ai_controlled_move_delay = 10
	var/aimove_power_usage = 200							  // Power usage per tile traveled when suit is moved by AI in IIS. In joules.
	var/drain = 1											  // Power drained per tick when the suit is sealed. In 10 joule steps.


	// Keeps track of what this rig should spawn with.
	var/suit_type = "hardsuit"
	var/list/initial_modules = list()
	var/chest_type = /obj/item/clothing/suit/space/rig
	var/helm_type =  /obj/item/clothing/head/helmet/space/rig
	var/boot_type =  /obj/item/clothing/shoes/magboots/rig
	var/glove_type = /obj/item/clothing/gloves/rig
	var/cell_type =  /obj/item/cell/large/high
	var/air_type =   /obj/item/tank/oxygen

	//Component/device holders.
	var/obj/item/tank/air_supply								// Air tank, if any.
	var/obj/item/clothing/shoes/boots = null					// Deployable boots, if any.
	var/obj/item/clothing/suit/space/rig/chest					// Deployable chestpiece, if any.
	var/obj/item/clothing/head/helmet/space/rig/helmet = null	// Deployable helmet, if any.
	var/obj/item/clothing/gloves/rig/gloves = null				// Deployable gauntlets, if any.
	cell = null								// Power supply, if any.
	var/removable_cell = TRUE // Can you remove the cell?
	var/obj/item/rig_module/selected_module = null				// Primary system (used with middle-click)
	var/obj/item/rig_module/vision/visor						// Kinda shitty to have a var for a module, but saves time.
	var/obj/item/rig_module/voice/speech						// As above.
	var/obj/item/rig_module/storage/storage						// var for installed storage module, if any
	var/mob/living/carbon/human/wearer							// The person currently wearing the rig.
	var/image/mob_icon											// Holder for on-mob icon.
	var/list/installed_modules = list()							// Power consumption/use bookkeeping.

	suitable_cell = /obj/item/cell/large

	// Rig status vars.
	var/active = FALSE
	var/open = 0                                              // Access panel status.
	var/locked = 1 // Lock status. 0 = unlocked, 1 = locked with ID, -1 = broken lock, permanantly unlocked
	var/subverted = 0
	var/interface_locked = 0
	var/control_overridden = 0
	var/ai_override_enabled = 0
	var/security_check_enabled = 1
	var/malfunctioning = 0
	var/malfunction_delay = 0
	var/electrified = 0
	var/locked_down = 0

	var/seal_delay = SEAL_DELAY
	var/sealing                                               // Keeps track of seal status independantly of canremove.
	var/offline = 1                                           // Should we be applying suit maluses?
	var/offline_slowdown = 3                                  // If the suit is deployed and unpowered, it sets slowdown to this.
	var/vision_restriction
	var/offline_vision_restriction = 1                        // 0 - none, 1 - welder vision, 2 - blind. Maybe move this to helmets.
	var/airtight = 1 //If set, will adjust AIRTIGHT and STOPPRESSUREDAMAGE flags on components. Otherwise it should leave them untouched.

	var/emp_protection = 0
	// 2022- Just so everyone knows , this doesn't get checked at all down the line. It only checks if its on the back , regardles of its value.
	var/rig_wear_slot = slot_back //Changing this allows for rigs that are worn as a belt or a tie or something

	// Wiring! How exciting.
	var/datum/wires/rig/wires
	var/datum/effect/effect/system/spark_spread/spark_system


	//Stuff rigs can store
	//allowed = list(/obj/item/storage/backpack) // nope
	var/list/extra_allowed = list()
	var/rig_verbs = list(
	/mob/living/carbon/human/rig/verb/hardsuit_interface,
	/mob/living/carbon/human/rig/verb/toggle_vision,
	/mob/living/carbon/human/rig/verb/deploy_suit,
	/mob/living/carbon/human/rig/verb/deploynt_suit,
	/mob/living/carbon/human/rig/verb/toggle_seals_verb,
	/mob/living/carbon/human/rig/verb/switch_vision_mode,
	/mob/living/carbon/human/rig/verb/alter_voice,
	/mob/living/carbon/human/rig/verb/select_module,
	/mob/living/carbon/human/rig/verb/toggle_module,
	/mob/living/carbon/human/rig/verb/engage_module,
	/mob/living/carbon/human/rig/verb/injector_fast_change
	)

/obj/item/rig/New()
	..()
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "[initial(icon_state)]")

/obj/item/rig/proc/getCurrentGlasses()
	if(wearer && visor && visor && visor.vision && visor.vision.glasses && (!helmet || (wearer.head && helmet == wearer.head)))
		return visor.vision.glasses

/obj/item/rig/examine()
	..()
	if(wearer)
		for(var/obj/item/piece in list(helmet,gloves,chest,boots))
			if(!piece || piece.loc != wearer)
				continue
			to_chat(usr, "\icon[piece] \The [piece] [piece.gender == PLURAL ? "are" : "is"] deployed.")

	if(src.loc == usr)
		to_chat(usr, "The maintenance panel is [open ? "open" : "closed"].")
		to_chat(usr, "Hardsuit systems are [offline ? "<font color='red'>offline</font>" : "<font color='green'>online</font>"].")

	if(ablative_max) // If ablative armor is replaced with a module system, this should be called as a proc on the module
		var/ablative_ratio = ablative_armor / ablative_max
		switch(ablative_ratio)
			if(1) // First we get this over with
				to_chat(usr, "The armor system reports pristine condition.")
			if(-INFINITY to 0.1)
				to_chat(usr, "The armor system reports system error. Repairs mandatory.")
			if(0.1 to 0.5)
				to_chat(usr, "The armor system reports critical failure! Repairs mandatory.")
			if(0.5 to 0.8)
				to_chat(usr, "The armor system reports heavy damage. Repairs required.")
			if(0.8 to 0.99)
				to_chat(usr, "The armor system reports insignificant damage. Repairs advised.")

/obj/item/rig/Initialize()
	. = ..()

	item_state = icon_state
	wires = new(src)

	//Add on any extra items allowed into suit storage
	if(LAZYLEN(extra_allowed))
		LAZYOR(allowed, extra_allowed)

	if(!LAZYLEN(req_access) && !LAZYLEN(req_one_access))
		locked = FALSE

	spark_system = new()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	START_PROCESSING(SSobj, src)



	// Create and initialize our various segments.
	if(cell_type)
		cell = new cell_type(src)
	if(air_type)
		air_supply = new air_type(src)
	if(glove_type)
		gloves = new glove_type(src)
		rig_verbs |= /mob/living/carbon/human/rig/verb/toggle_gauntlets
	if(helm_type)
		helmet = new helm_type(src)
		rig_verbs |= /mob/living/carbon/human/rig/verb/toggle_helmet
		helmet.obscuration = obscuration
	if(boot_type)
		boots = new boot_type(src)
		rig_verbs |= /mob/living/carbon/human/rig/verb/toggle_boots
	if(chest_type)
		chest = new chest_type(src)
		chest.equip_delay = 0
		if(allowed)
			LAZYOR(chest.allowed, allowed)
		chest.slowdown = offline_slowdown
		chest.stiffness = stiffness
		rig_verbs |= /mob/living/carbon/human/rig/verb/toggle_chest

	if(initial_modules && initial_modules.len)
		for(var/path in initial_modules)
			var/obj/item/rig_module/module = new path(src)
			install(module)

	for(var/obj/item/piece in list(gloves,helmet,boots,chest))
		if(!istype(piece))
			continue
		piece.canremove = 0
		piece.name = "[suit_type] [initial(piece.name)]"
		piece.desc = "It seems to be part of a [src.name]."
		piece.icon_state = "[initial(icon_state)]"
		piece.min_cold_protection_temperature = min_cold_protection_temperature
		piece.max_heat_protection_temperature = max_heat_protection_temperature
		if(piece.siemens_coefficient > siemens_coefficient) //So that insulated gloves keep their insulation.
			piece.siemens_coefficient = siemens_coefficient
		piece.permeability_coefficient = permeability_coefficient
		piece.unacidable = unacidable
		if(armor) piece.armor = armor

	ablative_armor = ablative_max
	update_icon(1)

/obj/item/rig/proc/updateArmor()
	for(var/obj/item/piece in list(gloves,helmet,boots,chest))
		if(!istype(piece))
			continue
		if(armor_list)
			piece.armor = armor

/obj/item/rig/Destroy()
	for(var/obj/item/piece in list(gloves,boots,helmet,chest))
		QDEL_NULL(piece)
	for(var/a in installed_modules)
		uninstall(a)
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(wires)
	QDEL_NULL(spark_system)
	return ..()

/obj/item/rig/proc/suit_is_deployed()
	if(!istype(wearer) || src.loc != wearer || wearer.back != src)
		return FALSE
	if(helm_type && !(helmet && wearer.head == helmet))
		return FALSE
	if(glove_type && !(gloves && wearer.gloves == gloves))
		return FALSE
	if(boot_type && !(boots && wearer.shoes == boots))
		return FALSE
	if(chest_type && !(chest && wearer.wear_suit == chest))
		return FALSE
	return TRUE

/obj/item/rig/proc/reset()
	offline = 2
	canremove = 1
	active = FALSE
	for(var/obj/item/piece in list(helmet,boots,gloves,chest))
		if(!piece) continue
		piece.icon_state = "[initial(icon_state)]"
		if(airtight)
			piece.item_flags &= ~(STOPPRESSUREDAMAGE|AIRTIGHT)
	update_icon(1)

/obj/item/rig/proc/toggle_seals(mob/initiator,instant)

	updateArmor()
	if(sealing) return

	// Seal toggling can be initiated by the suit AI, too
	if(!wearer)
		to_chat(initiator, SPAN_DANGER("Cannot toggle suit: The suit is currently not being worn by anyone."))
		return FALSE
	if(!offline && !cell) //incase we remove the cell while the suit is locked into place
		if(!check_power_cost(wearer))
			return FALSE



	var/seal_target = !active

	//Only force deploy when we're turning it on, not when removing it
	if (seal_target)
		deploy(wearer,instant)

	var/failed_to_seal

	canremove = 0 // No removing the suit while unsealing.
	sealing = 1

	if(seal_target && !suit_is_deployed())
		wearer.visible_message(SPAN_DANGER("[wearer]'s suit flashes an error light."),SPAN_DANGER("Your suit flashes an error light. It can't function properly without being fully deployed."))
		failed_to_seal = 1

	if(!failed_to_seal)

		if(!instant)
			wearer.visible_message("<font color='blue'>[wearer]'s suit emits a quiet hum as it begins to adjust its seals.</font>","<font color='blue'>With a quiet hum, the suit begins running checks and adjusting components.</font>")
			if(seal_delay && !do_after(wearer,seal_delay, src))
				if(wearer) to_chat(wearer, SPAN_WARNING("You must remain still while the suit is adjusting the components."))
				failed_to_seal = 1

		if(!wearer)
			failed_to_seal = 1
		else
			for(var/list/piece_data in list(list(wearer.shoes,boots,"boots",boot_type),list(wearer.gloves,gloves,"gloves",glove_type),list(wearer.head,helmet,"helmet",helm_type),list(wearer.wear_suit,chest,"chest",chest_type)))

				var/obj/item/piece = piece_data[1]
				var/obj/item/compare_piece = piece_data[2]
				var/msg_type = piece_data[3]
				var/piece_type = piece_data[4]

				if(!piece || !piece_type)
					continue

				if(!istype(wearer) || !istype(piece) || !istype(compare_piece) || !msg_type)
					if(wearer) to_chat(wearer, SPAN_WARNING("You must remain still while the suit is adjusting the components."))
					failed_to_seal = 1
					break

				if(!failed_to_seal && wearer.back == src && piece == compare_piece)

					if(seal_delay && !instant && !do_after(wearer,seal_delay,src,needhand=0))
						failed_to_seal = 1

					piece.icon_state = "[initial(icon_state)][seal_target ? "_sealed" : ""]"
					switch(msg_type)
						if("boots")
							to_chat(wearer, "<font color='blue'>\The [piece] [seal_target ? "seal around your feet" : "relax their grip on your legs"].</font>")
							wearer.update_inv_shoes()
						if("gloves")
							to_chat(wearer, "<font color='blue'>\The [piece] [seal_target ? "tighten around your fingers and wrists" : "become loose around your fingers"].</font>")
							wearer.update_inv_gloves()
						if("chest")
							to_chat(wearer, "<font color='blue'>\The [piece] [seal_target ? "cinches tight again your chest" : "releases your chest"].</font>")
							wearer.update_inv_wear_suit()
						if("helmet")
							to_chat(wearer, "<font color='blue'>\The [piece] hisses [seal_target ? "closed" : "open"].</font>")
							wearer.update_inv_head()
							if(helmet)
								helmet.update_light(wearer)

					//sealed pieces become airtight, protecting against diseases
					if (seal_target)
						piece.armor.bio = 100
					else
						piece.armor.bio = armor.bio

				else
					failed_to_seal = 1

		if((wearer && !(istype(wearer) && wearer.back == src)) || (seal_target && !suit_is_deployed()))
			failed_to_seal = 1

	sealing = null

	if(failed_to_seal)
		for(var/obj/item/piece in list(helmet,boots,gloves,chest))
			if(!piece) continue
			piece.icon_state = "[initial(icon_state)][seal_target ? "" : "_sealed"]"
		canremove = !active

		if(airtight)
			update_component_sealed()
		update_icon(1)
		return FALSE

	// Success!
	active = seal_target
	canremove = !active
	to_chat(wearer, "<font color='blue'><b>Your entire suit [active ? "tightens around you as the components lock into place" : "loosens as the components relax"].</b></font>")

	if(wearer != initiator)
		to_chat(initiator, "<font color='blue'>Suit adjustment complete. Suit is now [active ? "unsealed" : "sealed"].</font>")

	if(canremove)
		for(var/obj/item/rig_module/module in installed_modules)
			module.deactivate()
	if(airtight)
		update_component_sealed()
	update_icon(1)

/obj/item/rig/proc/update_component_sealed()
	for(var/obj/item/piece in list(helmet,boots,gloves,chest))
		if(canremove)
			piece.item_flags &= ~(STOPPRESSUREDAMAGE|AIRTIGHT)
		else
			piece.item_flags |=  (STOPPRESSUREDAMAGE|AIRTIGHT)
	update_icon(1)

/obj/item/rig/Process()

	// If we've lost any parts, grab them back.
	var/mob/living/M
	for(var/obj/item/piece in list(gloves,boots,helmet,chest))
		if(piece.loc != src && !(wearer && piece.loc == wearer))
			if(isliving(piece.loc))
				M = piece.loc
				M.drop_from_inventory(piece)
			piece.forceMove(src)

	if(active && cell) // drains power from the cell whenever the suit is sealed
		cell.use(drain*0.1)

	if(!istype(wearer) || loc != wearer || wearer.back != src || canremove || !cell || cell.charge <= 0)
		if(!cell || cell.charge <= 0)
			if(electrified > 0)
				electrified = 0
			if(!offline)
				if(istype(wearer))
					if(!canremove)
						if (offline_slowdown < 3)
							to_chat(wearer, SPAN_DANGER("Your suit beeps stridently, and suddenly goes dead."))
						else
							to_chat(wearer, SPAN_DANGER("Your suit beeps stridently, and suddenly you're wearing a leaden mass of metal and plastic composites instead of a powered suit."))
					if(offline_vision_restriction == 1)
						to_chat(wearer, SPAN_DANGER("The suit optics flicker and die, leaving you with restricted vision."))
					else if(offline_vision_restriction == 2)
						to_chat(wearer, SPAN_DANGER("The suit optics drop out completely, drowning you in darkness."))
		if(!offline)
			offline = 1
	else
		if(offline)
			offline = 0
			if(istype(wearer) && !wearer.wearing_rig)
				wearer.wearing_rig = src
			chest.slowdown = initial(slowdown)

	if(offline)
		if(offline == 1)
			for(var/obj/item/rig_module/module in installed_modules)
				module.deactivate()
			offline = 2
			chest.slowdown = offline_slowdown
		return

	if(cell && cell.charge > 0 && electrified > 0)
		electrified--

	if(malfunction_delay > 0)
		malfunction_delay--
	else if(malfunctioning)
		malfunctioning--
		malfunction()

	for(var/obj/item/rig_module/module in installed_modules)
		cell.use(module.Process()*10)

/obj/item/rig/proc/check_power_cost(mob/living/user, cost, use_unconcious, obj/item/rig_module/mod, user_is_ai)

	if(!istype(user))
		return FALSE

	var/fail_msg

	if(!user_is_ai)
		var/mob/living/carbon/human/H = user
		if(istype(H) && H.back != src)
			fail_msg = SPAN_WARNING("You must be wearing \the [src] to do this.")
		else if(user.incorporeal_move)
			fail_msg = SPAN_WARNING("You must be solid to do this.")
	if(sealing)
		fail_msg = SPAN_WARNING("The hardsuit is in the process of adjusting seals and cannot be activated.")
	else if(!fail_msg && ((use_unconcious && user.stat > 1) || (!use_unconcious && user.stat)))
		fail_msg = SPAN_WARNING("You are in no fit state to do that.")
	else if(!cell)
		fail_msg = SPAN_WARNING("There is no cell installed in the suit.")
	else if(cost && cell.charge < cost * 10) //TODO: Cellrate?
		fail_msg = SPAN_WARNING("Not enough stored power.")

	if(fail_msg)
		to_chat(user, fail_msg)
		return FALSE

	// This is largely for cancelling stealth and whatever.
	if(mod && mod.disruptive)
		for(var/obj/item/rig_module/module in (installed_modules - mod))
			if(module.active && module.disruptable)
				module.deactivate()

	cell.use(cost*10)
	return TRUE

/obj/item/rig/update_icon(update_mob_icon)

	cut_overlays()
	if(!mob_icon || update_mob_icon)
		var/species_icon = 'icons/mob/rig_back.dmi'
		// Since setting mob_icon will override the species checks in
		// update_inv_wear_suit(), handle species checks here.
		mob_icon = image("icon" = species_icon, "icon_state" = icon_state)

	if(installed_modules.len)
		for(var/obj/item/rig_module/module in installed_modules)
			if(module.suit_overlay)
				chest.add_overlay(image("icon" = 'icons/mob/rig_modules.dmi', "icon_state" = module.suit_overlay, "dir" = SOUTH))

	if(wearer)
		wearer.update_inv_shoes()
		wearer.update_inv_gloves()
		wearer.update_inv_head()
		wearer.update_inv_wear_suit()
		wearer.update_inv_back()
	return

/obj/item/rig/proc/check_suit_access(mob/living/carbon/human/user)

	if(!security_check_enabled)
		return TRUE

	if(istype(user))
		if(malfunction_check(user))
			return FALSE
		if(user.back != src)
			return FALSE
		else if(!src.allowed(user))
			to_chat(user, SPAN_DANGER("Unauthorized user. Access denied."))
			return FALSE

	else if(!ai_override_enabled)
		to_chat(user, SPAN_DANGER("Synthetic access disabled. Please consult hardware provider."))
		return FALSE

	return TRUE

/obj/item/rig/proc/notify_ai(var/message)
	for(var/obj/item/rig_module/ai_container/module in installed_modules)
		if(module.integrated_ai && module.integrated_ai.client && !module.integrated_ai.stat)
			to_chat(module.integrated_ai, "[message]")
			. = 1

//Delayed equipping of rigs
/obj/item/rig/pre_equip(mob/user, slot)
	if (active)
		//Can't take it off while it's engaged
		return TRUE

	if (slot == rig_wear_slot)
		if(seal_delay > 0)
			user.visible_message(
				SPAN_NOTICE("[user] starts putting on \the [src]..."),
				SPAN_NOTICE("You start putting on \the [src]...")
			)
			if(!do_after(user,seal_delay,src))
				return TRUE //A nonzero return value will cause the equipping operation to fail
	//Delayed unequipping too
	else if (is_worn())
		retract()
		if(seal_delay > 0)
			user.visible_message(
				SPAN_NOTICE("[user] starts taking off \the [src]..."),
				SPAN_NOTICE("You start taking off \the [src]...")
			)
			if(!do_after(user,seal_delay,src))
				return TRUE //A nonzero return value will cause the equipping operation to fail


/obj/item/rig/equipped(mob/user, slot)
	..()
	if (slot == rig_wear_slot)
		user.visible_message(
			SPAN_NOTICE("<b>[user] struggles into \the [src].</b>"),
			SPAN_NOTICE("<b>You struggle into \the [src].</b>")
		)
		wearer = user
		wearer.wearing_rig = src
		update_icon()
		rig_verb_giveith()

/obj/item/rig/proc/toggle_piece(piece, mob/initiator, deploy_mode, forced = FALSE)

	if(sealing)
		return

	if((!cell || !cell.charge) && !forced)
		if(do_after(usr,10,src))
			to_chat(wearer, "<font color='blue'><b>You manually set [piece] into place.</b></font>")
		else
			to_chat(wearer, SPAN_DANGER("You must stand still to manually set your suit!"))
			return

	if(!istype(wearer) || !wearer.back == src)
		return

	if(initiator == wearer && (usr && (usr.stat||usr.paralysis||usr.stunned))) // If the initiator isn't wearing the suit it's probably an AI.
		return

	var/obj/item/check_slot
	var/equip_to
	var/obj/item/clothing/use_obj

	if(!wearer)
		return

	switch(piece)
		if("helmet")
			equip_to = slot_head
			use_obj = helmet
			check_slot = wearer.head
		if("gauntlets")
			equip_to = slot_gloves
			use_obj = gloves
			check_slot = wearer.gloves
		if("boots")
			equip_to = slot_shoes
			use_obj = boots
			check_slot = wearer.shoes
		if("chest")
			equip_to = slot_wear_suit
			use_obj = chest
			check_slot = wearer.wear_suit

	if(use_obj)
		use_obj.refresh_upgrades()
		if(check_slot == use_obj && deploy_mode != ONLY_DEPLOY)
			if (active && !(use_obj.retract_while_active))
				to_chat(wearer, SPAN_DANGER("The [use_obj] is locked in place while [src] is active. You must deactivate it first!"))
				return

			var/mob/living/carbon/human/holder

			if(use_obj)
				holder = use_obj.loc
				if(istype(holder))
					if(use_obj && check_slot == use_obj)
						use_obj.canremove = 1
						if (wearer.unEquip(use_obj, src))
							if(use_obj.overslot)
								use_obj.remove_overslot_contents(wearer)
							to_chat(wearer, "<font color='blue'><b>Your [use_obj.name] [use_obj.gender == PLURAL ? "retract" : "retracts"] swiftly.</b></font>")
							if(piece == "gauntlets" && gloves)
								use_obj.siemens_coefficient = initial(use_obj.siemens_coefficient)
						use_obj.canremove = 0


		else if (deploy_mode != ONLY_RETRACT)
			if(check_slot && check_slot == use_obj)
				return
			if(cosmetic_check(check_slot))
				if(!wearer.equip_to_slot_if_possible(use_obj, equip_to, TRUE)) //Disable_warning
					use_obj.forceMove(src)
					if(check_slot)
						to_chat(initiator, SPAN_DANGER("You are unable to deploy \the [piece] as \the [check_slot] [check_slot.gender == PLURAL ? "are" : "is"] in the way."))
						return
				else
					to_chat(wearer, SPAN_NOTICE("Your [use_obj.name] [use_obj.gender == PLURAL ? "deploy" : "deploys"] swiftly."))
					if(piece == "gauntlets" && gloves && check_slot)
						use_obj.siemens_coefficient *= check_slot.siemens_coefficient
			else
				to_chat(initiator, SPAN_DANGER("You are unable to deploy \the [piece] as \the [check_slot] [check_slot.gender == PLURAL ? "are" : "is"] in the way."))
				return

	if(piece == "helmet" && helmet)
		helmet.update_light(wearer)

/obj/item/rig/proc/cosmetic_check(obj/item/check_slot) //Return TRUE if we are cosmetic
	var/list/armor = list(ARMOR_BULLET,ARMOR_ENERGY,ARMOR_MELEE,ARMOR_BOMB,ARMOR_RAD)
	if(!check_slot)
		return TRUE
	if(!check_slot.armor_list || check_slot == wearer.shoes || check_slot == wearer.gloves)
		return TRUE
	for(var/i in check_slot.armor_list)
		var/a = check_slot.armor_list[i]
		for(a in armor)
			if(check_slot.armor_list[i] > 2)
				return FALSE
	if(check_slot.armor_list[ARMOR_BIO] > 75) //Let the nerds keep the labcoat drip
		return FALSE
	return TRUE

/obj/item/rig/proc/deploy(mob/M,sealed)

	var/mob/living/carbon/human/H = M

	if(!H || !istype(H)) return

	if(H.back != src)
		return

	if(sealed)
		if(H.head)
			var/obj/item/garbage = H.head
			H.drop_from_inventory(garbage)
			H.head = null
			qdel(garbage)

		if(H.gloves)
			var/obj/item/garbage = H.gloves
			H.drop_from_inventory(garbage)
			H.gloves = null
			qdel(garbage)

		if(H.shoes)
			var/obj/item/garbage = H.shoes
			H.drop_from_inventory(garbage)
			H.shoes = null
			qdel(garbage)

		if(H.wear_suit)
			var/obj/item/garbage = H.wear_suit
			H.drop_from_inventory(garbage)
			H.wear_suit = null
			qdel(garbage)

	for(var/piece in list("helmet","gauntlets","chest","boots"))
		toggle_piece(piece, H, ONLY_DEPLOY)


	updateArmor()

/obj/item/rig/dropped(mob/user)
	..()
	remove()

/obj/item/rig/proc/retract(forced = FALSE)
	if (wearer)
		for(var/piece in list("helmet","gauntlets","chest","boots"))
			toggle_piece(piece, wearer, ONLY_RETRACT, forced)

/obj/item/rig/proc/remove()
	retract(TRUE)
	if(wearer)
		rig_verb_takeith()
		wearer.wearing_rig = null
		wearer = null

//Todo
/obj/item/rig/proc/malfunction()
	return FALSE

/obj/item/rig/emp_act(severity_class)
	//set malfunctioning
	if(emp_protection < 30) //for ninjas, really.
		malfunctioning += 10
		if(malfunction_delay <= 0)
			malfunction_delay = max(malfunction_delay, round(30/severity_class))

	//drain some charge
	if(cell) cell.emp_act(severity_class + 15)

	//possibly damage some modules
	take_hit((100/severity_class), "electrical pulse", 1)

/obj/item/rig/proc/shock(mob/user)
	if (!user)
		return FALSE

	if (electrocute_mob(user, cell, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()
		if(user.stunned)
			return TRUE
	return FALSE

/obj/item/rig/block_bullet(mob/user, var/obj/item/projectile/P, def_zone)
	if(!active || !ablative_armor)
		return FALSE

	var/ablative_stack = ablative_armor // Follow-up attacks drain this

	for(var/damage_type in P.damage_types)
		if(damage_type in list(BRUTE, BURN)) // Ablative armor affects both brute and burn damage
			var/damage = P.damage_types[damage_type]
			P.damage_types[damage_type] -= ablative_stack / armor_divisor

			ablative_stack = max(ablative_stack - damage, 0)
		else if(damage_type == HALLOSS)
			P.damage_types[damage_type] -= ablative_stack / armor_divisor

		if(P.damage_types[damage_type] <= 0)
			P.damage_types -= damage_type

	ablative_armor -= max(-(ablative_stack - ablative_armor) / ablation - armor.getRating(P.check_armour), 0) // Damage blocked (not halloss) reduces ablative armor, base armor protects ablative armor

	if(!P.damage_types.len)
		return TRUE
	return FALSE

/obj/item/rig/proc/take_hit(damage, source, is_emp=0)

	if(!installed_modules.len)
		return

	var/chance
	if(!is_emp)
		chance = 2*max(0, damage - (chest? chest.breach_threshold : 0))
	else
		//Want this to be roughly independant of the number of modules, meaning that X emp hits will disable Y% of the suit's modules on average.
		//that way people designing hardsuits don't have to worry (as much) about how adding that extra module will affect emp resiliance by 'soaking' hits for other modules
		chance = 2*max(0, damage - emp_protection)*min(installed_modules.len/15, 1)

	if(!prob(chance))
		return

	//deal addition damage to already damaged module first.
	//This way the chances of a module being disabled aren't so remote.
	var/list/valid_modules = list()
	var/list/damaged_modules = list()
	for(var/obj/item/rig_module/module in installed_modules)
		if(module.damage < 2)
			valid_modules |= module
			if(module.damage > 0)
				damaged_modules |= module

	var/obj/item/rig_module/dam_module = null
	if(damaged_modules.len)
		dam_module = pick(damaged_modules)
	else if(valid_modules.len)
		dam_module = pick(valid_modules)

	if(!dam_module) return

	dam_module.damage++

	if(!source)
		source = "hit"

	if(wearer)
		if(dam_module.damage >= 2)
			to_chat(wearer, SPAN_DANGER("The [source] has disabled your [dam_module.interface_name]!"))
		else
			to_chat(wearer, SPAN_WARNING("The [source] has damaged your [dam_module.interface_name]!"))
	dam_module.deactivate()

/obj/item/rig/proc/malfunction_check(mob/living/carbon/human/user)
	if(malfunction_delay)
		if(offline)
			to_chat(user, SPAN_DANGER("The suit is completely unresponsive."))
		else
			to_chat(user, SPAN_DANGER("ERROR: Hardware fault. Rebooting interface..."))
		return TRUE
	return FALSE

/obj/item/rig/proc/ai_can_move_suit(mob/user, check_user_module = 0, check_for_ai = 0)

	if(check_for_ai)
		if(!(locate(/obj/item/rig_module/ai_container) in contents))
			return FALSE
		var/found_ai
		for(var/obj/item/rig_module/ai_container/module in contents)
			if(module.damage >= 2)
				continue
			if(module.integrated_ai && module.integrated_ai.client && !module.integrated_ai.stat)
				found_ai = 1
				break
		if(!found_ai)
			return FALSE

	if(check_user_module)
		if(!user || !user.loc || !user.loc.loc)
			return FALSE
		var/obj/item/rig_module/ai_container/module = user.loc.loc
		if(!istype(module) || module.damage >= 2)
			to_chat(user, SPAN_WARNING("Your host module is unable to interface with the suit."))
			return FALSE

	if(offline || !cell || !cell.charge || locked_down)
		if(user) user << SPAN_WARNING("Your host rig is unpowered and unresponsive.")
		return FALSE
	if(!wearer || wearer.back != src)
		if(user) user << SPAN_WARNING("Your host rig is not being worn.")
		return FALSE
	if(!wearer.stat && !control_overridden && !ai_override_enabled)
		if(user) user << SPAN_WARNING("You are locked out of the suit servo controller.")
		return FALSE
	return TRUE

/obj/item/rig/proc/force_rest(mob/user)
	if(!ai_can_move_suit(user, check_user_module = 1))
		return
	wearer.lay_down()
	to_chat(user, "<span class='notice'>\The [wearer] is now [wearer.resting ? "resting" : "getting up"].</span>")

/obj/item/rig/proc/forced_move(direction, mob/user)
	if(malfunctioning)
		direction = pick(GLOB.cardinal)

	if(world.time < wearer_move_delay)
		return

	if(!wearer || !wearer.loc || !ai_can_move_suit(user, check_user_module = 1))
		return

	// AIs are a bit slower than regular and ignore move intent.
	wearer_move_delay = world.time + ai_controlled_move_delay

	cell.use(aimove_power_usage * CELLRATE)
	wearer.DoMove(direction, user)

// This returns the rig if you are contained inside one, but not if you are wearing it
/atom/proc/get_rig()
	if(loc)
		return loc.get_rig()
	return null

/obj/item/rig/get_rig()
	return src

/mob/living/carbon/human/get_rig()
	return back


//Used in random rig spawning for cargo
//Randomly deletes modules
/obj/item/rig/proc/lose_modules(probability)
	for(var/obj/item/rig_module/module in installed_modules)
		if (probability)
			qdel(module)


//Fiddles with some wires to possibly make the suit malfunction a little
/obj/item/rig/proc/misconfigure(probability)
	if (prob(probability))
		wires.UpdatePulsed(RIG_SECURITY)//Fiddle with access
	if (prob(probability))
		wires.UpdatePulsed(RIG_AI_OVERRIDE)//frustrate the AI
	if (prob(probability))
		wires.UpdateCut(RIG_SYSTEM_CONTROL)//break the suit
	if (prob(probability))
		wires.UpdatePulsed(RIG_INTERFACE_LOCK)
	if (prob(probability))
		wires.UpdateCut(RIG_INTERFACE_SHOCK)
	if (prob(probability))
		subverted = 1

//Drains, rigs or removes the cell
/obj/item/rig/proc/sabotage_cell()
	if (!cell)
		return

	if (prob(50))
		cell.charge = rand(0, cell.charge*0.5)
	else if (prob(1))
		cell.rigged = 1
	else
		cell = null

//Depletes or removes the airtank
/obj/item/rig/proc/sabotage_tank()
	if (!air_supply)
		return

	if (prob(70))
		air_supply.remove_air(air_supply.air_contents.total_moles)
	else
		QDEL_NULL(air_supply)

/obj/item/rig/clean_blood()
	..()
	if(chest)
		chest.clean_blood()
	if(boots)
		boots.clean_blood()
	if(helmet)
		helmet.clean_blood()
	if(gloves)
		gloves.clean_blood()
	var/obj/glasses = getCurrentGlasses()
	if(glasses)
		glasses.clean_blood()

/obj/item/rig/decontaminate()
	..()
	if(chest)
		chest.decontaminate()
	if(boots)
		boots.decontaminate()
	if(helmet)
		helmet.decontaminate()
	if(gloves)
		gloves.decontaminate()
	var/obj/item/glasses = getCurrentGlasses()
	if(glasses)
		glasses.decontaminate()

/obj/item/rig/make_young()
	..()
	if(chest)
		chest.make_young()
	if(boots)
		boots.make_young()
	if(helmet)
		helmet.make_young()
	if(gloves)
		gloves.make_young()
	var/obj/glasses = getCurrentGlasses()
	if(glasses)
		glasses.make_young()

#undef ONLY_DEPLOY
#undef ONLY_RETRACT
#undef SEAL_DELAY
