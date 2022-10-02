/obj/item/gun/projectile/revolver/hornet
	name = "\"Hornet\" heavy revolver"
	desc = "A heavy pistol custom made that has built smaller PainMaker allowing it to still be able to penetrate through basic armor and flesh alike if needed. \
	Used by eather vigilantes or during hostages situations were taking some lives is needed .Uses 12mm."
	icon = 'icons/obj/guns/projectile/hornet.dmi'
	icon_state = "hornet"
	item_state = "hornet"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1200
	can_dual = TRUE
	proj_agony_multiplier = 1.3
	damage_multiplier = 0.9
	penetration_multiplier = 1
	init_recoil = HANDGUN_RECOIL(1) //So it can accully be used
	zoom_factors = list(0.2)
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_12MM)
	serial_type = "SA"
