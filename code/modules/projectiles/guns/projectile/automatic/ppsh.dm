/obj/item/weapon/gun/projectile/automatic/ppsh
	name = "Excelsior \"Shpagin\" assault SMG"
	desc = "\"We are spiritual wanderers, poor in spirit. What do we live on? We live from the pure hatred we feel. We cannot love anyone. We destroy things, we shout them, we burn them..\"\
		 An expirimental sub-machine gun design made for urban combat with a built in silencer and chambered in 35 Auto; taking only specific drum magizines. For the union, for the future."
	icon = 'icons/obj/guns/projectile/ppsh.dmi'
	icon_state = "ppsh"
	item_state = "ppsh"
	w_class = ITEM_SIZE_BULKY
	twohanded = TRUE
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 28, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	penetration_multiplier = 1.2
	recoil_buildup = 3.5
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	one_hand_penalty = 20
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1
	init_firemodes = list(
		FULL_AUTO_600,
		BURST_8_ROUND,
		)

/obj/item/weapon/gun/projectile/automatic/ppsh/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/weapon/gun/projectile/automatic/ppsh/ppv
	name = "\"Semyonovich\" assault SMG"
	desc = "Some madmans bastardized yet idealized version of the past; improved yet its meaning and worth lost to time. \
		 An expirimental sub-machine gun design made for urban combat with a built in silencer and chambered in .35 Auto; taking only specific drum magizines. The hammer to break the chains."
	icon = 'icons/obj/guns/projectile/ppv.dmi'
	icon_state = "ppv"
	item_state = "ppv"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	price_tag = 1200
	damage_multiplier = 0.9
	penetration_multiplier = 1.0
	recoil_buildup = 5
	one_hand_penalty = 20
	auto_eject = 0
