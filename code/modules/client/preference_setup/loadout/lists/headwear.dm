/datum/gear/head
	display_name = "ushanka"
	path = /obj/item/clothing/head/ushanka
	slot = slot_head
	sort_category = "Hats and Headwear"

/datum/gear/head/bandana
	display_name = "bandana head selection"
	path = /obj/item/clothing/head/bandana
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beanie
	display_name = "beanie selection"
	path = /obj/item/clothing/head/beanie
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beretselect
	display_name = "beret selection"
	path = /obj/item/clothing/head/beret
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beretselect
	display_name = "beret, customized"
	path = /obj/item/clothing/head/beret/custom
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/boater
	display_name = "boater hat"
	path = /obj/item/clothing/head/boaterhat

/datum/gear/head/bowler
	display_name = "bowler hat selection"
	path = /obj/item/clothing/head/bowler
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

/datum/gear/head/cowboy
	display_name = "cowboy hat selection"
	path = /obj/item/clothing/head/cowboy
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/fedora
	display_name = "fedora selection"
	path = /obj/item/clothing/head/fedora
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/fez
	display_name = "fez"
	path = /obj/item/clothing/head/fez

/datum/gear/head/hardhat
	display_name = "hardhat selection"
	path = /obj/item/clothing/head/hardhat/

/datum/gear/head/hardhat/New()
	..()
	var/hardhat = list(
		"yellow hardhat"			=	/obj/item/clothing/head/hardhat/yellow,
		"red hardhat"				=	/obj/item/clothing/head/hardhat/red,
		"orange hardhat"			=	/obj/item/clothing/head/hardhat/orange,
		"blue hardhat"				=	/obj/item/clothing/head/hardhat/blue,
	)
	gear_tweaks += new /datum/gear_tweak/path(hardhat)

/datum/gear/head/sombrero
	display_name = "sombrero"
	path = /obj/item/clothing/head/sombrero

/datum/gear/head/tophat
	display_name = "top hat selection"
	path = /obj/item/clothing/head/tophat
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/turban
	display_name = "turban"
	path = /obj/item/clothing/head/turban

/datum/gear/head/fishbowl
	display_name = "fishbowl helmet"
	path = /obj/item/clothing/head/costume/misc/fishbowl

/datum/gear/head/rice_hat
	display_name = "rice hat"
	path = /obj/item/clothing/head/rice_hat

/datum/gear/head/ranger
	display_name = "ranger hat"
	path = /obj/item/clothing/head/ranger

/datum/gear/head/tanker_helmet/color_presets
	display_name = "tanker helmet, color presets"
	path = /obj/item/clothing/head/armor/helmet/tanker

/datum/gear/head/tanker_helmet/color_presets/New()
	..()
	var/tanker_helmet = list(
		"Black"		=	/obj/item/clothing/head/armor/helmet/tanker,
		"Green"		=	/obj/item/clothing/head/armor/helmet/tanker/green,
		"Brown"		=	/obj/item/clothing/head/armor/helmet/tanker/brown,
		"Gray"		=	/obj/item/clothing/head/armor/helmet/tanker/gray,
	)
	gear_tweaks += new /datum/gear_tweak/path(tanker_helmet)