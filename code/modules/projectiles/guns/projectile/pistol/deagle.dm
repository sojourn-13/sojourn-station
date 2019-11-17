//Used to be a Desert Eagle and has been replced with a customized version of the Eris Upstream Lamia
/obj/item/weapon/gun/projectile/deagle
	name = "FS HG .40 Magnum \"Avasarala\""
	desc = "An obvious replica of an old Earth \"Desert Eagle\". Robust and straight, this is a gun for a leader, not just an officer."
	icon = 'icons/obj/guns/projectile/deagle.dmi'
	icon_state = "deagle"
	item_state = "lamiaold" //Old bolter style Lamia
	force = WEAPON_FORCE_PAINFUL
	caliber = "magnum"
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 2000'
	damage_multiplier = 1.1
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	auto_eject = 1
	recoil = 0.8 //high caliber pistol recoil

/obj/item/weapon/gun/projectile/deagle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "deagle-[round(ammo_magazine.stored_ammo.len,1)]"
	else
		icon_state = "deagle"
	return