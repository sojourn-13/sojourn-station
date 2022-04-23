/obj/item/gun/energy/laser/heavypulserifle
	name = "Jury-Rigged EZ-13 MK2 Heavy Pulse Rifle"
	desc = "An exosuit mounted heavy pulse rifle that has been modified to be used on foot. This kind of modification is highly illegal in Sol. \
	It's not supposed to function without an exosuit's power source and might destroy powercells it consumes."
	icon = 'icons/obj/guns/energy/heavypulserifle.dmi'
	icon_state = "heavypulserifle"
	item_state = "heavypulserifle"
	item_charge_meter = TRUE
	slot_flags = 0
	fire_sound = 'sound/weapons/marauder.ogg'
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 3, TECH_POWER = 4)
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	projectile_type = /obj/item/projectile/beam/pulse
	charge_cost = 6000 //1 heavy shot of this with most basic cells. Titanic but with bigger stats basiclly
	fire_delay = 36 //Upgrades will make this fire way faster making it something you have to modife more then once to get a real bang out of it
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_SILVER = 10)
	damage_multiplier = 1.1 //Deals 44~ per shot and can be upgraded. Titanic but with bigger stats basiclly
	twohanded = TRUE
	init_firemodes = list(
		WEAPON_NORMAL
	)
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	suitable_cell = /obj/item/cell/large
	price_tag = 2000 //Only worth 1k in cargo rare and all
	var/consume_cell = TRUE
	serial_type = "AG"

/obj/item/gun/energy/laser/heavypulserifle/consume_next_projectile()
	.=..()
	if(. && consume_cell && cell.empty())
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
	return .
