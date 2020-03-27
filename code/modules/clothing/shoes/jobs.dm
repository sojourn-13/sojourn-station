/obj/item/clothing/shoes/galoshes
	name = "galoshes"
	desc = "A pair of slip-resistant rubber boots used for janitorial work."
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	siemens_coefficient = 0 // DAMN BOI
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null
	drop_sound = 'sound/items/drop/rubber.ogg'

/obj/item/clothing/shoes/jackboots
	name = "jackboots"
	desc = "A pair of standard-issue jackboots typically worn by security personnel."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.6
	can_hold_knife = 1
	drop_sound = 'sound/items/drop/boots.ogg'

/obj/item/clothing/shoes/reinforced
	name = "reinforced boots"
	desc = "A pair of metallic boots designed for industrial environments."
	icon_state = "reinforced"
	item_state = "reinforced"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.5
	drop_sound = 'sound/items/drop/boots.ogg'

/obj/item/clothing/shoes/workboots
	name = "workboots"
	desc = "A pair of steel-toed utility workboots."
	icon_state = "workboots"
	item_state = "workboots"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 25
	)
	siemens_coefficient = 0
	can_hold_knife = 1
	drop_sound = 'sound/items/drop/boots.ogg'

/obj/item/clothing/shoes/jackboots/toeless
	name = "toeless jackboots"
	desc = "A modified pair of jackboots, designed for species with clawed feet."
	icon_state = "digiboots"
	species_restricted = null

/obj/item/clothing/shoes/workboots/toeless
	name = "toeless workboots"
	desc = "A modified pair of workboots, designed for species with clawed feet."
	icon_state = "workbootstoeless"
	species_restricted = null
