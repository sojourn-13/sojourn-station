/decl/hierarchy/outfit/job/church
	l_ear = /obj/item/device/radio/headset/church
	id_type = /obj/item/weapon/card/id/church
	pda_type = /obj/item/modular_computer/pda/church
	hierarchy_type = /decl/hierarchy/outfit/job/church
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform = 1)

/decl/hierarchy/outfit/job/church/New()
	..()
	BACKPACK_OVERRIDE_NEOTHEOLOGY

/decl/hierarchy/outfit/job/church/chaplain
	name = OUTFIT_JOB_NAME("Church - Prime")
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_type = /obj/item/weapon/card/id/chaplain
	uniform = /obj/item/clothing/under/rank/preacher
	suit = /obj/item/clothing/suit/storage/chaplain/coat
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
	backpack_contents = list(/obj/item/weapon/book/ritual/cruciform/priest = 1)

/decl/hierarchy/outfit/job/church/acolyte
	name = OUTFIT_JOB_NAME("Church - Vector")
	uniform = /obj/item/clothing/under/rank/acolyte
	suit = /obj/item/clothing/suit/storage/chaplain
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
