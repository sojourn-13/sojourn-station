/obj/item/weapon/gun/projectile/mk58
	name = "\"Thorn\" pistol"
	desc = "The OT Thorn is a cheap, ubiquitous sidearm, that was one of the Old Testaments few ballistic creations, though it bears a clear resemblance to the Mk-58 Mod 0. Uses .40 Auto-Mag."
	icon = 'icons/obj/guns/projectile/mk58.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 1400
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = 1
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	damage_multiplier = 0.9
	penetration_multiplier = 0.9
	recoil_buildup = 3
	one_hand_penalty = 10

/obj/item/weapon/gun/projectile/mk58/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"


/obj/item/weapon/gun/projectile/mk58/wood
	name = "\"Rose\" pistol"
	desc = "The OT Rose is a cheap, yet ubiquitous sidearm, that was one of the Old Testaments few ballistic creations. Uses .40 Auto-Mag. This one has a finely polished wood furnish."
	icon = 'icons/obj/guns/projectile/mk58_wood.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1800

/obj/item/weapon/gun/projectile/mk58/wood/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"
