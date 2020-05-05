/obj/item/weapon/gun/projectile/automatic/drozd
	name = "\"Drozd\" SMG"
	desc = "An excellent fully automatic submachinegun. Famous for it's perfomance in close quarters. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/drozd.dmi'
	icon_state = "drozd"
	item_state = "drozd"
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 3)
	price_tag = 2000
	damage_multiplier = 0.75
	recoil_buildup = 1.5
	one_hand_penalty = 10
	silencer_type = /obj/item/weapon/silencer
	twohanded = FALSE
	one_hand_penalty = 5 //smg level

	firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY
		)

/obj/item/weapon/gun/projectile/automatic/drozd/update_icon()
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