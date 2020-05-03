/obj/item/weapon/gun/projectile/clarissa
	name = "\"Clarissa\" pistol"
	desc = "A small, easily concealable, but somewhat underpowered gun. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/clarissa.dmi'
	icon_state = "clarissa"
	item_state = "clarissa"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = 1
	silenced = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 1200
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	silencer_type = /obj/item/weapon/silencer
	damage_multiplier = 0.7
	recoil_buildup = 19
	one_hand_penalty = 10

/obj/item/weapon/gun/projectile/clarissa/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)


/obj/item/weapon/gun/projectile/clarissa/makarov
	name = "\"Makarov\" pistol"
	desc = "Old-designed pistol used by space communists. Small and easily concealable. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/makarov.dmi'
	icon_state = "makarov"
	damage_multiplier = 1.2
	recoil_buildup = 21
	price_tag = 1400
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_ILLEGAL = 3)
	firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/weapon/gun/projectile/clarissa/loaded
/obj/item/weapon/gun/projectile/clarissa/loaded_rubber

/obj/item/weapon/gun/projectile/clarissa/loaded/New()
	..()
	src.self_load(new /obj/item/ammo_magazine/pistol)
	src.update_icon()

/obj/item/weapon/gun/projectile/clarissa/loaded_rubber/New()
	..()
	src.self_load(new /obj/item/ammo_magazine/pistol/rubber)
	src.update_icon()