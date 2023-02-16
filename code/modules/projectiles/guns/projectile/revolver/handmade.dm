/obj/item/gun/projectile/revolver/handmade
	name = "handmade revolver"
	desc = "Handmade revolver, made from spare parts and some duct tape, will it even hold up?"
	icon = 'icons/obj/guns/projectile/handmade_revolver.dmi'
	icon_state = "handmade_revolver"//evan, temp icon
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	max_shells = 6
	matter = list(MATERIAL_WOOD = 10, MATERIAL_STEEL = 15)
	price_tag = 100 //one of the cheapest revolvers here
	damage_multiplier = 1
	init_recoil = HANDGUN_RECOIL(0.8)
	serial_type = "INDEX"
	serial_shown = FALSE

	wield_delay = 0 SECOND
	gun_parts = list(/obj/item/part/gun/frame/revolver_handmade = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver/steel = 1, /obj/item/part/gun/barrel/magnum/steel = 1)

/obj/item/part/gun/frame/revolver_handmade
	name = "Handmade revolver frame"
	desc = "A handmade revolver. The second most ancient gun design, made with scrap and spit."
	icon_state = "frame_revolver_hm"
	matter = list(MATERIAL_STEEL = 5)
	resultvars = list(/obj/item/gun/projectile/revolver/handmade)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver/steel
	barrelvars = list(/obj/item/part/gun/barrel/pistol/steel, /obj/item/part/gun/barrel/magnum/steel, /obj/item/part/gun/barrel/kurtz/steel)	//9mm, 10mm, or 12mm
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.
