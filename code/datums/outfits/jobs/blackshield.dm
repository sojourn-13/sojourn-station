/decl/hierarchy/outfit/job/blackshield
	hierarchy_type = /decl/hierarchy/outfit/job/blackshield
	l_ear = /obj/item/device/radio/headset/headset_blackshield
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/card/id/sec
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/blackshield/New()
	..()
	BACKPACK_OVERRIDE_BLACKSHIELD

/decl/hierarchy/outfit/job/blackshield/smc
	name = OUTFIT_JOB_NAME("Blackshield - Blackshield Commander")
	l_ear = /obj/item/device/radio/headset/heads/bscom
	uniform = /obj/item/clothing/under/rank/commander
	suit = /obj/item/clothing/suit/armor/commander/militia
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	glasses = /obj/item/clothing/glasses/ballistic
	id_type = /obj/item/card/id/hos
	head = /obj/item/clothing/head/rank/milcom
	pda_type = /obj/item/modular_computer/pda/heads/hos
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/co = 1)

/decl/hierarchy/outfit/job/blackshield/serg
	name = OUTFIT_JOB_NAME("Blackshield - Sergeant")
	l_ear = /obj/item/device/radio/headset/headset_blackshield/sergeant
	uniform = /obj/item/clothing/under/rank/armorer/gorka
	head = /obj/item/clothing/head/rank/armorer/cap
	glasses = /obj/item/clothing/glasses/ballistic
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/serg = 1)

/decl/hierarchy/outfit/job/blackshield/medspec
	name = OUTFIT_JOB_NAME("Blackshield - Corpsman")
	l_pocket = /obj/item/device/flash
	l_ear = /obj/item/device/radio/headset/headset_blackshield/corps
	id_type = /obj/item/card/id/medcpec
	uniform = /obj/item/clothing/under/rank/corpsman
	head = /obj/item/clothing/head/rank/corpsman/beret
	pda_type = /obj/item/modular_computer/pda/corpsman
	belt = /obj/item/storage/belt/medical/emt
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield_corpsman
	l_hand = /obj/item/storage/firstaid/blackshield
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/medspec = 1)

/decl/hierarchy/outfit/job/blackshield/troop
	name = OUTFIT_JOB_NAME("Blackshield - Trooper")
	l_ear = /obj/item/device/radio/headset/headset_blackshield
	l_pocket = /obj/item/device/flash
	uniform = /obj/item/clothing/under/rank/trooper/gorka
	mask = /obj/item/clothing/mask/balaclava/tactical
	glasses = /obj/item/clothing/glasses/ballistic
	head = /obj/item/clothing/head/rank/trooper/cap
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/trooper = 1)

/decl/hierarchy/outfit/job/blackshield/troop/cadet
	name = OUTFIT_JOB_NAME("Blackshield - Cadet")