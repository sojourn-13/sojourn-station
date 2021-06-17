/obj/item/weapon/gun/projectile/automatic/texan
	name = "\"Texan\" SMG"
	desc = "The Texan is a reliable assault weapon, mass-produced by \"Scarborough Arms\" for raiding parities in tight ship hall, with a moderate effectiveness against soft body armor. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/texan.dmi'
	icon_state = "texan"
	item_state = "texan"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_WOOD = 4)
	price_tag = 800
	damage_multiplier = 0.9
	penetration_multiplier = 1.5
	recoil_buildup = 4.5
	one_hand_penalty = 10
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL)

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/texan/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return
