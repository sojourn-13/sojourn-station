// The powers here are centered around creating a nanite rig and upgrading it.
/*
List of powers in this page :
- Install Rig : Spawn a Nanite Rig, defined in nanogate_items.dm, on your back if there isn't anything there.
- Upgrade Rig Storage : Install a Storage Module in the rig.
- Install Laser Cannon : Install a Laser Cannon Module in the rig.
- Install Autodoc : Install an Autodoc Module in the rig.
*/

// Create the nanite rig
/obj/item/organ/internal/nanogate/proc/nanite_rig()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	nano_point_cost = 3

	if(!nanite_rig)
		nanite_rig = new /obj/item/rig/nanite(src)
		nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(owner.can_equip(nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(pay_power_cost(nano_point_cost))
			owner.visible_message("[owner.name]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			owner.replace_in_slot(nanite_rig, slot_back, skip_covering_check = TRUE)
			nanite_rig.seal_delay = initial(nanite_rig.seal_delay) // resetting the seal delay
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig

// Create the *opifex* nanite rig
/obj/item/organ/internal/nanogate/proc/nanite_rig_opifex()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	nano_point_cost = 3

	if(!nanite_rig)
		nanite_rig = new /obj/item/rig/nanite/opifex(src)
		nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(owner.can_equip(nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(pay_power_cost(nano_point_cost))
			owner.visible_message("[owner.name]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			owner.replace_in_slot(nanite_rig, slot_back, skip_covering_check = TRUE)
			nanite_rig.seal_delay = initial(nanite_rig.seal_delay) // resetting the seal delay
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_opifex

// Give the nanite rig a storage module
/obj/item/organ/internal/nanogate/proc/nanite_rig_storage()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Storage Module (1)"
	set desc = "Use some of your nanites to create a storage compartment into your nanite rigsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power you idiot.")
		return

	if(pay_power_cost(nano_point_cost))
		nanite_rig.install(new /obj/item/rig_module/storage)
		to_chat(owner, "Your spine hurt as the nanites start to work on making a storage module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_storage

// Give the nanite rig a Laser Cannon
/obj/item/organ/internal/nanogate/proc/nanite_rig_laser()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Laser Module (2)"
	set desc = "Use some of your nanites to create a mounted laser gun on your rigsuit."
	nano_point_cost = 2

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power you idiot.")
		return

	if(pay_power_cost(nano_point_cost))
		nanite_rig.install(new /obj/item/rig_module/mounted/egun)
		to_chat(owner, "Your spine hurt as the nanites start to work on making a laser canon.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_laser

// Give the nanite rig an Autodoc Module
/obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Autodoc Module (5)"
	set desc = "Use many of your nanites to create a surgery module inside your hardsuit."
	nano_point_cost = 5

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power you idiot.")
		return

	if(pay_power_cost(nano_point_cost))

		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/autodoc/autodoc_module = new /obj/item/rig_module/autodoc(src)
		autodoc_module.Initialize()

		nanite_rig.install(autodoc_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an autodoc module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc

// Give the nanite rig an EVA Module
/obj/item/organ/internal/nanogate/proc/nanite_rig_eva()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - EVA Module (1)"
	set desc = "Use some of your nanites to create thrusters inside your hardsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power you idiot.")
		return

	if(pay_power_cost(nano_point_cost))

		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/maneuvering_jets/eva_module = new /obj/item/rig_module/maneuvering_jets(src)
		eva_module.Initialize()

		nanite_rig.install(eva_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an autodoc module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_eva
