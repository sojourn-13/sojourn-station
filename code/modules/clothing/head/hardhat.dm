/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "Headgear for dangerous working conditions. This one is an Artificer's standard yellow design with a built-in light."
	icon_state = "hardhat-y"
	item_state = "hardhat-y"
	action_button_name = "Toggle Headlamp"
	brightness_on = 4 //luminosity when on
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 2,
		bullet = 2,
		energy = 2,
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

/obj/item/clothing/head/hardhat/yellow
	name = "yellow hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in standard Artificer's yellow."
	icon_state = "hardhat-y"
	item_state = "hardhat-y"

/obj/item/clothing/head/hardhat/orange
	name = "orange hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in orange."
	icon_state = "hardhat-o"
	item_state = "hardhat-o"

/obj/item/clothing/head/hardhat/red
	name = "red hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in red."
	icon_state = "hardhat-r"
	item_state = "hardhat-r"

/obj/item/clothing/head/hardhat/blue
	name = "blue hardhat"
	desc = "Headgear for dangerous working conditions with a built-in light. This one comes in blue."
	icon_state = "hardhat-b"
	item_state = "hardhat-b"

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
	armor_list = list(
		melee = 7,
		bullet = 5,
		energy = 5,
		bomb = 35,
		bio = 10,
		rad = 25
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

/obj/item/clothing/head/firefighter/guild_emergency
	name = "emergency guild helmet"
	desc = "A heavy plated and radiation protected hard helmet meant for emergency guild repairs in the most dangerous areas."
	icon_state = "advanced_hardhat"
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	action_button_name = "Toggle Headlamp"
	brightness_on = 8 //luminosity when on
	light_overlay = "hardhat_light"
	armor_list = list(
		melee = 10,
		bullet = 15,
		energy = 12,
		bomb = 75,
		bio = 80,
		rad = 100
	)
	siemens_coefficient = 0.8
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
