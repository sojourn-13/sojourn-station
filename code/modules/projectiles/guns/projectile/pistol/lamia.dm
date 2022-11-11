/obj/item/gun/projectile/lamia
	name = "\"Lamia\" heavy pistol"
	desc = "The \"Lamia\", a massive handgun based on the M6 series, repackaged by Holland & Sullivan for civilian and law enforcement use. Uses 12mm."
	icon = 'icons/obj/guns/projectile/lamia.dmi'
	icon_state = "lamia"
	item_state = "lamia"
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	caliber = CAL_50
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1000
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.3
	init_recoil = HANDGUN_RECOIL(1.3)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_12MM)
	serial_type = "H&S"

/obj/item/gun/projectile/lamia/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/gun/projectile/lamia/sf
	name = "\"Rattler\" heavy pistol"
	desc = "An M6 \"Rattler\" heavy pistol, the mainline heavy sidearm of the galaxy. This one still bears SolFed markings either lost or stolen. Uses 12mm."
	icon_state = "sfdark_lamia"
	item_state = "sfdark_lamia"
	serial_type = "Sol Fed"
	serial_shown = TRUE

/obj/item/gun/projectile/lamia/scoped
	name = "\"Argos\" advanced heavy pistol"
	desc = "Seinemetall Defense GmbH handgun 12mm \"Argos\" Based on the \"Lamia\" heavy pistol, it's fit for high ranking enforcers; fitted with a smart-linked optic and stabilizer. Uses 12mm."
	icon_state = "scoped_lamia"
	item_state = "scoped_lamia"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 5)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	zoom_factors = list(0.4)
	init_recoil = HANDGUN_RECOIL(0.7)
	price_tag = 1100
	serial_type = "SD GmbH"

/obj/item/gun/projectile/lamia/akurra
	name = "\"Akurra\" silenced heavy pistol"
	desc = "The \"Akurra\", a specialized and heavily modified Lamia-pattern pistol that's been shaved down to a sleek gunfighter's tool.  This one is fitted with an integrated suppressor and gutter-sights. Uses 12mm."
	icon_state = "akurra"
	item_state = "akurra"
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 3)
	init_recoil = HANDGUN_RECOIL(0.4)
	silenced = TRUE
	damage_multiplier = 0.95
	penetration_multiplier = 1.2
	price_tag = 1400
	serial_type = "SA"

/obj/item/gun/projectile/lamia/amnesty
	name = "\"Amnesty\" heavy pistol"
	desc = "The \"Amnesty\" pistol started as a prototype as parts from advanced heavy pistols found themselves converted to a cheaper, easier to procude format alongside improvements made to Marshal firearms. Chambered in 12mm."
	icon = 'icons/obj/guns/projectile/amnesty.dmi'
	icon_state = "amnesty"
	item_state = "amnesty"
	price_tag = 1200
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 8, MATERIAL_GLASS = 4)
	damage_multiplier = 1.4
	penetration_multiplier = 1.2
	zoom_factors = list(0.2)
	init_recoil = HANDGUN_RECOIL(1.1)
	unload_sound 	= 'sound/weapons/guns/interact/avasarala_unload.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/avasarala_cock.ogg'
	fire_sound 	= 'sound/weapons/guns/fire/avasarala_fire.ogg'
	serial_type = "NM"
