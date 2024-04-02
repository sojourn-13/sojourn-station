/obj/item/gun/energy/laser/heavypulserifle
	name = "\"PL-3\" Heavy Pulse Rifle"
	desc = "A remnant of bygone age even in it's full sized version, this heavy pulse rifle is an infantry version of MPL-3 from a long defunct manufacturer. \
	Rigged together by someone with very little knowldge of how it actually operates it burns out cells outright on top of consuming them way faster."
	icon = 'icons/obj/guns/energy/heavypulserifle.dmi'
	icon_state = "heavypulserifle"
	item_state = "heavypulserifle"
	item_charge_meter = TRUE
	slot_flags = SLOT_BACK //So we can use it like normal person
	fire_sound = 'sound/weapons/energy/aer9fire.ogg'
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 3, TECH_POWER = 4)
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	projectile_type = /obj/item/projectile/beam/pulse/heavy
	charge_cost = 2000 //8 heavy shots of this with with a large posi. Damage per cell of a Titanic but trading number of shots for per shot damage basiclly
	fire_delay = 36 //Upgrades will make this fire way faster making it something you have to modife more then once to get a real bang out of it
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_SILVER = 10)
	twohanded = TRUE
	init_firemodes = list(
		WEAPON_NORMAL
	)
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	suitable_cell = /obj/item/cell/large
	price_tag = 2000 //Only worth 1k in cargo rare and all
	var/consume_cell = TRUE
	serial_type = "PHM" //Phobos Hellion Metalworks

/obj/item/gun/energy/laser/heavypulserifle/consume_next_projectile()
	.=..()
	if(. && consume_cell && cell.empty())
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
	return .

/obj/item/gun/energy/laser/heavypulserifle/emp_act(severity)
	..(max(severity, 1)) //Localized
