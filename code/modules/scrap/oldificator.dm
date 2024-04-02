/atom
	var/oldified = FALSE  // Whether the item has underwent make_old()
	// var/crit_fail = FALSE // In theory should make the item fail horifically, currently only used in vending.dm

//Defined at atom level for convenience, not currently used for mobs and turfs, but there are possible applications
/atom/proc/make_old()
	return

/atom/proc/make_young()
	oldified = FALSE

/obj/make_old()
	if (oldified)
		return FALSE
	if (prob(80))
		color = pick("#AA7744", "#774411", "#777777")
	light_color = color
	name = "[pick("old", "worn", "rusted", "weathered", "expired", "dirty", "frayed", "beaten", "ancient", "tarnished")] [name]"
	desc += "\n "
	desc += pick("Its warranty has expired.",
	 "The inscriptions on this thing have been erased by time.",
	 "Looks completely ruined.",
	 "It is difficult to make out what this thing once was.",
	 "A relic from a bygone age.")
	price_tag *= RAND_DECIMAL(0.1, 0.6) //Tank the price of it

	//Deplete matter and matter_reagents
	for (var/a in matter)
		matter[a] *= RAND_DECIMAL(0.5, 1)

	for (var/a in matter_reagents)
		matter_reagents[a] *= RAND_DECIMAL(0.5, 1)

	for(var/obj/item/sub_item in contents)
		if (prob(80))
			sub_item.make_old()

	oldified = TRUE


	update_icon()
	return TRUE

/obj/make_young()
	if(!oldified)
		return
	name = initial(name)
	color = initial(color)
	desc = initial(desc)
	price_tag = initial(price_tag)
	..()

/obj/item/make_old()
	.=..()
	if (.)
		if(prob(75))
			origin_tech = null
		siemens_coefficient += 0.3

/obj/item/tool/make_old()
	.=..()
	if (.)
		adjustToolHealth(-(rand(20, 60) * degradation))
		precision -= rand(0,10)
		workspeed = workspeed*(rand(5,10)/10) //50% less speed max
		degradation += rand(0,4)
		health = rand(10, max_health)

/obj/item/tool/make_young()
	if(!oldified)
		return
	workspeed = initial(workspeed)
	precision = initial(precision)
	degradation = initial(degradation)
	refresh_upgrades() //So we dont null upgrades
	..()

/obj/item/gun/make_old()
	. = ..()
	if(. && prob(60))
		var/list/trash_mods = TRASH_GUNMODS
		while(trash_mods.len)
			var/trash_mod_path = pick_n_take(trash_mods)
			var/obj/item/trash_mod = new trash_mod_path
			if(LEGACY_SEND_SIGNAL(trash_mod, COMSIG_IATTACK, src, null))
				break
			QDEL_NULL(trash_mod)
	else
		fire_delay += rand(0,3)
		init_recoil = OLDIFED_RECOIL(pick(1.5, 1.8, 2, 2.3, 2.6, 3.2, 3.3, 4))
		damage_multiplier = damage_multiplier*(rand(8,10)/10) //20% less damage max
		penetration_multiplier = penetration_multiplier*(rand(8,10)/10) //20% less damage penetration
	refresh_upgrades() //So we dont null upgrades.

/obj/item/gun/make_young()
	if(!oldified)
		return
	fire_delay = initial(fire_delay)
	damage_multiplier = initial(damage_multiplier)
	penetration_multiplier = initial(penetration_multiplier)
	refresh_upgrades() //So we dont null upgrades
	..()

/obj/item/gun/energy/make_old()
	. = ..()
	charge_cost+= rand(0,250)
	overcharge_max-= rand(0,5) //This is infact a number you want to go up
	overcharge_rate-= rand(0,5)

/obj/item/gun/energy/make_young()
	if(!oldified)
		return
	charge_cost = initial(charge_cost)
	overcharge_max = initial(overcharge_max)
	overcharge_rate = initial(overcharge_rate)
	refresh_upgrades() //So we dont null upgrades. Do it again...
	..()

/obj/item/storage/make_old()
	.=..()
	if (.)
		var/del_count = rand(0, contents.len)
		for(var/i = 1 to del_count)
			var/removed_item = pick(contents)
			contents -= removed_item
			QDEL_NULL(removed_item)

		if(storage_slots && prob(75))
			storage_slots = max(contents.len, max(0, storage_slots - pick(2, 2, 2, 3, 3, 4)))
		if(max_storage_space && prob(75))
			max_storage_space = max_storage_space / 2

//Old pill bottles get a name that disguises their contents
/obj/item/storage/pill_bottle/make_old()
	if (prob(85))
		name = "bottle of [pick("generic ", "unknown ", "")]pills"
		desc = "Contains pills of some kind. The label has long since worn away"
		for (var/obj/item/reagent_containers/pill/P in contents)
			P.make_old()

	.=..()

//Make sure old pills always hide their contents too
/obj/item/reagent_containers/pill/make_old()
	name = "pill"
	desc = "Some kind of pill. The imprints have worn away."
	.=..()

/obj/structure/reagent_dispensers/make_old()
	.=..()
	if (. && reagents)
		for(var/datum/reagent/R in reagents.reagent_list)
			R.volume = rand(0, R.volume)


/obj/item/reagent_containers/make_old()
	.=..()
	if (.)
		var/actual_volume = reagents?.total_volume
		for(var/datum/reagent/R in reagents?.reagent_list)
			R.volume = rand(0, R.volume)
		reagents?.add_reagent("toxin", rand(0, actual_volume - reagents?.total_volume))

//Old chemical bottles also hide their reagents
/obj/item/reagent_containers/glass/bottle/make_old(low_quality_oldification)
	.=..()
	if(.)
		name = "[pick("scratched", "cracked", "dirty", "chipped")] bottle"
		desc = "A small old glass bottle."
		if(display_label)
			desc += " The label is unreadable."

//Sealed survival food, always edible
/obj/item/reagent_containers/food/snacks/openable/liquidfood/make_old()
	return

/obj/item/ammo_magazine/make_old()
	var/del_count = rand(0, stored_ammo.len)
	for(var/i = 1 to del_count)
		var/removed_item = pick(stored_ammo)
		stored_ammo -= removed_item
		QDEL_NULL(removed_item)
	..()

/obj/item/cell/make_old()
	.=..()
	if (.)
		// It's silly to have old self-charging cells spawn partially discharged
		if(!autorecharging)
			charge = min(charge, RAND_DECIMAL(50, maxcharge))

		if(prob(20))
			rigged = TRUE
			if(prob(40))
				charge = maxcharge  //make it BOOM hard
		update_icon()

/obj/item/stock_parts/make_old()
	.=..()
	if (.)
		var/degrade = pick(0,1,1,1,2)
		rating = max(rating - degrade, 1)


/obj/item/stack/material/make_old()
	return

/obj/item/stack/rods/make_old()
	return

/obj/item/stack/ore/make_old()
	return

/obj/item/computer_hardware/hard_drive/portable/design/make_old()
	..()
	if(license >= 1)
		license = round(license / pick(1, 1, 1, 1.1, 1.1, 1.1, 1.1, 1.2, 1.3)) //This looses a lot when unlucky
//todo: make old disk have corrupted prints
/*
	if(designs)
		for(var/key in designs)
			if(prob(50))//1% to make a design into a corrputed one
				var/replacement = /datum/design/autolathe/corrupted
				designs[key] = replacement[key]
*/

/obj/item/grenade/make_old()
	..()
	det_time = RAND_DECIMAL(0, det_time)

/obj/item/tank/make_old()
	.=..()
	if (.)
		air_contents.remove(pick(0.2, 0.4 ,0.6, 0.8))


/obj/item/circuitboard/make_old()
	.=..()
	if (.)
		if(prob(75))
			name = "unknown board"
			build_path = pick(/obj/machinery/washing_machine, /obj/machinery/broken, /obj/machinery/shower, /obj/machinery/holoposter, /obj/machinery/holosign)


/obj/item/aiModule/make_old()
	.=..()
	if (.)
		if(prob(75) && !istype(src, /obj/item/aiModule/broken))
			var/obj/item/aiModule/brokenmodule = new /obj/item/aiModule/broken
			brokenmodule.name = src.name
			brokenmodule.desc = src.desc
			brokenmodule.make_old()
			QDEL_NULL(src)


/obj/item/clothing/suit/space/make_old()
	.=..()
	if (.)
		if(prob(50))
			create_breaches(pick(BRUTE, BURN), rand(10, 50))


/obj/item/clothing/make_old()
	.=..()
	if (.)
		if(prob(30))
			slowdown += pick(0.5, 0.5, 1, 1.5)
		if(prob(40))
			if(!armor) //Possible to run before the initialize proc, thus having to modify the armor list
				for(var/i in armor_list)
					armor_list[i] = rand(0, armor_list[i])
			else
				armor = armor.setRating(melee = rand(0, armor.getRating(ARMOR_MELEE)), bullet =  rand(0, armor.getRating(ARMOR_BULLET)), energy = rand(0, armor.getRating(ARMOR_ENERGY)), bomb = rand(0, armor.getRating(ARMOR_BOMB)), bio = rand(0, armor.getRating(ARMOR_BIO)), rad = rand(0, armor.getRating(ARMOR_RAD)))
		if(prob(40))
			heat_protection = rand(0, round(heat_protection * 0.5))
		if(prob(40))
			cold_protection = rand(0, round(cold_protection * 0.5))
		if(prob(20))
			contaminate()
		if(prob(15))
			add_blood()
		if(prob(60)) // I mean, the thing is ew gross.
			equip_delay += rand(0, 6 SECONDS)
		if(prob(60)) // I mean, the thing is ew gross.
			stiffness += pick(0, 0, 0.5, 0.5, 0.5, 1, 1.5)

/obj/item/clothing/make_young()
	if(!oldified)
		return
	var/obj/item/clothing/referencecarmor = new type()
	armor = referencecarmor.armor
	qdel(referencecarmor)
	slowdown = initial(slowdown)
	heat_protection = initial(heat_protection)
	cold_protection = initial(cold_protection)
	equip_delay = initial(equip_delay)
	refresh_upgrades() //So we dont null upgrades.
	..()


/obj/item/aiModule/broken
	name = "\improper broken core AI module"
	desc = "broken Core AI Module: 'Reconfigures the AI's core laws.'"

/obj/machinery/broken/Initialize()
	..()
	explosion(loc, 1, 2, 3, 3)
	return INITIALIZE_HINT_QDEL

/obj/machinery/broken/Destroy()
	contents.Cut()
	return ..()

/obj/item/aiModule/broken/transmitInstructions(mob/living/silicon/ai/target, mob/sender)
	..()
	IonStorm(0)
	explosion(sender.loc, 1, 1, 1, 3)
	sender.drop_from_inventory(src)
	QDEL_NULL(src)

/obj/item/dnainjector/make_old()
	.=..()
	if (.)
		if(prob(75))
			name = "DNA-Injector (unknown)"
			desc = pick("1mm0r74l17y 53rum", "1ncr3d1bl3 73l3p47y hNlk", "5up3rhum4n m16h7")
			value = 0xFFF
		if(prob(75))
			block = pick(MONKEYBLOCK, HALLUCINATIONBLOCK, DEAFBLOCK, BLINDBLOCK, NERVOUSBLOCK, TWITCHBLOCK, CLUMSYBLOCK, COUGHBLOCK, HEADACHEBLOCK, GLASSESBLOCK)


/obj/item/clothing/glasses/hud/make_old()
	.=..()
	if (.)
		if(prob(75) && !istype(src, /obj/item/clothing/glasses/hud/broken))
			var/obj/item/clothing/glasses/hud/broken/brokenhud = new /obj/item/clothing/glasses/hud/broken
			brokenhud.name = src.name
			brokenhud.desc = src.desc
			brokenhud.icon = src.icon
			brokenhud.icon_state = src.icon_state
			brokenhud.item_state = src.item_state
			brokenhud.make_old()
			QDEL_NULL(src)

/obj/item/clothing/glasses/make_old()
	.=..()
	if (.)
		if(prob(75))
			vision_flags = 0
		if(prob(75))
			darkness_view = -1

/obj/item/clothing/glasses/make_young()
	if(!oldified)
		return
	vision_flags = initial(vision_flags)
	darkness_view = initial(darkness_view)
	refresh_upgrades() //So we dont null upgrades.
	..()

/obj/item/device/lighting/glowstick/make_old()
	.=..()
	if (.)
		if(prob(75))
			fuel = rand(0, fuel)

/obj/item/device/lighting/toggleable/make_old()
	.=..()
	if (.)
		if(prob(75))
			brightness_on = brightness_on / 2

/obj/machinery/floodlight/make_old()
	.=..()
	if (.)
		if(prob(75))
			brightness_on = brightness_on / 2

/obj/machinery/make_old()
	.=..()
	if (.)
		if(prob(60))
			stat |= BROKEN
		if(prob(60))
			emagged = TRUE


/obj/machinery/vending/make_old()
	.=..()
	if (.)
		if(prob(60))
			vend_power_usage *= pick(1, 1.3, 1.5, 1.7, 2.0)
		if(prob(60))
			seconds_electrified = -1
		if(prob(60))
			shut_up = FALSE
			slogan_delay = rand(round(slogan_delay * 0.5), slogan_delay)
		if(prob(60))
			shoot_inventory = TRUE

		var/del_count = rand(0, product_records.len)
		for(var/i in 1 to del_count)
			product_records.Remove(pick(product_records))

/obj/item/clothing/glasses/sechud/make_old()
	.=..()
	if (.)
		if(hud && prob(75))
			hud = new /obj/item/clothing/glasses/hud/broken

/obj/item/clothing/glasses/sechud/make_young()
	.=..()
	if (.)
		if(hud)
			hud = new /obj/item/clothing/glasses/hud/security

// This code is fucking cursed and responsible for roughly 50% of the round run-times and crashed when booting up the server. No idea what cursed shit eris did, leave this commented out. -Kaz
/*
/obj/effect/decal/mecha_wreckage/make_old()
	.=..()
	if (.)
		salvage_num = max(1, salvage_num - pick(1, 2, 3))

/obj/mecha/make_old()
	. = ..()

	// Mech log is clean. No one knows when was this mech manufactured, or what happened to it before it was found.
	log = list()

	if (.)
		//Now we determine the exosuit's condition
		switch (rand(0,100))
			if (0 to 3)
			//Perfect condition, it was well cared for and put into storage in a pristine state
			//Nothing is done to it.
			if (4 to 10)
			//Poorly maintained.
			//The internal airtank and power cell will be somewhat depleted, otherwise intact
				var/P = rand(0,50) / 100
				if (cell)//Set the cell to a random charge below 50%
					cell.charge =  cell.maxcharge * P

				P = rand(50,100) / 100
				if(internal_tank)//remove 50-100% of airtank contents
					internal_tank.air_contents.remove(internal_tank.air_contents.total_moles * P)


			if (11 to 20)
			//Wear and tear
			//Hull has light to moderate damage, tank and cell are depleted
			//Any equipment will have a 25% chance to be lost
				var/P = rand(0,30) / 100
				if (cell)//Set the cell to a random charge below 50%
					cell.charge =  cell.maxcharge * P

				P = rand(70,100) / 100
				if(internal_tank)//remove 50-100% of airtank contents
					internal_tank.air_contents.remove(internal_tank.air_contents.total_moles * P)

				lose_equipment(25)//Lose modules

				P = rand(10,100) / 100 //Set hull integrity
				health = initial(health)*P


			if (21 to 40)
			//Severe damage
			//Power cell has 50% chance to be missing or is otherwise low
			//Significant chance for internal damage
			//Hull integrity less than half
			//Each module has a 50% loss chance
			//Systems may be misconfigured
				var/P

				if (prob(50))//Remove cell
					cell = null
				else
					P = rand(0,20) / 100 //or deplete it
					if (cell)//Set the cell to a random charge below 50%
						cell.charge = cell.maxcharge * P

				P = rand(80,100) / 100 //Deplete tank
				if(internal_tank)//remove 50-100% of airtank contents
					internal_tank.air_contents.remove(internal_tank.air_contents.total_moles * P)

				lose_equipment(50)//Lose modules
				random_internal_damage(15)//Internal damage

				P = rand(5,50) / 100 //Set hull integrity
				health = initial(health)*P
				misconfigure_systems(15)


			if (41 to 80)
			//Decomissioned
			//The exosuit is a writeoff, it was tossed into storage for later scrapping.
			//Wasnt considered worth repairing, but you still can
			//Power cell missing, internal tank completely drained or ruptured/
			//65% chance for each type of internal damage
			//90% chance to lose each equipment
			//System settings will be randomly configured
				var/P
				if (prob(1))
					cell.rigged = 1//Powercell will explode if you use it
				else if (prob(50))//Remove cell
					QDEL_NULL(cell)

				if (cell)
					P = rand(0,20) / 100 //or deplete it
					cell.charge =  cell.maxcharge * P

				lose_equipment(90)//Lose modules
				random_internal_damage(50)//Internal damage

				if (!hasInternalDamage(MECHA_INT_TANK_BREACH))//If the tank isn't breaches
					qdel(internal_tank)//Then delete it
					internal_tank = null

				P = rand(5,50)/ 100 //Set hull integrity
				health = initial(health)*P
				misconfigure_systems(45)


			if (81 to 100)
			//Salvage
			//The exosuit is wrecked. Spawns a wreckage object instead of a suit
				//Set the noexplode var so it doesn't explode, then just qdel it
				//The destroy proc handles wreckage generation
				noexplode = 1
				QDEL_NULL(src)

		//Finally, so that the exosuit seems like it's been in storage for a while
		//We will take any malfunctions to their logical conclusion, and set the error states high

		//If the tank has a breach, then there will be no air left
		if (hasInternalDamage(MECHA_INT_TANK_BREACH) && internal_tank)
			internal_tank.air_contents.remove(internal_tank.air_contents.total_moles)

		//If there's an electrical fault, the cell will be complerely drained
		if (hasInternalDamage(MECHA_INT_SHORT_CIRCUIT) && cell)
			cell.charge = 0


		//Code for interacting with damage+power warnings, an unported aurora feature
		/*
		process_warnings()//Trigger them first, if they'll happen

		if (power_alert_status)
			last_power_warning = -99999999
			//Make it go into infrequent warning state instantly
			power_warning_delay = 99999999
			//and set the delay between warnings to a functionally infinite value
			//so that it will shut up

		if (damage_alert_status)
			last_damage_warning = -99999999
			damage_warning_delay = 99999999

		process_warnings()
		*/
*/


// OCCULUS EDIT: Required check for nanite reconstitution apparatus; checks if old without youngifying it
/obj/proc/is_old()
	if(oldified)
		return TRUE
	return FALSE
// OCCULUS EDIT END
