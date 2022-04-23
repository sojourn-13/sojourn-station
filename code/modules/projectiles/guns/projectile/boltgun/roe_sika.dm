/obj/item/gun/projectile/boltgun/light
	name = "\"Sika\" light boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .257, it's a common varmint and plinking rifle."
	icon = 'icons/obj/guns/projectile/lightboltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	max_shells = 10
	zoom_factor = 2.0
	recoil_buildup = 15
	one_hand_penalty = 20 //maybe some trick shots
	price_tag = 1000
	damage_multiplier = 1.25
	sharp = FALSE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/light
	serial_type = "Hunt Inc"

/obj/item/gun/projectile/boltgun/sawn/light
	name = "\"obrez\" light boltgun"
	desc = "A crudly mangled and sawn-down .257 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING
	fire_delay = 18
	one_hand_penalty = 10
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 5)
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	saw_off = FALSE
	serial_type = "Hunt Inc"

//Wood version
/obj/item/gun/projectile/boltgun/light_wood
	name = "\"Roe\" light boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .257, it's a common varmint and plinking rifle."
	icon = 'icons/obj/guns/projectile/lightboltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	max_shells = 10
	recoil_buildup = 15
	one_hand_penalty = 20 //maybe some trick shots
	zoom_factor = 2.0
	price_tag = 1000
	damage_multiplier = 1.25
	force = WEAPON_FORCE_PAINFUL
	sharp = FALSE
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 10, MATERIAL_GLASS = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/light_wood
	serial_type = "Hunt Inc"

/obj/item/gun/projectile/boltgun/sawn/light_wood
	name = "\"obrez\" light boltgun"
	desc = "A crudly mangled and sawn-down .257 bolt action rifle. Rifle was fine."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_WOOD = 5)
	max_shells = 10
	saw_off = FALSE
	serial_type = "Hunt Inc"
