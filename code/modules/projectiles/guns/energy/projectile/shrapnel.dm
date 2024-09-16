/obj/item/gun/energy/shrapnel
	name = "\"Shellshock\" scrap rifle"
	desc = "A slapped together junk design made as a copy of the far superior Reductor rail gun. It's projectiles fire slower and it has a wider delay between shots with the \
	same issue of burning batteries out. The matter contained in empty cells can be converted directly into ammunition as well, if the safety bolts are loosened properly."
	icon = 'icons/obj/guns/energy/energyshotgun.dmi'
	icon_state = "eshotgun"
	item_state = "eshotgun"
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	can_dual = FALSE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8)
	charge_cost = 100
	suitable_cell = /obj/item/cell/medium
	init_recoil = RIFLE_RECOIL(1.1)
	fire_delay = 14 //Equivalent to a pump then fire time
	damage_multiplier = 0.8
	fire_sound = 'sound/weapons/energy/energy_shotgun.ogg'
	init_firemodes = list(
		list(mode_name="slug", mode_desc="fires a small metal chunk at light speeds", projectile_type=/obj/item/projectile/bullet/heavy_rifle_408/railgun, icon="kill"),
		list(mode_name="grenade", mode_desc="fires a frag synth-shell", projectile_type=/obj/item/projectile/bullet/grenade/frag/weak, charge_cost=30000, icon="grenade"),
	)
	var/consume_cell = FALSE
	price_tag = 500
	serial_type = "INDEX"
	serial_shown = FALSE
	wrench_intraction = TRUE

/obj/item/gun/energy/shrapnel/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)

/obj/item/gun/energy/shrapnel/wrench_intraction(obj/item/I, mob/user)
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
			if(consume_cell)
				consume_cell = FALSE
				to_chat(user, SPAN_NOTICE("You secure the safety bolts and tune down the capacitor to safe levels, preventing the weapon from destroying empty cells for use as ammuniton."))
			else
				consume_cell = TRUE
				to_chat(user, SPAN_NOTICE("You loosen the safety bolts and overclock the capacitor to unsafe levels, allowing the weapon to destroy empty cells for use as ammunition."))
