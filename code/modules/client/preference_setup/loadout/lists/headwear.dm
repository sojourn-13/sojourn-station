/datum/gear/head
	display_name = "ushanka"
	path = /obj/item/clothing/head/ushanka
	slot = slot_head
	sort_category = "Hats and Headwear"
	cost = 0

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

/datum/gear/head/beretselect_fancy
	display_name = "fashionable beret selection"
	path = /obj/item/clothing/head/beret/fashion
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/beretcustom
	display_name = "beret, customized"
	path = /obj/item/clothing/head/beret/custom
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/bikerhelmet
	display_name = "biker helmet selection"
	path = /obj/item/clothing/head/helmet/biker
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 2 //Has some good armor

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

/datum/gear/head/headscarf
	display_name = "headscarf"
	path = /obj/item/clothing/head/headscarf

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
	cost = 1

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

/datum/gear/head/jingasa
	display_name = "jingasa"
	path = /obj/item/clothing/head/jingasa

/datum/gear/head/headband
	display_name = "headband, customized"
	path = /obj/item/clothing/head/headband
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/strawhat
	display_name = "strawhat selection"
	path = /obj/item/clothing/head/headband
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/sunhat
	display_name = "sunhat selection"
	path = /obj/item/clothing/head/sunhat
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/tiara
	display_name = "tiara, customized"
	path = /obj/item/clothing/head/tiara
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/omni_hood
	display_name = "religious hood"
	path = /obj/item/clothing/head/religion_hood_color
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/kinhelm
	display_name = "kin voidhelm"
	path = /obj/item/clothing/head/voidhelm
	cost = 1

/datum/gear/head/headdress
	display_name = "headdress, customized"
	path = /obj/item/clothing/head/headdress
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/ranger
	display_name = "ranger hat"
	path = /obj/item/clothing/head/ranger

/datum/gear/head/tanker_helmet/color_presets
	display_name = "tanker/rugby helmet"
	path = /obj/item/clothing/head/helmet/tanker
	cost = 1

/datum/gear/head/ribbon
	display_name = "hair ribbon selection"
	path = /obj/item/clothing/head/ribbon
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/head/maid
	display_name = "maid headdress"
	path = /obj/item/clothing/head/maid

/datum/gear/head/anarchist
	display_name = "anarchist cap"
	path = /obj/item/clothing/head/costume/history/anarchist_cap

/datum/gear/head/papakha
	display_name = "black papakha"
	path = /obj/item/clothing/head/costume/history/anarchist

/datum/gear/head/livesey
	display_name = "Naval Surgeon Tricorne"
	path = /obj/item/clothing/head/costume/livesey

