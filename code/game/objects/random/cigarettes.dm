/obj/random/cigarettes
	name = "random cigarettes"
	icon_state = "material-red"

/obj/random/cigarettes/item_to_spawn()
	return pickweight(list(/obj/item/storage/fancy/cigarettes/ishimura = 0.1,
				/obj/item/storage/fancy/cigarettes/tannhauser = 0.1,
				/obj/item/storage/fancy/cigarettes/brouzouf = 0.1,
				/obj/item/storage/fancy/cigarettes/frozen = 0.1,
				/obj/item/storage/fancy/cigarettes/shodan = 0.1,
				/obj/item/storage/fancy/cigarettes/toha = 0.1,
				/obj/item/storage/fancy/cigarettes/fortress = 0.1,
				/obj/item/storage/fancy/cigarettes/fortressred = 0.1,
				/obj/item/storage/fancy/cigarettes/fortressblue = 0.1,
				/obj/item/storage/fancy/cigarettes/khi = 0.1,
				/obj/item/storage/fancy/cigarettes/comred = 0.1,
				/obj/item/storage/fancy/cigarettes/lonestar = 0.1,
				/obj/item/storage/fancy/cigarettes/faith = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/ishimura = 1,
				/obj/item/clothing/mask/smokable/cigarette/tannhauser = 1,
				/obj/item/clothing/mask/smokable/cigarette/brouzouf = 1,
				/obj/item/clothing/mask/smokable/cigarette/frozen = 1,
				/obj/item/clothing/mask/smokable/cigarette/shodan = 1,
				/obj/item/clothing/mask/smokable/cigarette/toha = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortress = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortressred = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortressblue = 1,
				/obj/item/clothing/mask/smokable/cigarette/khi = 1,
				/obj/item/clothing/mask/smokable/cigarette/comred = 1,
				/obj/item/clothing/mask/smokable/cigarette/lonestar = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/blue = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/red = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/yellow = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/green = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/orange = 1))


/obj/random/cigarettes/singles
	name = "random single cigarette"
	icon_state = "material-red"
	spawn_nothing_percentage = 0

/obj/random/cigarettes/singles/item_to_spawn()
	return pickweight(list(
				/obj/item/clothing/mask/smokable/cigarette/ishimura = 1,
				/obj/item/clothing/mask/smokable/cigarette/tannhauser = 1,
				/obj/item/clothing/mask/smokable/cigarette/brouzouf = 1,
				/obj/item/clothing/mask/smokable/cigarette/frozen = 1,
				/obj/item/clothing/mask/smokable/cigarette/shodan = 1,
				/obj/item/clothing/mask/smokable/cigarette/toha = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortress = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortressred = 1,
				/obj/item/clothing/mask/smokable/cigarette/fortressblue = 1,
				/obj/item/clothing/mask/smokable/cigarette/khi = 1,
				/obj/item/clothing/mask/smokable/cigarette/comred = 1,
				/obj/item/clothing/mask/smokable/cigarette/lonestar = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/blue = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/red = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/yellow = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/green = 1,
				/obj/item/clothing/mask/smokable/cigarette/faith/orange = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 1))

/obj/random/cigarettes/low_chance
	name = "low chance random cigarettes"
	icon_state = "material-red-low"
	spawn_nothing_percentage = 60
