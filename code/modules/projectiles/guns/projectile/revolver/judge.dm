/obj/item/gun/projectile/revolver/judge
	name = "\"Judge\" heavy revolver"
	desc = "A specially made revolver procued by Nadezhda Marshal's gunsmiths to solve the problem of ever-heavier armors being used in criminal actions. \
	This revolver specifically is chambered in 7.5, packing quite a punch for a revolver even in spite of its short barrel."
	icon = 'icons/obj/guns/projectile/judge.dmi'
	icon_state = "judge"
	item_state = "judge"
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 6)
	price_tag = 1500
	damage_multiplier = 1.2
	penetration_multiplier = 1.4
	recoil_buildup = 14
	one_hand_penalty = 18
	zoom_factor = 0.2
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "NM"
