// Uniform slot
/datum/gear/uniform
	display_name = "wedding dress"
	path = /obj/item/clothing/under/bride_white
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/casualwear
	display_name = "casualwear selection"
	path = /obj/item/clothing/under/top
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/cheongsam
	display_name = "cheongsam selection"
	path = /obj/item/clothing/under/cheongsam
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/dress
	display_name = "dress selection"
	path = /obj/item/clothing/under/plaid
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/gorkajumpsuit
	display_name = "gorka jumpsuit selection"
	path = /obj/item/clothing/under/gorka
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/gorkapants
	display_name = "gorka pants selection"
	path = /obj/item/clothing/under/gorkapants
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/jeans
	display_name = "jeans selection"
	path = /obj/item/clothing/under/jeans
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/jumpsuit
	display_name = "jumpsuit selection"
	path = /obj/item/clothing/under/color
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/jumpsuit2
	display_name = "jumpsuit, customized"
	path = /obj/item/clothing/under/custom
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/jumpskirt
	display_name = "jumpskirt selection"
	path = /obj/item/clothing/under/colorskirt
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/jumpskirt2
	display_name = "jumpskirt, customized"
	path = /obj/item/clothing/under/customskirt
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/latex_maid
	display_name = "latex maid dress"
	path = /obj/item/clothing/under/costume/kinky/latex_maid

/datum/gear/uniform/modularsuit
	display_name = "modular suit selection"
	path = /obj/item/clothing/under/modular
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/onepiecesuit
	display_name = "one piece suit selection"
	path = /obj/item/clothing/under/suit_jacket
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/overalls
	display_name = "overalls selection"
	path = /obj/item/clothing/under/overalls
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/pants
	display_name = "pants selection"
	path = /obj/item/clothing/under/pants
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/shorts
	display_name = "shorts selection"
	path = /obj/item/clothing/under/shorts
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/skirt
	display_name = "skirt selection"
	path = /obj/item/clothing/under/skirt
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/swimsuit
	display_name = "swimsuit selection"
	path = /obj/item/clothing/under/swimsuit
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/turtleneck
	display_name = "turtleneck selection"
	path = /obj/item/clothing/under/turtleneck
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/leisure
    display_name = "leisure suits"
    path = /obj/item/clothing/under/leisure

/datum/gear/uniform/leisure/New()
	..()
	var/leisure = list(
		"Brown Jacket"			=	/obj/item/clothing/under/leisure,
		"White Blazer"			=	/obj/item/clothing/under/leisure/white,
		"Patterned Pullover"	=	/obj/item/clothing/under/leisure/pullover
	)
	gear_tweaks += new /datum/gear_tweak/path(leisure)

/datum/gear/uniform/dress
    display_name = "dresses"
    path = /obj/item/clothing/under/dress

/datum/gear/uniform/dress/New()
	..()
	var/dress = list(
		"Gray Dress"			=	/obj/item/clothing/under/dress,
		"Blue Dress"			=	/obj/item/clothing/under/dress/blue,
		"Red Dress"				=	/obj/item/clothing/under/dress/red
	)
	gear_tweaks += new /datum/gear_tweak/path(dress)

/datum/gear/uniform/cyber
	display_name = "augmented jumpsuit"
	path = /obj/item/clothing/under/cyber

/datum/gear/uniform/jersey
	display_name = "church overalls"
	path = /obj/item/clothing/under/jersey

/datum/gear/uniform/churchsport
	display_name = "church sport clothes"
	path = /obj/item/clothing/under/rank/church/sport

/datum/gear/uniform/churchnonrank
	display_name = "church clothes"
	path = /obj/item/clothing/under/rank/church

/datum/gear/uniform/neon
	display_name = "neon tracksuits, color presets"
	path = /obj/item/clothing/under/neon
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/generic
	display_name = "generic outfit, color presets"
	path = /obj/item/clothing/under/genericb

/datum/gear/uniform/generic/New()
	..()
	var/generic = list(
		"blue" = /obj/item/clothing/under/genericb,
		"red" = /obj/item/clothing/under/genericr,
		"white" = /obj/item/clothing/under/genericw
	)
	gear_tweaks += new /datum/gear_tweak/path(generic)