/obj/item/gun/projectile/revolver/judge
	name = "\"Judge\" heavy revolver"
	desc = "A specially made revolver produced by Nadezhda Marshal's gunsmiths to solve the problem of ever-heavier armors being used in criminal actions. \
	This revolver specifically is chambered in 7.62, packing quite a punch for a revolver even in spite of its short barrel."
	icon = 'icons/obj/guns/projectile/judge.dmi'
	icon_state = "judge"
	item_state = "judge"
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 6)
	price_tag = 1400
	damage_multiplier = 1.2
	penetration_multiplier = 1.4
	init_recoil = HANDGUN_RECOIL(1.5)
	zoom_factors = list(0.2)
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "NM"

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/judge = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/lrifle = 1)

/obj/item/part/gun/frame/judge
	name = "Judge frame"
	desc = "An Judge revolver frame. For when you just really don't like someone."
	icon_state = "frame_inspector"
	result = /obj/item/gun/projectile/revolver/judge
	resultvars = list(/obj/item/gun/projectile/revolver/judge)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)
