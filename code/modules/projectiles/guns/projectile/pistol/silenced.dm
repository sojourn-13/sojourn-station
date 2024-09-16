/obj/item/gun/projectile/silenced
	name = "\"Rafale\" silenced pistol"
	desc = "A high quality, specialty handgun exclusively produced (as the markings so proudly state) by Seinemetall Defense GmbH. Commonly used by police and SWAT teams during stealth operations. Uses 10mm Auto-Mag. Has an integrated silencer which cannot be removed."
	icon = 'icons/obj/guns/projectile/rafale.dmi'
	icon_state = "rafale"
	item_state = "rafale"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_MAGNUM
	can_dual = TRUE
	silenced = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 800
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	proj_step_multiplier = 0.8
	damage_multiplier = 1.6
	penetration_multiplier = 1.5
	init_recoil = HANDGUN_RECOIL(0.4)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "SD GmbH"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/silenced/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring

/obj/item/gun/projectile/silenced/Initialize()
	. = ..()
	update_icon()
