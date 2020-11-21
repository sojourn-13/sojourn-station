/decl/hierarchy/outfit/job/cargo
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/cargo

/decl/hierarchy/outfit/job/cargo/merchant
	name = OUTFIT_JOB_NAME("Lonestar - CEO")
	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/color/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/storage/rank/qm_coat
	l_hand = /obj/item/weapon/clipboard
	id_type = /obj/item/weapon/card/id/car
	pda_type = /obj/item/device/pda/quartermaster
	l_ear = /obj/item/device/radio/headset/heads/merchant
	backpack_contents = list(/obj/item/modular_computer/pda/cargo = 1)

/decl/hierarchy/outfit/job/cargo/cargo_tech
	name = OUTFIT_JOB_NAME("Lonestar - Cargo Technician")
	uniform = /obj/item/clothing/under/rank/cargotech
	suit = /obj/item/clothing/suit/storage/rank/cargo_jacket
	belt = /obj/item/weapon/storage/belt/utility
	pda_type = /obj/item/device/pda/cargo

/decl/hierarchy/outfit/job/cargo/mining
	name = OUTFIT_JOB_NAME("Lonestar - Lonestar Miner")
	uniform = /obj/item/clothing/under/rank/miner
	pda_type = /obj/item/modular_computer/pda/science/science
	belt = /obj/item/weapon/storage/belt/utility
	pda_type = /obj/item/device/pda/shaftminer
	backpack_contents = list(/obj/item/weapon/tool/crowbar = 1, /obj/item/weapon/storage/bag/ore = 1)
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/cargo/mining/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/cargo/mining/void
	name = OUTFIT_JOB_NAME("Lonestar - Lonestar Miner Voidsuit")
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining

