/obj/item/gun/projectile/revolver/hornet
	name = "\"Hornet\" heavy revolver"
	desc = "A heavy pistol of custom make with a built-in PainMaker, its heavy round allowing it to still be able to penetrate through basic armor and flesh alike when necessary. \
	Used primarily by either vigilantes, or during hostage situations where taking lives may be needed. Uses 12mm rounds."
	icon = 'icons/obj/guns/projectile/hornet.dmi'
	icon_state = "hornet"
	item_state = "hornet"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1200
	can_dual = TRUE
	proj_agony_multiplier = 1.5
	damage_multiplier = 0.6
	penetration_multiplier = 1
	init_recoil = HANDGUN_RECOIL(2) //Low controle do to painmaker
	zoom_factors = list(0.2)
	fire_sound = 'sound/weapons/guns/fire/12mm_revolver.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_12MM)
	serial_type = "SA"

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/hornet = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/kurtz = 1)

/obj/item/gun/projectile/revolver/hornet/refresh_upgrades()
	..()
	//We give anything we shoot a bit of halloss
	proj_damage_adjust[HALLOSS] += 20

/obj/item/part/gun/frame/hornet
	name = "Hornet frame"
	desc = "A Hornet revolver frame. The pain-maker!"
	icon_state = "frame_hornet"
	result = /obj/item/gun/projectile/revolver/hornet
	resultvars = list(/obj/item/gun/projectile/revolver/hornet)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/kurtz)
