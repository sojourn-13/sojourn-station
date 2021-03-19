/obj/item/weapon/gun/projectile/boltgun/handmade
	name = "handmade bolt action rifle"
	desc = "A handmade bolt action rifle, made from junk and some spare parts."
	icon = 'icons/obj/guns/projectile/makeshift_boltgun.dmi'
	icon_state = "boltgun"
	item_state = "boltgun"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	fire_delay = 17 // abit more than the serbian one
	damage_multiplier = 1
	penetration_multiplier = 1
	recoil_buildup = 40 //same as AMR
	max_shells = 5
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/rifle_load.ogg'
	price_tag = 800
	one_hand_penalty = 30 //don't you dare to one hand this
	sharp = FALSE //no bayonet here