/obj/item/gun/projectile/deaglebolt
	name = "\"Triple Primary\" heavy pistol"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	This particular pistol is the pinnacle of gunsmithing, featuring an advanced chamber switching magwell capable of fitting pistol, magnum, and kurtz rounds. A bit flashy, but hands down \
	one of the greatest pistols ever made in terms of versatility."
	icon = 'icons/obj/guns/projectile/deaglebolt.dmi'
	icon_state = "deagle"
	item_state = "deagle"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1750
	can_dual = TRUE
	damage_multiplier = 1.4
	penetration_multiplier = 1.3
	recoil_buildup = 6
	one_hand_penalty = 10
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	auto_eject = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_50, GUN_CALIBRE_35)
	serial_type = "BlueCross"

/obj/item/gun/projectile/deaglebolt/verb/change_caliber()
	set name = "Change Caliber"
	set desc = "For when you need to change your guns caliber, handy when you have more ammo of one type."
	set category = "Object"

	playsound(src.loc, 'sound/weapons/guns/interact/chaingun_cock.ogg', 100, 1)
	if(caliber == CAL_50)
		caliber = CAL_MAGNUM
		visible_message(SPAN_NOTICE("\The [usr] clicks a button on \the [src], a beep and metallic whirr is heard before it changes to .40 magnum caliber!"), \
		SPAN_NOTICE("You hear something metallic whirr and beep."))
	else if(caliber == CAL_MAGNUM)
		caliber = CAL_PISTOL
		visible_message(SPAN_NOTICE("\The [usr] clicks a button on \the [src], a beep and metallic whirr is heard before it changes to .35 pistol caliber!"), \
		SPAN_NOTICE("You hear something metallic whirr and beep."))
	else if (caliber == CAL_PISTOL)
		caliber = CAL_50
		visible_message(SPAN_NOTICE("\The [usr] clicks a button on \the [src], a beep and metallic whirr is heard before it changes to .50 kurtz caliber!"), \
		SPAN_NOTICE("You hear something metallic whirr and beep."))
	refresh_upgrades()