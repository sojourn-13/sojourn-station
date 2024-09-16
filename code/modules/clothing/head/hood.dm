/obj/item/clothing/head/hood
	name = "hood"
	desc = "A generic hood."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR

/*
// Winter coats
/obj/item/clothing/head/hood/winter
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket."
	icon_state = "generic_hood"
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hood/winter/captain
	name = "premier's winter hood"
	armor_list = list(melee = 20, bullet = 15, energy = 10, bomb = 15, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/security
	name = "security winter hood"
	armor_list = list(melee = 6, bullet = 20, energy = 3, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/medical
	name = "medical winter hood"
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/head/hood/winter/science
	name = "science winter hood"
	armor_list = list(melee = 0, bullet = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/hood/winter/engineering
	name = "guild winter hood"
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 20)

/obj/item/clothing/head/hood/winter/engineering/atmos
	name = "atmospherics winter hood"

/obj/item/clothing/head/hood/winter/botany
	name = "botany winter hood"

/obj/item/clothing/head/hood/winter/cargo
	name = "cargo winter hood"

/obj/item/clothing/head/hood/winter/cargo/miner
	name = "mining winter hood"
	armor_list = list(melee = 10, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
*/
// Explorer gear
/obj/item/clothing/head/hood/explorer
	name = "explorer hood"
	desc = "An armoured hood for exploring harsh environments."
	icon_state = "explorer"
	flags = THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 35, bio = 75, rad = 35)

// Costumes
/obj/item/clothing/head/hood/carp_hood
	name = "carp hood"
	desc = "A hood attached to a carp costume."
	icon_state = "carp"
	item_state_slots = list(slot_r_hand_str = "carp_casual", slot_l_hand_str = "carp_casual") //Does not exist -S2-
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE	//Space carp like space, so you should too

/obj/item/clothing/head/hood/ian_hood
	name = "corgi hood"
	desc = "A hood that looks just like a corgi's head, it won't guarantee dog biscuits."
	icon_state = "ian"
	item_state_slots = list(slot_r_hand_str = "ian", slot_l_hand_str = "ian") //Does not exist -S2-

/obj/item/clothing/head/hood/techpriest
	name = "techpriest hood"
	desc = "For larping as the other techno cult."
	icon_state = "techpriest"
	item_state = "techpriest"

/obj/item/clothing/head/hood/absolutecloakhood
	name = "absolute cloak hood"
	desc = "Protect yourself from the elements or conceal your identity, in the name of the Absolute."
	armor_list = list(
		melee = 0,
		bullet = 0, //unarmoured, but bioproof
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 0
	)
	icon_state = "absolutecloakhood"
	item_state = "absolutecloakhood"
