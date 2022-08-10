#define WANDER_MODE 1 // Do we wander around?
#define GATHER_MODE 2 // Do we pick up the ore?
#define MINER_MODE 4 // Do we mine rocks?

/mob/living/carbon/superior_animal/robot/mining
	name = "Generic Mining Drone"
	desc = "A small, unbranded drone, it has a drill and a deep thirst for shiny rocks."
	gender = NEUTER
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "mining_drone"
	faction = "neutral"
	health = 75 // Bit tanky, the mines are dangerous
	maxHealth = 75
	melee_damage_lower = 20 // Diamond-tipped drill.
	melee_damage_upper = 30
	viewRange = 6
	move_to_delay = 3
	randpixel = 0
	mob_size = MOB_SMALL
	do_gibs = TRUE
	light_range = 5
	light_color = COLOR_LIGHTING_CYAN_BRIGHT
	cleaning = FALSE // It isn't a roomba
	wander = FALSE // We got the wandering handled manually
	stop_automated_movement_when_pulled = TRUE
	possession_candidate = TRUE

	// Unique vars
	var/target // Where we want to go
	var/mining_modes = 7 // Bitflags for the AI. They start activated

/mob/living/carbon/superior_animal/robot/mining/examine(mob/user)
	..()

/mob/living/carbon/superior_animal/robot/mining/Life()
	..()
	if(!client) // If there's anyone controlling the bot, this AI part won't run
		if(!look_around() && (mining_modes & WANDER_MODE) && !in_use) // If we didn't find anything of value and can (mining_modes & WANDER_MODE) and someoen isn't using our UI
			target = pick(oview(viewRange + 1, src)) // Go somewhere random

		// Are we going to a minable turf despite not being supposed to?
		if(istype(target, /turf/simulated/mineral && !(mining_modes & MINER_MODE)))
			target = null // reset the target

		// Are we going to ores on the ground despite not being supposed to?
		if(istype(target, /obj/item/stack/ore && !(mining_modes & GATHER_MODE)))
			target = null // reset the target

		// We shouldn't target the floor if we are not wandering
		if(istype(target, /turf/simulated/floor) && !(mining_modes & WANDER_MODE))
			target = null // reset the target

		if(target) // Do we have a destination?
			if (stat != DEAD)
				SSmove_manager.move_to(src, target, 1, move_to_delay) // Go there
		else
			SSmove_manager.stop_looping(src) // Or else stop
	else // We got someone controlling the drone.
		SSmove_manager.stop_looping(src) // Stop automated movement
		target = null // No targets to go to

/mob/living/carbon/superior_animal/robot/mining/death()
	drop_loot()
	//new /obj/item/tool/pickaxe/diamonddrill(loc) // So we can use the drill to make another one // Miners destroy the bot round-start to get the drill...
	..()

/mob/living/carbon/superior_animal/robot/mining/attack_hand(mob/user as mob)
	if(user.a_intent == I_HELP) // Are we on help intent?
		interact(user)
	else ..()

/mob/living/carbon/superior_animal/robot/mining/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?
		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name].")
										)
					if(user.stats.getPerk(PERK_ROBOTICS_EXPERT))
						heal_overall_damage(50, 50)
					else
						heal_overall_damage(rand(30, 50), rand(30, 50))
					updateDialog()
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return

	// If nothing was ever triggered, continue as normal
	..()

/mob/living/carbon/superior_animal/robot/mining/proc/look_around()
	for(var/O in oview(1, src)) // Check our surroundings.
		if((mining_modes & MINER_MODE) && istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				mine(M) // Mine the turf
				target = null
				. = TRUE // We'll return later, keep looping.
				continue

		if((mining_modes & GATHER_MODE) && istype(O, /obj/item/stack/ore)) // Is it ore on the ground?
			var/obj/item/stack/ore/Ore = O
			pick_ore(Ore) // Pick it up
			target = null
			. = TRUE // We'll return later, keep looping.
			continue

	if(.) // Did we mine or pick up stuff earlier on?
		return . // return TRUE

	for(var/O in oview(viewRange, src)) // Check everything we can see
		if((mining_modes & GATHER_MODE) && istype(O, /obj/item/stack/ore)) // Is it ore on the ground?
			var/obj/item/stack/ore/Ore = O
			target = Ore // Let's go there
			return TRUE

		if((mining_modes & MINER_MODE) && istype(O, /turf/simulated/mineral)) // Is it a turf?
			var/turf/simulated/mineral/M = O
			if(M.mineral) // Does it have stuff to mine?
				target = M // We want to go to M
				return TRUE



// Mine a tile
/mob/living/carbon/superior_animal/robot/mining/proc/mine(turf/simulated/mineral/M)
	//visible_message("[src] mine [M]") // For some reasons the messages do not combine and spam the chat.
	M.GetDrilled() // Mine the turf
	return TRUE

// Pick an ore and put it in the contents.
/mob/living/carbon/superior_animal/robot/mining/proc/pick_ore(obj/item/stack/ore/O)
	//visible_message("[src] pick up [O]") // For some reasons the messages do not combine and spam the chat.
	O.loc = src
	contents += O // Pick up the item
	updateDialog()
	return TRUE

// Drop all the loot that the bot gathered on the ground.
/mob/living/carbon/superior_animal/robot/mining/proc/drop_loot()
	visible_message("[src] empties \his storage bin.")
	for(var/obj/O in contents) // Empty everything
		contents -= O
		O.loc = loc
	updateDialog()
	return TRUE

/mob/living/carbon/superior_animal/robot/mining/interact(mob/user as mob)
	if((get_dist(src, user) > 1) || (stat & (BROKEN|NOPOWER)))
		if(!isAI(user))
			user.unset_machine()
			user << browse(null, "window=MiningDrone")
			return

	user.set_machine(src)

	user << browse(handle_ui(), "window=MiningDrone")
	onclose(user, "MiningDrone")
	return

/mob/living/carbon/superior_animal/robot/mining/proc/handle_ui()
	var/dat = ""
	dat += "<head><title>[name]</title></head>"
	dat += "[name]<BR>"
	dat += "<A href='?src=\ref[src];close=1'>Close</A><BR>"
	dat += "<A href='?src=\ref[src];refresh=1'>Refresh</A><BR><BR>"

	dat += "Status: <BR>"
	if(!client)
		dat += "- <A href='?src=\ref[src];togglemode=[WANDER_MODE]'>[(mining_modes & WANDER_MODE) ? "Wandering" : "Not Wandering"].</A><BR>"
		dat += "- <A href='?src=\ref[src];togglemode=[GATHER_MODE]'>[(mining_modes & GATHER_MODE) ? "Gathering" : "Not Gathering"].</A><BR>"
		dat += "- <A href='?src=\ref[src];togglemode=[MINER_MODE]'>[(mining_modes & MINER_MODE) ? "Mining" : "Not Mining"].</A><BR>"
	else
		dat += "- Advanced AI detected.<BR>"
	dat += "<BR>"

	dat += "Storage Compartment Contents :<BR>"
	for(var/ores in typesof(/obj/item/stack/ore)) // Check every ore type.
		var/ore_amount = 0 // Total amount of sheets of that material type
		var/ore_name = ""
		for(var/obj/item/stack/ore/O in contents) // Check everything in the box.
			if(O.type == ores) // Check if it is the correct type
				ore_amount += 1
				if(!ore_name) // Only store the name once.
					ore_name = O.name
		if(ore_amount > 0)
			dat += "- [ore_amount] of [ore_name]\s.<BR>"
	if(contents.len)
		dat += "<A href='?src=\ref[src];dropore=1'>Empty Storage Compartment.</A><BR>"

	return dat

/mob/living/carbon/superior_animal/robot/mining/Topic(href, href_list)
	..()

	if(href_list["close"])
		usr << browse(null, "window=MiningDrone")
		usr.unset_machine()
		return

	if(href_list["togglemode"])
		switch(text2num(href_list["togglemode"]))
			if(WANDER_MODE)
				if(mining_modes & WANDER_MODE)
					mining_modes &= ~WANDER_MODE // Turn off wander mode
				else
					mining_modes |= WANDER_MODE // Turn on wander mode

			if(GATHER_MODE)
				if(mining_modes & GATHER_MODE)
					mining_modes &= ~GATHER_MODE
				else
					mining_modes |= GATHER_MODE

			if(MINER_MODE)
				if(mining_modes & MINER_MODE)
					mining_modes &= ~MINER_MODE // Turn off wander mode
				else
					mining_modes |= MINER_MODE // Turn on wander mode

	if(href_list["dropore"])
		drop_loot()

	updateDialog()
	return

// Ghost-specific verbs.
/mob/living/carbon/superior_animal/robot/mining/verb/mine_nearby()
	set name = "Mine"
	set desc = "Mine every rock around you that has ores."
	set category = "Mining Bot"

	for(var/O in oview(1, src)) // Check our surroundings.
		if(istype(O, /turf/simulated/mineral)) // Is it a minable turf?
			var/turf/simulated/mineral/M = O
			mine(M) // Mine the turf
			continue

/mob/living/carbon/superior_animal/robot/mining/verb/gather_nearby()
	set name = "Gather"
	set desc = "Gather all the ore around you."
	set category = "Mining Bot"

	for(var/O in oview(1, src)) // Check our surroundings.
		if(istype(O, /obj/item/stack/ore)) // Is it ore on the ground?
			var/obj/item/stack/ore/Ore = O
			pick_ore(Ore) // Pick it up
			continue

/mob/living/carbon/superior_animal/robot/mining/verb/dump_loot()
	set name = "Empty"
	set desc = "Dump all the ore you gathered on the ground."
	set category = "Mining Bot"

	if(contents.len > 0)
		drop_loot()
	else
		to_chat(usr, "You do not have any ore to drop.")
