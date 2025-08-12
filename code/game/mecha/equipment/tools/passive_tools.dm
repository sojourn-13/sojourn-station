/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/armor_booster
 * /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster
 * /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster
 * /obj/item/mecha_parts/mecha_equipment/repair_droid
 * /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
 * /obj/item/mecha_parts/mecha_equipment/generator
 * /obj/item/mecha_parts/mecha_equipment/generator/nuclear
 * /obj/item/mecha_parts/mecha_equipment/tool/passenger
 */

/obj/item/mecha_parts/mecha_equipment/fist_plating
	name = "mech plating"
	desc = "Plating designed to cover and reinforce the limbs of exosuits to prevent impact damage to the machine during accidents in high risk environments."
	icon_state = "mecha_fist"
	range = 0 // Can't attack
	force = 0
	required_type = /obj/mecha
	matter = list(MATERIAL_STEEL = 15) //Its only 30 damage compared to the 15 steel 60 damage sword
	var/extra_armor = 15
	selectable = FALSE

/obj/item/mecha_parts/mecha_equipment/fist_plating/attach(obj/mecha/M)
	. = ..()
	chassis.damage_absorption[BRUTE] += extra_armor
	chassis.damage_absorption[ARMOR_MELEE] += extra_armor

	update_chassis_page()

/obj/item/mecha_parts/mecha_equipment/fist_plating/detach(atom/moveto=null)
	chassis.damage_absorption[BRUTE] -= extra_armor
	chassis.damage_absorption[ARMOR_MELEE] -= extra_armor
	. = ..()

/obj/item/mecha_parts/mecha_equipment/fist_plating/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[name]"

/obj/item/mecha_parts/mecha_equipment/armor_booster
	name = "armor booster"
	desc = "Powered armor-enhancing mech equipment."
	icon_state = "mecha_abooster_proj"
	equip_cooldown = 10
	energy_drain = 50
	range = 0
	var/deflect_coeff = 1
	var/damage_coeff = 1
	var/extra_armor = 0
	var/melee
	selectable = FALSE

/obj/item/mecha_parts/mecha_equipment/armor_booster/attach(obj/mecha/M as obj)
	. = ..()
	activate_boost()

/obj/item/mecha_parts/mecha_equipment/armor_booster/detach()
	if(equip_ready)
		deactivate_boost()
	. = ..()

/obj/item/mecha_parts/mecha_equipment/armor_booster/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[name]"

/obj/item/mecha_parts/mecha_equipment/armor_booster/proc/activate_boost()
	if(!chassis)
		return 0
	return 1

/obj/item/mecha_parts/mecha_equipment/armor_booster/proc/deactivate_boost()
	if(!chassis)
		return 0
	return 1

/obj/item/mecha_parts/mecha_equipment/armor_booster/set_ready_state(state)
	if(state && !equip_ready)
		activate_boost()
	else if(equip_ready)
		deactivate_boost()
	. = ..()

/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster //what is that noise? A BAWWW from TK mutants.
	name = "\improper CCW armor booster"
	desc = "Close-combat armor booster. Boosts exosuit armor against armed melee attacks. Requires energy to operate."
	icon_state = "mecha_abooster_ccw"
	origin_tech = list(TECH_MATERIAL = 4)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_SILVER = 5)
	deflect_coeff = 1.15
	damage_coeff = 0.8
	extra_armor = 10
	melee = 1
	price_tag = 600

/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster/activate_boost()
	if(..())
		chassis.m_deflect_coeff *= deflect_coeff
		chassis.m_damage_coeff *= damage_coeff
		chassis.m_armor_addition += extra_armor
		chassis.mhit_power_use += energy_drain


/obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster/deactivate_boost()
	if(..())
		chassis.m_deflect_coeff /= deflect_coeff
		chassis.m_damage_coeff /= damage_coeff
		chassis.m_armor_addition -= extra_armor
		chassis.mhit_power_use -= energy_drain


/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster
	name = "\improper RW armor booster"
	desc = "Ranged-weaponry armor booster. Boosts exosuit armor against ranged attacks. Completely blocks taser shots, but requires energy to operate."
	icon_state = "mecha_abooster_proj"
	origin_tech = list(TECH_MATERIAL = 4)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_GOLD = 5)
	deflect_coeff = 1.15
	damage_coeff = 0.8
	extra_armor = 10
	melee = 0
	price_tag = 600

/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster/activate_boost()
	if(..())
		chassis.r_deflect_coeff *= deflect_coeff
		chassis.r_damage_coeff *= damage_coeff
		chassis.r_armor_addition += extra_armor
		chassis.rhit_power_use += energy_drain

/obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster/deactivate_boost()
	if(..())
		chassis.r_deflect_coeff /= deflect_coeff
		chassis.r_damage_coeff /= damage_coeff
		chassis.r_armor_addition -= extra_armor
		chassis.rhit_power_use -= energy_drain


/obj/item/mecha_parts/mecha_equipment/repair_droid
	name = "repair droid"
	desc = "Automated repair droid. Scans exosuit for damage and repairs it. Can fix almost any type of external or internal damage."
	icon_state = "repair_droid"
	origin_tech = list(TECH_MAGNET = 3, TECH_DATA = 3)
	equip_cooldown = 20
	energy_drain = 100
	range = 0
	matter = list(MATERIAL_STEEL = 10, MATERIAL_GOLD = 10, MATERIAL_SILVER = 2, MATERIAL_GLASS = 5)
	price_tag = 1200
	var/health_boost = 2
	var/icon/droid_overlay
	var/list/repairable_damage = list(MECHA_INT_TEMP_CONTROL,MECHA_INT_TANK_BREACH)
	selectable = FALSE
	var/repairing = FALSE

/obj/item/mecha_parts/mecha_equipment/repair_droid/attach(obj/mecha/M as obj)
	. = ..()
	droid_overlay = new(icon, icon_state = "repair_droid")
	M.add_overlay(droid_overlay)

/obj/item/mecha_parts/mecha_equipment/repair_droid/destroy()
	chassis.cut_overlay(droid_overlay)
	. = ..()

/obj/item/mecha_parts/mecha_equipment/repair_droid/detach()
	chassis.cut_overlay(droid_overlay)
	repairing = FALSE
	. = ..()

/obj/item/mecha_parts/mecha_equipment/repair_droid/Process()
	if(!chassis || !repairing)
		return

	var/modified_health_boost = health_boost
	var/repaired = 0
	if(chassis.hasInternalDamage(MECHA_INT_SHORT_CIRCUIT))
		modified_health_boost *= -2
	else if(chassis.hasInternalDamage() && prob(15))
		for(var/int_dam_flag in repairable_damage)
			if(chassis.hasInternalDamage(int_dam_flag))
				chassis.clearInternalDamage(int_dam_flag)
				repaired = 1
				break

	if(modified_health_boost < 0 || chassis.health < initial(chassis.health))
		chassis.health += min(modified_health_boost, initial(chassis.health)-chassis.health)
		repaired = 1

	if(repaired)
		chassis.use_power(energy_drain)

/obj/item/mecha_parts/mecha_equipment/repair_droid/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[name] - <a href='?src=\ref[src];toggle_repairs=1'>[repairing?"Dea":"A"]ctivate</a>"

/obj/item/mecha_parts/mecha_equipment/repair_droid/Topic(href, href_list)
	. = ..()
	if(href_list["toggle_repairs"])
		chassis.cut_overlay(droid_overlay)
		repairing = !repairing
		if(repairing)
			droid_overlay = new(icon, icon_state = "repair_droid_a")
			log_message("Activated.")
		else
			droid_overlay = new(icon, icon_state = "repair_droid")
			log_message("Deactivated.")
			set_ready_state(1)
		chassis.add_overlay(droid_overlay)
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())


/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	name = "energy relay"
	desc = "Wirelessly drains energy from any available power channel in area. The performance index is quite low."
	icon_state = "tesla"
	origin_tech = list(TECH_MAGNET = 4, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_GOLD = 2, MATERIAL_SILVER = 3, MATERIAL_GLASS = 2)
	equip_cooldown = 10
	energy_drain = 0
	range = 0
	price_tag = 900
	var/coeff = 100
	var/list/use_channels = list(STATIC_EQUIP,STATIC_ENVIRON,STATIC_LIGHT)
	selectable = FALSE
	var/activated = FALSE

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/Process()
	if(!chassis || chassis.hasInternalDamage(MECHA_INT_SHORT_CIRCUIT) || !activated)
		return
	var/cur_charge = chassis.get_charge()
	if(isnull(cur_charge) || !chassis.cell)
		return
	if(cur_charge < chassis.cell.maxcharge)
		var/area/A = get_area(chassis)
		if(A)
			var/pow_chan
			for(var/c in list(STATIC_EQUIP,STATIC_ENVIRON,STATIC_LIGHT))
				if(A.powered(c))
					pow_chan = c
					break
			if(pow_chan)
				var/delta = min(12, chassis.cell.maxcharge-cur_charge)
				chassis.give_power(delta)
				A.use_power(delta*coeff, pow_chan)

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/proc/get_power_channel(var/area/A)
	var/pow_chan
	if(A)
		for(var/c in use_channels)
			if(A.powered(c))
				pow_chan = c
				break
	return pow_chan

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/Topic(href, href_list)
	. = ..()
	if(href_list["toggle_relay"])
		activated = !activated
		if(activated)
			log_message("Activated.")
		else
			log_message("Deactivated.")
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())

/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[name] - <a href='?src=\ref[src];toggle_relay=1'>[activated?"Dea":"A"]ctivate</a>"


/obj/item/mecha_parts/mecha_equipment/generator
	name = "plasma generator"
	desc = "Generates power using solid plasma as fuel. Pollutes the environment."
	icon_state = "plasma"
	origin_tech = list(TECH_PLASMA = 2, TECH_POWER = 2, TECH_ENGINEERING = 1)
	equip_cooldown = 10
	energy_drain = 0
	range = MECHA_MELEE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 5, MATERIAL_GLASS = 1)
	var/coeff = 100
	var/obj/item/stack/material/fuel
	var/max_fuel = 120
	var/fuel_per_cycle_idle = 1
	var/fuel_per_cycle_active = 5
	var/power_per_cycle = 25
	var/activated = FALSE

/obj/item/mecha_parts/mecha_equipment/generator/Initialize()
	. = ..()
	create_fuel()

/obj/item/mecha_parts/mecha_equipment/generator/proc/create_fuel()
	fuel = new /obj/item/stack/material/plasma(src)
	fuel.amount = 0

/obj/item/mecha_parts/mecha_equipment/generator/Destroy()
	QDEL_NULL(fuel)
	. = ..()

/obj/item/mecha_parts/mecha_equipment/generator/Topic(href, href_list)
	. = ..()
	if(href_list["toggle"])
		activated = !activated
		if(activated)
			log_message("Activated.")
		else
			log_message("Deactivated.")
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())

/obj/item/mecha_parts/mecha_equipment/generator/get_equip_info()
	var/output = ..()
	if(output)
		return "[output] \[[fuel]: [fuel.amount] sheets\] - <a href='?src=\ref[src];toggle=1'>[activated?"Dea":"A"]ctivate</a>"

/obj/item/mecha_parts/mecha_equipment/generator/action(target)
	if(chassis)
		var/result = load_fuel(target)
		var/message
		if(isnull(result))
			message = SPAN_WARNING("[fuel] traces in target minimal. [target] cannot be used as fuel.")
		else if(!result)
			message = "Unit is full."
		else
			message = "[result] unit\s of [fuel] successfully loaded."
			send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
		occupant_message(message)

/obj/item/mecha_parts/mecha_equipment/generator/proc/load_fuel(obj/item/stack/material/P)
	if(P.type == fuel.type && P.amount)
		var/to_load = max(max_fuel - fuel.amount,0)
		if(to_load)
			var/units = min(to_load, P.amount)
			if(units)
				fuel.amount += units
				P.use(units)
				return units
		else
			return 0

/obj/item/mecha_parts/mecha_equipment/generator/attackby(weapon, mob/user)
	var/result = load_fuel(weapon)
	if(isnull(result))
		user.visible_message("[user] tries to shove [weapon] into [src]. What a dumb-ass.", SPAN_WARNING("[fuel] traces minimal. [weapon] cannot be used as fuel."))
	else if(!result)
		to_chat(user, "Unit is full.")
	else
		user.visible_message("[user] loads [src] with [fuel].", "[result] unit\s of [fuel] successfully loaded.")

/obj/item/mecha_parts/mecha_equipment/generator/critfail()
	. = ..()
	var/turf/simulated/T = get_turf(src)
	if(!T)
		return
	var/datum/gas_mixture/GM = new
	if(prob(10))
		T.assume_gas("plasma", 100, 1500+T0C)
		T.visible_message("[src] suddenly disgorges a cloud of heated plasma.")
		destroy()
	else
		T.assume_gas("plasma", 5, istype(T) ? T.air.temperature : T20C)
		T.visible_message("[src] suddenly disgorges a cloud of plasma.")
	T.assume_air(GM)

/obj/item/mecha_parts/mecha_equipment/generator/Process()
	if(!chassis || !activated)
		return FALSE
	if(fuel.amount <= 0)
		return FALSE
	var/cur_charge = chassis.get_charge()
	if(isnull(cur_charge))
		return FALSE
	var/use_fuel = fuel_per_cycle_idle
	if(cur_charge < chassis.cell.maxcharge)
		use_fuel = fuel_per_cycle_active
		chassis.give_power(power_per_cycle)
	fuel.amount -= min(use_fuel,fuel.amount)
	update_equip_info()
	return TRUE


/obj/item/mecha_parts/mecha_equipment/generator/nuclear
	name = "\improper ExoNuclear reactor"
	desc = "Generates power using uranium recklessly. Radiates the environment."
	icon_state = "uranium"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 3)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 5, MATERIAL_GLASS = 10)
	max_fuel = 50000
	fuel_per_cycle_idle = 10
	fuel_per_cycle_active = 30
	power_per_cycle = 50
	var/rad_per_cycle = 0.3

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/Process()
	if(..())
		for(var/mob/living/carbon/M in view(chassis))
			if(ishuman(M))
				M.apply_effect((rad_per_cycle * 3),IRRADIATE)
			else
				M.apply_effect(rad_per_cycle, IRRADIATE)
	return 1

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/create_fuel()
	fuel = new /obj/item/stack/material/uranium(src)
	fuel.amount = 0

/obj/item/mecha_parts/mecha_equipment/generator/nuclear/critfail()
	return

/obj/item/mecha_parts/mecha_equipment/tool/passenger
	name = "passenger compartment"
	desc = "A mountable passenger compartment for exo-suits. Rather cramped."
	icon_state = "mecha_abooster_ccw"
	origin_tech = list(TECH_ENGINEERING = 1, TECH_BIO = 1)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_GLASS = 5)
	energy_drain = 10
	range = MECHA_MELEE
	equip_cooldown = 20
	var/mob/living/carbon/occupant = null
	var/door_locked = 1
	salvageable = 0
	selectable = FALSE

/obj/item/mecha_parts/mecha_equipment/tool/passenger/destroy()
	for(var/atom/movable/AM in src)
		AM.forceMove(get_turf(src))
		to_chat(AM, SPAN_DANGER("You tumble out of the destroyed [name]!"))
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/passenger/Exit(atom/movable/O)
	return 0

// Make absolutely sure this alert is cleared
/obj/item/mecha_parts/mecha_equipment/tool/passenger/Exited(mob/living/L)
	. = ..()
	if(istype(L))
		L.clear_alert("passenger_cabin")

/obj/item/mecha_parts/mecha_equipment/tool/passenger/proc/move_inside(var/mob/user)
	if(chassis)
		chassis.visible_message(SPAN_NOTICE("[user] starts to climb into [chassis]."))

	if(do_after(user, 40, src, needhand=0))
		if(!occupant)
			user.forceMove(src)
			occupant = user
			log_message("[user] boarded.")
			occupant_message("[user] boarded.")
			occupant.throw_alert("passenger_cabin", /obj/screen/alert/exit_passenger_compartment)
		else if(occupant != user)
			to_chat(user, SPAN_WARNING("[occupant] was faster. Try better next time, loser."))
	else
		to_chat(user, "You stop entering the exosuit.")

/obj/item/mecha_parts/mecha_equipment/tool/passenger/proc/go_out()
	if(!occupant)
		return
	to_chat(occupant, "You climb out from [src].")
	occupant.forceMove(get_turf(src))
	occupant.reset_view()
	occupant.clear_alert("passenger_cabin")
	occupant = null
	occupant_message("[occupant] disembarked.")
	log_message("[occupant] disembarked.")
	add_fingerprint(usr)
	return

/obj/item/mecha_parts/mecha_equipment/tool/passenger/attach()
	..()
	if(chassis)
		chassis.verbs |= /obj/mecha/proc/move_inside_passenger

/obj/item/mecha_parts/mecha_equipment/tool/passenger/detach()
	if(occupant)
		occupant_message("Unable to detach [src] - equipment occupied.")
		return

	var/obj/mecha/M = chassis
	. = ..()
	if(M && !(locate(/obj/item/mecha_parts/mecha_equipment/tool/passenger) in M))
		M.verbs -= /obj/mecha/proc/move_inside_passenger

/obj/item/mecha_parts/mecha_equipment/tool/passenger/get_equip_info()
	return "[..()] <br />[occupant? "\[Occupant: [occupant]\]|" : ""]Exterior Hatch: <a href='?src=\ref[src];toggle_lock=1'>Toggle Lock</a>"

/obj/item/mecha_parts/mecha_equipment/tool/passenger/Topic(href,href_list)
	. = ..()
	if(href_list["toggle_lock"])
		door_locked = !door_locked
		occupant_message("Passenger compartment hatch [door_locked? "locked" : "unlocked"].")
		if(chassis)
			chassis.visible_message("The hatch on [chassis] [door_locked? "locks" : "unlocks"].", "You hear something latching.")
		send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())


#define LOCKED 1
#define OCCUPIED 2

/obj/mecha/proc/move_inside_passenger()
	set category = "Object"
	set name = "Enter Passenger Compartment"
	set src in oview(1)

	//check that usr can climb in
	if(usr.stat || !ishuman(usr))
		return

	if(!usr.Adjacent(src))
		return

	if(!isturf(usr.loc))
		to_chat(usr, SPAN_DANGER("You can't reach the passenger compartment from here."))
		return

	if(iscarbon(usr))
		var/mob/living/carbon/C = usr
		if(C.handcuffed)
			to_chat(usr, SPAN_DANGER("Kinda hard to climb in while handcuffed don't you think?"))
			return

	for(var/mob/living/carbon/slime/M in range(1,usr))
		if(M.Victim == usr)
			to_chat(usr, SPAN_DANGER("You're too busy getting your life sucked out of you."))
			return

	//search for a valid passenger compartment
	var/feedback = 0 //for nicer user feedback
	for(var/obj/item/mecha_parts/mecha_equipment/tool/passenger/P in src)
		if(P.occupant)
			feedback |= OCCUPIED
			continue
		if(P.door_locked)
			feedback |= LOCKED
			continue

		//found a boardable compartment
		P.move_inside(usr)
		return

	//didn't find anything
	switch(feedback)
		if(OCCUPIED)
			to_chat(usr, SPAN_DANGER("The passenger compartment is already occupied!"))
		if(LOCKED)
			to_chat(usr, SPAN_WARNING("The passenger compartment hatch is locked!"))
		if(OCCUPIED|LOCKED)
			to_chat(usr, SPAN_DANGER("All of the passenger compartments are already occupied or locked!"))
		if(0)
			to_chat(usr, SPAN_WARNING("[src] doesn't have a passenger compartment."))

#undef LOCKED
#undef OCCUPIED
