/*
 * Contains:
 *		Fire protection
 *		Bomb protection
 *		Radiation protection
 */

/*
 * Fire protection
 */
/obj/item/clothing/suit/fire
	name = "firesuit"
	desc = "A suit that protects against fire and heat."
	icon_state = "firesuit"
	item_state = "firefighter"
	w_class = ITEM_SIZE_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	extra_allowed = list(/obj/item/extinguisher,
						 /obj/item/storage/toolbox)
	armor_list = list(
		melee = 2,
		bullet = 0,
		energy = 1,
		bomb = 10,
		bio = 10,
		rad = 0
	)
	slowdown = 0.4
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	item_flags = STOPPRESSUREDAMAGE | COVER_PREVENT_MANIPULATION
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	price_tag = 50



/obj/item/clothing/suit/fire/firefighter
	icon_state = "firesuit"
	item_state = "firefighter"


/obj/item/clothing/suit/fire/heavy
	name = "firesuit"
	desc = "A suit that protects against extreme fire and heat."
	icon_state = "firesuit"
	item_state = "firefighter"
	w_class = ITEM_SIZE_BULKY//bulky item
	slowdown = 1.5

/*
 * Radiation protection
 */
/obj/item/clothing/head/radiation
	name = "radiation hood"
	icon_state = "rad"
	desc = "A hood with radiation protective properties."
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 6,
		bomb = 0,
		bio = 90,
		rad = 100
	)
	price_tag = 50


/obj/item/clothing/suit/radiation
	name = "radiation suit"
	desc = "A suit that protects against radiation."
	icon_state = "rad"
	item_state = "rad_suit"
	w_class = ITEM_SIZE_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	extra_allowed = list(/obj/item/clothing/head/radiation)
	//slowdown = 0.4
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 6,
		bomb = 0,
		bio = 90,
		rad = 100
	)
	flags_inv = HIDEJUMPSUIT|HIDETAIL
	price_tag = 100
