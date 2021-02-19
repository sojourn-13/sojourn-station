/obj/item/clothing/shoes/galoshes
	name = "galoshes"
	desc = "A pair of slip-resistant rubber boots used for janitorial work."
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	siemens_coefficient = 0 // DAMN BOI
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null

/obj/item/clothing/shoes/jackboots
	name = "jackboots"
	desc = "A pair of standard-issue jackboots typically worn by people who need to stomp things."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	armor = list(melee = 15, bullet = 0, energy = 10, bomb = 0, bio = 25, rad = 0)
	siemens_coefficient = 0.6
	can_hold_knife = 1

/obj/item/clothing/shoes/jackboots/german
	name = "brown jackboots"
	desc = "A pair of standard-issue jackboots typically worn by people who need to stomp things. These ones are brown."
	icon_state = "germanboots"

/obj/item/clothing/shoes/jackboots/laced_jackboots
	name = "laced jackboots"
	desc = "Old military boots designed to make look you tacticool."
	icon_state = "laced_jackboots"

/obj/item/clothing/shoes/reinforced
	name = "reinforced boots"
	desc = "A pair of metallic boots designed for industrial environments."
	icon_state = "reinforced"
	item_state = "reinforced"
	armor = list(melee = 15, bullet = 0, energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.5

/obj/item/clothing/shoes/reinforced/medical
	name = "soteria reinforced shoes"
	desc = "Slightly reinforced shoes for soteria medical personnel."
	icon_state = "medshoes"
	item_state = "medshoes"

/obj/item/clothing/shoes/workboots
	name = "workboots"
	desc = "A pair of steel-toed utility workboots."
	icon_state = "workboots"
	item_state = "workboots"
	armor = list(melee = 10, bullet = 0, energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0
	can_hold_knife = 1

/obj/item/clothing/shoes/jackboots/janitor
	name = "custodian's jackboots"
	desc = "Specially altered jackboots for custodians to prevent them from slipping."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	siemens_coefficient = 0.3
	item_flags = NOSLIP
	can_hold_knife = TRUE

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

/obj/item/clothing/shoes/artist_shoes
	name = "Pointy Shoes"
	desc = "They're actually quite comfortable."
	icon_state = "artist"
	item_state = "artist_shoes"

/obj/item/clothing/shoes/hermes_shoes
	name = "Hermes Boots"
	desc = "Boots used by the faithful to spread the word of God more quickly. Sadly not all that good at protecting your feet as other more robust shoes."
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1)
	icon_state = "artist"
	item_state = "artist_shoes"
	slowdown = SHOES_SLOWDOWN - 0.1 //As aposed to clown shoes
