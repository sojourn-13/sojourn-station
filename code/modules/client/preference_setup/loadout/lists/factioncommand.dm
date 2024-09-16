/datum/gear/factioncommand
	display_name = "winter coat, premier"
	path = /obj/item/clothing/suit/hooded/wintercoat/captain
	allowed_roles = list("Premier")
	slot = slot_wear_suit
	sort_category = "Faction: Command"
	cost = 0

/datum/gear/factioncommand/cloakcaptain
	display_name = "cloak, premier"
	path = /obj/item/clothing/accessory/job/cape
	allowed_roles = list("Premier")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/cloakfo
	display_name = "cloak, steward"
	path = /obj/item/clothing/accessory/job/cape/fo
	allowed_roles = list("Steward")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/snowsuitcommand
	display_name = "snowsuit, command"
	path = /obj/item/clothing/suit/storage/snowsuit/command
	allowed_roles = list("Premier","Steward")
	slot = slot_wear_suit
	sort_category = "Faction: Command"

/datum/gear/factioncommand/winterbootscommand
	display_name = "winter boots, command"
	path = /obj/item/clothing/shoes/winter/command
	allowed_roles = list("Premier","Steward")
	slot = slot_shoes
	sort_category = "Faction: Command"

/datum/gear/factioncommand/captaingreatcoat
	display_name = "greatcoat, premier"
	path = /obj/item/clothing/suit/greatcoat/cap
	allowed_roles = list("Premier")
	slot = slot_wear_suit
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: Command"

/datum/gear/factioncommand/captainturtleneck
	display_name = "turtleneck, premier"
	path = /obj/item/clothing/under/turtleneck/premier
	allowed_roles = list("Premier")
	slot = slot_w_uniform
	sort_category = "Faction: Command"
	cost = 0
