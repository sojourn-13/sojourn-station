/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/reinforced/medical
	id_type = /obj/item/weapon/card/id/med
	pda_type = /obj/item/device/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Soteria - Biolab Overseer")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/moebius_biolab_officer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	l_hand = /obj/item/weapon/storage/firstaid/adv
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	id_type = /obj/item/weapon/card/id/cmo
	pda_type = /obj/item/device/pda/heads/cmo
	r_ear  = /obj/item/weapon/reagent_containers/syringe/large
	belt = /obj/item/weapon/storage/belt/medical
	backpack_contents = list(/obj/item/modular_computer/pda/heads/cmo = 1)

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Soteria - Medical Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/weapon/storage/firstaid/adv
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	r_ear  = /obj/item/weapon/reagent_containers/syringe/large
	belt = /obj/item/weapon/storage/belt/medical

/decl/hierarchy/outfit/job/medical/orderly
	name = OUTFIT_JOB_NAME("Soteria - Orderly")
	uniform = /obj/item/clothing/under/scrubs
	id_type = /obj/item/weapon/card/id/med
	pda_type = /obj/item/device/pda/medical
	suit =  /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/surgery
	r_ear  = /obj/item/weapon/reagent_containers/syringe/large
	backpack_contents = list(/obj/item/weapon/gun/energy/stunrevolver = 1, /obj/item/weapon/cell/small/high = 2, /obj/item/weapon/handcuffs = 2, /obj/item/clothing/suit/straight_jacket = 1, /obj/item/device/flash = 1)

/decl/hierarchy/outfit/job/medical/orderly/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/psychiatrist
	name = OUTFIT_JOB_NAME("Soteria - Psychiatrist")
	uniform = /obj/item/clothing/under/rank/psych
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	r_ear  = /obj/item/weapon/reagent_containers/syringe/large

/decl/hierarchy/outfit/job/medical/paramedic
	name = OUTFIT_JOB_NAME("Soteria - Paramedic")
	uniform = /obj/item/clothing/under/rank/paramedic
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	r_ear  = /obj/item/weapon/reagent_containers/syringe/large
