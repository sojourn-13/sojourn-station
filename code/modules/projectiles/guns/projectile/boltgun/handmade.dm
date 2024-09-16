/obj/item/gun/projectile/boltgun/handmade
	name = "handmade bolt action rifle"
	desc = "A handmade bolt action rifle, made from junk and some spare parts."
	icon = 'icons/obj/guns/projectile/makeshift_boltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 5)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE, GUN_SILENCABLE)
	fire_delay = 4 // 2 more than the serbian one
	damage_multiplier = 1
	penetration_multiplier = 1
	max_shells = 5
	fire_sound = 'sound/weapons/guns/fire/mosin.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	price_tag = 150 // so we dont make a market on the cargo shuttle for these
	init_recoil = HMG_RECOIL(0.2)
	sharp = FALSE //no bayonet here
	saw_off = FALSE //No sawning it down and remaking it into a Kardashev-Mosin
	serial_type = "INDEX"
	serial_shown = FALSE
	gun_parts = list(/obj/item/part/gun/frame/homemadebolt = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/lrifle/steel = 1)


/obj/item/part/gun/frame/homemadebolt
	name = "handmade rifle frame"
	desc = "A handmade bolt-action rifle frame. For the absolute poorest in the universe. Also insanely modular, taking any rifle barrel type."
	icon_state = "frame_riose"
	matter = list(MATERIAL_STEEL = 5)
	nra = FALSE
	resultvars = list(/obj/item/gun/projectile/boltgun/handmade)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle/steel, /obj/item/part/gun/barrel/srifle/steel, /obj/item/part/gun/barrel/hrifle/steel, /obj/item/part/gun/barrel/clrifle/steel)	//Basically any rifle caliber fits them.
	nra = FALSE		//This controls if the weapon checks for barrels or not. If you want a gun to have MULTIPLE calibers that it can be chambered in, put FALSE.
