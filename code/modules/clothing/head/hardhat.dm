/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "Headgear for dangerous working conditions. Comes with a built-in light and a variety of colors."
	action_button_name = "Toggle Headlamp"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 10,
		rad = 25
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 30
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/hardhat/New()
	icon_state = "hardhat-[pick("o","y","r","b")]"
	item_state = icon_state
	..()

/obj/item/clothing/head/firefighter/chief
	name = "guild master helmet"
	desc = "A pure white fire resistant hard hat with a powerful headlight and built in nuclear cell. The best utility helmet the guild has."
	icon_state = "hardhat_white"
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Headlamp"
	brightness_on = 6 //luminosity when on
	light_overlay = "hardhat_light"
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 35,
		bio = 10,
		rad = 25
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100