//Captain's Spacesuit
/obj/item/clothing/head/helmet/space/capspace
	name = "space helmet"
	icon_state = "capspace"
	item_state = "capspace"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Only for the most fashionable of figureheads."
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/space/captain
	name = "Premier's armor"
	desc = "A bulky, heavy-duty piece of exclusive armor."
	icon_state = "caparmor"
	item_state = "capspacesuit"
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 12,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	stiffness = MEDIUM_STIFFNESS

//Marqua Captain's Spacesuit
/obj/item/clothing/head/helmet/space/marqua
	name = "Mar'quaian exploration helmet"
	icon_state = "skrell_helmet_white"
	item_state = "skrell_helmet_white"
	desc = "A well padded helmet, fitted with a heads up display on its visor, keeping its occupant well aware of the surroundings with a small built in light."
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	price_tag = 2000

/obj/item/clothing/suit/space/marqua
	name = "Mar'quaian exploration suit"
	desc = "A well padded voidsuit, yet still light and agile, it allows for effective exploration in the void, and on an planet."
	icon_state = "skrell_suit_white"
	item_state = "skrell_suit_white"
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 12,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	stiffness = MEDIUM_STIFFNESS
