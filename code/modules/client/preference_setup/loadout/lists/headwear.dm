/datum/gear/head
	display_name = "ushanka"
	path = /obj/item/clothing/head/ushanka
	slot = slot_head
	sort_category = "Hats and Headwear"

/datum/gear/head/fez
	display_name = "fez"
	path = /obj/item/clothing/head/fez

/datum/gear/head/beret/bsec_officer
	display_name = "beret, operative"
	path = /obj/item/clothing/head/sec/navy/officer
	allowed_roles = list("Ironhammer Operative")
	sort_category = "Faction: Ironhammer"

/datum/gear/head/beret/bsec_warden
	display_name = "beret, warden"
	path = /obj/item/clothing/head/sec/navy/warden
	allowed_roles = list("Ironhammer Gunnery Sergeant")
	sort_category = "Faction: Ironhammer"

/datum/gear/head/beret/bsec_hos
	display_name = "beret, commander"
	path = /obj/item/clothing/head/sec/navy/hos
	allowed_roles = list("Ironhammer Commander")
	sort_category = "Faction: Ironhammer"

/datum/gear/head/engineering
	display_name = "beret, engineering"
	allowed_roles = list("Technomancer", "Technomancer Exultant")
	path = /obj/item/clothing/head/engineering
	sort_category = "Faction: Technomancer"
	allowed_roles = list(JOBS_ENGINEERING)

/datum/gear/head/hardhat
	display_name = "hardhat selection"
	path = /obj/item/clothing/head/hardhat/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/cap
	display_name = "cap selection"
	path = /obj/item/clothing/head/soft/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/sombrero
	display_name = "sombrero"
	path = /obj/item/clothing/head/sombrero

/datum/gear/head/beanie
	display_name = "beanie selection"
	path = /obj/item/clothing/head/beanie
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/capcustom
	display_name = "cap, customized"
	path = /obj/item/clothing/head/customcap
	slot = slot_head
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/surgical
	display_name = "surgical cap selection"
	path = /obj/item/clothing/head/surgery/
	allowed_roles = list("Moebius Paramedic","Moebius Psychiatrist","Moebius Chemist","Moebius Doctor","Moebius Biolab Officer")
	cost = 1
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: Moebius"

/datum/gear/head/bandana
	display_name = "bandana head selection"
	path = /obj/item/clothing/head/bandana
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beretselect
	display_name = "beret selection"
	path = /obj/item/clothing/head/beret
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/tophat
	display_name = "top hat selection"
	path = /obj/item/clothing/head/tophat
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/bowler
	display_name = "bowler hat selection"
	path = /obj/item/clothing/head/bowler
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/fez
	display_name = "fez"
	path = /obj/item/clothing/head/fez

/datum/gear/head/boater
	display_name = "boater hat"
	path = /obj/item/clothing/head/boaterhat

/datum/gear/head/cowboy
	display_name = "cowboy hat selection"
	path = /obj/item/clothing/head/cowboy
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/fedora
	display_name = "fedora selection"
	path = /obj/item/clothing/head/fedora
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/corp
	display_name = "cap, inspector"
	path = /obj/item/clothing/head/seccorp
	allowed_roles = list("Ironhammer Inspector")
	sort_category = "Faction: Ironhammer"

/datum/gear/head/sec
	display_name = "cap, ironhammer"
	path = /obj/item/clothing/head/seccap
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")
	sort_category = "Faction: Ironhammer"