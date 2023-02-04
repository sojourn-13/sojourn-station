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
	gun_parts = list(/obj/item/part/gun/frame/colt = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/colt/ten
	name = "\"Delta Elite\" magnum pistol"
	desc = "A classy high-powered automatic commissionedby Blackshield and based on the M1911 series handguns, with significant reinforcements produced by Scarborough Arms. Uses 10mm Auto-Mag."
	icon_state = "dark_delta"
	item_state = "colt"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8)
	price_tag = 550
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	init_recoil = HANDGUN_RECOIL(0.5)
	damage_multiplier = 1.1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	serial_type = "SA"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig
	gun_parts = list(/obj/item/part/gun/frame/colt = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/colt/liberty
	name = "\"Liberty\" magnum pistol"
	desc = "A common Nadezhda Marshal issue pistol chambered in 10mm Magnum. It appears to be loosely based off a Colt model, albeit with a changed slide, polymer grip and a built-in holographic sight."
	icon = 'icons/obj/guns/projectile/liberty.dmi'
	icon_state = "liberty"
	item_state = "liberty"
	caliber = CAL_MAGNUM
	price_tag = 650
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	damage_multiplier = 1.0
	penetration_multiplier = 1.3
	zoom_factors = list(0.2)
	init_recoil = HANDGUN_RECOIL(0.6)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	serial_type = "NM"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig
	gun_parts = list(/obj/item/part/gun/frame/colt = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)


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

/obj/item/part/gun/frame/colt
	name = "Colt 1911 frame"
	desc = "A Colt pistol frame. Winner of dozens of world wars, and loser of many more guerilla wars."
	icon_state = "frame_1911"
	result = /obj/item/gun/projectile/colt
	gripvars = list(/obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/rubber, /obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol, /obj/item/part/gun/barrel/magnum)
	resultvars = list(/obj/item/gun/projectile/colt, /obj/item/gun/projectile/colt/liberty, /obj/item/gun/projectile/colt/ten)

/*
Stored code - not implimented /yet/, test at a later time. Taken from the gun_parts.dm original code.
/obj/item/part/gun/frame/colt/attack_self(mob/user)
	. = ..()
	var/turf/T = get_turf(src)
	if(!InstalledGrip)
		to_chat(user, SPAN_WARNING("\the [src] does not have a grip!"))
		return
	if(!InstalledMechanism)
		to_chat(user, SPAN_WARNING("\the [src] does not have a mechanism!"))
		return
	if(!InstalledBarrel)
		to_chat(user, SPAN_WARNING("\the [src] does not have a barrel!"))
		return
	var/obj/item/gun/G = new result(T)
	G.serial_type = serial_type
	if(barrelvars.len > 1 && istype(G, /obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = G
		P.caliber = InstalledBarrel.caliber
		G.gun_parts = list(src.type = 1, InstalledGrip.type = 1, InstalledMechanism.type = 1, InstalledBarrel.type = 1)
	qdel(src)
	return
	*/
