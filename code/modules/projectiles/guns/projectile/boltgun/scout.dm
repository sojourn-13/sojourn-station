/obj/item/weapon/gun/projectile/boltgun/scout
	name = "\"Scout\" heavy boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .408 Heavy Rifle rounds, it packs the reach and accuracy for every occasion."
	icon = 'icons/obj/guns/projectile/heavyboltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	force = WEAPON_FORCE_PAINFUL
	damage_multiplier = 1.3
	penetration_multiplier  = 1.6
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
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/boltgun/sawn/scout

/obj/item/weapon/gun/projectile/boltgun/sawn/scout
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

// Star-Striker! A sci only gun that fires laser based shells
/obj/item/weapon/gun/projectile/boltgun/scout/sci
	name = "\"Star Striker\" laser boltgun"
	desc = "A weapon based on the Sike boltgun line but fitted to use longer, laser based casings. Chambered in laser casings."
	icon = 'icons/obj/guns/energy/starstriker.dmi'
	icon_state = "starstriker"
	item_state = "starstriker"
	max_shells = 10
	price_tag = 250 //no...
	damage_multiplier = 1
	caliber = CAL_SCI
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_POWER = 6)
	fire_sound = 'sound/weapons/Laser.ogg'
	saw_off = FALSE
