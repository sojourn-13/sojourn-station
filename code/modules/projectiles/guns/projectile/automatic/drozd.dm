/obj/item/gun/projectile/automatic/drozd
	name = "Excelsior \"Drozd\" SMG"
	desc = "\"The supremacy of the proletariat will cause the enemy to vanish even faster.\"\nAn excellent, fully automatic compact submachinegun. \
			Famous for its perfomance in close quarters, and used by communist cells such as Excelsior. \
			Chambered in .40, it takes both pistol and SMG magazines."
	icon = 'icons/obj/guns/projectile/drozd.dmi'
	icon_state = "drozd"
	item_state = "drozd"
	excelsior = TRUE
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 3)
	price_tag = 800
	damage_multiplier = 0.95
	init_recoil = SMG_RECOIL(0.4)
	twohanded = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL)
	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	serial_type = "EXC"

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.1 // 10 vig
	gun_parts = list(/obj/item/part/gun/frame/drozd = 1, /obj/item/part/gun/grip/excel = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/automatic/drozd/NM_colony
	name = "\"Kompleks\" SMG"
	desc = "An excellent, fully automatic compact submachinegun. Famous for its perfomance in close quarters. Uses .40 rounds and can take a variety of pistol and SMG magazines.\nThis model of the \"Drozd\" SMG has been reclaimed and repurposed by Nadezhda Marshals, making it free of Excelsior taint."
	icon = 'icons/obj/guns/projectile/drozd_bs.dmi'
	icon_state = "drozd-bs"
	item_state = "drozd-bs"
	excelsior = FALSE
	origin_tech = list(TECH_COMBAT = 4)
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/drozd = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/gun/projectile/automatic/drozd/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	item_state = itemstring

/obj/item/part/gun/frame/drozd
	name = "Drozd frame"
	desc = "A Drozd SMG frame. Workhorse of the Excelsior force."
	icon_state = "frame_excelsmg"
	result = /obj/item/gun/projectile/automatic/drozd
	gripvars = list(/obj/item/part/gun/grip/excel, /obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/magnum)
	resultvars = list(/obj/item/gun/projectile/automatic/drozd, /obj/item/gun/projectile/automatic/drozd/NM_colony)
