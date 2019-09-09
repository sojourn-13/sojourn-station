/obj/item/clothing/under/pj
	name = "red pyjamas"
	desc = "A set of white sleepwear with a red stripe pattern."
	icon_state = "red_pyjamas"
	item_state = "w_suit"

/obj/item/clothing/under/pj/blue
	name = "blue pyjamas"
	desc = "A set of white sleepwear with a blue stripe pattern."
	icon_state = "blue_pyjamas"
	item_state = "w_suit"

/obj/item/clothing/under/bathrobe
	name = "bathrobe"
	desc = "A fluffy robe to keep you from showing off to the world."
	icon_state = "bathrobe"
	item_state = "bathrobe"

/obj/item/clothing/under/space
	name = "\improper NASA jumpsuit"
	desc = "A jumpsuit with an old NASA logo on it. It's made out of space-proof materials."
	icon_state = "black"
	item_state = "bl_suit"
	w_class = ITEM_SIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/admin/acj
	name = "cybernetic jumpsuit"
	icon_state = "syndicate"
	item_state = "bl_suit"
	desc = "A cybernetically enhanced jumpsuit of incredible durability. Who could have made this?"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 100, bullet = 100, laser = 100,energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/under/rank/first_officer/suit
	name = "first officer's suit"
	desc = "A teal suit complete with a white shirt and orange tie. This one has a first officer's badge."
	icon_state = "teal_suit"
	item_state = "g_suit"

/obj/item/clothing/under/bride_white
	name = "wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	item_state = "nursesuit"
	flags_inv = HIDESHOES
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/rank/captain/formal
	name = "captain's formal uniform"
	desc = "A captain's formal-wear, saved for special occasions."
	icon_state = "captain_formal"
	item_state = "b_suit"

/obj/item/clothing/under/rank/assistant/formal
	name = "assistant's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	item_state = "gy_suit"

/obj/item/clothing/under/permit
	name = "public nudity permit"
	desc = "A clothes-free permit only issued for crew with no visible genitalia."
	icon = 'icons/obj/card.dmi'
	icon_state = "nudity"
	body_parts_covered = 0
	item_state = "nudity"

/obj/item/clothing/under/burial
	name = "burial garments"
	desc = "Traditional burial garments used to clothe the deceased.."
	icon_state = "burial"
	item_state = "burial"

/obj/item/clothing/under/harness
	name = "black gear harness"
	desc = "A black gear harness worn around the body."
	icon_state = "gear_harness"

/obj/item/clothing/under/harness/brown
	name = "brown gear harness"
	desc = "A brown gear harness worn around the body."
	icon_state = "gear_harnessbrown"
	item_state = "gear_harnessbrown"

/obj/item/clothing/under/loincloth
	name = "loincloth"
	desc = "A sturdy cloth that covers the private areas."
	icon_state = "loincloth"

/obj/item/clothing/under/medigown
	name = "medical gown"
	desc = "A medical examination gown, usually worn in operations."
	icon_state = "medicalgown"
	item_state = "medicalgown"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
