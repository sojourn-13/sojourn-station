/obj/item/gun/projectile/lamia
	name = "\"Lamia\" heavy pistol"
	desc = "The \"Lamia\", a massive handgun based on the M6 series, repurposed by Holland & Sullivan for civilian and law enforcement use. Uses 12mm."
	icon = 'icons/obj/guns/projectile/lamia.dmi'
	icon_state = "lamia"
	item_state = "lamia"
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
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

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/lamia = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/kurtz = 1)

/obj/item/part/gun/frame/lamia
	name = "Lamia frame"
	desc = "An Lamia pistol frame. For a pocket sized hole puncher."
	icon_state = "frame_lamia"
	result = /obj/item/gun/projectile/lamia
	resultvars = list(/obj/item/gun/projectile/lamia)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/kurtz)

/obj/item/gun/projectile/lamia/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/gun/projectile/lamia/gemini
	name = "\"Gemini\" advanced heavy pistol"
	desc = "The M6D \"Gemini\", a heavy pistol manufactured on Mars and often used by SolFed enforcers and commissars, fitted with a smart-linked optic and stabilizer. Uses 12mm."
	icon_state = "scoped_dark_lamia"
	item_state = "scoped_dark_lamia"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 3)
	zoom_factors = list(0.4)
	init_recoil = HANDGUN_RECOIL(0.7)
	damage_multiplier = 1.3
	price_tag = 1200
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	blacklist_upgrades = list(/obj/item/tool_upgrade/refinement/laserguide = TRUE) // Already has an underbarrel one, hence the recoil control
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
	unload_sound 	= 'sound/weapons/guns/interact/avasarala_unload.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/avasarala_cock.ogg'
	fire_sound 	= 'sound/weapons/guns/fire/avasarala_fire.ogg'
	serial_type = "SD GmbH"

/obj/item/gun/projectile/lamia/socom
	name = "\"SOCOM\" silenced heavy pistol"
	desc = "The M6C SOCOM, a variant of the M6 \"Naga\", it's a highly specialized and advanced handgun developed for the Solar Federation Special Operations Command. This one is fitted with a smart-linked optic and integrated suppressor. Uses 12mm."
	icon_state = "socom"
	item_state = "socom"
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_SILVER = 3)
	init_recoil = HANDGUN_RECOIL(0.1)
	zoom_factors = list(0.5)
	silenced = TRUE
	//penetration_multiplier = 1 // Assuming the silencer turns bullets into subsonic ammo, it has less velocity and thus less penetration. //bzzt, no. We got rid of suppressors reducing pen/damage. Leaving for postereity
	price_tag = 1400
	fire_sound_silenced = 'sound/weapons/guns/fire/vintorez.ogg'
	serial_type = "Sol Fed"
	blacklist_upgrades = list(/obj/item/tool_upgrade/refinement/laserguide = TRUE) // Already has an underbarrel one, hence the recoil control

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
	gun_parts = list(/obj/item/part/gun/frame/amnesty = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/kurtz = 1)

/obj/item/part/gun/frame/amnesty
	name = "Amnesty frame"
	desc = "An Amnesty pistol frame. For a pocket sized hole puncher."
	icon_state = "frame_lamia"
	result = /obj/item/gun/projectile/lamia/amnesty
	resultvars = list(/obj/item/gun/projectile/lamia/amnesty)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/kurtz)
