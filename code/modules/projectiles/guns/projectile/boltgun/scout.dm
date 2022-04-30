/obj/item/gun/projectile/boltgun/scout
	name = "\"Scout\" heavy boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .408 Heavy Rifle rounds, it packs the reach, the punch and the accuracy for every occasion, however saying it kicks like a mule would only be a plain understatement."
	icon = 'icons/obj/guns/projectile/heavyboltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 1.5
	penetration_multiplier  = 1.5
	extra_damage_mult_scoped = 0.2
	recoil_buildup = 30
	max_shells = 5
	zoom_factor = 2.0
	price_tag = 1500
	sharp = 0
	caliber = CAL_HRIFLE
	load_method = SINGLE_CASING
	one_hand_penalty = 40 //No trick shots
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 10)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/scout
	slowdown_hold = 1
	brace_penalty = 15
	serial_type = "H&S"


/obj/item/gun/projectile/boltgun/sawn/scout
	name = "\"obrez\" heavy boltgun"
	desc = "A crudly mangled and sawn-down .408 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/heavyboltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_HRIFLE
	load_method = SINGLE_CASING
	fire_delay = 18
	max_shells = 5
	one_hand_penalty = 15
	saw_off = FALSE
	slowdown_hold = FALSE
	brace_penalty = FALSE
	serial_type = "H&S"