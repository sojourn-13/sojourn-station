// The powers here are centered around creating a nanite rig and upgrading it.
/*
List of powers in this page :
- Install Rig : Spawn a Nanite Rig, defined in nanogate_items.dm, on your back if there isn't anything there.
- Upgrade Rig Storage : Install a Storage Module in the rig.
- Install Laser Cannon : Install a Laser Cannon Module in the rig.
- Install Autodoc : Install an Autodoc Module in the rig.
*/

// Create the nanite rig
/mob/living/carbon/human/nanogate/proc/nanite_rig()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	var/nano_point_cost = 3
	var/obj/item/organ/internal/nanogate/thrdprn = random_organ_by_process(BP_NANOGATE)

	if(!thrdprn)
		to_chat(src, SPAN_WARNING("You dont have a nanogate that is active!"))
		return

	if(!thrdprn.nanite_rig)
		thrdprn.nanite_rig = new /obj/item/rig/nanite(src)
		thrdprn.nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(can_equip(thrdprn.nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(thrdprn.pay_power_cost(nano_point_cost))
			visible_message("[src]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			replace_in_slot(thrdprn.nanite_rig, slot_back, skip_covering_check = TRUE)
			thrdprn.nanite_rig.seal_delay = initial(thrdprn.nanite_rig.seal_delay) // resetting the seal delay
			verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig
			thrdprn.nanogate_verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig

			// Add the nanite rig verbs at activation
			//verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_storage
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_laser
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_eva

			//Add to nanogate_verbs so it can be removed properly should the need arise.
			//nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_storage
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_laser
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_eva

// Create the *opifex* nanite rig
/mob/living/carbon/human/nanogate/proc/nanite_rig_opifex()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	var/nano_point_cost = 3
	var/obj/item/organ/internal/nanogate/thrdprn = random_organ_by_process(BP_NANOGATE)

	if(!thrdprn)
		to_chat(src, SPAN_WARNING("You dont have a nanogate that is active!"))
		return

	if(!thrdprn.nanite_rig)
		thrdprn.nanite_rig = new /obj/item/rig/nanite/opifex(src)
		thrdprn.nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(can_equip(thrdprn.nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(thrdprn.pay_power_cost(nano_point_cost))
			visible_message("[src]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			replace_in_slot(thrdprn.nanite_rig, slot_back, skip_covering_check = TRUE)
			thrdprn.nanite_rig.seal_delay = initial(thrdprn.nanite_rig.seal_delay) // resetting the seal delay
			verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_opifex
			thrdprn.nanogate_verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_opifex

			// Add the nanite rig verbs at activation
			//verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_storage
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_laser
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc
			verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_eva

			//Add to nanogate_verbs so it can be removed properly should the need arise.
			//nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_storage
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_laser
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc
			thrdprn.nanogate_verbs += /mob/living/carbon/human/nanogate/proc/nanite_rig_eva

// Give the nanite rig a Laser Cannon
/mob/living/carbon/human/nanogate/proc/nanite_rig_laser()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Laser Module (2)"
	set desc = "Use some of your nanites to create a mounted laser gun on your rigsuit."
	var/nano_point_cost = 2
	var/obj/item/organ/internal/nanogate/thrdprn = random_organ_by_process(BP_NANOGATE)

	if(!thrdprn)
		to_chat(src, SPAN_WARNING("You dont have a nanogate that is active!"))
		return

	if(!thrdprn.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(thrdprn.pay_power_cost(nano_point_cost))
		thrdprn.nanite_rig.install(new /obj/item/rig_module/mounted/egun)
		to_chat(src, "Your spine hurt as the nanites start to work on making a laser canon.")
		verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_laser
		thrdprn.nanogate_verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_laser

// Give the nanite rig an Autodoc Module
/mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Autodoc Module (5)"
	set desc = "Use many of your nanites to create a surgery module inside your hardsuit."
	var/nano_point_cost = 5
	var/obj/item/organ/internal/nanogate/thrdprn = random_organ_by_process(BP_NANOGATE)

	if(!thrdprn)
		to_chat(src, SPAN_WARNING("You dont have a nanogate that is active!"))
		return

	if(!thrdprn.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(thrdprn.pay_power_cost(nano_point_cost))

		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/autodoc/autodoc_module = new /obj/item/rig_module/autodoc(src)
		autodoc_module.Initialize()

		thrdprn.nanite_rig.install(autodoc_module)
		to_chat(src, "Your spine hurt as the nanites start to work on making an autodoc module.")
		verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc
		thrdprn.nanogate_verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_autodoc

// Give the nanite rig an EVA Module
/mob/living/carbon/human/nanogate/proc/nanite_rig_eva()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - EVA Module (1)"
	set desc = "Use some of your nanites to create thrusters inside your hardsuit."
	var/nano_point_cost = 1
	var/obj/item/organ/internal/nanogate/thrdprn = random_organ_by_process(BP_NANOGATE)

	if(!thrdprn)
		to_chat(src, SPAN_WARNING("You dont have a nanogate that is active!"))
		return

	if(!thrdprn.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(thrdprn.pay_power_cost(nano_point_cost))

		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/maneuvering_jets/eva_module = new /obj/item/rig_module/maneuvering_jets(src)
		eva_module.Initialize()

		thrdprn.nanite_rig.install(eva_module)
		to_chat(src, "Your spine hurt as the nanites start to work on making an autodoc module.")
		verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_eva
		thrdprn.nanogate_verbs -= /mob/living/carbon/human/nanogate/proc/nanite_rig_eva
