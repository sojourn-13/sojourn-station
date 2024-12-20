/obj/item/gun/projectile/automatic/triage
	name = "\"Triage\" Compact SMG"
	desc = "A bullpup SMG chambered in 10mm. \
	Created in collaboration with the Soteria R&D division using jury-rigged greyson miniaturization designs to create a compact and lightweight SMG. \
	Perfect for the corpsman who travels light."
	icon = 'icons/obj/guns/projectile/triage.dmi'
	icon_state = "triage"
	item_state = "triage"
	w_class = ITEM_SIZE_NORMAL
	extra_bulk = 4
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5)
	slot_flags = SLOT_BELT
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 14, MATERIAL_PLASTIC = 12, MATERIAL_PLATINUM = 3)
	price_tag = 900
	penetration_multiplier = 1.2
	init_recoil = SMG_RECOIL(0.6)
	gun_parts = null //she's a delicate, complicated lil flower. Don't try to pull her apart.
	fire_sound_silenced = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SCOPE, GUN_SILENCABLE)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		FULL_AUTO_600_NOLOSS
		)
	serial_type = "NM"

/obj/item/gun/projectile/automatic/triage/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		if(ammo_magazine.max_ammo==30)
			iconstring += "_long"
		else
			iconstring += "_short"

		var/percent = (ammo_magazine.stored_ammo.len / ammo_magazine.max_ammo) * 100
		var/number = round(percent, 25)
		iconstring += "_[number]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		itemstring += "_s"
		iconstring += "_s"


	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/triage/Initialize()
	. = ..()
	update_icon()
