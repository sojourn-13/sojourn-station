//Deathsquad suit
/obj/item/clothing/head/helmet/space/deathsquad
	name = "deathsquad helmet"
	desc = "That's not red paint. That's real blood."
	icon_state = "deathsquad"
	item_state_slots = list(
		slot_l_hand_str = "syndicate-helm-black-red",
		slot_r_hand_str = "syndicate-helm-black-red",
		)
	armor_list = list(melee = 16, bullet = 13, energy = 11, bomb = 30, bio = 100, rad = 60)
	item_flags = STOPPRESSUREDAMAGE | THICKMATERIAL
	flags_inv = BLOCKHAIR
	siemens_coefficient = 0.6

//Orange emergency space suit
/obj/item/clothing/head/helmet/space/emergency
	name = "Emergency Space Helmet"
	icon_state = "emergencyhelm"
	item_state = "emergencyhelm"
	desc = "A simple helmet with a built in light, smells like mothballs."
	flash_protection = FLASH_PROTECTION_NONE

/obj/item/clothing/suit/space/emergency
	name = "Emergency Softsuit"
	icon_state = "emergency_suit"
	item_state = "emergency_suit"
	desc = "A thin, ungainly softsuit colored in blaze orange for rescuers to easily locate, looks pretty fragile."
	slowdown = 4
