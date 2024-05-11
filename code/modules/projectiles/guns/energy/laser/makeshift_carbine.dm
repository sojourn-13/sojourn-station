/obj/item/gun/energy/laser/makeshift
	name = "makeshift laser carbine"
	desc = "A makeshift laser carbine, rather wasteful on its charge, but none the less reliable"
	icon = 'icons/obj/guns/energy/makeshift_carbine.dmi'
	icon_state = "makeshift"
	item_state = "makeshift"
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 15)
	item_charge_meter = FALSE
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	zoom_factors = list()
	charge_cost = 100 //worst lightfall
	fire_delay = 10 //ditto
	price_tag = 400
	fire_sound = 'sound/weapons/energy/laser_rifle.ogg'
	init_firemodes = list(
		WEAPON_NORMAL
	)
	serial_type = "INDEX"
	serial_shown = FALSE
