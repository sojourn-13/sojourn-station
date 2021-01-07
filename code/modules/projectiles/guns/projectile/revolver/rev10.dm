/obj/item/weapon/gun/projectile/revolver/rev10
	name = "\"Law Maker\" magnum revolver"
	desc = "A well made police revolver used by many departments round the universal frontier. While the design appears to predate its production by H&S it has become iconic to their company for stopping power. \
	It appears to take .40 magnum rounds."
	icon = 'icons/obj/guns/projectile/rev10.dmi'
	icon_state = "rev10"
	item_state = "rev10"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/c10x24
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1200
	damage_multiplier = 1.3
	penetration_multiplier = 1.5
	recoil_buildup = 25
	zoom_factor = 0.2
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)

/obj/item/weapon/gun/projectile/rev10/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring