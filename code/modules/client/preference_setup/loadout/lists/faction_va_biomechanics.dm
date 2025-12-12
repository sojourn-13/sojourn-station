/datum/gear/factionsoteria
	display_name = "winter coat, soteria research"
	path = /obj/item/clothing/suit/hooded/wintercoat/science
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"
	cost = 0

/datum/gear/factionsoteria/cloakmbo
	display_name = "cloak, biolab overseer"
	path = /obj/item/clothing/accessory/job/cape/mbo
	allowed_roles = list("Chief Biolab Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/cloakmeo
	display_name = "cloak, research overseer"
	path = /obj/item/clothing/accessory/job/cape/meo
	allowed_roles = list("Chief Research Overseer")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/cloakmedical
	display_name = "cloak, soteria medical"
	path = /obj/item/clothing/accessory/job/cape/medical
	allowed_roles = list("Vesalius-Andra Doctor","Vesalius-Andra Biolab Officer","Vesalius-Andra Lifeline Technician", "Vesalius-Andra Medical Resident")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/cloakscience
	display_name = "cloak, soteria research"
	path = /obj/item/clothing/accessory/job/cape/science
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/si_bdu
	display_name = "recovery team bdu"
	path = /obj/item/clothing/under/rank/paramedic/bdu
	allowed_roles = list("Vesalius-Andra Doctor","Chief Biolab Overseer","Vesalius-Andra Lifeline Technician", "Vesalius-Andra Medical Resident")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/gorka_crew_med
	display_name = "gorka jacket, soteria medical"
	path = /obj/item/clothing/suit/gorka/toggle/crew_med
	allowed_roles = list("Vesalius-Andra Doctor","Chief Biolab Overseer","Vesalius-Andra Lifeline Technician", "Vesalius-Andra Medical Resident")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/gorka_crew_sci
	display_name = "gorka jacket, soteria research"
	path = /obj/item/clothing/suit/gorka/toggle/gorka_crew_sci
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Lifeline Technician")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/gorkamoebiusmedical
	display_name = "gorka jumpsuit, soteria medical"
	path = /obj/item/clothing/under/rank/medical/gorka_crew_med
	allowed_roles = list("Vesalius-Andra Doctor","Chief Biolab Overseer","Vesalius-Andra Lifeline Technician")
	slot = slot_w_uniform
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/gorkamoebiusscientist
	display_name = "gorka jumpsuit, soteria research"
	path = /obj/item/clothing/under/rank/scientist/gorka_crew_sci
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_w_uniform
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/gorkapantsmedical
	display_name = "gorka pants, soteria medical"
	path = /obj/item/clothing/under/rank/medical/gorkapantscrewmed
	allowed_roles = list("Vesalius-Andra Doctor","Chief Biolab Overseer","Vesalius-Andra Lifeline Technician", "Vesalius-Andra Medical Resident")
	slot = slot_w_uniform
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/medicalhud
	display_name = "medical HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list(JOBS_MEDICAL)
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/medicalscouter
	display_name = "medical HUD, scouter"
	path = /obj/item/clothing/glasses/hud/health/scouter
	allowed_roles = list("Chief Biolab Overseer","Vesalius-Andra Doctor","Vesalius-Andra Lifeline Technician","Corpsman", "Vesalius-Andra Medical Resident")
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/medicalhalfmoon
	display_name = "medical HUD, halfmoon glasses"
	path = /obj/item/clothing/glasses/hud/health/halfmoon
	allowed_roles = list("Chief Biolab Overseer","Vesalius-Andra Doctor","Vesalius-Andra Lifeline Technician","Corpsman", "Vesalius-Andra Medical Resident")
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/hudpatch
	display_name = "medical HUD, eyepatch"
	path = /obj/item/clothing/glasses/eyepatch/medpatch
	allowed_roles = list("Chief Biolab Overseer","Vesalius-Andra Doctor","Vesalius-Andra Lifeline Technician","Corpsman", "Vesalius-Andra Medical Resident")
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/sciencegoggles
	display_name = "science goggles"
	path = /obj/item/clothing/glasses/powered/science
	allowed_roles = list(JOBS_SCIENCE)
	slot = slot_glasses
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/scrubs
	display_name = "scrubs selection"
	path = /obj/item/clothing/under/scrubs
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Vesalius-Andra Psychiatrist","Vesalius-Andra Lifeline Technician","Vesalius-Andra Doctor","Chief Biolab Overseer", "Vesalius-Andra Medical Resident")
	slot = slot_w_uniform
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/surgical
	display_name = "surgical cap selection"
	path = /obj/item/clothing/head/surgery/
	allowed_roles = list("Vesalius-Andra Psychiatrist","Vesalius-Andra Lifeline Technician","Vesalius-Andra Doctor","Chief Biolab Overseer", "Vesalius-Andra Medical Resident")
	cost = 1
	slot = slot_head
	flags = GEAR_HAS_TYPE_SELECTION
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/snowsuitmedical
	display_name = "snowsuit, soteria medical"
	path = /obj/item/clothing/suit/storage/snowsuit/medical
	allowed_roles = list("Vesalius-Andra Psychiatrist","Vesalius-Andra Orderly","Vesalius-Andra Lifeline Technician","Chief Biolab Overseer", "Vesalius-Andra Medical Resident")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/snowsuitscience
	display_name = "snowsuit, soteria research"
	path = /obj/item/clothing/suit/storage/snowsuit/science
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/winterbootsmedical
	display_name = "winter boots, soteria medical"
	path = /obj/item/clothing/shoes/winter/medical
	allowed_roles = list("Vesalius-Andra Psychiatrist","Vesalius-Andra Lifeline Technician","Vesalius-Andra Doctor","Chief Biolab Overseer")
	slot = slot_shoes
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/winterbootsscience
	display_name = "winter boots, soteria research"
	path = /obj/item/clothing/shoes/winter/science
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_shoes
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/wintercoatmedical
	display_name = "winter coat, soteria medical"
	path = /obj/item/clothing/suit/hooded/wintercoat/medical
	allowed_roles = list("Vesalius-Andra Psychiatrist","Vesalius-Andra Lifeline Technician","Vesalius-Andra Doctor","Chief Biolab Overseer", "Vesalius-Andra Medical Resident")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/labcoatmembrane
	display_name = "labcoat, membrane"
	path = /obj/item/clothing/suit/storage/membrane
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_wear_suit
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/glovesscience
	display_name = "gloves, scientific"
	path = /obj/item/clothing/gloves/membrane
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_gloves
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/glovesscience
	display_name = "gloves, scientific"
	path = /obj/item/clothing/gloves/membrane
	allowed_roles = list("Chief Research Overseer","Vesalius-Andra Scientist","Vesalius-Andra Roboticist")
	slot = slot_gloves
	sort_category = "Faction: Vesalius-Andra"

/datum/gear/factionsoteria/penlight
	display_name = "medical penlight"
	path = /obj/item/device/lighting/toggleable/flashlight/pen
	allowed_roles = list("Vesalius-Andra Lifeline Technician","Vesalius-Andra Doctor","Chief Biolab Overseer", "Vesalius-Andra Medical Resident")
	slot = slot_r_ear
	sort_category = "Faction: Vesalius-Andra"
	cost = 0
