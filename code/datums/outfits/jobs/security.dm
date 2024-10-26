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

/decl/hierarchy/outfit/job/security/gunserg
	name = OUTFIT_JOB_NAME("Marshal - Supply Specialist")
	uniform = /obj/item/clothing/under/rank/warden
	suit = /obj/item/clothing/suit/armor/vest/ironhammer
	head = /obj/item/clothing/head/rank/warden/beret
	glasses = /obj/item/clothing/glasses/hud/security
	l_pocket = /obj/item/device/flash
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/spec_officer = 1)

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

/decl/hierarchy/outfit/job/security/ihoper
	name = OUTFIT_JOB_NAME("Marshal - Marshal Officer")
	l_pocket = /obj/item/device/flash
	uniform = /obj/item/clothing/under/rank/security
	mask = /obj/item/clothing/mask/balaclava/tactical
	glasses = /obj/item/clothing/glasses/sechud/tactical
	head = /obj/item/clothing/head/seccap
	gloves = /obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/storage/hcases/ammo/ih/marshal_officer = 1)

//same as normal officer but different name
/decl/hierarchy/outfit/job/security/ihoper/jr
	name = OUTFIT_JOB_NAME("Marshal - Jr. Marshal Officer")
