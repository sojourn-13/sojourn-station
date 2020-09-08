/obj/item/weapon/gun/projectile/automatic/straylight
	name = "\"Straylight\" auto-pistol"
	desc = "A select-fire pistol made by H&S as a variant of the Firefly. Compact and flexible, but somewhat underpowered. Custom magwell allows it to feed both from pistol and SMG magazines. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/straylight.dmi'
	icon_state = "straylight"
	item_state = "straylight"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG|MAG_WELL_H_PISTOL
	auto_eject = 1
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 3)
	price_tag = 850
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35)
	damage_multiplier = 0.9
	recoil_buildup = 3
	one_hand_penalty = 40

	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/straylight/update_icon()
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

/obj/item/weapon/gun/projectile/automatic/straylight/Initialize()
	. = ..()
	update_icon()