// The powers here are centered around creating a nanite rig and upgrading it.
/*
List of powers in this page :
- Install Rig : Spawn a Nanite Rig, defined in nanogate_items.dm, on your back if there isn't anything there.
- Upgrade Rig Storage : Install a Storage Module in the rig.
- Install Laser Cannon : Install a Laser Cannon Module in the rig.
- Install Autodoc : Install an Autodoc Module in the rig.
*/

// Create the nanite rig
/mob/living/carbon/human/proc/nanite_rig()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.nanite_rig)
		organ.nanite_rig = new /obj/item/rig/nanite(organ)
		organ.nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(can_equip(organ.nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(organ.pay_power_cost(3))
			visible_message("[name]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			replace_in_slot(organ.nanite_rig, slot_back, skip_covering_check = TRUE)
			organ.nanite_rig.seal_delay = initial(organ.nanite_rig.seal_delay) // resetting the seal delay
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_rig)

			// Add the nanite rig verbs at activation
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_laser)
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_autodoc)
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_eva)

// Create the *opifex* nanite rig
/mob/living/carbon/human/proc/nanite_rig_opifex()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Installation (3)"
	set desc = "Convert some of your nanites into a permanent rigsuit attached to your spine."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.nanite_rig)
		organ.nanite_rig = new /obj/item/rig/nanite/opifex(organ)
		organ.nanite_rig.seal_delay = 0 // No delay to put it on because nanites, and moving while putting it one make it disapear

	if(can_equip(organ.nanite_rig, slot_back, disable_warning = FALSE, skip_item_check = FALSE, skip_covering_check = TRUE))
		if(organ.pay_power_cost(3))
			visible_message("[name]'s back erupt in a black goo that quickly transform into a rig suit module.",
									"Despite the nanites dulling the pain, your back still aches while your nanites form a rig suit on your back..")
			replace_in_slot(organ.nanite_rig, slot_back, skip_covering_check = TRUE)
			organ.nanite_rig.seal_delay = initial(organ.nanite_rig.seal_delay) // resetting the seal delay
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_rig_opifex)

			// Add the nanite rig verbs at activation
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_laser)
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_autodoc)
			organ.organ_add_verb(/mob/living/carbon/human/proc/nanite_rig_eva)

// Give the nanite rig a Laser Cannon
/mob/living/carbon/human/proc/nanite_rig_laser()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Laser Module (2)"
	set desc = "Use some of your nanites to create a mounted laser gun on your rigsuit."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(organ.pay_power_cost(2))
		organ.nanite_rig.install(new /obj/item/rig_module/mounted/egun)
		to_chat(src, "Your spine hurt as the nanites start to work on making a laser canon.")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_rig_laser)

// Give the nanite rig an Autodoc Module
/mob/living/carbon/human/proc/nanite_rig_autodoc()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - Autodoc Module (5)"
	set desc = "Use many of your nanites to create a surgery module inside your hardsuit."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(organ.pay_power_cost(5))
		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/autodoc/autodoc_module = new /obj/item/rig_module/autodoc(organ)
		organ.nanite_rig.install(autodoc_module)
		to_chat(src, "Your spine hurt as the nanites start to work on making an autodoc module.")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_rig_autodoc)

// Give the nanite rig an EVA Module
/mob/living/carbon/human/proc/nanite_rig_eva()
	set category = "Nanogate Powers"
	set name = "Nanite Rigsuit - EVA Module (1)"
	set desc = "Use some of your nanites to create thrusters inside your hardsuit."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.nanite_rig)
		to_chat(src, "You need a rig to use this power you idiot.")
		return

	if(organ.pay_power_cost(1))
		// Creating it early because we need to manually initialize some stuff
		var/obj/item/rig_module/maneuvering_jets/eva_module = new /obj/item/rig_module/maneuvering_jets(organ)
		organ.nanite_rig.install(eva_module)
		to_chat(src, "Your spine hurt as the nanites start to work on making an autodoc module.")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_rig_eva)
