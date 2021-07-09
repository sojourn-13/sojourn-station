/decl/hierarchy/outfit/job/off_colony/hunt_master
	name = OUTFIT_JOB_NAME("Lodge - Hunt Master")
	l_pocket = /obj/item/device/radio
	uniform = /obj/item/clothing/under/genericw
	suit = /obj/item/clothing/suit/armor/hunter/bone
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/jackboots/german
	l_ear = null
	pda_type = null
	backpack_contents = list(/obj/item/weapon/tool/knife/dagger/skinning = 1, /obj/item/clothing/mask/gas/tactical = 1, /obj/item/clothing/head/helmet/huntmaster_helmet = 1)

/decl/hierarchy/outfit/job/off_colony/hunter
	name = OUTFIT_JOB_NAME("Lodge - Hunter")
	l_pocket = /obj/item/device/radio
	uniform = /obj/item/clothing/under/genericw
	suit = /obj/item/clothing/suit/armor/hunter
	mask = /obj/item/clothing/mask/gas/tactical
	head = /obj/item/clothing/head/helmet/hunter
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/jackboots/german
	l_ear = null
	id_type = null
	pda_type = null
	backpack_contents = list(/obj/item/weapon/tool/knife/dagger/skinning = 1)

/decl/hierarchy/outfit/job/outsider
	name = OUTFIT_JOB_NAME("Outsider")
	uniform = /obj/item/clothing/under/outcast
	suit = /obj/item/clothing/suit/storage/raggedcape
	head = /obj/item/clothing/head/outcasthood
	belt = /obj/item/weapon/storage/belt/utility/handmade/full
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/workboots
	l_ear = /obj/item/weapon/tool/knife/shiv // Let's see if this frees up backpack content space.
	id_type = null
	pda_type = null
	backpack_contents = list(/obj/item/weapon/storage/firstaid/outsider = 1, /obj/item/weapon/reagent_containers/food/drinks/flask/lithium = 1)

