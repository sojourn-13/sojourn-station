/datum/gear/accessory
	slot = slot_accessory_buffer
	display_name = "wallet"
	path = /obj/item/weapon/storage/wallet
	sort_category = "Accessories"

/datum/gear/accessory/armband
	display_name = "armband selection"
	path = /obj/item/clothing/accessory/armband
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/holster
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Ironhammer Commander","Ironhammer Gunnery Sergeant","Ironhammer Inspector","Ironhammer Medical Specialist","Ironhammer Operative","First Officer","Captain")
	sort_category = "Faction: Ironhammer"

/datum/gear/accessory/tie
	display_name = "tie selection"
	path = /obj/item/clothing/accessory/tie
	slot = slot_w_uniform
	flags = GEAR_HAS_TYPE_SELECTION
