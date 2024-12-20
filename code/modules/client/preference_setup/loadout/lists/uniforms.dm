// Uniform slot
/datum/gear/uniform
	display_name = "wedding dress"
	path = /obj/item/clothing/under/bride_white
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"
	cost = 0

/datum/gear/uniform/tracksuit
	display_name = "track suit"
	path = /obj/item/clothing/under/track_suit
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/casualwear
	display_name = "casualwear selection"
	path = /obj/item/clothing/under/top
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/hawaiian
	display_name = "Hawaiian-shirt selection"
	path = /obj/item/clothing/under/hawaiian
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/dismas
	display_name = "highwayman clothes"
	path = /obj/item/clothing/under/dismas

/datum/gear/uniform/cheongsam
	display_name = "cheongsam selection"
	path = /obj/item/clothing/under/cheongsam
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/ashigaru
	display_name = "ashigaru"
	path = /obj/item/clothing/under/ashigaru

/datum/gear/uniform/dress
	display_name = "dress selection"
	path = /obj/item/clothing/under/dress/
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/gorkajumpsuit
	display_name = "gorka jumpsuit selection"
	path = /obj/item/clothing/under/gorka
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/gorkapants
	display_name = "gorka pants selection"
	path = /obj/item/clothing/under/gorkapants
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/bdu
	display_name = "BDU selection"
	path = /obj/item/clothing/under/bdu
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

/datum/gear/uniform/black_suit_skirt
	display_name = "black suit skirt"
	path = /obj/item/clothing/under/suit_jacket/blackskirt

/datum/gear/uniform/fancy_redish_suit
	display_name = "expensive brown suit"
	path =/obj/item/clothing/under/fancy_redish_suit

/datum/gear/uniform/latex_maid
	display_name = "latex maid dress"
	path = /obj/item/clothing/under/costume/kinky/latex_maid

/datum/gear/uniform/classy_maid
	display_name = "maid dress"
	path = /obj/item/clothing/under/costume/maid

/datum/gear/uniform/sexy_maid
	display_name = "sexy maid dress"
	path = /obj/item/clothing/under/sexymaid

/datum/gear/uniform/proper_maid
	display_name = "proper maid dress"
	path = /obj/item/clothing/under/costume/propermaid

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

/datum/gear/uniform/swimsuitrisque
	display_name = "daring swimsuit"
	path = /obj/item/clothing/under/swimsuit_c
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/texansuit
	display_name = "ivory texan suit"
	path = /obj/item/clothing/under/top/dimmadome

/datum/gear/uniform/turtleneck
	display_name = "turtleneck selection"
	path = /obj/item/clothing/under/turtleneck
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/leisure
    display_name = "leisure suits"
    path = /obj/item/clothing/under/leisure

/datum/gear/uniform/leisure/New() //Don't do this. Use GEAR_HAS_TYPE_SELECTION unless the items you want selectable don't share the same valid parent.
	..()
	var/leisure = list(
		"Brown Jacket"			=	/obj/item/clothing/under/leisure,
		"White Blazer"			=	/obj/item/clothing/under/leisure/white,
		"Patterned Pullover"	=	/obj/item/clothing/under/leisure/pullover
	)
	gear_tweaks += new /datum/gear_tweak/path(leisure)

/datum/gear/uniform/stylish_suits
    display_name = "stylish suits"
    path = /obj/item/clothing/under/white

/datum/gear/uniform/stylish_suits/New() //Like so.
	..()
	var/stylish = list(
		"Ivory Suit"				=	/obj/item/clothing/under/white,
		"Blood-red Suit"			=	/obj/item/clothing/under/red,
		"Questionable Suit"			=	/obj/item/clothing/under/green,
		"Ashen Suit"				=	/obj/item/clothing/under/grey,
		"Charcoal Suit"				=	/obj/item/clothing/under/black,
	)
	gear_tweaks += new /datum/gear_tweak/path(stylish)

/datum/gear/uniform/cyber
	display_name = "augmented jumpsuit"
	path = /obj/item/clothing/under/cyber

/datum/gear/uniform/helltaker
	display_name = "black charming outfit"
	path = /obj/item/clothing/under/helltaker

/datum/gear/uniform/helltaker_m
	display_name = "white charming outfit"
	path = /obj/item/clothing/under/helltaker_m

/datum/gear/uniform/johnny
	display_name = "rockerboy clothes"
	path = /obj/item/clothing/under/johnny

/datum/gear/uniform/raider
	display_name = "leather outfit"
	path = /obj/item/clothing/under/raider

/datum/gear/uniform/aerostatic_suit
	display_name = "dark comfortable clothing"
	path = /obj/item/clothing/under/aerostatic_suit

/datum/gear/uniform/jamrock_suit
	display_name = "brown comfortable clothing"
	path = /obj/item/clothing/under/jamrock_suit

/datum/gear/uniform/hunterformal
	display_name = "hunting lodge formal clothing"
	path = /obj/item/clothing/under/costume/misc/hunterformal
	slot = slot_w_uniform
	allowed_roles = list("Lodge Hunter", "Lodge Hunt Master", "Lodge Herbalist")

/datum/gear/uniform/neon
	display_name = "neon tracksuits, color presets"
	path = /obj/item/clothing/under/neon
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/bodysuit
	display_name = "eva skinsuit"
	path = /obj/item/clothing/under/bodysuit

/datum/gear/uniform/skintight
	display_name = "skintight bodysuit"
	path = /obj/item/clothing/under/skintight

/datum/gear/uniform/greyturtleneck
	display_name = "grey turtleneck"
	path = /obj/item/clothing/under/greyturtleneck

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

/datum/gear/uniform/jersey
	display_name = "tacky jersey"
	path = /obj/item/clothing/under/costume/misc/jersey

/datum/gear/uniform/sports
	display_name = "white tank top"
	path = /obj/item/clothing/under/sports
