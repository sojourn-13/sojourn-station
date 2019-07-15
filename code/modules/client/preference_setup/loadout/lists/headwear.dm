/datum/gear/head/
	display_name = "natural philosopher's wig"
	path = /obj/item/clothing/head/philosopher_wig
	slot = slot_head
	sort_category = "Hats and Headwear"

/datum/gear/head/beret/bsec_officer
	display_name = "beret, navy (officer)"
	path = /obj/item/clothing/head/sec/navy/officer
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Gunnery Sergeant")

/datum/gear/head/beret/bsec_warden
	display_name = "beret, navy (warden)"
	path = /obj/item/clothing/head/sec/navy/warden
	allowed_roles = list("Ironhammer Commander","Gunnery Sergeant")

/datum/gear/head/beret/bsec_hos
	display_name = "beret, navy (hos)"
	path = /obj/item/clothing/head/sec/navy/hos
	allowed_roles = list("Ironhammer Commander")

/datum/gear/head/engineering
	display_name = "beret, engineering"
	allowed_roles = list("Ironhammer Commander")
	path = /obj/item/clothing/head/engineering

/datum/gear/head/beret/sec
	display_name = "beret, security"
	path = /obj/item/clothing/head/sec
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Gunnery Sergeant")

/datum/gear/head/cap/corp
	display_name = "cap, corporate security"
	path = /obj/item/clothing/head/sec/corp
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Gunnery Sergeant", "Inspector")

/datum/gear/head/cap/sec
	display_name = "cap, security"
	path = /obj/item/clothing/head/sec
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Gunnery Sergeant", "Inspector")

/datum/gear/head/hardhat
	display_name = "hardhat selection"
	path = /obj/item/clothing/head/hardhat/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/cap
	display_name = "cap selection"
	path = /obj/item/clothing/head/soft/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/capcustom
	display_name = "cap, customized"
	path = /obj/item/clothing/head/customcap
	slot = slot_head
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/hat
	display_name = "hat selection"
	path = /obj/item/clothing/head/hat/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/surgical
	display_name = "surgical cap selection"
	path = /obj/item/clothing/head/surgery/
	allowed_roles = list("Moebius Paramedic","Moebius Psychiatrist","Moebius Chemist","Moebius Doctor","Moebius Biolab Officer","Moebius Expedition Overseer","Moebius Scientist","Moebius Roboticist","Ironhammer Medical Specialist")
	cost = 2
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/bandana
	display_name = "bandana head selection"
	path = /obj/item/clothing/head/bandana
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beretselect
	display_name = "beret selection"
	path = /obj/item/clothing/head/beret
	flags = GEAR_HAS_TYPE_SELECTION
