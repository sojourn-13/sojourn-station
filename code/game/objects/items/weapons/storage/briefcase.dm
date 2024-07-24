/obj/item/storage/briefcase
	name = "briefcase"
	desc = "A sturdy briefcase made of authentic faux-leather."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY //Cant normally bag this
	max_w_class = ITEM_SIZE_NORMAL //We can fit anything smaller then us
	max_storage_space = 20 //Its a big case
	matter = list(MATERIAL_BIOMATTER = 8, MATERIAL_PLASTIC = 4)
	price_tag = 90
	no_swing = FALSE //Incase we ever do make fancy briefcase weapons...

/*
/obj/item/storage/briefcase/rifle //replaced with the 'duffel' child item
	name = "gun case"
	desc = "A sturdy metal case made for transporting ranged weaponry."
	icon_state = "rifle_case"
	item_state = "rifle_case"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 4
	max_w_class = null
	max_storage_space = 16
	can_hold = list(/obj/item/gun,
		/obj/item/ammo_magazine
		)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 4) */