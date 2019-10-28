/obj/item/weapon/gun/projectile/colt
	name = "FS HG .45 \"Colt\""
	desc = "A decent quality reproduction of the grandfather of automatic pistols, the M1911A1. Uses .45 rounds."
	icon_state = "colt"
	item_state = "colt"
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 5)
	price_tag = 1200
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	recoil = 0.5 //regular pistol kick

/obj/item/weapon/gun/projectile/colt/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/weapon/gun/projectile/colt/IH_colt
	name = "FS HG .45 \"Bronco\""
	desc = "A rugged derivative of the venerable M1911, modernized to the M1911A4 standard. Uses .45 rounds."
	icon_state = "IH_colt"
	item_state = "IH_colt"
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 5)