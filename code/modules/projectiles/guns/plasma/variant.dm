/*
Core Concept : 	This unfortunate quality makes a Plasma Weapon potentially as deadly to the wielder as it is to the target.
				However, the sheer power and deadliness of Plasma Weapons often outweigh the hazards that come with their use.

--- AMMO ---
- Projectile Drop-off for each gun.
- Make the gun use non-rechargable hydrogen flasks.
- Each flask hold ~15 shots.
- Reloaded using a screwdriver to remove and secure the cell. High skill cap and take a long time.
- Failure when reloading can lead to 20 burn damage to the hand or a containment failure on the first shot.
- Backpack & Feedline can replace hydrogen flasks.

--- HEAT MECHANIC ---
- Heat the gun by firing shots.
- Lose Heat over time when not firing.
- Regularly release steam when a Heat threshold is reached, reducing Heat.
- Cannot constantly vent, random minimal delay between ventings.
- Manually venting the gun make it happen immediately, but has a delay where the user must stand still and not get shot.
- Overheat by firing too fast for venting to keep up.
- When overheating, deal 50 burn damage to the active hand.

- When containment fail, give a second warning, destroy the gun and deal 50 burn damage to every bodypart, with a 1-tile explosion.

--- PROJECTILE ---
- Deal 100 burn damage with high armor penetration.
- Does a 1-tile explosion when hitting a target.
- Maximal Mode : Use more fuel for more damage, force a delay after firing.

--- TYPES ---
- Plasma Pistol : Same Damage, less range and lower rate of fire. Can use Maximal Mode.
- Plasma Torch : Welder that use plasma flasks or backpack, can be used as an emergency pistol without the Maximal Mode and less range.
- Plasma Grenade : Made from Flasks. Explode and sear everything around them.
- Plasma Gun : Reasonable rate of fire, can use Maximal Mode. Likely to survive through containment failure.
- Plasma Cannon : Cannot use Fuel Flasks, Projectile explosion is a 3x3 AoE. Maximal Mode give even bigger boom. More Dangerous Meltdown.
- Plasma Cannon Mounted Stand : Can accept Plasma Cannons and Fuel Backpack, prevent overheating of the gun thanks to external cooling system. Give one to Blackshield.
- Plasma Incinerator : Blue Cross Weapon. ***NO RISK OF OVERHEATING***, Overcharge setting is even deadlier and risk overheating. // Overcharge might not be added
*/

/obj/item/weapon/gun/plasma/pistol
	name = "Plasma Pistol"
	desc = "A volatile but powerful weapon that use hydrogen flasks to fire powerful bolts."
	icon = 'icons/obj/guns/plasma/plasma.dmi'
	icon_state = "pistol"
	twohanded = FALSE

	projectile_type = /obj/item/projectile/plasma_bullet/pistol
	use_plasma_cost = 10 // How much plasma is used per shot
	heat_per_shot = 5

/obj/item/weapon/gun/plasma/cannon
	name = "Plasma Cannon"
	desc = "A volatile but powerful weapon that use hydrogen flasks to fire powerful bolts."
	icon = 'icons/obj/guns/plasma/plasma.dmi'
	icon_state = "cannon"

	projectile_type = /obj/item/projectile/plasma_bullet/cannon
	use_plasma_cost = 20 // How much plasma is used per shot
	heat_per_shot = 10

// Welder that use plasma flasks
/obj/item/weapon/tool/plasmawelder
	name = "Plasma Welder"
	desc = "A welder that use cryo-sealed hydrogen fuel cell to weld with the heat of a sun."
	icon = 'icons/obj/guns/plasma/plasma.dmi'
	icon_state = "welder"

	eye_hazard = TRUE
	degradation = FALSE
	create_hot_spot = TRUE
	switched_on_qualities = list(QUALITY_WELDING = 80, QUALITY_CAUTERIZING = 50)
	toggleable = TRUE
	max_upgrades = 0
	heat = 2250

	var/obj/item/weapon/plasma_flask/flask = null // The flask the welder use for ammo
	var/use_plasma_cost = 1 // Active cost
	var/passive_cost = 0.3 // Passive cost

/obj/item/weapon/tool/plasmawelder/New()
	..()
	if(!flask)
		flask = new /obj/item/weapon/plasma_flask(src)

/obj/item/weapon/tool/plasmawelder/Process()
	..()
	if(switched_on)
		if (use_plasma_cost && passive_cost)
			if(!consume_plasma_fuel(passive_cost))
				turn_off()

/obj/item/weapon/tool/plasmawelder/proc/consume_plasma_fuel(var/volume)
	if (get_plasma_fuel() >= volume)
		flask.use(volume)
		return TRUE
	return FALSE

/obj/item/weapon/tool/plasmawelder/proc/get_plasma_fuel()
	return flask.plasma

/obj/item/weapon/tool/plasmawelder/consume_resources(var/timespent, var/user)
	..()
	if(use_plasma_cost)
		if(!consume_plasma_fuel(use_plasma_cost*timespent))
			to_chat(user, SPAN_NOTICE("You need more hydrogen fuel to complete this task."))
			return FALSE

/obj/item/weapon/tool/plasmawelder/check_tool_effects(var/mob/living/user, var/time)
	if(use_plasma_cost)
		if(get_plasma_fuel() < (use_plasma_cost*time))
			to_chat(user, SPAN_NOTICE("You need more hydrogen fuel to complete this task."))
			return FALSE
	..()

/obj/item/weapon/tool/plasmawelder/examine(mob/user)
	..(user)
	if(!flask)
		to_chat(user, SPAN_NOTICE("Has no fuel flask inserted."))
		return
	to_chat(user, "Has [get_plasma_fuel()] unit of fuel remaining.")
	return

// Copying the superior proc because I don't know how to insert the plasma cost in the middle.
/obj/item/weapon/tool/plasmawelder/ui_data(mob/user)
	var/list/data = list()

	if(tool_qualities)
		data["tool_qualities"] = list()
		for(var/name in tool_qualities)
			data["tool_qualities"] += list(list("name" = capitalize(name), "number" = tool_qualities[name]))

	data["precision"] = precision
	data["precision_state"] = precision > 0 ? "good" : precision < 0 ? "bad" : ""

	data["workspeed"] = workspeed
	data["workspeed_state"] = initial(workspeed) < workspeed ? "good" : initial(workspeed) > workspeed ? "bad" : ""
	data["workspeed_max"] = initial(workspeed) * 20

	data["degradation"] = degradation
	data["degradation_state"] = initial(degradation) > degradation ? "good" : initial(degradation) < degradation ? "bad" : ""
	data["degradation_max"] = initial(degradation) * 10

	if(use_power_cost)
		data["cell_charge"] = cell ? cell.percent() : null
		data["use_power_cost"] = use_power_cost
		data["use_power_cost_state"] = initial(use_power_cost) > use_power_cost ? "good" : initial(use_power_cost) < use_power_cost ? "bad" : ""
		data["use_power_cost_max"] = initial(use_power_cost) * 10

	if(use_fuel_cost)
		data["fuel"] = reagents ? reagents.ui_data() : null
		data["max_fuel"] = max_fuel
		data["use_fuel_cost"] = use_fuel_cost
		data["use_fuel_cost_state"] = initial(use_fuel_cost) > use_fuel_cost ? "good" : initial(use_fuel_cost) < use_fuel_cost ? "bad" : ""
		data["use_fuel_cost_max"] = initial(use_fuel_cost) * 10

	if(use_plasma_cost)
		data["fuel"] = flask ? flask.plasma : null
		data["max_fuel"] = flask.max_plasma
		data["use_fuel_cost"] = use_plasma_cost
		data["use_fuel_cost_state"] = initial(use_plasma_cost) > use_plasma_cost ? "good" : initial(use_plasma_cost) < use_plasma_cost ? "bad" : ""
		data["use_fuel_cost_max"] = initial(use_plasma_cost) * 10

	data["health"] = health
	data["health_max"] = max_health
	data["health_threshold"] = health_threshold

	data["force"] = force
	data["force_max"] = initial(force) * 10


	data["extra_volume"] = extra_bulk

	data["upgrades_max"] = max_upgrades

	// it could be done with catalog using one line but whatever
	if(item_upgrades.len)
		data["attachments"] = list()
		for(var/atom/A in item_upgrades)
			data["attachments"] += list(list("name" = A.name, "icon" = getAtomCacheFilename(A)))

	return data

/obj/item/weapon/tool/plasmawelder/turn_on(mob/user)
	.=..()
	if(.)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		damtype = BURN
		START_PROCESSING(SSobj, src)

/obj/item/weapon/tool/plasmawelder/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
	..()
	damtype = initial(damtype)

/obj/item/weapon/tool/plasmawelder/is_hot()
	if (damtype == BURN)
		return heat




