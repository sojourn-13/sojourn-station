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
	set name = "Nanite Rigsuit - Installation (1)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	nano_point_cost = 1

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

			// Add the nanite rig verbs at activation
			//verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_laser
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_eva
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_meson
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module

			//Add to owner_verbs so it can be removed properly should the need arise.
			//owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_laser
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_eva
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_meson
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module

// Create the *opifex* nanite rig
/obj/item/organ/internal/nanogate/proc/nanite_rig_opifex()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (1)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."
	nano_point_cost = 1

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

			// Add the nanite rig verbs at activation
			//verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_laser
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_eva
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_meson
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade
			verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module

			//Add to owner_verbs so it can be removed properly should the need arise.
			//owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_laser
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_eva
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_meson
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade
			owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module

/*
// Give the nanite rig a storage module
/obj/item/organ/internal/nanogate/proc/nanite_rig_storage()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Storage Module (1)"
	set desc = "Use some of your nanites to create a storage compartment into your nanite rigsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))
		nanite_rig.install(new /obj/item/rig_module/storage)
		to_chat(owner, "Your spine hurt as the nanites start to work on making a storage module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_storage
*/
// Give the nanite rig a Laser Cannon
/obj/item/organ/internal/nanogate/proc/nanite_rig_laser()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Laser Module (1)"
	set desc = "Use some of your nanites to create a mounted laser gun on your rigsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power.")
		return

	if(pay_power_cost(nano_point_cost))
		nanite_rig.install(new /obj/item/rig_module/mounted/egun)
		to_chat(owner, "Your spine hurt as the nanites start to work on making a laser canon.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_laser

// Give the nanite rig an Autodoc Module
/obj/item/organ/internal/nanogate/proc/nanite_rig_autodoc()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Autodoc Module (2)"
	set desc = "Use many of your nanites to create a surgery module inside your hardsuit."
	nano_point_cost = 2

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
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
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/maneuvering_jets/eva_module = new /obj/item/rig_module/maneuvering_jets(src)
		eva_module.Initialize()

		nanite_rig.install(eva_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an eva module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_eva

/obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Health Scanner Module (1)"
	set desc = "Use some of your nanites to create a health scanner inside your hardsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		var/obj/item/rig_module/device/healthscanner/healhtscanner_module = new /obj/item/rig_module/device/healthscanner(src)
		healhtscanner_module.Initialize()

		nanite_rig.install(healhtscanner_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_healthscanner

/obj/item/organ/internal/nanogate/proc/nanite_rig_meson()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Meson Module (1)"
	set desc = "Use some of your nanites to create a meson scanner inside your hardsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		var/obj/item/rig_module/vision/meson/meson_module = new /obj/item/rig_module/vision/meson(src)
		meson_module.Initialize()

		nanite_rig.install(meson_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_meson

/obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Power Sink Module (1)"
	set desc = "Use some of your nanites to create a power sink inside your hardsuit. Make sure to only use it on floor wires to not mess with APCs."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		var/obj/item/rig_module/power_sink/power_sink_module = new /obj/item/rig_module/power_sink(src)
		power_sink_module.Initialize()

		nanite_rig.install(power_sink_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_power_sink

/obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Energy Blade Module (1)"
	set desc = "Use some of your nanites to create a energy blade inside your hardsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		var/obj/item/rig_module/held/energy_blade/energy_blade_module = new /obj/item/rig_module/held/energy_blade(src)
		energy_blade_module.Initialize()

		nanite_rig.install(energy_blade_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_e_blade



/obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Storage Module (1)"
	set desc = "Use some of your nanites to create a storage module inside your hardsuit."
	nano_point_cost = 1

	if(!nanite_rig)
		to_chat(owner, "You need a rig to use this power")
		return

	if(pay_power_cost(nano_point_cost))

		var/obj/item/rig_module/storage_module = new /obj/item/rig_module/storage(src)
		storage_module.Initialize()

		nanite_rig.install(storage_module)
		to_chat(owner, "Your spine hurt as the nanites start to work on making an module.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_rig_storage_module


