// Eyes
/datum/gear/eyes
	display_name = "eyepatch"
	path = /obj/item/clothing/glasses/eyepatch
	slot = slot_glasses
	sort_category = "Glasses and Eyewear"

/datum/gear/eyes/glasses/monocle
	display_name = "monocle"
	path = /obj/item/clothing/glasses/monocle

/datum/gear/eyes/sciencegoggles
	display_name = "science goggles"
	path = /obj/item/clothing/glasses/powered/science
	allowed_roles = list("Moebius Expedition Overseer","Moebius Scientist","Moebius Roboticist")
	sort_category = "Faction: Moebius"

/datum/gear/eyes/security
	display_name = "security HUD"
	path = /obj/item/clothing/glasses/hud/security
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")
	sort_category = "Faction: Ironhammer"

/datum/gear/eyes/medical
	display_name = "medical HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list("Moebius Doctor","Moebius Biolab Officer","Moebius Chemist","Moebius Paramedic")
	sort_category = "Faction: Moebius"

/datum/gear/eyes/regular
	display_name = "glasses selection"
	path = /obj/item/clothing/glasses/regular
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/eyes/shades
	display_name = "sunglasses selection"
	path = /obj/item/clothing/glasses/sunglasses
	flags = GEAR_HAS_TYPE_SELECTION
