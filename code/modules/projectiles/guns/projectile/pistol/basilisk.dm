/obj/item/gun/projectile/basilisk
	name = "\"Basilisk\" heavy pistol"
	desc = "A distant relative of the Lamia produced by Holland & Sullivan. Robust and straight, this is a gun for a leader, not just an officer. Uses .50 Kurz."
	icon = 'icons/obj/guns/projectile/basilisk.dmi'
	icon_state = "basilisk"
	item_state = "basilisk"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 800
	can_dual = TRUE
	damage_multiplier = 1.1
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(1.6)
	fire_sound		= 'sound/weapons/guns/fire/deagle_fire.ogg' // Sound taken from JSRS SOUND MOD https://www.moddb.com/mods/stalker-anomaly/addons/solarint-gunshot-overhaul
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	auto_eject = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_50)
	serial_type = "H&S"

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/basilisk = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/kurz = 1)

/obj/item/part/gun/frame/basilisk
	name = "Basilisk frame"
	desc = "An Basilisk pistol frame. Big n' cheap."
	icon_state = "frame_deagle"
	result = /obj/item/gun/projectile/basilisk
	resultvars = list(/obj/item/gun/projectile/basilisk)
	gripvars = list(/obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/kurz)

/obj/item/gun/projectile/basilisk/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/basilisk/Initialize()
	. = ..()
	update_icon()
