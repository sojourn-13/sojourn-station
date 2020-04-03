/obj/item/weapon/gun/projectile/lamia
	name = "\"Lamia\" magnum pistol"
	desc = "The \"Lamia\", a heavy pistol based on the core mechanism of the \"Naga\" heavy pistol, simplified for law enforcement and exploration in hostile environments. Produced by Holland & Sullivan Arms. Uses .40 Magnum rounds."
	icon = 'icons/obj/guns/projectile/lamia.dmi'
	icon_state = "lamia"
	item_state = "lamia"
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	can_dual = 1
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	auto_eject = 0
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 2400
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	recoil_buildup = 21
	one_hand_penalty = 20

/obj/item/weapon/gun/projectile/lamia/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/weapon/gun/projectile/lamia/scoped_lamia
	name = "\"Lamia\" advanced magnum pistol"
	desc = "H&S HG .40 \"Lamia\" Based on the \"Naga\" heavy pistol, it's fit for high ranking enforcers; fitted with a smart-linked optic and stabilizer. Uses .40 Magnum rounds."
	icon_state = "scoped_lamia"
	item_state = "scoped_lamia"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 5)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	zoom_factor = 0.4
	recoil_buildup = 15
	price_tag = 2500

/obj/item/weapon/gun/projectile/lamia/dark_lamia
	name = "\"Naga\" advanced magnum pistol"
	desc = "The \"Naga\", a heavy pistol manufactured on Mars and given only to SolFed enforcers and commissars, fitted with a smart-linked optic and stabilizer. Uses .40 Magnum rounds."
	icon_state = "dark_lamia"
	item_state = "dark_lamia"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 3)
	zoom_factor = 0.4
	recoil_buildup = 0.7
	damage_multiplier = 1.40
	penetration_multiplier = 1.80
	price_tag = 2200