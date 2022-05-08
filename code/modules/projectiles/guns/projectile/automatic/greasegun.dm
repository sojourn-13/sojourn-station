/obj/item/gun/projectile/automatic/greasegun
	name = "M3 \"Grease Gun\" assault SMG"
	desc = "An old, handy firearm hailing from Sol. Despite it's inredibly dated design it has maintained use within the Sol Federal Police due to its compactness and sub-sonic rounds. \
		 It appears to be made for urban combat with a built in silencer and chambered in .35 Auto; taking specifically only SMG magazines. Reliable but slow firing."
	icon = 'icons/obj/guns/projectile/greasegun.dmi'
	icon_state = "greasegun"
	item_state = "greasegun"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_PLASTEEL = 28, MATERIAL_PLASTIC = 10)
	price_tag = 950
	penetration_multiplier = 1.2
	recoil_buildup = 1.25
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL)
	one_hand_penalty = 3
	init_firemodes = list(
		FULL_AUTO_400_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	serial_type = "Sol Fed"

/obj/item/gun/projectile/automatic/greasegun/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	item_state = itemstring
