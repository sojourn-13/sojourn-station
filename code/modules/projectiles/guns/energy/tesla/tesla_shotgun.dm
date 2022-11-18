/obj/item/gun/energy/tesla_shotgun
	name = "\"Nikolai's Fervor\" tesla shotgun"
	desc = "An energy shotgun that drains power from a nearby APC to shoot electric blasts. May take time to charge and piss off your local guild adept."
	icon = 'icons/obj/guns/energy/tesla_shotgun.dmi'
	icon_state = "tesla_shotgun"
	item_state = "tesla_shotgun"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	price_tag = 1600
	charge_cost = 100
	fire_sound = 'sound/effects/lightningshock.ogg'
	suitable_cell = /obj/item/cell/medium
	cell_type = /obj/item/cell/medium/moebius
	slot_flags = SLOT_BACK
	twohanded = TRUE
	w_class = ITEM_SIZE_BULKY // It's a shotgun
	can_dual = FALSE
	projectile_type = /obj/item/projectile/beam/tesla/shotgun
	charge_meter = TRUE
	item_charge_meter = TRUE
	self_recharge = TRUE
	use_external_power = TRUE
	serial_type = "Hellcat" //You only get them form this trade station so idk

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
