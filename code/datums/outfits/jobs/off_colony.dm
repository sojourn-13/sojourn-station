/decl/hierarchy/outfit/job/off_colony/hunt_master
	name = OUTFIT_JOB_NAME("Lodge - Hunt Master")
	l_pocket = /obj/item/device/radio
	uniform = /obj/item/clothing/under/genericr
	suit = /obj/item/clothing/suit/armor/hunter
	gloves = /obj/item/clothing/gloves/thick/hunter
	shoes = /obj/item/clothing/shoes/hunterboots
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/helmet/huntmaster_helmet
	l_ear = null
	pda_type = FALSE
	id_type = /obj/item/card/id/lodge
	backpack_contents = list(/obj/item/tool/knife/dagger/skinning = 1)

/decl/hierarchy/outfit/job/off_colony/hunter
	name = OUTFIT_JOB_NAME("Lodge - Hunter")
	l_pocket = /obj/item/device/radio
	uniform = /obj/item/clothing/under/genericw
	suit = /obj/item/clothing/suit/armor/hunter
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/helmet/hunter
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/hunterboots
	l_ear = null
	pda_type = FALSE
	id_type = /obj/item/card/id/lodge
	backpack_contents = list(/obj/item/tool/knife/dagger/skinning = 1)

/decl/hierarchy/outfit/job/off_colony/herbalist
	name = OUTFIT_JOB_NAME("Lodge - Herbalist")
	l_pocket = /obj/item/device/radio
	uniform = /obj/item/clothing/under/genericb
	suit = /obj/item/clothing/suit/armor/hunter/leather
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/helmet/hunter/stalker
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = null
	pda_type = FALSE
	id_type = /obj/item/card/id/lodge
	backpack_contents = list(/obj/item/tool/knife/dagger/skinning = 1, /obj/item/device/scanner/health = 1)

/decl/hierarchy/outfit/job/outsider
	name = OUTFIT_JOB_NAME("Outsider")
	uniform = /obj/item/clothing/under/outcast
	suit = /obj/item/clothing/suit/storage/raggedcape
	head = /obj/item/clothing/head/outcasthood
	belt = /obj/item/storage/belt/utility/handmade/full
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = /obj/item/tool/knife/shiv // Let's see if this frees up backpack content space.
	id_type = FALSE
	pda_type = FALSE
	backpack_contents = list(/obj/item/storage/hcases/ammo/scrap/outsider = 1)

