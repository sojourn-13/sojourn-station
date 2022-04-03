/obj/item/gun/energy/laser/railgun
	name = "\"Reductor\" MEC rail rifle"
	desc = "\"Artificer's Guild\" brand mass-energy-converting railgun. Automatically generates ammuniton using cell charge. This gun features a sleek and deadly design with the capability for lethal and non-lethal firing modes. A competant engineer can also overclock it using a wrench, \
	consuming the cell within for an extra bullet or a powerful explosive round."
	icon = 'icons/obj/guns/energy/railgun.dmi'
	icon_state = "railgun"
	item_state = "railgun"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/rail.ogg'
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	twohanded = TRUE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10)
	charge_cost = 500
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	suitable_cell = /obj/item/cell/large
	one_hand_penalty = 10
	fire_delay = 14 //Slow, on par with a shotgun pump then fire
	recoil_buildup = 12 //Big shots, big recoil.
	damage_multiplier = 1.2
	init_firemodes = list(
		list(mode_name="slug", mode_desc="fires a large metal chunk at light speeds", projectile_type=/obj/item/projectile/bullet/shotgun/railgun, icon="kill"),
		list(mode_name="non-lethal", mode_desc="fires a rubber pellet at light speed", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag/railgun, icon="stun"),
		list(mode_name="grenade", mode_desc="fires an explosive synth-shell", projectile_type=/obj/item/projectile/bullet/grenade, charge_cost=30000, icon="grenade")
	)
	var/consume_cell = FALSE
	price_tag = 2250

/obj/item/gun/energy/laser/railgun/consume_next_projectile()
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

/obj/item/gun/energy/laser/railgun/attackby(obj/item/I, mob/user)
	..()
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
			if(consume_cell)
				consume_cell = FALSE
				to_chat(user, SPAN_NOTICE("You secure the safety bolts and tune down the capacitor to safe levels, preventing the weapon from destroying empty cells for use as ammuniton."))
			else
				consume_cell = TRUE
				to_chat(user, SPAN_NOTICE("You loosen the safety bolts and overclock the capacitor to unsafe levels, allowing the weapon to destroy empty cells for use as ammunition."))


/obj/item/gun/energy/laser/railgun/pistol
	name = "\"Myrmidon\" MEC rail pistol"
	desc = "\"Artificer's Guild\" brand mass-energy-converting rail-pistol. Automatically generates ammuniton using cell charge. This gun features a sleek and deadly design with the capability for lethal and non-lethal firing modes. A competant engineer can also overclock it using a wrench, \
	consuming the cell within for an extra bullet or a powerful explosive round. For the law abiding engineer because rifles are too hard to hide."
	icon = 'icons/obj/guns/energy/railpistol.dmi'
	icon_state = "railpistol"
	item_state = "railpistol"
	suitable_cell = /obj/item/cell/medium
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4, TECH_ENGINEERING = 4)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 4, MATERIAL_SILVER = 5)
	fire_delay = 7
	charge_cost = 100
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY)
	recoil_buildup = 6 //Still a railgun.
	can_dual = TRUE
	twohanded = FALSE
	init_firemodes = list(
		list(mode_name="slug", mode_desc="fires a small metal chunk at light speeds", projectile_type=/obj/item/projectile/bullet/kurtz_50/railgun, icon="kill"),
		list(mode_name="non-lethal", mode_desc="fires a small rubber chunk at light speeds", projectile_type=/obj/item/projectile/bullet/kurtz_50/rubber/railgun, icon="stun"),
		list(mode_name="grenade", mode_desc="fires a frag synth-shell", projectile_type=/obj/item/projectile/bullet/grenade/frag, charge_cost=30000, icon="grenade"),
	)
	price_tag = 1250

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
	one_hand_penalty = 10
	fire_delay = 14 //Equivalent to a pump then fire time
	recoil_buildup = 1.2
	damage_multiplier = 0.8
	fire_sound = 'sound/weapons/energy_shotgun.ogg'
	init_firemodes = list(
		list(mode_name="slug", mode_desc="fires a small metal chunk at light speeds", projectile_type=/obj/item/projectile/bullet/heavy_rifle_408/railgun, icon="kill"),
		list(mode_name="grenade", mode_desc="fires a frag synth-shell", projectile_type=/obj/item/projectile/bullet/grenade/frag/weak, charge_cost=30000, icon="grenade"),
	)
	var/consume_cell = FALSE
	price_tag = 500

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

/obj/item/gun/energy/shrapnel/attackby(obj/item/I, mob/user)
	..()
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
			if(consume_cell)
				consume_cell = FALSE
				to_chat(user, SPAN_NOTICE("You secure the safety bolts and tune down the capacitor to safe levels, preventing the weapon from destroying empty cells for use as ammuniton."))
			else
				consume_cell = TRUE
				to_chat(user, SPAN_NOTICE("You loosen the safety bolts and overclock the capacitor to unsafe levels, allowing the weapon to destroy empty cells for use as ammunition."))

/obj/item/gun/energy/laser/railgun/mounted
	name = "SDF SC \"Schrapnell\""
	desc = "An energy-based railgun, employing a matter fabricator to pull shotgun rounds from thin air and energy before launching them at faster than light speeds."
	icon_state = "shrapnel"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE
	consume_cell = FALSE
	cell_type = /obj/item/cell/small/high //Two shots
	twohanded = FALSE
	init_firemodes = list(
		list(mode_name="Buckshot", mode_desc="Fires a buckshot synth-shell", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, charge_cost=100, icon="kill"),
		list(mode_name="Beanbag", mode_desc="Fires a beanbag synth-shell", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag, charge_cost=25, icon="stun"),
		list(mode_name="Blast", mode_desc="Fires a slug synth-shell", projectile_type=/obj/item/projectile/bullet/shotgun, charge_cost=null, icon="destroy"),
	)

/obj/item/gun/energy/material_railgun
	name = "\"Black Arrow\" railgun"
	desc = "\"Artificer's Guild\" brand rail gun. A \'true\' railgun, utilizing the Lorentz effect and a pair of long conductors to propel solid projectiles."
	icon = 'icons/obj/guns/energy/blackarrow.dmi'
	icon_state = "blackarrow"
	item_state = "blackarrow"
	fire_sound = 'sound/weapons/blackarrow.ogg'
	fire_sound_silenced = 'sound/weapons/blackarrow_silenced.ogg'
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	twohanded = TRUE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 7, TECH_ENGINEERING = 6)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 12, MATERIAL_URANIUM = 4)
	charge_cost = 400
	gun_tags = list(GUN_AMR, GUN_PROJECTILE, GUN_LASER, GUN_ENERGY) //gun_AMR does nothing at the moment
	suitable_cell = /obj/item/cell/large
	zoom_factor = 2.0
	extra_damage_mult_scoped = 0.25
	one_hand_penalty = 80
	fire_delay = 15
	recoil_buildup = 6 //Light recoil, it's a railgun
	damage_multiplier = 1 //we don't care about this as it has its own projectiles
	init_firemodes = list(
		list(mode_name="low-velocity", mode_desc="fires a metal rod at subsonic speed", projectile_type=/obj/item/projectile/bullet/rail/lv, charge_cost=400, silenced = TRUE, icon="charge"),
		list(mode_name="high-velocity", mode_desc="fires a metal rod at high speed", projectile_type=/obj/item/projectile/bullet/rail/hv, charge_cost= 500, silenced = FALSE, icon="kill"),
		list(mode_name="ultrahigh-velocity", mode_desc="fires a metal rod at hypersonic speed", projectile_type=/obj/item/projectile/rail/uhv, charge_cost=2000, silenced = FALSE, icon="destroy")
	)
	var/material_storage = 0
	var/material_max = 30
	var/mat_per_fire = 1
	price_tag = 2250

/obj/item/gun/energy/material_railgun/examine(mob/user)
	..()
	to_chat(user,SPAN_NOTICE("It has [material_storage] out of [material_max] matter left."))

/obj/item/gun/energy/material_railgun/consume_next_projectile()
	if(!material_storage || material_storage < mat_per_fire || !..())
		return null
	material_storage -= mat_per_fire
	return ..()

/obj/item/gun/energy/material_railgun/attackby(obj/item/W, mob/user)
	if(!istype(W,/obj/item/stack))
		return ..	()
	var/obj/item/stack/S = W
	if(istype(S,/obj/item/stack/rods))
		while(material_max >= material_storage)
			if(R.use(1) && do_after(user, 5, src))
				material_storage += 2
				playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
				to_chat(user, "<span class='notice'>You load a rod into \the [src].</span>. The [src] now holds [material_storage]/[material_max] rods.")
