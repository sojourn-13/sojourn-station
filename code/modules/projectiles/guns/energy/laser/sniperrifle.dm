/obj/item/gun/energy/sniperrifle
	name = "\"Valkyrie\" laser rifle"
	desc = "\"Valkyrie\" is one of the original Old Testament designs, the precursor to the \"Lightfall\". A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon for killing from a distance."
	icon = 'icons/obj/guns/energy/sniper.dmi'
	icon_state = "sniper"
	item_state = "sniper"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/laser_sniper.ogg'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	slot_flags = SLOT_BACK
	charge_cost = 330
	fire_delay = 35
	force = 10
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 5, MATERIAL_URANIUM = 3)
	price_tag = 2500
	cell_type = /obj/item/cell/medium
	zoom_factors = list(1,2)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE
	gun_tags = list(GUN_ENERGY)
	serial_type = "Absolute"
	action_button_name = "Switch zoom level"
	action_button_proc = "switch_zoom"
