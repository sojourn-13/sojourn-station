/obj/item/gun/projectile/boltgun/lever
	name = "\"Armstrong\" repeating rifle"
	desc = "Weapon for hunting, or endless open plains. Perfect for horseback!"
	icon = 'icons/obj/guns/projectile/lever.dmi'
	icon_state = "lever"
	item_state = "lever"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	max_shells = 11
	price_tag = 600
	init_recoil = HMG_RECOIL(0.4)
	damage_multiplier = 1.2
	penetration_multiplier  = 1.1
	zoom_factors = list(0.4)
	extra_damage_mult_scoped = 0.2 //scoping this should be rewarded its not that good
	matter = list(MATERIAL_STEEL = 25, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 5)
	saw_off = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SILENCABLE)
	serial_type = "H&S"
	gun_parts = list(/obj/item/part/gun/frame/armstrong = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/armstrong
	name = "Armstrong frame"
	desc = "A Armstrong lever rifle. If death is our destination this will surely bring it."
	icon_state = "frame_armstrong"
	result = /obj/item/gun/projectile/boltgun/lever
	resultvars = list(/obj/item/gun/projectile/boltgun/lever, /obj/item/gun/projectile/boltgun/lever/custer)
	gripvars = list(/obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/magnum, /obj/item/part/gun/barrel/hrifle)

/obj/item/gun/projectile/boltgun/lever/custer
	name = "\"Custer\" repeating rifle"
	desc = "This sized-up version of the \"Armstrong\" sports a few improvements compared to its predecessor. \
			Made to compete with modern bolt actions in hunting, this repeating rifle sports a heavy bore rifle cartridge to pack an extra punch!"
	icon = 'icons/obj/guns/projectile/custer.dmi'
	icon_state = "custer"
	item_state = "custer"
	caliber = CAL_HRIFLE
	max_shells = 7
	price_tag = 1200
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	init_recoil = HMG_RECOIL(0.6)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_WOOD = 10)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)
	gun_parts = list(/obj/item/part/gun/frame/armstrong = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/hrifle = 1)
