/obj/item/gun/projectile/automatic/freedom
	name = "\"Freedom\" magnum SMG"
	desc = "A modified version of the .40 \"Liberty\" pistol, the aptly named \"Freedom\" sports an increased rate of fire and a brace-style stock to aid in recoil control."
	icon_state = "freedom"
	item_state = "freedom"
	icon = 'icons/obj/guns/projectile/freedom.dmi'
	fire_sound = 'sound/weapons/guns/fire/1911_fire.ogg' //This is just a 1911 with rapidfire, no reason for it to sound different. / Sound taken from JSRS SOUND MOD https://www.moddb.com/mods/stalker-anomaly/addons/solarint-gunshot-overhaul
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER // The Vector can, I don't see why this one shouldn't as it's literally just a liberty with extended mag.
	load_method = SINGLE_CASING|MAGAZINE
	caliber = CAL_MAGNUM
	mag_well = MAG_WELL_SMG|MAG_WELL_PISTOL
	can_dual = TRUE
	price_tag = 800
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_PLASTIC = 8)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	zoom_factors = list(0.2)
	damage_multiplier = 1.0
	penetration_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(0.9)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND_NOLOSS,
		FULL_AUTO_600_NOLOSS
		)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield
	gun_parts = list(/obj/item/part/gun/frame/freedom = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/automatic/freedom/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		if(ammo_magazine.max_ammo==30)
			iconstring += "_longmag"
		else
			iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/freedom/Initialize()
	. = ..()
	update_icon()

/obj/item/part/gun/frame/freedom
	name = "Freedom SMG frame"
	desc = "A Colt-based Freedom SMG frame. For when you need to fight five more world wars."
	icon_state = "frame_1911"
	result = /obj/item/gun/projectile/automatic/freedom
	resultvars = list(/obj/item/gun/projectile/automatic/freedom)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/magnum)
