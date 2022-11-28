/obj/item/gun/projectile/colt
	name = "\"Colt\" pistol"
	desc = "A cheap knock-off of an M1911 produced by Holland & Sullivan. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/colt.dmi'
	icon_state = "colt"
	item_state = "colt"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 450
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	damage_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.4)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_SILENCABLE, GUN_MAGWELL)
	serial_type = "H&S"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/projectile/colt/NM_colt
	name = "\"Bronco\" pistol"
	desc = "A rugged derivative of the venerable M1911, built on double-stack frames and modified by the Nadezhda Marshals gunsmiths from new or refitted weapons to meet match-grade standards. Uses 9mm rounds."
	icon_state = "NM_colt"
	item_state = "colt"
	caliber = CAL_PISTOL
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	price_tag = 500
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 5)
	init_recoil = HANDGUN_RECOIL(0.3)
	serial_type = "NM"

/obj/item/gun/projectile/colt/ten
	name = "\"Delta Elite\" magnum pistol"
	desc = "A classy high-powered automatic based on the M1911 series handguns, with significant reinforcements produded by Scarborough Arms. Uses 10mm Auto-Mag."
	icon_state = "delta"
	item_state = "colt"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8)
	price_tag = 550
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	init_recoil = HANDGUN_RECOIL(0.5)
	damage_multiplier = 1.1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	serial_type = "SA"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/colt/ten/dark
	name = "\"Stallion\" magnum pistol"
	desc = "A rugged derivative of the venerable M1911, modernized to the M1911A5 standard and produced by SolFed armories across the galaxy, this one bears defaced serial numbers and the insignia of the Blackshield. Uses 10mm Auto-Mag."
	icon_state = "dark_delta"
	item_state = "colt"
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	serial_type = "Sol Fed"

/obj/item/gun/projectile/colt/liberty
	name = "\"Liberty\" magnum pistol"
	desc = "A common Nadezhda Marshal issue pistol chambered in 10mm Magnum. It appears to be loosely based off a Colt model, albeit with a changed slide and polymer grip and a built-in holographic scope."
	icon = 'icons/obj/guns/projectile/liberty.dmi'
	icon_state = "liberty"
	item_state = "liberty"
	caliber = CAL_MAGNUM
	price_tag = 650
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	damage_multiplier = 1.0
	penetration_multiplier = 1.3
	zoom_factors = list(0.2)
	init_recoil = HANDGUN_RECOIL(0.6)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	serial_type = "NM"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig


/obj/item/gun/projectile/colt/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/colt/Initialize()
	. = ..()
	update_icon()
