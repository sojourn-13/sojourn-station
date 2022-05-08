/obj/item/gun/projectile/automatic/scaffold
	name = "Greyson Positronic \"Scaffold\" caseless rifle"
	desc = "A old and lost gun design of a caseless rifle by Greyson Positronic, its high fire rate stopping power and more make it the perfect frame for war. \
	Its'caliber is 10mm and shockingly can be fitted with a silencer and has room for a scope."
	icon = 'icons/obj/guns/projectile/scaffold.dmi'
	icon_state = "scaffold"
	item_state = "scaffold"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 12, TECH_MATERIAL = 10)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PULSE
	auto_eject = TRUE
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_PLASTIC = 35, MATERIAL_PLATINUM = 20)
	price_tag = 2500
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.5 //simular to 257
	penetration_multiplier = 3
	recoil_buildup = 1.25
	one_hand_penalty = 15 //smg level
	serial_type = "GP"

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE ,GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/gun/projectile/automatic/scaffold/update_icon()
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