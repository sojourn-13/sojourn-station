/datum/gear/bible
	display_name = "NeoTheology ritual book"
	path = /obj/item/weapon/book/ritual/cruciform
	cost = 2

/datum/gear/cane
	display_name = "cane"
	path = /obj/item/weapon/cane

/datum/gear/dice
	display_name = "dice pack"
	path = /obj/item/weapon/storage/pill_bottle/dice
/datum/gear/holder
	display_name = "card holder"
	path = /obj/item/weapon/cardholder

/datum/gear/cardpackstrad
	display_name = "card traditional selection"
	path = /obj/item/weapon/deck
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/cardpacksgame
	display_name = "card game selection"
	path = /obj/item/weapon/pack
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/spaceball_pack
	display_name = "Spaceball booster pack"
	path = /obj/item/weapon/pack/spaceball

/datum/gear/mug
	display_name = "mug selection"
	path = /obj/item/weapon/reagent_containers/food/drinks/mug
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/pitcher
	display_name = "insulated pitcher"
	path = /obj/item/weapon/reagent_containers/food/drinks/pitcher

/datum/gear/flask
	display_name = "flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/barflask

/datum/gear/vacflask
	display_name = "vacuum-flask"
	path = /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask

/datum/gear/plushies
	display_name = "plushie selection"
	path = /obj/item/toy/plushie
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/plush_toy/New()
	..()
	var/plushes = list(
		"mouse plush"	=	/obj/item/toy/plushie/mouse,
		"kitten plush"	=	/obj/item/toy/plushie/kitten,
		"lizard plush"	=	/obj/item/toy/plushie/lizard,
		"spider plush"	=	/obj/item/toy/plushie/spider,
		"farwa plush"	=	/obj/item/toy/plushie/farwa,
	)
	gear_tweaks += new /datum/gear_tweak/path(plushes)

/datum/gear/mirror/
	display_name = "handheld mirror"
	sort_category = "Cosmetics"
	path = /obj/item/weapon/mirror

/datum/gear/lipstick
	display_name = "lipstick selection"
	sort_category = "Cosmetics"
	path = /obj/item/weapon/lipstick
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/comb
	display_name = "plastic comb"
	sort_category = "Cosmetics"
	path = /obj/item/weapon/haircomb

/datum/gear/hairflower
	display_name = "hair flower pin selection"
	sort_category = "Cosmetics"
	path = /obj/item/clothing/head/hairflower
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/smokingpipe
	display_name = "pipe, smoking"
	path = /obj/item/clothing/mask/smokable/pipe

/datum/gear/cornpipe
	display_name = "pipe, corn"
	path = /obj/item/clothing/mask/smokable/pipe/cobpipe

/datum/gear/matchbook
	display_name = "matchbook"
	path = /obj/item/weapon/storage/box/matches

/datum/gear/lighter
	display_name = "cheap lighter"
	path = /obj/item/weapon/flame/lighter

/datum/gear/zippo
	display_name = "zippo"
	path = /obj/item/weapon/flame/lighter/zippo

/datum/gear/cigars
	display_name = "fancy cigar case"
	path = /obj/item/weapon/storage/fancy/cigar
	cost = 2

/datum/gear/cigar
	display_name = "fancy cigar"
	path = /obj/item/clothing/mask/smokable/cigarette/cigar

/datum/gear/cigar/New()
	..()
	var/cigar_type = list()
	cigar_type["premium"] = /obj/item/clothing/mask/smokable/cigarette/cigar
	cigar_type["Cohiba Robusto"] = /obj/item/clothing/mask/smokable/cigarette/cigar/cohiba
	gear_tweaks += new/datum/gear_tweak/path(cigar_type)
