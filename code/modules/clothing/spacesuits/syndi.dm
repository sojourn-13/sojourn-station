//Regular syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate
	name = "red space helmet"
	icon_state = "syndicate"
	item_state = "syndicate"
	desc = "A crimson helmet sporting clean lines and durable plating. Engineered to look menacing."
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/syndicate
	name = "red space suit"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A crimson spacesuit sporting clean lines and durable plating. Robust, reliable, and slightly suspicious."
	w_class = ITEM_SIZE_NORMAL
	slowdown = 1
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6
	stiffness = LIGHT_STIFFNESS

//Its a soft suit basicly but no slowdown
/obj/item/clothing/head/helmet/space/os
	name = "greyson positronic space helm"
	icon_state = "os_spacehelm"
	item_state = "os_spacehelm"
	desc = "A helmet produced by GP. It's outdated but sleek design makes it still viable to use even after all these years."
	flash_protection = FLASH_PROTECTION_MODERATE
	tint = TINT_NONE
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/os
	name = "greyson positronic space suit"
	icon_state = "os_spacesuit"
	item_state = "os_spacesuit"
	desc = "A engineering space suit with slight armor plates to help protect the warer form space dust and haul breaches well not impeeding speed, folds up really tightly as well.."
	w_class = ITEM_SIZE_NORMAL
	slowdown = 0
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/space/os/nova
	name = "Greyson Star Traders Enviromental Helm"
	icon_state = "gsn_spacehelm"
	item_state = "gsn_spacehelm"
	desc = "A helmet produced by Greyson Star Traders. It's more outdated than the usual version, but with sleekier design makes it still viable to use even after all these years."
	flash_protection = FLASH_PROTECTION_MINOR
	tint = TINT_NONE
	armor_list = list( // nerf the value compared to the original
		melee = 10,
		bullet = 5,
		energy = 15,
		bomb = 5,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.3 // half of the original helm value

/obj/item/clothing/suit/space/os/nova
	name = "Greyson Star Traders Enviromental Suit"
	icon_state = "os_spacesuit"
	item_state = "os_spacesuit"
	desc = "A engineering space suit with slight armor plates to help protect the warer form space dust and haul breaches well not impeeding speed, folds up really tightly as well.."
	w_class = ITEM_SIZE_NORMAL
	slowdown = 0
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 15,
		bomb = 0,
		bio = 100,
		rad = 15
	)
	siemens_coefficient = 0.3

//Upgraded version of the above, found rarely in greyson loot.
/obj/item/clothing/head/helmet/space/void/greyson
	name = "greyson 'zhengdou' hardsuit helm" //Credit for sprites go to Près de l'oiseau over at Eris
	icon_state = "os_hardsuit_helm"
	item_state = "os_hardsuit_helm"
	desc = "A combat rated hard-suit helmet produced by GP. Despite its age, the sleek suit still stands up against its more modern counterparts."
	flash_protection = FLASH_PROTECTION_MODERATE
	tint = TINT_NONE
	armor_list = list(
		melee = 40,
		bullet = 45,
		energy = 45,
		bomb = 45,
		bio = 100,
		rad =  25
	)
	siemens_coefficient = 0.6

/obj/item/clothing/suit/space/void/greyson
	name = "greyson 'zhengdou' hardsuit" //Credit for sprites go to Près de l'oiseau over at Eris
	icon_state = "os_hardsuit"
	item_state = "os_hardsuit"
	desc = "A combat rated hard-suit produced by GP. Despite its age, the sleek suit still stands up against its more modern counterparts and is surprisingly comfortable!"
	w_class = ITEM_SIZE_BULKY
	slowdown = 0
	helmet = /obj/item/clothing/head/helmet/space/void/greyson
	armor_list = list(
		melee = 40,
		bullet = 50,
		energy = 50,
		bomb = 45,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.6
