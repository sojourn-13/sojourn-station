/obj/item/weapon/gun/projectile/automatic/mac
	name = "\"MAC\" SMG"
	desc = "A conceptual replica of an old and incredibly simple SMG. However, ergonomics were never good on the original, and recoil is rather significan. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/mac.dmi'
	icon_state = "mac"
	item_state = "mac"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/smg
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 2000
	damage_multiplier = 0.9
	recoil_buildup = 5
	one_hand_penalty = 20
	silencer_type = /obj/item/weapon/silencer
	one_hand_penalty = 5 //smg level

	firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY,
		)

/obj/item/weapon/gun/projectile/automatic/mac/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return
