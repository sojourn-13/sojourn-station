//Used to be a Desert Eagle and has been replced with a customized version of the Eris Upstream Lamia
/obj/item/weapon/gun/projectile/deagle
	name = "FS HG .50 \"Avasarala\""
	desc = "An obvious replica of an old Earth \"Desert Eagle\". Robust and straight, this is a gun for a leader, not just an officer."
	icon = 'icons/obj/guns/projectile/deagle.dmi'
	icon_state = "deagle"
	item_state = "lamiaold" //Old bolter style Lamia
	force = WEAPON_FORCE_PAINFUL
	caliber = ".50"
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1600
	can_dual = 1
	damage_multiplier = 1.3
	penetration_multiplier = 1.2
	recoil_buildup = 33
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	auto_eject = 1
	recoil_buildup = 0.8 //high caliber pistol recoil