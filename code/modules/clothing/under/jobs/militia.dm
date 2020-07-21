/*
 * Contains:
 *		Trooper
 *		Corpsman
 *		Sergeant
 *		Blackshield Commander
 */


/*
 * Cadet
 */

/obj/item/clothing/under/rank/trooper/cadet
	name = "green cadet uniform"
	desc = "A rugged, baggy, one-size-fits-all set of militant and quite slavic two-tone clothes for volunteers, cadets, and conscripts."
	icon_state = "gorka"
	item_state = "gorka"

/*
 * Extra Fatigues
 */

/obj/item/clothing/under/rank/fatigues/green
	name = "green utility uniform"
	desc = "A green utility uniform, bearing the old marks of patches long since removed."
	icon_state = "greenutility"
	item_state = "greenutility"

/obj/item/clothing/under/rank/fatigues/grey
	name = "grey utility uniform"
	desc = "A grey utility uniform, bearing the old marks of patches long since removed."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/under/rank/fatigues/navy
	name = "navy utility uniform"
	desc = "A navy utility uniform, bearing the old marks of patches long since removed."
	icon_state = "navyutility"
	item_state = "navyutility"

/*
 * Trooper/Corpsman
 */

/obj/item/clothing/under/rank/trooper
	name = "blackshield gorka suit"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials and wearing the insignia of the Blackshield."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/trooper/green
	name = "green blackshield gorka"
	desc = "A rugged set of militant and quite slavic two-tone clothes."
	icon_state = "gorka"
	item_state = "gorka"

/obj/item/clothing/under/rank/trooper/tan
	name = "tan blackshield suit"
	desc = "A rugged set of militant and quite slavic two-tone clothes, this time coyote brown on tan."
	icon_state = "gorka_tan"
	item_state = "gorka_tan"

/obj/item/clothing/under/rank/trooper/service
	name = "blackshield service uniform"
	desc = "A modern uniform with dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "trooper_service"
	item_state = "trooper_service"

/obj/item/clothing/suit/rank/trooper/service
	name = "blackshield service jacket"
	desc = "A modern dark blue uniform jacket. Fit for a trooper, even one on the frontier."
	icon_state = "trooper_service"
	item_state = "trooper_service"

/obj/item/clothing/suit/rank/trooper/dress
	name = "blackshield dress jacket"
	desc = "A modern dark blue uniform jacket. Fit for a trooper, even one on the frontier."
	icon_state = "trooper_dress"
	item_state = "trooper_dress"

/obj/item/clothing/under/rank/corpsman
	name = "Medical Corpsman uniform"
	desc = "A durable, baggy uniform featuring blue medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_b"
	item_state = "gorka_ih_med_b"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

	siemens_coefficient = 0.9


/*
 * Sergeant
 */

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

/obj/item/clothing/under/rank/armorer/service
	name = "Blackshield NCO service uniform"
	desc = "A modern uniform with silver trimmings on the dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "sergeant_service"
	item_state = "sergeant_service"

/obj/item/clothing/suit/rank/armorer/service
	name = "Blackshield NCO service jacket"
	desc = "A modern dark blue uniform jacket with silver trimmings. Fit for a mid-level trooper, even one on the frontier."
	icon_state = "sergeant_service"
	item_state = "sergeant_service"

/obj/item/clothing/suit/rank/armorer/dress
	name = "Blackshield NCO dress jacket"
	desc = "A modern dark blue uniform jacket with silver trimmings. Fit for a mid-level trooper, even one on the frontier."
	icon_state = "sergeant_dress"
	item_state = "sergeant_dress"


/*
 * Militia Commander
 */
/obj/item/clothing/under/rank/commander
	name = "commander's combat uniform"
	desc = "It's a uniform worn by those few with the dedication to achieve the position of \"Blackshield Commander\". It has additional armor to protect the wearer."
	icon_state = "gorka_ih"

	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/commander/formal
	name = "commander's dress uniform"
	desc = "It's a uniform worn by those few with the dedication to achieve the position of \"Blackshield Commander\". This version seems old."
	icon_state = "commander"
	item_state = "commander"

/obj/item/clothing/suit/armor/commander/militia
	name = "commander's armored coat"
	desc = "A heavily armored combination of menacing style and cutting-edge body armor wearing the insignia and stripes of the Blackshield Commander."
	icon_state = "commander_mil"
	item_state = "commander_mil"
	siemens_coefficient = 0.6

/obj/item/clothing/under/rank/commander/service
	name = "blackshield command service uniform"
	desc = "A modern uniform with gold trimmings on the dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "commander_service"
	item_state = "commander_service"

/obj/item/clothing/suit/rank/commander/service
	name = "blackshield command service jacket"
	desc = "A modern dark blue uniform jacket with gold trimmings. Fit for a command officer, even one on the frontier."
	icon_state = "commander_service"
	item_state = "commander_service"

/obj/item/clothing/suit/rank/commander/dress
	name = "blackshield command dress jacket"
	desc = "A modern dark blue uniform jacket with gold trimmings. Fit for a command officer, even one on the frontier."
	icon_state = "commander_dress"
	item_state = "commander_dress"

/obj/item/clothing/under/rank/commander/brigservice
	name = "blackshield general's service uniform"
	desc = "A modern uniform with red trimmings on the dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "brigadier_service"
	item_state = "brigadier_service"

/obj/item/clothing/suit/rank/command/brigservice
	name = "blackshield general's service jacket"
	desc = "A modern dark blue uniform jacket with red trimmings. Fit for a general officer, even one on the frontier."
	icon_state = "brigadier_service"
	item_state = "brigadier_service"

/obj/item/clothing/suit/rank/commander/brigdress
	name = "blackshield general's dress jacket"
	desc = "A modern dark blue uniform jacket with red trimmings. Fit for a general officer, even one on the frontier."
	icon_state = "brigadier_dress"
	item_state = "brigadier_dress"
