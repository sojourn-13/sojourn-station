/obj/item/weapon/gun/projectile/automatic/luger
	name = "\"Vintovka Lyugera\" carbine"
	desc = "An old-world pistol mutilated and modified into an SMG of sorts. Reliable, well crafted but bulky. Amazingly it.. works! The look is hard to describe.. a mix between 'makeshift' and 'amazing'. \
	While able to take both .35 pistol and SMG magazines the gun appears to lack a proper fire selection. Figures it's made by Nadezhda Marshals gunsmiths."
	icon = 'icons/obj/guns/projectile/luger.dmi'
	icon_state = "luger"
	item_state = "luger"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_PISTOL
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG|MAG_WELL_H_PISTOL|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 6, MATERIAL_STEEL = 10)
	price_tag = 650
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	damage_multiplier = 1
	recoil_buildup = 5
	one_hand_penalty = 20
	load_method = MAGAZINE
	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY,
		)

/obj/item/weapon/gun/projectile/automatic/luger/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)
