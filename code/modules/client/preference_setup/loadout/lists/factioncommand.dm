/datum/gear/factioncommand
	display_name = "winter coat, captain"
	path = /obj/item/clothing/suit/hooded/wintercoat/captain
	allowed_roles = list("Captain")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/cloakcaptain
	display_name = "cloak, captain"
	path = /obj/item/clothing/suit/hooded/cloak/job/captain
	allowed_roles = list("Captain")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/cloakfo
	display_name = "cloak, first officer"
	path = /obj/item/clothing/suit/hooded/cloak/job/fo
	allowed_roles = list("First Officer")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/snowsuitcommand
	display_name = "snowsuit, command"
	path = /obj/item/clothing/suit/storage/snowsuit/command
	allowed_roles = list("Captain","First Officer")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/winterbootscommand
	display_name = "winter boots, command"
	path = /obj/item/clothing/shoes/winter/command
	allowed_roles = list("Captain","First Officer")
	slot = slot_shoes
	sort_category = "Faction: Command"

/datum/gear/factioncommand/captaingreatcoat
	display_name = "greatcoat, captain"
	path = /obj/item/clothing/suit/greatcoat/cap
	allowed_roles = list("Captain")
	slot = slot_wear_suit
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: Command"
