/obj/item/gun/projectile/automatic/freedom
	name = "\"Freedom\" magnum SMG"
	desc = "A modified version of the 10mm \"Liberty\" pistol, the aptly named \"Freedom\" sports an increased rate of fire and a brace-style stock to aid in recoil control."
	icon_state = "freedom"
	item_state = "freedom"
	icon = 'icons/obj/guns/projectile/freedom.dmi'
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	slot_flags = SLOT_BACK|SLOT_BELT
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
