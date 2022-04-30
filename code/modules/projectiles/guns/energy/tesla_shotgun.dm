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
	slot_flags = SLOT_BELT|SLOT_BACK
	twohanded = TRUE
	w_class = ITEM_SIZE_BULKY // It's a shotgun
	can_dual = FALSE
	projectile_type = /obj/item/projectile/beam/tesla/shotgun
	charge_meter = TRUE
	item_charge_meter = TRUE
	self_recharge = TRUE
	use_external_power = TRUE
	serial_type = "Hellcat" //You only get them form this trade station so idk

/obj/item/gun/energy/tesla_shotgun/manual
	name = "\"Edison's Lament\" tesla shotgun"
	desc = "An energy shotgun that drains power from a nearby APC. This one can be pumped to charge faster. Is it really better?"
	icon = 'icons/obj/guns/energy/tesla_shotgun_manual.dmi'
	icon_state = "tesla_shotgun_manual"
	item_state = "tesla_shotgun_manual"
	price_tag = 1950
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_GOLD = 2.5)
	var/recentpump = 0 // World time so that people can't spam it.
	var/pump_per_shot = 5 // How many pumps it takes to charge a single shot

// Charge the cell by pumping it.
/obj/item/gun/energy/tesla_shotgun/manual/attack_self(mob/user as mob)
	if(!cell) // Check if we have a cell to charge.
		to_chat(user, "The [src.name] doesn't have a cell to charge.")
		return FALSE
	else if(cell.charge >= cell.maxcharge) // Does the cell need charging?
		to_chat(user, "The [src.name] is already charged.")
		return FALSE
	else if(world.time >= recentpump + 10) // Charge the cell.
		to_chat(user, "You pump the [src.name].")
		playsound(user, pumpshotgun_sound, 60, 1) // Sounds are nice...
		flick("pumping", src) // ...But animations are even better
		recentpump = world.time
		cell.give(charge_cost / pump_per_shot) // So that we don't charge a whole shot each pump

/obj/item/gun/energy/tesla_shotgun/high_damage
	name = "\"Modern Solutions\" tesla shotgun"
	desc = "An energy shotgun that drains power from a nearby APC. This one shoots a stronger beam than others."
	icon = 'icons/obj/guns/energy/tesla_shotgun_powerful.dmi'
	icon_state = "tesla_shotgun_powerful"
	item_state = "tesla_shotgun_powerful"
	price_tag = 2500
	charge_cost = 200
	projectile_type = /obj/item/projectile/beam/tesla/shotgun/strong
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_PLASMA = 2.5)

/obj/item/gun/energy/tesla_shotgun/atomic
	name = "\"Atom Bomb\" tesla shotgun"
	desc = "An energy shotgun that drains power from a nearby APC. This one doesn't need an APC to charge thanks to an atomic power cell. Oh baby!"
	icon = 'icons/obj/guns/energy/tesla_shotgun_atomic.dmi'
	icon_state = "tesla_shotgun_atomic"
	item_state = "tesla_shotgun_atomic"
	cell_type = /obj/item/cell/medium/moebius/nuclear
	price_tag = 3000
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
