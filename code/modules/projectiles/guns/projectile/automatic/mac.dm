//A combat classifed in gun loot pools weapon that deals more damage to less armored
/obj/item/gun/projectile/automatic/mac
	name = "\"MAC\" SMG"
	desc = "A conceptual replica of an old and incredibly simple SMG. \
	Designed to be used against unarmored threats. \
	However, ergonomics were never good on the original, and recoil is rather significant. \
	Essentially disposable. Uses .35."
	icon = 'icons/obj/guns/projectile/mac.dmi'
	icon_state = "mac"
	item_state = "mac"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 700
	gun_parts = null
	damage_multiplier = 0.9
	penetration_multiplier = 0.8
	wound_mult_addition = 0.75
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	init_recoil = SMG_RECOIL(0.7)

	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		BURST_8_ROUND_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	serial_type = "SA"

/obj/item/gun/projectile/automatic/mac/update_icon()
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

/obj/item/gun/projectile/automatic/mac/Initialize()
	. = ..()
	update_icon()

///not for typical use: it WILL cause lag
/obj/item/gun/projectile/automatic/mac/croon
	name = "\"Croon\" mini-chaingun"
	desc = "Essentially a box with a motor, this ultra-simple SMG is technically a chaingun. The markings are in strange runes, the only ledgible parts reading \"Croon HS-010 .35\" and the selector switch seems to be fully automatic in both directions."
	icon = 'icons/obj/guns/projectile/hs010.dmi'
	icon_state = "croon"
	item_state = "croon"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 1000
	damage_multiplier = 0.75
	init_recoil = SMG_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'

	init_firemodes = list(
		FULL_AUTO_300,
		list(mode_name="fuller auto", mode_desc = "Hold down trigger to make anything you point it at have 32 more holes around it", mode_type = /datum/firemode/automatic, burst_delay=1.25, fire_delay=1, icon="fuller"),
		)

/obj/item/gun/projectile/automatic/mac/croon/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/mac/croon/Initialize()
	. = ..()
	update_icon()
