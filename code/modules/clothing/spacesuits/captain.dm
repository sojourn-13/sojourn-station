//Captain's Spacesuit
/obj/item/clothing/head/helmet/space/capspace
	name = "space helmet"
	icon_state = "capspace"
	item_state = "capspace"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Only for the most fashionable of figureheads."
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 40,
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
		melee = 40,
		bullet = 30,
		energy = 50,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	stiffness = MEDIUM_STIFFNESS
