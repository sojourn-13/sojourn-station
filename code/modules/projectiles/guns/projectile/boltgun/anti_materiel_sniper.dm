/obj/item/gun/projectile/boltgun/heavysniper
	name = "Anti-Materiel Rifle"
	desc = "A heavy anti-material rifle fitted with a night-vision scope, it was originally designed for use against armoured exosuits. It is capable of punching through windows and non-reinforced walls with ease. Fires armor piercing .60-06 shells."
	icon = 'icons/obj/guns/projectile/heavysniper.dmi'
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = CAL_ANTIM
	recoil_buildup = 60
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/antim
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_PLASTIC = 20, MATERIAL_DIAMOND = 3, MATERIAL_OSMIUM = 5, MATERIAL_URANIUM = 2)
	price_tag = 10000
	one_hand_penalty = 80
	damage_multiplier = 0.9
	zoom_factor = 2.0
	twohanded = TRUE
	sharp = FALSE
	saw_off = FALSE
	eject_animatio = FALSE //Todo: this
	bolt_training = FALSE
	see_invisible_gun = SEE_INVISIBLE_NOLIGHTING
	scoped_offset_reduction = 8
	extra_damage_mult_scoped = 0.2
	gun_tags = list(GUN_AMR, GUN_PROJECTILE) //AMR tag atm does nothing
	slowdown_hold = 1.5  //Were entrenched
	brace_penalty = 30 //No running and gunning
	pierce_multiplier = 6
	serial_type = "SA"

/obj/item/weaponparts
	var/part_color = ""
	name = "weaponpart"
	desc = "how did you get it?"
	icon = 'icons/obj/weaponparts.dmi'

/obj/item/weaponparts/heavysniper/stock
	name = "sniper stock"
	desc = "This is a sniper stock. You need to attach the reciever."
	icon_state = "sniper_stock"

/obj/item/weaponparts/heavysniper/reciever
	name = "sniper reciever"
	desc = "This is a sniper reciever. You need to attach it to the stock."
	icon_state = "sniper_reciever"

/obj/item/weaponparts/heavysniper/stockreciever
	name = "sniper stock with reciever"
	desc = "This is a sniper stock with reciever. Now attach the barrel."
	icon_state = "sniper_stockreciever"

/obj/item/weaponparts/heavysniper/barrel
	name = "sniper rifle barrel"
	desc = "This is a barrel from a sniper rifle."
	icon_state = "sniper_barrel"

/obj/item/weaponparts/heavysniper/stock/attackby(obj/item/W, mob/user,)
	if(istype(W,/obj/item/weaponparts/heavysniper/reciever))
		to_chat(user, "You attach the reciever to the stock")
		var/obj/item/weaponparts/heavysniper/stockreciever/HS = new (get_turf(src))
		if(loc == user)
			equip_slot = user.get_inventory_slot(src)
			if(equip_slot in list(slot_r_hand, slot_l_hand))
				user.drop_from_inventory(src)
				user.equip_to_slot_if_possible(HS, equip_slot)
		qdel(W)
		qdel(src)


/obj/item/weaponparts/heavysniper/stockreciever/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/weaponparts/heavysniper/barrel))
		to_chat(user, "You attach the barrel to the stock")
		var/obj/item/gun/projectile/boltgun/heavysniper/HS = new (get_turf(src))
		if(loc == user)
			equip_slot = user.get_inventory_slot(src)
			if(equip_slot in list(slot_r_hand, slot_l_hand))
				user.drop_from_inventory(src)
				user.equip_to_slot_if_possible(HS, equip_slot)
		qdel(W)
		qdel(src)