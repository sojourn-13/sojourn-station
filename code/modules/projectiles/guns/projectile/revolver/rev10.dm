/obj/item/weapon/gun/projectile/revolver/rev10
	name = "\"Frontier\" magnum revolver"
	desc = "A well made police revolver used by many departments round the universal frontier. While the design appears to predate its production by H&S it has become iconic to their company for stopping power. \
	It appears to take .40 magnum rounds."
	icon = 'icons/obj/guns/projectile/rev10.dmi'
	icon_state = "rev10"
	item_state = "rev10"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 800
	damage_multiplier = 1.4
	penetration_multiplier = 1.3
	recoil_buildup = 20
	zoom_factor = 0.2
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)

/obj/item/weapon/gun/projectile/revolver/rev10/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len == 0)
		iconstring += "_slide"
	else
		iconstring = initial(icon_state) + "_full"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/revolver/rev10/Initialize()
	. = ..()
	update_icon()