// Uniform slot
/datum/gear/uniform
	display_name = "casualwear selection"
	path = /obj/item/clothing/under/casual
	flags = GEAR_HAS_TYPE_SELECTION
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/jumpsuit
	display_name = "jumpsuit selection"
	path = /obj/item/clothing/under/color/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/scrubs
	display_name = "scrubs selection"
	path = /obj/item/clothing/under/scrubs
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Moebius Paramedic","Moebius Psychiatrist","Moebius Chemist","Moebius Doctor","Moebius Biolab Officer","Moebius Expedition Overseer","Moebius Scientist","Moebius Roboticist","Ironhammer Medical Specialist")

/datum/gear/uniform/jumpsuit2
	display_name = "jumpsuit customized"
	path = /obj/item/clothing/under/custom
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/suit
	display_name = "suit selection"
	path = /obj/item/clothing/under/suit_jacket/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/shorts
	display_name = "shorts selection"
	path = /obj/item/clothing/under/shorts/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/swimsuit
	display_name = "swimsuit selection"
	path = /obj/item/clothing/under/swimsuit/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/pyjamas
	display_name = "pyjamas selection"
	path = /obj/item/clothing/under/pj/
	flags = GEAR_HAS_TYPE_SELECTION