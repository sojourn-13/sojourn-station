/*
 * Contains:
 *		Trooper
 *		Corpsman
 *		Armorer
 *		Militia Commander
 */

/*
 * Militia
 */


/obj/item/clothing/under/rank/trooper
	name = "Militia gorka suit"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials and wearing the insignia of the Blackshield Militia."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/trooper/green
	name = "green Militia gorka"
	desc = "A rugged set of militant and quite slavic two-tone clothes."
	icon_state = "gorka"
	item_state = "gorka"

/obj/item/clothing/under/rank/trooper/tan
	name = "tan Militia suit"
	desc = "A rugged set of militant and quite slavic two-tone clothes, this time coyote brown on tan."
	icon_state = "gorka_tan"
	item_state = "gorka_tan"

/obj/item/clothing/under/rank/corpsman
	name = "Medical Corpsman uniform"
	desc = "A durable, baggy uniform featuring blue medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_b"
	item_state = "gorka_ih_med_b"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

	siemens_coefficient = 0.9


/obj/item/clothing/under/rank/armorer
	name = "Sergeant's uniform"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials and wearing the pins of a blackshield sergeant."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/armorer/green
	name = "green sergeant's gorka"
	desc = "A rugged set of militant and quite slavic two-tone clothes with the pins of a blackshield sergeant."
	icon_state = "gorka"
	item_state = "gorka"

/obj/item/clothing/under/tactical
	name = "tactical turtleneck"
	desc = "A reinforced military turtleneck, designed to provide moderate combat protection."
	icon_state = "syndicate"

	siemens_coefficient = 0.9

/obj/item/clothing/under/instructor
	name = "Drill Instuctor uniform"
	desc = "Show 'em your war face."
	icon_state = "instructor"
	item_state = "instructor"
/
/*
 * Militia Commander
 */
/obj/item/clothing/under/rank/commander
	name = "Milita Commander's combat uniform"
	desc = "It's a uniform worn by those few with the dedication to achieve the position of \"Blackshield Commander\". It has additional armor to protect the wearer."
	icon_state = "gorka_ih"

	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/commander/formal
	name = "Milita Commander's dress uniform"
	desc = "It's a uniform worn by those few with the dedication to achieve the position of \"Blackshield Commander\"."
	icon_state = "commander"
	item_state = "commander"

/obj/item/clothing/suit/armor/commander/militia
	name = "Militia Commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor wearing the insignia and stripes of the Blackshield Militia Commander."
	icon_state = "commander_mil"
	item_state = "commander_mil"
	siemens_coefficient = 0.6

//Cadet
/obj/item/clothing/under/rank/trooper/cadet
	name = "green cadet uniform"
	desc = "A rugged, baggy, one-size-fits-all set of militant and quite slavic two-tone clothes for volunteers, cadets, and conscripts."
	icon_state = "gorka"
	item_state = "gorka"
