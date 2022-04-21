/obj/item/gun/projectile/automatic/ppsh
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
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 28, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	penetration_multiplier = 1.2
	recoil_buildup = 0.75
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	one_hand_penalty = 20
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1
	brace_penalty = 5 //Holding the line, not pushing
	init_firemodes = list(
		FULL_AUTO_800_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		BURST_8_ROUND_NOLOSS,
		)
	serial_type = "EXC"

/obj/item/gun/projectile/automatic/ppsh/NM_colony
	name = "\"Ekaterina\" assault SMG"
	desc = "An expirimental sub-machine gun design made for urban combat with a built in silencer and chambered in 35 Auto; taking only specific drum magizines."
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	price_tag = 800
	serial_type = "NM"

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
	desc = "Some madmans bastardized yet idealized version of the past; improved yet its meaning and worth lost to time. \
		 An expirimental sub-machine gun design made for urban combat with a built in silencer and chambered in .35 Auto. Unlike it's older cousin it can use both stick and drum magazines. The hammer to break the chains."
	icon = 'icons/obj/guns/projectile/ppv.dmi'
	icon_state = "ppv"
	item_state = "ppv"
	mag_well = MAG_WELL_SMG|MAG_WELL_DRUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	price_tag = 1200
	damage_multiplier = 0.9
	penetration_multiplier = 1.0
	recoil_buildup = 1.25
	one_hand_penalty = 20
	auto_eject = 0
	serial_type = "NM"

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