/datum/gear/clothing
	display_name = "sterile mask"
	path = /obj/item/clothing/mask/surgical
	slot = slot_wear_mask
	sort_category = "Clothing Pieces"
	cost = 0

/datum/gear/clothing/kriosan
	display_name = "kriosan sterile mask"
	path = /obj/item/clothing/mask/surgical/kriosan
	slot = slot_wear_mask
	cost = 0

/datum/gear/clothing/bandana
	display_name = "bandana mask selection"
	path = /obj/item/clothing/mask/bandana
	slot = slot_wear_mask
	flags = GEAR_HAS_TYPE_SELECTION
	cost = 0

/datum/gear/clothing/balaclava
	display_name = "balaclava"
	path = /obj/item/clothing/mask/balaclava
	slot = slot_wear_mask
	cost = 1

/datum/gear/clothing/gasmask
	display_name = "gas mask"
	path = /obj/item/clothing/mask/gas
	slot = slot_wear_mask
	cost = 2

/datum/gear/clothing/gasmaskenviro
	display_name = "gas mask, enviro"
	path = /obj/item/clothing/mask/gas/old
	slot = slot_wear_mask
	cost = 2

/datum/gear/clothing/gasmaskindustrial
	display_name = "gas mask, industrial"
	path = /obj/item/clothing/mask/gas/industrial
	slot = slot_wear_mask
	cost = 2

/datum/gear/clothing/withnosurvivors
	display_name = "rebreather"
	path = /obj/item/clothing/mask/gas/bigguy
	slot = slot_wear_mask
	cost = 2
	flags= GEAR_HAS_TYPE_SELECTION

/datum/gear/clothing/mask/costume/history/plaguedoctor
	display_name = "Plague Doctor mask"
	path = /obj/item/clothing/mask/costume/history/plaguedoctor
	slot = slot_wear_mask
	cost = 2 //Same cost as gasmasks because it provides the same benefit (actually better for this one)

/datum/gear/clothing/mask/costume/animal
	display_name = "Animal mask selection"
	path = /obj/item/clothing/mask/costume/animal/
	slot = slot_wear_mask
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/clothing/mask/gas/clown
	display_name = "Clown mask selection"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/gas/dal
	cost = 2 //Same cost as gasmasks because it provides the same benefit

/datum/gear/clothing/mask/gas/clown/New()
	..()
	var/gas = list(
		"professional clown mask"		=	/obj/item/clothing/mask/gas/dal,
		"psychopathic clown mask"		=	/obj/item/clothing/mask/gas/wolf,
		"prisoner clown mask"			=	/obj/item/clothing/mask/gas/hox,
		"daredevil clown mask"			=	/obj/item/clothing/mask/gas/cha,
	)
	gear_tweaks += new /datum/gear_tweak/path(gas)

/datum/gear/clothing/mask/costume/halloween
	display_name = "Halloween mask selection"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/costume/halloween/demon

/datum/gear/clothing/mask/costume/halloween/New()
	..()
	var/halloween = list(
		"demon mask"			=	/obj/item/clothing/mask/costume/halloween/demon,
		"scarecrow sack"		=	/obj/item/clothing/mask/costume/halloween/scarecrow,
		"mummy bandages"		=	/obj/item/clothing/mask/costume/halloween/mummy,
		"goblin mask"			=	/obj/item/clothing/mask/costume/halloween/goblin,
	)
	gear_tweaks += new /datum/gear_tweak/path(halloween)

datum/gear/clothing/mask/tiki
	display_name = "Tiki mask selection"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/costume/misc/tiki/

datum/gear/clothing/mask/tiki/New()
	..()
	var/tiki = list(
		"startled tiki mask"			=	/obj/item/clothing/mask/costume/misc/tiki,
		"angry tiki mask"				=	/obj/item/clothing/mask/costume/misc/tiki/angry,
		"confused tiki mask"			=	/obj/item/clothing/mask/costume/misc/tiki/confused,
		"happy tiki mask"				=	/obj/item/clothing/mask/costume/misc/tiki/happy,
	)
	gear_tweaks += new /datum/gear_tweak/path(tiki)

/datum/gear/clothing/mimemask
	display_name = "mime mask"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/costume/job/mime
	cost = 1
