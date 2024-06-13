/*
// Bluespace Technician is a godmode avatar designed for debugging and admin actions
// Their primary benefit is the ability to spawn in wherever you are, making it quick to get a human for your needs
// They also have incorporeal flying movement if they choose, which is often the fastest way to get somewhere specific
// They are mostly invincible, although godmode is a bit imperfect.
// Most of their superhuman qualities can be toggled off if you need a normal human for testing biological functions
*/


ADMIN_VERB_ADD(/client/proc/cmd_dev_bst, R_ADMIN|R_MOD|R_DEBUG, TRUE)

/client/proc/cmd_dev_bst()
	set category = "Debug"
	set name = "Spawn Bluespace Tech"
	set desc = "Spawns a Bluespace Tech to debug stuff"


	if(!check_rights(R_ADMIN|R_DEBUG))
		return

	var/T = get_turf(usr)
	var/mob/living/carbon/human/bst/bst = new(T)
	bst.anchored = TRUE
	bst.ckey = usr.ckey
	bst.name = "Bluespace Technician"
	bst.real_name = "Bluespace Technician"
	bst.voice_name = "Bluespace Technician"
	bst.h_style = "Crewcut"
	if(usr.mind)
		usr.mind.transfer_to(bst)

	//Items
	bst.equip_to_slot_or_del(new /obj/item/clothing/under/admin/bst(bst), slot_w_uniform)
	bst.equip_to_slot_or_del(new /obj/item/device/radio/headset/ert/bst(bst), slot_l_ear)
	bst.equip_to_slot_or_del(new /obj/item/storage/backpack/holding/bst(bst), slot_back)
	bst.equip_to_slot_or_del(new /obj/item/storage/box/survival(bst.back), slot_in_backpack)
	bst.equip_to_slot_or_del(new /obj/item/clothing/shoes/admin/bst(bst), slot_shoes)
	bst.equip_to_slot_or_del(new /obj/item/clothing/head/admin/bst(bst), slot_head)
	bst.equip_to_slot_or_del(new /obj/item/clothing/glasses/admin/bst(bst), slot_glasses)
	bst.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full/bst(bst), slot_belt)
	bst.equip_to_slot_or_del(new /obj/item/clothing/gloves/admin/bst(bst), slot_gloves)

	bst.equip_to_slot_or_del(new /obj/item/storage/box/ids(bst.back), slot_in_backpack)
	bst.equip_to_slot_or_del(new /obj/item/device/t_scanner(bst.back), slot_in_backpack)
	bst.equip_to_slot_or_del(new /obj/item/modular_computer/pda/captain(bst.back), slot_in_backpack)

	var/obj/item/storage/box/pills = new /obj/item/storage/box(null, TRUE)
	pills.name = "adminordrazine"
	for(var/i = 1, i < 12, i++)
		new /obj/item/reagent_containers/pill/adminordrazine(pills)
	bst.equip_to_slot_or_del(pills, slot_in_backpack)

	//Sort out ID
	var/obj/item/card/id/bst/id = new/obj/item/card/id/bst(bst)
	id.registered_name = bst.real_name
	id.assignment = "Bluespace Technician"
	id.name = "[id.assignment]"
	bst.equip_to_slot_or_del(id, slot_wear_id)
	bst.update_inv_wear_id()
	bst.regenerate_icons()

	//Add the rest of the languages
	bst.add_language(LANGUAGE_COMMON)
	bst.add_language(LANGUAGE_CYRILLIC)
	bst.add_language(LANGUAGE_ILLYRIAN)
	bst.add_language(LANGUAGE_MONKEY)
	// Antagonist languages
	bst.add_language(LANGUAGE_XENOMORPH)
	bst.add_language(LANGUAGE_HIVEMIND)
	bst.add_language(LANGUAGE_CORTICAL)
	bst.add_language(LANGUAGE_CULT)
	bst.add_language(LANGUAGE_OCCULT)

	spawn(10)
		bst_post_spawn(bst)

	log_and_message_admins("has become a Bluespace Technician \the [jumplink(T)] User:[src]", location = T) //So we can go to it
	log_admin("Bluespace Tech Spawned: X:[bst.x] Y:[bst.y] Z:[bst.z] User:[src]") //Going to leave this do to XYZ logging
	init_verbs()
	return 1

/client/proc/bst_post_spawn(mob/living/carbon/human/bst/bst)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()

	bst.anchored = FALSE

/mob/living/carbon/human/bst
	universal_understand = TRUE
	status_flags = GODMODE
	var/fall_override = TRUE
	var/mob/original_body = null

/mob/living/carbon/human/bst/can_inject(var/mob/user, var/error_msg, var/target_zone)
	to_chat(user, span("alert", "The [src] disarms you before you can inject them."))
	user.drop_item()
	return FALSE

/mob/living/carbon/human/bst/binarycheck()
	return TRUE

/mob/living/carbon/human/bst/proc/suicide()

	src.custom_emote(1,"presses a button on their suit, followed by a polite bow.")
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	spawn(10)
		qdel(src)
	if(key)

		var/mob/observer/ghost/ghost = ghostize(TRUE)
		ghost.name = "[ghost.key] BSTech"
		ghost.real_name = "[ghost.key] BSTech"
		ghost.voice_name = "[ghost.key] BSTech"
		ghost.admin_ghosted = TRUE

/mob/living/carbon/human/bst/verb/antigrav()
	set name = "Toggle Gravity"
	set desc = "Toggles on/off falling for you."
	set category = "BST"

	if (fall_override)
		fall_override = FALSE
		to_chat(src, SPAN_NOTICE("You will now fall normally."))
	else
		fall_override = TRUE
		to_chat(src, SPAN_NOTICE("You will no longer fall."))

/mob/living/carbon/human/bst/verb/bstwalk()
	set name = "Ruin Everything"
	set desc = "Uses bluespace technology to phase through solid matter and move quickly."
	set category = "BST"
	set popup_menu = 0

	if(!HasMovementHandler(/datum/movement_handler/mob/incorporeal))
		to_chat(src, SPAN_NOTICE("You will now phase through solid matter."))
		incorporeal_move = TRUE
		ReplaceMovementHandler(/datum/movement_handler/mob/incorporeal)
	else
		to_chat(src, SPAN_NOTICE("You will no-longer phase through solid matter."))
		incorporeal_move = FALSE
		RemoveMovementHandler(/datum/movement_handler/mob/incorporeal)

/mob/living/carbon/human/bst/verb/bstrecover()
	set name = "Rejuv"
	set desc = "Use the bluespace within you to restore your health"
	set category = "BST"
	set popup_menu = FALSE

	src.revive()

/mob/living/carbon/human/bst/verb/bstawake()
	set name = "Wake up"
	set desc = "This is a quick fix to the relogging sleep bug"
	set category = "BST"
	set popup_menu = FALSE

	src.sleeping = FALSE

/mob/living/carbon/human/bst/verb/bstquit()
	set name = "Teleport out"
	set desc = "Activate bluespace to leave and return to your original mob (if you have one)."
	set category = "BST"
	log_and_message_admins("has Bluespace Technician Teleported Out")
	src.suicide()


/mob/living/carbon/human/bst/verb/tgm()
	set name = "Toggle Godmode"
	set desc = "Enable or disable god mode. For testing things that require you to be vulnerable."
	set category = "BST"

	status_flags ^= GODMODE
	to_chat(src, SPAN_NOTICE("God mode is now [status_flags & GODMODE ? "enabled" : "disabled"]"))

	to_chat(src, span("notice", "God mode is now [status_flags & GODMODE ? "enabled" : "disabled"]"))

/mob/living/carbon/human/bst/verb/bst_raise_stats()
	set name = "Raise All Stats By 5"
	set desc = "Gives you 5+ to all stats."
	set category = "BST"
	log_and_message_admins("has Bluespace Technician raised stats by 5")

	to_chat(src, SPAN_NOTICE("Stats raised by 5"))

	src.stats.changeStat(STAT_COG, 5)
	src.stats.changeStat(STAT_MEC, 5)
	src.stats.changeStat(STAT_BIO, 5)
	src.stats.changeStat(STAT_ROB, 5)
	src.stats.changeStat(STAT_TGH, 5)
	src.stats.changeStat(STAT_VIG, 5)

/mob/living/carbon/human/bst/verb/bst_lower_stats()
	set name = "Lowers All Stats By 5"
	set desc = "Removes 5 to all stats."
	set category = "BST"
	log_and_message_admins("has Bluespace Technician lowered stats by 5")

	to_chat(src, SPAN_NOTICE("Stats lowered by 5"))

	src.stats.changeStat(STAT_COG, -5)
	src.stats.changeStat(STAT_MEC, -5)
	src.stats.changeStat(STAT_BIO, -5)
	src.stats.changeStat(STAT_ROB, -5)
	src.stats.changeStat(STAT_TGH, -5)
	src.stats.changeStat(STAT_VIG, -5)

///////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////I T E M S/////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/storage/backpack/holding/bst
	name = "stablized bag of holding"
	desc = "A backpack that opens into a localized pocket of bluespace. An example of stable bluespace that predate the crash and maintains its stability even with other bluespace objects."
	worn_access = TRUE
	bluespace_safe = TRUE

/obj/item/device/radio/headset/ert/bst
	name = "bluespace technician's headset"
	desc = "A Bluespace Technician's headset. The letters 'BST' are stamped on the side."
	translate_binary = TRUE
	translate_hive = TRUE
	keyslot1 = new /obj/item/device/encryptionkey/binary

/obj/item/device/radio/headset/ert/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/device/radio/headset/ert/bst/recalculateChannels(var/setDescription = FALSE)
	..(setDescription)
	translate_binary = TRUE
	translate_hive = TRUE

/obj/item/clothing/under/admin/bst
	name = "bluespace technician's uniform"
	desc = "A Bluespace Technician's Uniform. There is a logo on the sleeve that reads 'BST'."
	icon = 'icons/inventory/uniform/icon.dmi'
	icon_state = "syndicate"
	item_state = "bl_suit"
	has_sensor = FALSE
	sensor_mode = 0
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
	armor_list = list(melee = 100, bullet = 100, energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS | HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	cold_protection = FULL_BODY
	heat_protection = FULL_BODY

/obj/item/clothing/under/admin/assistantformalbst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/clothing/gloves/admin/bst
	name = "bluespace technician's gloves"
	desc = "A pair of modified gloves. The letters 'BST' are stamped on the side."
	icon = 'icons/inventory/hands/icon.dmi'
	icon_state = "black"
	item_state = "black"
	siemens_coefficient = 0
	permeability_coefficient = 0

/obj/item/clothing/gloves/admin/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/clothing/head/admin/bst
	name = "bluespace technician's beret"
	desc = "An incredible beret. The letters 'BST' are stamped on the side."
	icon = 'icons/inventory/head/icon.dmi'
	icon_state = "beret"
	psi_blocking = 50

/obj/item/clothing/head/admin/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/clothing/glasses/admin/bst
	name = "bluespace technician's glasses"
	desc = "A pair of modified sunglasses. The word 'BST' is stamped on the side."
	icon = 'icons/inventory/eyes/icon.dmi'
	icon_state = "sun"
	item_state = "sunglasses"
	vision_flags = (SEE_TURFS|SEE_OBJS|SEE_MOBS)
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/admin/bst/verb/toggle_xray(mode in list("X-Ray without Lighting", "X-Ray with Lighting", "Normal"))
	set name = "Change Vision Mode"
	set desc = "Changes your glasses' vision mode."
	set category = "BST"
	set src in usr

	switch (mode)
		if ("X-Ray without Lighting")
			vision_flags = (SEE_TURFS|SEE_OBJS|SEE_MOBS)
			see_invisible = SEE_INVISIBLE_NOLIGHTING
		if ("X-Ray with Lighting")
			vision_flags = (SEE_TURFS|SEE_OBJS|SEE_MOBS)
			see_invisible = -1
		if ("Normal")
			vision_flags = FALSE
			see_invisible = -1

	to_chat(usr, "<span class='notice'>\The [src]'s vision mode is now <b>[mode]</b>.</span>")

/obj/item/clothing/glasses/admin/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/clothing/shoes/admin/bst
	name = "bluespace technician's shoes"
	desc = "A pair of black shoes with extra grip. The letters 'BST' are stamped on the side."
	icon_state = "black"
	item_flags = NOSLIP

/obj/item/clothing/shoes/admin/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

	return TRUE //Because Bluespace

/obj/item/card/id/bst
	icon_state = "centcom"
	group = "secblue"
	desc = "An ID straight from Central Command. This one looks highly classified."

/obj/item/card/id/bst/New()
		access = get_all_accesses()+get_all_centcom_access()+get_all_syndicate_access()

/obj/item/card/id/bst/attack_hand()
	if(!usr)
		return
	if(!isbst(usr))
		to_chat(usr, span("alert", "Your hand seems to go right through the [src]. It's like it doesn't exist."))
		return
	else
		..()

/obj/item/storage/belt/utility/full/bst
	name = "bluespace technician's belt"
	storage_slots = 24
	icon = 'icons/inventory/belt/icon.dmi'
	icon_state = "utility"
	item_state = "utility"

/obj/item/storage/belt/utility/full/bst/populate_contents()
	..()
	new /obj/item/tool/screwdriver/bs(src)
	new /obj/item/tool/saw/bs(src)
	new /obj/item/tool/wrench/bs(src)
	new /obj/item/tool/weldingtool/bs(src)
	new /obj/item/tool/crowbar/bs(src)
	new /obj/item/tool/wirecutters/bs(src)
	new /obj/item/tool/multitool/bs(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/device/t_scanner(src)
	new /obj/item/stack/cable_coil/random(src)
	new /obj/item/tool/tape_roll/flextape(src)

/mob/living/carbon/human/bst/restrained()
	return !(status_flags & GODMODE)


/mob/living/carbon/human/bst/can_fall()
	return fall_override ? FALSE : ..()


/mob/living/carbon/human/bst/verb/moveup()
	set name = "Phase Upwards"
	set category = "BST"
	zMove(UP)

/mob/living/carbon/human/bst/verb/movedown()
	set name = "Phase Downwards"
	set category = "BST"
	zMove(DOWN)
