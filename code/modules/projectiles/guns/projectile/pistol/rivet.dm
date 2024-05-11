/obj/item/gun/projectile/rivet
	name = "Greyson Positronic \"Rivet\" magnum pistol"
	desc = "GP \"Rivet\" magnum pistol, lost tech of a high power pistol using only 10mm Auto-Mag. Also has the ablity to have a Master Unmaker integrated into it."
	icon = 'icons/obj/guns/projectile/rivet_gun.dmi'
	icon_state = "rivet"
	damage_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(1.3)
	price_tag = 1000
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 6, TECH_ILLEGAL = 3)
	w_class = ITEM_SIZE_SMALL
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_MAGNUM
	can_dual = TRUE
	silenced = FALSE
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 6, MATERIAL_PLATINUM = 9)
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_MAGWELL)
	allow_greyson_mods = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "GP"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.1 // 10 vig, Greyson & rare

/obj/item/gun/projectile/rivet/update_icon()
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
