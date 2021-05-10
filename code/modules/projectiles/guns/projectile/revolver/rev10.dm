/obj/item/weapon/gun/projectile/revolver/rev10
	name = "\"Frontier\" magnum revolver"
	desc = "A well made police revolver used by many departments round the universal frontier. While the design appears to predate its production by H&S it has become iconic to their company for stopping power. \
	It appears to take .40 magnum rounds loaded via its break-action."
	icon = 'icons/obj/guns/projectile/rev10.dmi'
	icon_state = "rev10"
	item_state = "rev10"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_WOOD = 6)
	price_tag = 800
	damage_multiplier = 1.4
	penetration_multiplier = 1.3
	recoil_buildup = 8
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

/obj/item/weapon/gun/projectile/revolver/rex10
	name = "\"Cowboy\" double-action revolver"
	desc = "A relatively common gun around the frontier of the galaxy. This gun can be found worn by outlaws, criminals and small-time sheriffs or law enforcement. \
	It lacks any serial markings; it's hard to tell who even produces these guns they're so common. But hey, easy reloading via its break-action!"
	icon = 'icons/obj/guns/projectile/rex10.dmi'
	icon_state = "rex10"
	item_state = "rex10"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 6)
	price_tag = 350
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	recoil_buildup = 3.5
	one_hand_penalty = 6
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_INTERNAL_MAG, GUN_REVOLVER)
	can_dual = TRUE

/obj/item/weapon/gun/projectile/revolver/rex10/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len == 0)
		iconstring += "_slide"
	else
		iconstring = initial(icon_state) + "_full"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/revolver/rex10/Initialize()
	. = ..()
	update_icon()