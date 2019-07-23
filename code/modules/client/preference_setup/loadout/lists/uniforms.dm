// Uniform slot
/datum/gear/uniform
	display_name = "utility selection"
	path = /obj/item/clothing/under/overalls
	flags = GEAR_HAS_TYPE_SELECTION
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/jumpsuit
	display_name = "jumpsuit selection"
	path = /obj/item/clothing/under/color/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/dress
	display_name = "dress selection"
	path = /obj/item/clothing/under/plaid
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/scrubs
	display_name = "scrubs selection"
	path = /obj/item/clothing/under/scrubs
	flags = GEAR_HAS_TYPE_SELECTION
	allowed_roles = list("Moebius Paramedic","Moebius Psychiatrist","Moebius Chemist","Moebius Doctor","Moebius Biolab Officer")
	sort_category = "Moebius"

/datum/gear/uniform/jumpsuit2
	display_name = "jumpsuit, customized"
	path = /obj/item/clothing/under/custom
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/onepiecesuit
	display_name = "one piece suit selection"
	path = /obj/item/clothing/under/suit_jacket/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/modularsuit
	display_name = "modular suit selection"
	path = /obj/item/clothing/under/modular/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/pants
	display_name = "pants selection"
	path = /obj/item/clothing/under/pants/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/shorts
	display_name = "shorts selection"
	path = /obj/item/clothing/under/shorts/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/swimsuit
	display_name = "swimsuit selection"
	path = /obj/item/clothing/under/swimsuit/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/skirt
	display_name = "skirt selection"
	path = /obj/item/clothing/under/skirt
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/top
	display_name = "top selection"
	path = /obj/item/clothing/under/top/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/turtleneck
	display_name = "turtleneck selection"
	path = /obj/item/clothing/under/turtleneck/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/cheongsam
	display_name = "cheongsam selection"
	path = /obj/item/clothing/under/cheongsam
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/noselect/detcorporate
	display_name = "inspectors uniform"
	path = /obj/item/clothing/under/detalt
	allowed_roles = list("Ironhammer Inspector")
	slot = slot_w_uniform
	sort_category = "Ironhammer"