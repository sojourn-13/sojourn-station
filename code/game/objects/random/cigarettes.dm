/obj/random/cigarettes
	name = "random cigarettes"
	icon_state = "material-red"

/obj/random/cigarettes/item_to_spawn()
	return pickweight(list(/obj/item/storage/fancy/cigarettes/ishimura = 1,
				/obj/item/storage/fancy/cigarettes/tannhauser = 1,
				/obj/item/storage/fancy/cigarettes/brouzouf = 1,
				/obj/item/storage/fancy/cigarettes/frozen = 1,
				/obj/item/storage/fancy/cigarettes/shodan = 1,
				/obj/item/storage/fancy/cigarettes/toha = 1,
				/obj/item/storage/fancy/cigarettes/fortress = 1,
				/obj/item/storage/fancy/cigarettes/fortressred = 1,
				/obj/item/storage/fancy/cigarettes/fortressblue = 1,
				/obj/item/storage/fancy/cigarettes/khi = 1,
				/obj/item/storage/fancy/cigarettes/comred = 1,
				/obj/item/storage/fancy/cigarettes/lonestar = 1,
				/obj/item/storage/fancy/cigarettes/faith = 1,
				/obj/item/clothing/mask/smokable/cigarette/ishimura = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/tannhauser = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/brouzouf = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/frozen = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/shodan = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/toha = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/fortress = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/fortressred = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/fortressblue = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/khi = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/comred = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/lonestar = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/faith = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/faith/blue = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/faith/red = 0.1,
				/obj/item/clothing/mask/smokable/cigarette/faith/yellow = 0.3,
				/obj/item/clothing/mask/smokable/cigarette/faith/green = 0.3,
				/obj/item/clothing/mask/smokable/cigarette/faith/orange = 0.3))

/obj/random/cigarettes/low_chance
	name = "low chance random cigarettes"
	icon_state = "material-red-low"
	spawn_nothing_percentage = 60
