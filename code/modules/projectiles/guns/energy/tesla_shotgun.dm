/obj/item/gun/energy/tesla_shotgun
	name = "Tesla Shotgun"
	desc = "An energy shotgun that drain power from a nearby APC."
	icon = 'icons/obj/guns/energy/slimegun.dmi'
	icon_state = "slimepistol"
	item_state = "slimepistol"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	price_tag = 500
	charge_cost = 100
	fire_sound = 'sound/weapons/Taser.ogg'
	suitable_cell = /obj/item/cell/medium
	cell_type = /obj/item/cell/medium/moebius
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = FALSE
	projectile_type = /obj/item/projectile/beam/shotgun
	charge_meter = FALSE
	item_charge_meter = FALSE
	self_recharge = TRUE
	use_external_power = TRUE

/obj/item/gun/energy/tesla_shotgun/manual
	name = "Manual Tesla Shotgun"
	desc = "An energy shotgun that drain power from a nearby APC. This one can be pumped to charge faster."
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_GOLD = 2.5)

// Charge the cell by pumping it.
/obj/item/gun/energy/tesla_shotgun/manual/attack_self(mob/user as mob)
	if(!cell) // Check if we have a cell to charge.
		to_chat(user, "The [src.name] doesn't have a cell to charge.")
		return FALSE
	else if(cell.charge >= cell.maxcharge) // Does the cell need charging?
		to_chat(user, "The [src.name] is already charged.")
		return FALSE
	else if(do_after(user, WORKTIME_NEAR_INSTANT, src)) // Charge the cell.
		to_chat(user, "You pump the [src.name].")
		cell.give(charge_cost / 5) // Only charge a fifth of a shot per pump.

/obj/item/gun/energy/tesla_shotgun/high_damage
	name = "High-Output Tesla Shotgun"
	desc = "An energy shotgun that drain power from a nearby APC. This one shoot a stronger beam."
	charge_cost = 200
	projectile_type = /obj/item/projectile/beam/shotgun/strong
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_PLASMA = 2.5)

/obj/item/gun/energy/tesla_shotgun/atom
	name = "Atomic Tesla Shotgun"
	desc = "An energy shotgun that drain power from a nearby APC. This one doesn't need an APC to charge thanks to an Atomcell."
	cell_type = /obj/item/cell/medium/moebius/nuclear
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_URANIUM = 2.5)

/obj/item/gun/energy/tesla_shotgun/Process()
	if(self_recharge) //Every [recharge_time] ticks, recharge a shot for the cyborg
		charge_tick++
		if(charge_tick < recharge_time) return 0
		charge_tick = 0

		if(!cell || cell.charge >= cell.maxcharge)
			return 0 // check if we actually need to recharge

		if(use_external_power)
			if(drain_apc(charge_cost)) //Take power from the APC...
				cell.give(charge_cost) //... to recharge the shot
				update_icon()
	return 1

/obj/item/gun/energy/tesla_shotgun/proc/drain_apc(var/power_usage)
	var/area/A = get_area(src)
	if(!istype(A) || !A.powered(STATIC_EQUIP))
		return FALSE

	A.use_power(power_usage, STATIC_EQUIP)
	return TRUE
