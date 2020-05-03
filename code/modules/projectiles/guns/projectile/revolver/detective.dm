/obj/item/weapon/gun/projectile/revolver/detective
	name = "\"Havelock\" revolver"
	desc = "A cheap H&S J-frame revolver, simple, reliable, .35 caliber."
	icon = 'icons/obj/guns/projectile/detective.dmi'
	icon_state = "detective"
	drawChargeMeter = FALSE
	w_class = ITEM_SIZE_SMALL
	max_shells = 6
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 800 //cheap civ peashooter revolver, something similar to olivav
	damage_multiplier = 1.15 //because pistol round
	penetration_multiplier = 1.2
	recoil_buildup = 18
	one_hand_penalty = 15

/obj/item/weapon/gun/projectile/revolver/detective/loaded
/obj/item/weapon/gun/projectile/revolver/detective/loaded_rubber

/obj/item/weapon/gun/projectile/revolver/detective/loaded/New()
	..()
	src.self_load(new /obj/item/ammo_magazine/slpistol)
	src.update_icon()

/obj/item/weapon/gun/projectile/revolver/detective/loaded_rubber/New()
	..()
	src.self_load(new /obj/item/ammo_magazine/slpistol/rubber)
	src.update_icon()