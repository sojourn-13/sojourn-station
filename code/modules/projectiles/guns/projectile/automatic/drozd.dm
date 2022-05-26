/obj/item/gun/projectile/automatic/drozd
	name = "Excelsior \"Drozd\" SMG"
	desc = "An excellent fully automatic submachinegun. Famous for it's perfomance in close quarters and used by communists groups such as the excelsior. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/drozd.dmi'
	icon_state = "drozd"
	item_state = "drozd"
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 3)
	price_tag = 1000
	damage_multiplier = 0.95
	recoil_buildup = 0.15
	one_hand_penalty = 10
	twohanded = FALSE
	one_hand_penalty = 5 //smg level
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL)
	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		SEMI_AUTO_NODELAY
		)
	serial_type = "EXC"

/obj/item/gun/projectile/automatic/drozd/NM_colony
	name = "\"Kompleks\" SMG"
	desc = "An excellent fully automatic submachinegun. Famous for it's perfomance in close quarters. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/drozd.dmi'
	origin_tech = list(TECH_COMBAT = 4)
	price_tag = 600
	serial_type = "NM"

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