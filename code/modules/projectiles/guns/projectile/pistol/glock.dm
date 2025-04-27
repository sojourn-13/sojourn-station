/obj/item/gun/projectile/glock
	name = "\"Sky\" pistol"
	desc = "The Seinemetall Defense GmbH sky pistol, a weapon bearing a close resemblance to the traditional police high grade glock, modified for semi-auto, burst, auto-eject mags and coming with a fitting for a silencer. Uses .35."
	icon = 'icons/obj/guns/projectile/glock.dmi'
	icon_state = "glock"
	item_state = "glock"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 600
	fire_sound = 'sound/weapons/guns/fire/glock_fire.ogg' //I got glock in my rari / Sound taken from JSRS SOUND MOD https://www.moddb.com/mods/stalker-anomaly/addons/solarint-gunshot-overhaul
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL|MAG_WELL_DRUM
	damage_multiplier = 1.15
	penetration_multiplier = 1
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE, GUN_MAGWELL)
	init_recoil = HANDGUN_RECOIL(1)
	auto_eject = TRUE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
		)
	serial_type = "SD GmbH"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.3 // 30 vig
	gun_parts = list(/obj/item/part/gun/frame/glock = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol= 1)

/obj/item/gun/projectile/glock/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/part/gun/frame/glock
	name = "Sky frame"
	desc = "A Sky pistol frame. An ugly, blocky piece of shit."
	icon_state = "frame_glock"
	result = /obj/item/gun/projectile/glock
	resultvars = list(/obj/item/gun/projectile/glock)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
