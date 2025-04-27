/obj/item/gun/projectile/boltgun/light
	name = "\"Roe\" light boltgun"
	desc = "Weapon for hunting, sniping, and competition shooting. Chambered in .257, it's a common varmint and plinking rifle."
	icon = 'icons/obj/guns/projectile/lightboltgun_wood.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	fire_sound = 'sound/weapons/guns/fire/sfrifle_fire.ogg'
	max_shells = 10
	init_recoil = HMG_RECOIL(0.5)
	zoom_factors = list(2.0)
	price_tag = 750
	damage_multiplier = 1.25
	force = WEAPON_FORCE_PAINFUL
	sharp = FALSE
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 10, MATERIAL_GLASS = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE, GUN_KNIFE)	//Can take bayonet.
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/boltgun/sawn/light
	serial_type = "Hunt Inc"
	gun_parts = list(/obj/item/part/gun/frame/roe = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/srifle = 1)

/obj/item/gun/projectile/boltgun/sawn/light
	name = "\"obrez\" light boltgun"
	desc = "A crudely mangled and sawn-down .257 bolt action rifle. The rifle was fine before."
	icon = 'icons/obj/guns/projectile/sawnoff/boltgun_wood.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	caliber = CAL_LRIFLE
	load_method = SINGLE_CASING
	init_recoil = HMG_RECOIL(0.6)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_WOOD = 5)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)	//No more bayonet.
	max_shells = 10
	saw_off = FALSE
	serial_type = "Hunt Inc"
	//Sawn guns lose their frames
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/stack/material/plasteel = 2)


/obj/item/part/gun/frame/roe
	name = "Roe frame"
	desc = "A Roe bolt-action rifle frame. Perfect for small game and practice."
	icon_state = "frame_roe"
	result = /obj/item/gun/projectile/boltgun/light
	resultvars = list(/obj/item/gun/projectile/boltgun/light)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/srifle)
