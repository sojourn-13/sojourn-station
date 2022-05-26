/obj/item/gun/projectile/spring
	name = "Greyson Positronic \"Spring\" pistol"
	desc = "GP \"Spring\" pistol, lost tech of a high power pistol using only .35 rounds. "
	icon = 'icons/obj/guns/projectile/spring.dmi'
	icon_state = "spring"
	damage_multiplier = 1.1
	recoil_buildup = 5
	price_tag = 700
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 6, TECH_ILLEGAL = 3)
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = FALSE
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_PLATINUM = 6)
	price_tag = 850
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "GP"

/obj/item/gun/projectile/spring/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)