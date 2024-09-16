/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye."
	icon_state = "welding"
	item_state_slots = list(
		slot_l_hand_str = "welding",
		slot_r_hand_str = "welding",
		)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	var/up = 0
	armor_list = list(
		melee = 5,
		bullet = 1,
		energy = 2,
		bomb = 5,
		bio = 0,
		rad = 0
	)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	action_button_name = "Flip Welding Mask"
	siemens_coefficient = 0.9
	w_class = ITEM_SIZE_NORMAL
	var/base_state
	flash_protection = FLASH_PROTECTION_MODERATE
	tint = TINT_MODERATE
	obscuration = HEAVY_OBSCURATION

/obj/item/clothing/head/welding/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()

/obj/item/clothing/head/welding/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Welding"] = "welding"
	options["Demonic Welding"] = "demonwelding"
	options["Knight Welding"] = "knightwelding"
	options["Fancy Welding"] = "fancywelding"
	options["Faithful Welding"] = "cultwelding"
	options["Aquatic Welding"] = "norah_briggs_1"
	options["Rustic Welding"] = "yuki_matsuda_1"
	options["Flame Welding"] = "alice_mccrea_1"
	options["Technomancer Welding"] = "engiewelding"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust Welding Mask"
	set src in usr

	if(!usr.incapacitated())
		if(src.up)
			src.up = !src.up
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			obscuration = initial(obscuration)
			icon_state = base_state
			to_chat(usr, "You flip the [src] down to protect your eyes.")
		else
			src.up = !src.up
			body_parts_covered &= ~(EYES|FACE)
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			obscuration = 0
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "[base_state]up"
			to_chat(usr, "You push the [src] up out of your face.")
		update_wear_icon()	//so our mob-over-lays
		usr.update_action_buttons()

/obj/item/clothing/head/welding/demon
	name = "demonic welding helmet"
	desc = "A welding helmet painted to resemble a demonic face."
	icon_state = "demonwelding"
	item_state_slots = list(
		slot_l_hand_str = "demonwelding",
		slot_r_hand_str = "demonwelding",
		)

/obj/item/clothing/head/welding/church
	name = "faithful welding helmet"
	desc = "A welding helmet painted to resemble a the local faith ."
	icon_state = "cultwelding"
	item_state_slots = list(
		slot_l_hand_str = "cultwelding",
		slot_r_hand_str = "cultwelding",
		)

/obj/item/clothing/head/welding/knight
	name = "knightly welding helmet"
	desc = "A welding helmet painted to resemble a medieval knight."
	icon_state = "knightwelding"
	item_state_slots = list(
		slot_l_hand_str = "knightwelding",
		slot_r_hand_str = "knightwelding",
		)

/obj/item/clothing/head/welding/fancy
	name = "fancy welding helmet"
	desc = "A welding helmet painted in fancy black and gold colors."
	icon_state = "fancywelding"
	item_state_slots = list(
		slot_l_hand_str = "fancywelding",
		slot_r_hand_str = "fancywelding",
		)

/obj/item/clothing/head/welding/technomancer
	name = "technomancer welding helmet"
	desc = "A welding helmet painted in artificer guild colors."
	icon_state = "engiewelding"
	item_state_slots = list(
		slot_l_hand_str = "engiewelding",
		slot_r_hand_str = "engiewelding",
		)

/obj/item/clothing/head/welding/flame
	name = "flame welding helmet"
	desc = "A welding helmet painted with vivid flames and fire."
	icon_state = "alice_mccrea_1"
	item_state_slots = list(
		slot_l_hand_str = "alice_mccrea_1",
		slot_r_hand_str = "alice_mccrea_1",
		)

/obj/item/clothing/head/welding/ghetto
	name = "ghetto welding helmet"
	desc = "A welding helmet painted white with a graffiti tag."
	icon_state = "yuki_matsuda_1"
	item_state_slots = list(
		slot_l_hand_str = "yuki_matsuda_1",
		slot_r_hand_str = "yuki_matsuda_1",
		)

/obj/item/clothing/head/welding/aquatic
	name = "aquatic welding helmet"
	desc = "A welding helmet painting in an underwater blue theme."
	icon_state = "norah_briggs_1"
	item_state_slots = list(
		slot_l_hand_str = "norah_briggs_1",
		slot_r_hand_str = "norah_briggs1",
		)

/obj/item/clothing/head/matriarch_cape
	name = "Matriarch Cape"
	desc = "A cape made from the hide of a xenomorph queen. The skill and experience required to hunt such a beast shows that the individual wearing this \
			is none other than the Matriarch of the Hunting Lodge."
	icon_state = "matriarch_cape"
	item_state = "matriarch_cape"
	armor_list = list(melee = 11, bullet = 6, energy = 6, bomb = 25, bio = 20, rad = 15)
