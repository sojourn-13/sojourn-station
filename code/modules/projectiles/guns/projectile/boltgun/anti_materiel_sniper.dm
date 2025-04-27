/obj/item/gun/projectile/boltgun/heavysniper
	name = "Anti-Materiel Rifle"
	desc = "A heavy anti-materiel rifle fitted with a night-vision scope, it was originally designed for use against armoured exosuits. It is capable of punching through windows and non-reinforced walls with ease. Fires armor piercing .60-06 shells."
	icon = 'icons/obj/guns/projectile/heavysniper.dmi'
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = CAL_ANTIM
	init_recoil = HMG_RECOIL(3)
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/antim
	fire_sound = 'sound/weapons/guns/fire/AMR.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_PLASTIC = 20, MATERIAL_DIAMOND = 3, MATERIAL_OSMIUM = 5, MATERIAL_URANIUM = 2)
	price_tag = 7500
	damage_multiplier = 0.9
	zoom_factors = list(1,2)
	twohanded = TRUE
	sharp = FALSE
	saw_off = FALSE
	eject_animatio = TRUE // Now with boolet eject animation!
	bolt_training = FALSE
	see_invisible_gun = SEE_INVISIBLE_NOLIGHTING
	scoped_offset_reduction = 8
	extra_damage_mult_scoped = 0.2
	gun_tags = list(GUN_AMR, GUN_PROJECTILE) //AMR tag atm does nothing
	slowdown_hold = 1.5  // Massive, unwieldy rifle
	pierce_multiplier = 6
	serial_type = "SA"
	action_button_name = "Switch zoom level"
	action_button_proc = "switch_zoom"

	wield_delay = 2 SECOND
	wield_delay_factor = 0.6 // 60 vig, heavy as shit
	gun_parts = list(/obj/item/part/gun/frame/heavysniper = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/boltgun = 1, /obj/item/part/gun/barrel/antim = 1)

/obj/item/part/gun/frame/heavysniper
	name = "Anti-Materiel Rifle frame"
	desc = "An AMR frame. For removing chunks of man and machine alike."
	icon_state = "frame_amr"
	resultvars = list(/obj/item/gun/projectile/boltgun/heavysniper)
	gripvars = list(/obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/boltgun
	barrelvars = list(/obj/item/part/gun/barrel/antim)

/* - Old components system. Updated with weapon pars system instead.

/obj/item/weaponparts
	var/part_color = ""
	name = "weaponpart"
	desc = "how did you get it?"
	icon = 'icons/obj/weaponparts.dmi'

/obj/item/weaponparts/heavysniper/stock
	name = "AMR stock"
	desc = "This is a stock for an anti-materiel rifle. You need to attach a receiver to it."
	icon_state = "AMR_stock" // Actual AMR sprite disassembly

/obj/item/weaponparts/heavysniper/receiver
	name = "AMR receiver"
	desc = "This is a receiver for an anti-materiel rifle. You need to attach it to the stock."
	icon_state = "AMR_receiver"

/obj/item/weaponparts/heavysniper/stockreceiver
	name = "AMR stock with receiver"
	desc = "This is an anti-materiel rifle stock with the receiver and bolt mechanism installed. Now you must attach the barrel to finish."
	icon_state = "AMR_stockreceiver"

/obj/item/weaponparts/heavysniper/barrel
	name = "heavy bore barrel"
	desc = "This is a hefty barrel bored in .60-06, clearly part of an anti-materiel rifle. Needs to be attached to a combination of stock and receiver to finish assembly."
	icon_state = "AMR_barrel"

/obj/item/weaponparts/heavysniper/stock/attackby(obj/item/W, mob/user,)
	if(istype(W,/obj/item/weaponparts/heavysniper/receiver))
		to_chat(user, "You attach the receiver to the stock")
		var/obj/item/weaponparts/heavysniper/stockreceiver/HS = new (get_turf(src))
		if(loc == user)
			equip_slot = user.get_inventory_slot(src)
			if(equip_slot in list(slot_r_hand, slot_l_hand))
				user.drop_from_inventory(src)
				user.equip_to_slot_if_possible(HS, equip_slot)
		qdel(W)
		qdel(src)


/obj/item/weaponparts/heavysniper/stockreceiver/attackby(obj/item/W, mob/user)
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
*/
