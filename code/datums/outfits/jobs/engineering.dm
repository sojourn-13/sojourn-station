/decl/hierarchy/outfit/job/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/storage/belt/utility/full/guild
	l_ear = /obj/item/device/radio/headset/headset_eng
	r_ear = /obj/item/tool/screwdriver
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/insulated
	suit = /obj/item/clothing/suit/storage/hazardvest
	pda_slot = slot_l_store
	r_pocket = /obj/item/device/t_scanner
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	suit_store = /obj/item/gun/matter/launcher/breaker

/decl/hierarchy/outfit/job/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/engineering/exultant
	name = OUTFIT_JOB_NAME("Artificer - Guild Master")
	head = /obj/item/clothing/head/firefighter/chief
	uniform = /obj/item/clothing/under/rank/exultant
	head = /obj/item/clothing/head/firefighter/chief
	l_ear = /obj/item/device/radio/headset/heads/ce
	gloves = /obj/item/clothing/gloves/insulated/guild
	id_type = /obj/item/card/id/ce
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/engineering/engineer
	name = OUTFIT_JOB_NAME("Artificer - Guild Adept")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/rank/engineer
	head = /obj/item/clothing/head/hardhat
	id_type = /obj/item/card/id/engie
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/engineering/engineer/apprentice
	name = OUTFIT_JOB_NAME("Artificer - Guild Adept Apprentice")

/decl/hierarchy/outfit/job/engineering/engineer/void
	name = OUTFIT_JOB_NAME("Artificer - Adept Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/engineering
