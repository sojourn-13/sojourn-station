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
	recoil_buildup = 40
	max_shells = 5
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	price_tag = 150 // so we dont make a market on the cargo shuttle for these
	one_hand_penalty = 30
	sharp = FALSE //no bayonet here
	saw_off = FALSE //No sawning it down and remaking it into a Kardashev-Mosin
	serial_type = "INDEX"
	serial_shown = FALSE