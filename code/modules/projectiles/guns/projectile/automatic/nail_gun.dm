/obj/item/gun/projectile/automatic/nail_gun
	name = "Greyson Positronic \"Nail\" rifle"
	desc = "A old and lost gun design of a rifle by Greyson Positronic, its high fire rate stopping power and more make it the perfect tool for war. \
	Its'caliber is .257 and shockingly can be fitted with a silencer and has room for a scope."
	icon = 'icons/obj/guns/projectile/nail_gun.dmi'
	icon_state = "nail_gun"
	item_state = "nail_gun"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 12, TECH_MATERIAL = 10)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_STANMAG
	auto_eject = TRUE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 25, MATERIAL_PLATINUM = 20)
	price_tag = 2500
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	recoil_buildup = 0.5
	one_hand_penalty = 5 //smg level

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE ,GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "GP"

/obj/item/gun/projectile/automatic/nail_gun/update_icon()
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