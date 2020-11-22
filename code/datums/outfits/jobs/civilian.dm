/decl/hierarchy/outfit/job/assistant
	name = OUTFIT_JOB_NAME("Assistant")
	suit = /obj/item/clothing/suit/storage/rank/ass_jacket
	uniform = /obj/item/clothing/under/rank/assistant

/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = OUTFIT_JOB_NAME("Lonestar - Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	head = /obj/item/clothing/head/tophat
	id_type = /obj/item/weapon/card/id/white
	pda_type = /obj/item/modular_computer/pda/club_worker

/decl/hierarchy/outfit/job/service/waiter
	name = OUTFIT_JOB_NAME("Lonestar - Waiter")
	uniform = /obj/item/clothing/under/costume/job/waiter
	id_type = /obj/item/weapon/card/id/white
	pda_type = /obj/item/modular_computer/pda/club_worker

/decl/hierarchy/outfit/job/service/chef
	name = OUTFIT_JOB_NAME("Lonestar - Chef")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/rank/chef
	head = /obj/item/clothing/head/rank/chef
	id_type = /obj/item/weapon/card/id/ltgrey
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/gardener
	name = OUTFIT_JOB_NAME("Lonestar - Gardener")
	uniform = /obj/item/clothing/under/rank/botanist
	suit = /obj/item/clothing/suit/rank/botanist
	gloves = /obj/item/clothing/gloves/botanic_leather
	id_type = /obj/item/weapon/card/id/hydro
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/gardener/New()
	..()
	//backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/weapon/storage/backpack/hydroponics;
	//backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/weapon/storage/backpack/satchel/hyd;


/decl/hierarchy/outfit/job/service/janitor
	name = OUTFIT_JOB_NAME("Lonestar - Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	pda_type = /obj/item/modular_computer/pda
	shoes = /obj/item/clothing/shoes/jackboots/janitor

/decl/hierarchy/outfit/job/service/actor
	name = OUTFIT_JOB_NAME("Lonestar - Actor")
	uniform = /obj/item/clothing/under/modular/black
	suit = /obj/item/clothing/suit/storage/suitjacket/black
	l_pocket = /obj/item/weapon/bikehorn
	backpack_contents = list(/obj/item/weapon/bananapeel = 1, /obj/item/weapon/storage/fancy/crayons = 1, /obj/item/toy/weapon/waterflower = 1, /obj/item/weapon/stamp/clown = 1, /obj/item/weapon/handcuffs/fake = 1)

/decl/hierarchy/outfit/job/service/actor/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/clown
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel/leather

/decl/hierarchy/outfit/job/service/actor/post_equip(var/mob/living/carbon/human/H)
	..()
	H.mutations.Add(CLUMSY)