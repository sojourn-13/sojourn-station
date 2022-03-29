// Funny/excelsior version of the BST, asked by PinkestKitten#8019. -R4d6

ADMIN_VERB_ADD(/client/proc/cmd_dev_rst, R_ADMIN|R_DEBUG, TRUE)

/client/proc/cmd_dev_rst()
	set category = "Debug"
	set name = "Spawn Redspess Tek"
	set desc = "Spawns a Redspess Tek to debug stuff"


	if(!check_rights(R_ADMIN|R_DEBUG))
		return

	var/T = get_turf(usr)
	var/mob/living/carbon/human/bst/bst = new(T)
	bst.anchored = TRUE
	bst.ckey = usr.ckey
	bst.name = "Redspess Teknician"
	bst.real_name = "Redspess Teknician"
	bst.voice_name = "Redspess Teknician"
	bst.h_style = "Crewcut"

	//Items
	var/obj/item/clothing/under/admin/bst/under = new(bst)
	under.icon_state = "excelsior_officer"
	under.item_state  = "bl_suit"
	bst.equip_to_slot_or_del(under, slot_w_uniform)

	var/obj/item/device/radio/headset/ert/bst/headset = new(bst)
	bst.equip_to_slot_or_del(headset, slot_l_ear)

	var/obj/item/storage/backpack/holding/bst/backpack = new(bst)
	bst.equip_to_slot_or_del(backpack, slot_back)

	var/obj/item/storage/box/survival/box = new(bst)
	bst.equip_to_slot_or_del(box, slot_in_backpack)

	var/obj/item/clothing/shoes/admin/bst/shoes = new(bst)
	under.icon_state = "jackboots"
	under.item_state  = "jackboots"
	bst.equip_to_slot_or_del(shoes, slot_shoes)

	var/obj/item/clothing/head/admin/bst/beret = new(bst)
	under.icon_state = "beret_navy_warden"
	bst.equip_to_slot_or_del(beret, slot_head)

	var/obj/item/clothing/glasses/admin/bst/glasses = new(bst)
	bst.equip_to_slot_or_del(glasses, slot_glasses)

	var/obj/item/storage/belt/utility/full/bst/belt = new(bst)
	bst.equip_to_slot_or_del(belt, slot_belt)

	var/obj/item/clothing/gloves/admin/bst/gloves = new(bst)
	under.icon_state = "black"
	under.item_state  = "black"
	bst.equip_to_slot_or_del(gloves, slot_gloves)

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
	id.assignment = "Redspess Teknician"
	id.name = "[id.assignment]"
	bst.equip_to_slot_or_del(id, slot_wear_id)
	bst.update_inv_wear_id()
	bst.regenerate_icons()

	//Add the rest of the languages
	bst.add_language(LANGUAGE_COMMON)
	bst.add_language(LANGUAGE_CYRILLIC)
	bst.add_language(LANGUAGE_SERBIAN)
	bst.add_language(LANGUAGE_MONKEY)
	// Antagonist languages
	bst.add_language(LANGUAGE_XENOMORPH)
	bst.add_language(LANGUAGE_HIVEMIND)
	bst.add_language(LANGUAGE_CORTICAL)
	bst.add_language(LANGUAGE_CULT)
	bst.add_language(LANGUAGE_OCCULT)

	spawn(10)
		bst_post_spawn(bst)

	log_and_message_admins("has become a Redspess Teknician \the [jumplink(T)] User:[src]", location = T) //So we can go to it
	log_admin("Redspess Tek Spawned: X:[bst.x] Y:[bst.y] Z:[bst.z] User:[src]") //Going to leave this do to XYZ logging
	return 1
