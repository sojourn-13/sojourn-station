/decl/hierarchy/outfit/job/security
	hierarchy_type = /decl/hierarchy/outfit/job/security
	l_ear = /obj/item/device/radio/headset/headset_sec/bowman
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/jackboots
	id_type = /obj/item/card/id/sec
	pda_type = /obj/item/modular_computer/pda/security
	backpack_contents = list(/obj/item/handcuffs = 1)

/decl/hierarchy/outfit/job/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/security/swo
	name = OUTFIT_JOB_NAME("Marshal - Warrant Officer")
	l_ear = /obj/item/device/radio/headset/heads/hos/bowman
	uniform = /obj/item/clothing/under/rank/ih_commander
	suit = /obj/item/clothing/suit/armor/hos
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	glasses = /obj/item/clothing/glasses/sechud/tactical
	id_type = /obj/item/card/id/hos
	head = /obj/item/clothing/head/rank/commander
	pda_type = /obj/item/modular_computer/pda/heads/hos
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/wo = 1)

/decl/hierarchy/outfit/job/security/smc
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


/decl/hierarchy/outfit/job/security/gunserg
	name = OUTFIT_JOB_NAME("Marshal - Supply Specialist")
	uniform = /obj/item/clothing/under/rank/warden
	suit = /obj/item/clothing/suit/armor/vest/ironhammer
	head = /obj/item/clothing/head/rank/warden/beret
	glasses = /obj/item/clothing/glasses/hud/security
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/spec_officer = 1)

/decl/hierarchy/outfit/job/security/serg
	name = OUTFIT_JOB_NAME("Blackshield - Sergeant")
	l_ear = /obj/item/device/radio/headset/headset_blackshield/sergeant
	uniform = /obj/item/clothing/under/rank/armorer/gorka
	head = /obj/item/clothing/head/rank/armorer/cap
	glasses = /obj/item/clothing/glasses/ballistic
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/serg = 1)

/decl/hierarchy/outfit/job/security/inspector
	name = OUTFIT_JOB_NAME("Marshal - Ranger")
	head = /obj/item/clothing/head/rank/inspector
	uniform = /obj/item/clothing/under/rank/inspector
	suit = /obj/item/clothing/suit/storage/rank/insp_trench
	head = /obj/item/clothing/head/investigator
	gloves = /obj/item/clothing/gloves/stungloves
	l_pocket = /obj/item/device/flash
	shoes = /obj/item/clothing/shoes/reinforced
	belt = /obj/item/gun/energy/gun/martin
	r_hand = /obj/item/storage/briefcase/crimekit
	id_type = /obj/item/card/id/det
	pda_type = /obj/item/modular_computer/pda/forensics
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/ranger_officer = 1)

/decl/hierarchy/outfit/job/security/detective/New()
	..()
	backpack_overrides.Cut()

/decl/hierarchy/outfit/job/security/medspec
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

/decl/hierarchy/outfit/job/security/ihoper
	name = OUTFIT_JOB_NAME("Marshal - Marshal Officer")
	l_pocket = /obj/item/device/flash
	uniform = /obj/item/clothing/under/rank/security
	mask = /obj/item/clothing/mask/balaclava/tactical
	glasses = /obj/item/clothing/glasses/sechud/tactical
	head = /obj/item/clothing/head/seccap
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/marshal_officer = 1)

/decl/hierarchy/outfit/job/security/troop
	name = OUTFIT_JOB_NAME("Blackshield - Trooper")
	l_ear = /obj/item/device/radio/headset/headset_blackshield
	l_pocket = /obj/item/device/flash
	uniform = /obj/item/clothing/under/rank/trooper/gorka
	mask = /obj/item/clothing/mask/balaclava/tactical
	glasses = /obj/item/clothing/glasses/ballistic
	head = /obj/item/clothing/head/rank/trooper/cap
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield
	backpack_contents = list(/obj/item/storage/hcases/ammo/blackmarket/trooper = 1)
