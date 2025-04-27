/obj/item/gun/projectile/automatic/ppsh
	name = "Excelsior \"Shpagin\" assault SMG"
	desc = "\"We are spiritual wanderers, poor in spirit. What do we live on? We live on the pure hatred we feel. We cannot love. We destroy. We shout. We burn.\"\nAn experimental sub-machine gun design made for urban combat with a built in silencer and chambered in .35. For the union, for the future."
	icon = 'icons/obj/guns/projectile/ppsh.dmi'
	icon_state = "ppsh"
	item_state = "ppsh"
	excelsior = TRUE
	w_class = ITEM_SIZE_BULKY
	twohanded = TRUE
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 28, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	penetration_multiplier = 1.2
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1
	init_recoil = SMG_RECOIL(1.2)
	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		BURST_8_ROUND_NOLOSS,
		)
	serial_type = "EXC"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield
	gun_parts = list(/obj/item/part/gun/frame/ppsh = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/automatic/ppsh/NM_colony
	name = "\"Ekaterina\" assault SMG"
	desc = "An experimental sub-machine gun design made for urban combat with a built in silencer and chambered in .35.\nThis model of the \"Shpagin\" assault SMG has been reclaimed and repurposed by Nadezhda Marshals, making it free of Excelsior taint."
	icon = 'icons/obj/guns/projectile/ppsh_bs.dmi'
	icon_state = "ppsh_bs"
	item_state = "ppsh_bs"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	price_tag = 800
	serial_type = "NM"
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun/frame/ppsh = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/automatic/ppsh/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/gun/projectile/automatic/ppsh/ppv
	name = "\"Semyonovich\" assault SMG"
	desc = "Some madmans bastardized yet idealized version of the past; while improved, its meaning and worth are lost to time. \
		 An experimental sub-machine gun design made for urban combat with a built in silencer and chambered in .35." // Don't add communist spiel on de-excelsiored guns for consistency, please.
	icon = 'icons/obj/guns/projectile/ppv.dmi'
	icon_state = "ppv"
	item_state = "ppv"
	mag_well = MAG_WELL_SMG|MAG_WELL_DRUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	price_tag = 800
	damage_multiplier = 0.9
	penetration_multiplier = 1
	init_recoil = SMG_RECOIL(1.3)
	auto_eject = 0
	serial_type = "NM"
	excelsior = FALSE
	gun_parts = list(/obj/item/part/gun/frame/ppsh = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/automatic/ppsh/ppv/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/part/gun/frame/ppsh
	name = "PPSH frame"
	desc = "A PPSH SMG frame. A worker's best friend."
	icon_state = "frame_ppsh"
	result = /obj/item/gun/projectile/automatic/ppsh
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/rubber, /obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
	resultvars = list(/obj/item/gun/projectile/automatic/ppsh, /obj/item/gun/projectile/automatic/ppsh/NM_colony, /obj/item/gun/projectile/automatic/ppsh/ppv)
