/obj/item/weapon/gun/projectile/automatic/mac
	name = "\"MAC\" SMG"
	desc = "A conceptual replica of an old and incredibly simple SMG. However, ergonomics were never good on the original, and recoil is rather significant. Essentially disposable. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/mac.dmi'
	icon_state = "mac"
	item_state = "mac"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 1000
	damage_multiplier = 0.9
	recoil_buildup = 5
	gun_tags = list(GUN_PROJECTILE,GUN_SILENCABLE, GUN_CALIBRE_35)
	one_hand_penalty = 5 //smg level

	init_firemodes = list(
		FULL_AUTO_600,
		BURST_8_ROUND,
		SEMI_AUTO_NODELAY
		)

/obj/item/weapon/gun/projectile/automatic/mac/update_icon()
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

/obj/item/weapon/gun/projectile/automatic/mac/Initialize()
	. = ..()
	update_icon()

///not for typical use: it WILL cause lag
/obj/item/weapon/gun/projectile/automatic/mac/croon
	name = "\"Croon\" mini-chaingun"
	desc = "Essentially a box with a motor, this ultra-simple SMG is technically a chaingun. The markings are in strange runes, the only ledgible parts reading \"Croon HS-010 .35\" and the selector switch seems to be fully automatic in both directions."
	icon = 'icons/obj/guns/projectile/hs010.dmi'
	icon_state = "croon"
	item_state = "croon"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 1000
	damage_multiplier = 0.75
	recoil_buildup = 2
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	one_hand_penalty = 5 //smg level
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'

	init_firemodes = list(
		FULL_AUTO_600,
		list(mode_name="fuller auto", mode_type = /datum/firemode/automatic, fire_delay=0.5, icon="auto"),
		)

/obj/item/weapon/gun/projectile/automatic/mac/croon/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/mac/croon/Initialize()
	. = ..()
	update_icon()
