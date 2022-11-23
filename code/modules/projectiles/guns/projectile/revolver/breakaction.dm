/obj/item/gun/projectile/revolver/rev10
	name = "\"Frontier\" magnum revolver"
	desc = "A well made police revolver used by many departments around the universal frontier. While the design appears to predate its production by H&S it has become iconic to their company for stopping power. \
	It appears to take 10mm magnum rounds loaded via its break-action."
	icon = 'icons/obj/guns/projectile/rev10.dmi'
	icon_state = "rev10"
	item_state = "rev10"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_WOOD = 6)
	price_tag = 700
	damage_multiplier = 1.4
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.2)
	zoom_factors = list(0.2)
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	can_dual = TRUE
	serial_type = "H&S"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/revolver/rev10/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (loaded.len == 0)
		iconstring += "_slide"
	else
		iconstring = initial(icon_state) + "_full"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/revolver/rev10/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/revolver/rev10/rex10
	name = "\"Cowboy\" double-action revolver"
	desc = "A relatively common gun around the frontier of the galaxy. This gun can be found worn by outlaws, criminals and small-time sheriffs or law enforcement. \
	It lacks any serial markings; it's hard to tell who even produces these guns they're so common. But hey, easy reloading via its break-action!"
	icon = 'icons/obj/guns/projectile/rex10.dmi'
	icon_state = "rex10"
	item_state = "rex10"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 6)
	price_tag = 300
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.1)
	zoom_factors = list()
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "H&S"

/obj/item/gun/projectile/revolver/rev10/rex10/showdown
	name = "\"Showdown\" kurtz revolver"
	desc = "An uncommon revolver known for being an old model break action, chambered in fifty kurtz and capable of blowing a hole through a man with ease. While not exceptionally lethal as far \
	as 12mm kurtz handguns go, its ability to blow through armor thanks to its brutal design make it a favorite among those at the wrong side of a gun and the law. Chambered in 12mm rounds."
	icon = 'icons/obj/guns/projectile/showdown.dmi'
	icon_state = "showdown"
	item_state = "showdown"
	caliber = CAL_50
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	price_tag = 900
	damage_multiplier = 1
	penetration_multiplier = 1.5
	init_recoil = HANDGUN_RECOIL(1)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_12MM, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "SA" //Hand made good old gun I guess?
