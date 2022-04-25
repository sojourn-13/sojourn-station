/obj/item/gun/projectile/glock
	name = "\"Sky\" pistol"
	desc = "The Seinemetall Defense GmbH sky pistol, a weapon bearing a close resemblance to the traditional police high grade glock, modified for semi-auto, burst, auto-eject mags and coming with a fitting for a silencer. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/glock.dmi'
	icon_state = "glock"
	item_state = "glock"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 800
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL|MAG_WELL_DRUM
	damage_multiplier = 1.15
	penetration_multiplier = 1
	recoil_buildup = 2
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE, GUN_MAGWELL)
	one_hand_penalty = 8
	auto_eject = TRUE
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
		)
	serial_type = "SD GmbH"

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