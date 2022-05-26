/obj/item/gun/projectile/gyropistol
	name = "SA GP \"Emperor \""
	desc = "A bulky pistol designed to fire self-propelled rounds. Commonly referred to as the 'man-opener' by void wolves."
	icon = 'icons/obj/guns/projectile/gyropistol.dmi'
	icon_state = "gyropistol"
	item_state = "pistol"
	caliber = CAL_70
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 3)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 1500
	ammo_type = "/obj/item/ammo_casing/a75"
	load_method = SINGLE_CASING|MAGAZINE //Nothing bad will happen
	mag_well = MAG_WELL_PISTOL
	magazine_type = /obj/item/ammo_magazine/a75
	auto_eject = 1
	recoil_buildup = 3 //self-propelled rounds, basically almost no recoil
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	serial_type = "SA"

/obj/item/gun/projectile/gyropistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "gyropistolloaded"
	else
		icon_state = "gyropistol"
