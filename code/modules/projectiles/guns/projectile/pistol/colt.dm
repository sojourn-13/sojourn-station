/obj/item/weapon/gun/projectile/colt
	name = "FS HG .45 \"Colt M1911\""
	desc = "A cheap knock-off of a Colt M1911. Uses .45 rounds."
	icon = 'icons/obj/guns/projectile/colt.dmi'
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

/obj/item/weapon/gun/projectile/colt/IH_colt
	name = "FS HG .45 \"Bronco\""
	desc = "A rugged derivative of the venerable M1911, modernized to the M1911A3 standard. Uses .45 rounds."
	icon_state = "IH_colt"
	item_state = "IH_colt"
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 5)

/obj/item/weapon/gun/projectile/colt/ten
	name = "FS HG 10mm \"Delta Elite\""
	desc = "A classy civilian high-powered automatic based on the M1911 series handguns, with significant reinforcements. Uses 10mm auto."
	icon_state = "delta"
	item_state = "colt"
	w_class = ITEM_SIZE_NORMAL
	caliber = "10mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	ammo_type = "/obj/item/ammo_casing/a10mm"
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	magazine_type = /obj/item/ammo_magazine/a10mm
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8)
	price_tag = 2000
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	recoil = 0.6
	damage_multiplier = 1.4

/obj/item/weapon/gun/projectile/colt/ten/dark
	name = "FS HG 10mm \"Stallion\""
	desc = "A rugged derivative of the venerable M1911, modernized to the M1911A5 standard. Uses 10mm auto."
	icon_state = "dark_delta"
	item_state = "dark_delta"
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

/obj/item/weapon/gun/projectile/colt/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring

/obj/item/weapon/gun/projectile/colt/Initialize()
	. = ..()
	update_icon()
