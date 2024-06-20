/*
 * Bomb protection
 */
/obj/item/clothing/head/helmet/space/bomb
	name = "bomb helmet"
	desc = "A protective helmet designed for safety when handling explosives, biological problems, and radiation."
	icon_state = "bombsuit"
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 7,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	max_upgrades = 3
	siemens_coefficient = 0
	tint = TINT_LOW
	obscuration = HEAVY_OBSCURATION
	price_tag = 100

/obj/item/clothing/suit/space/bomb
	name = "bomb suit"
	desc = "A protective suit designed for safety when handling explosives, biological problems, and radiation."
	icon_state = "bombsuit"
	item_state = "bombsuit"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	slowdown = 1
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 7,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 3
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	equip_delay = 10 SECONDS
	price_tag = 300

/obj/item/clothing/head/helmet/space/bomb/security
	name = "juggernaut bomb helmet"
	desc = "For use when bombs, bullets, toxic enviroments, lasers, and melee are all a concern but speed is not."
	equip_delay = 16 SECONDS
	slowdown = 1.25 //so with full suit is 3.5 or 4.5
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	icon_state = "bombsuitsec"

/obj/item/clothing/suit/space/bomb/security
	name = "juggernaut bomb suit"
	desc = "For use when bombs, bullets, toxic enviroments, lasers, and melee are all a concern but speed is not."
	slowdown = 2.25
	equip_delay = 16 SECONDS
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 100,
		bio = 100,
		rad = 90
	)
	icon_state = "bombsuitsec"
