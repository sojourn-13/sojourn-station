/obj/item/gun/projectile/spring
	name = "Greyson Positronic \"Spring\" pistol"
	desc = "GP \"Spring\" pistol, lost tech of a high power pistol using only .35 rounds. Also has the ablity to have a Master Unmaker integrated into it."
	icon = 'icons/obj/guns/projectile/spring.dmi'
	icon_state = "spring"
	damage_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(1.1)
	price_tag = 700
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 6, TECH_ILLEGAL = 3)
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = FALSE
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_PLATINUM = 6)
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	allow_greyson_mods = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "GP"

	wield_delay = 0 SECOND

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
