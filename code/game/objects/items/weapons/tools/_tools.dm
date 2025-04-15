#define NOMODE null
#define EXCAVATE 0
#define DIG 1

// Time added to tool operations in percent based on original time
// (if you dig hole in 10 seconds then 50 ADDITIONAL_TIME_LOWHEALTH will add 0 on full health, 2.5sec on 50% health and 5sec ~0% health)
#define ADDITIONAL_TIME_LOWHEALTH 60

/obj/item/tool
	name = "tool"
	icon = 'icons/obj/tools.dmi'
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_SMALL

	var/tool_in_use = FALSE

	//Stunbatons
	var/hitcost = 0
	var/stunforce = 0
	var/agonyforce = 0

	sparks_on_use = FALSE	//Set to TRUE if you want to have sparks on each use of a tool
	eye_hazard = FALSE	//Set to TRUE should damage users eyes if they without eye protection

	use_power_cost = 0	//For tool system, determinze how much power tool will drain from cells, 0 means no cell needed
	cell = null
	suitable_cell = null	//Dont forget to edit this for a tool, if you want in to consume cells
	passive_power_cost = 1 //Energy consumed per process tick while active

	use_fuel_cost = 0	//Same, only for fuel. And for the sake of God, DONT USE CELLS AND FUEL SIMULTANEOUSLY.
	var/passive_fuel_cost = 0.03 //Fuel consumed per process tick while active
	var/max_fuel = 0

	var/mode = NOMODE //For various tool icon updates.
	var/isbroken = FALSE

	//Third type of resource, stock. A tool that uses physical objects (or itself) in order to work
	//Currently used for tape roll
	use_stock_cost = 0
	stock = 0
	var/max_stock = 0
	var/allow_decimal_stock = TRUE
	var/delete_when_empty = TRUE


	//Variables used for tool degradation
	var/degradation = 0.8 //If nonzero, the health of the tool decreases by this amount after each tool operation
	health = 0		// Health of a tool.
	max_health = 400
	var/health_threshold  = 0 // threshold in percent on which tool health stops dropping
	var/lastNearBreakMessage = 0 // used to show messages that tool is about to break

	var/force_upgrade_mults = 1

	var/force_upgrade_mods = 0

	var/toggleable = FALSE	//Determines if it can be switched ON or OFF, for example, if you need a tool that will consume power/fuel upon turning it ON only. Such as welder.
	var/switched_on = FALSE	//Curent status of tool. Dont edit this in subtypes vars, its for procs only.
	var/switched_on_qualities = list()	//This var will REPLACE tool_qualities when tool will be toggled on.
	var/switched_on_forcemult = null
	var/switched_on_penmult = null
	var/switched_on_icon_state = null
	var/switched_on_item_state = null
	var/switched_off_qualities = list()	//This var will REPLACE tool_qualities when tool will be toggled off. So its possible for tool to have diferent qualities both for ON and OFF state.
	var/create_hot_spot = FALSE	 //Set this TRUE to ignite plasma on turf with tool upon activation
	var/glow_color = null	//Set color of glow upon activation, or leave it null if you dont want any light
	var/last_tooluse = 0 //When the tool was last used for a tool operation. This is set both at the start of an operation, and after the doafter call
	var/active_time = null //If set to an integer, the tool cannot be manually turned off, and will instead remain on for that many ticks.

	//Vars for tool upgrades
	var/precision = 0	//Subtracted from failure rates
	var/workspeed = 1	//Worktimes are divided by this

	var/spawn_full = TRUE


/******************************
	/* Core Procs */
*******************************/
//Fuel and cell spawn
/obj/item/tool/New()
	..()
	if(cell && spawn_full)
		cell = new cell(src) //So when we have a cell spawn it spawns a cell, otherwise it will pick a suitable cell

	if(!cell && suitable_cell && spawn_full)
		cell = new suitable_cell(src) //No cell? We add are suitable cell

	if(use_fuel_cost)
		create_reagents(max_fuel)
		if(spawn_full)
			reagents.add_reagent(my_fuel, max_fuel)

	if(use_stock_cost)
		stock = max_stock

	if(max_health)
		health = max_health

	update_icon()
	return

/obj/item/tool/Initialize(mapload, ...)
	. = ..()
	var/obj/screen/item_action/action = new /obj/screen/item_action/top_bar/tool_info
	action.owner = src
	hud_actions = list(action)

//Fuel and cell spawn
/obj/item/tool/Created()
	QDEL_NULL(cell)
	if(use_fuel_cost)
		consume_fuel(get_fuel(), forced = TRUE)



//For killing processes like hot spots
/obj/item/tool/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/tool/proc/adjustToolHealth(amount, user)
	health = min(max_health, max(max_health * (health_threshold/100), health + amount))
	if(health <= 0)
		breakTool(user)
		return
	if(max_health <= 0)
		breakTool(user)

//Ignite plasma around, if we need it
/obj/item/tool/Process()
	SStgui.update_uis(src)
	if(switched_on)
		if(create_hot_spot)
			var/turf/location = get_turf(src)
			if(location)
				location.hotspot_expose(700, 5)
		if(tool_in_use && sparks_on_use && !(item_flags & SILENT) && prob(50))
			var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
			sparks.set_up(3, 0, get_turf(src))
			sparks.start()

		if(use_fuel_cost && passive_fuel_cost)
			if(!consume_fuel(passive_fuel_cost))
				turn_off()

		if(use_power_cost && passive_power_cost)
			if(!cell?.checked_use(passive_power_cost))
				turn_off()


//Cell reload
/obj/item/tool/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null
		update_icon()
	else
		..()

/obj/item/tool/get_cell()
	return cell

/obj/item/tool/attackby(obj/item/C, mob/living/user)
	if(isbroken)
		to_chat(user, SPAN_NOTICE("This tool is broken and falling apart!"))
		return
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C
		update_icon()
		return
	.=..()

//Turning it on/off
/obj/item/tool/attack_self(mob/user)
	if(isbroken)
		to_chat(user, SPAN_NOTICE("This tool is broken and falling apart!"))
		return
	if(toggleable)
		if(switched_on)
			if(active_time)
				to_chat(user, SPAN_NOTICE("You can't turn off \the [src] manually!"))
				return FALSE
			turn_off(user)
		else
			turn_on(user)
		SStgui.update_uis(src)
	..()
	return

/obj/item/tool/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ItemStats", name)
		ui.open()

/obj/item/tool/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet_batched/tool_upgrades)
	)

/obj/item/tool/ui_data(mob/user)
	var/list/data = list()

	var/list/stats = list()

	var/list/tool_qualities_stats = list()
	if(tool_qualities)
		for(var/name in tool_qualities)
			tool_qualities_stats += list(list("name" = capitalize(name), "type" = "ProgressBar", "value" = tool_qualities[name], "max" = 100))

	stats["Tool Qualities"] = tool_qualities_stats

	var/list/item_stats = list()

	var/list/health_ranges = list(
		"bad" = list(0, health_threshold),
		"average" = list(health_threshold, max_health - 1),
		"good" = list(max_health, max_health)
	)

	item_stats += list(list( "name" = "Health", "type" = "ProgressBar", "value" = health, "max" = max_health, "ranges" = health_ranges ))
	item_stats += list(list( "name" = "Degradation", "type" = "ProgressBar", "value" = degradation, "max" = initial(degradation) * 10, "color" = initial(degradation) > degradation ? "good" : initial(degradation) < degradation ? "bad" : "" ))
	item_stats += list(list( "name" = "Precision", "type" = "ProgressBar", "value" = precision, "min" = -100, "max" = 100, "color" = precision > 0 ? "good" : precision < 0 ? "bad" : "", "unit" = "%"))
	item_stats += list(list( "name" = "Workspeed", "type" = "ProgressBar", "value" = workspeed, "max" = initial(workspeed) * 20, "color" = initial(workspeed) < workspeed ? "good" : initial(workspeed) > workspeed ? "bad" : ""))
	item_stats += list(list( "name" = "Damage", "type" = "ProgressBar", "value" = force, "max" = initial(force) * 10 ))
	if (extra_bulk)
		item_stats += list(list( "name" = "Extra Volume", "type" = "AnimatedNumber", "value" = extra_bulk ))
	item_stats += list(list( "name" = "Armor Divisor", "type" = "AnimatedNumber", "value" = armor_divisor, "max" = 10))

	stats["Item Stats"] = item_stats

	var/list/fuel_stats = list()
	if(use_fuel_cost)
		fuel_stats += list(list(
			"name" = "Fuel Volume",
			"type" = "ProgressBar",
			"value" = reagents.total_volume,
			"max" = reagents.maximum_volume,
			"ranges" = list(
				"good" = list(reagents.maximum_volume, reagents.maximum_volume),
				"average" = list(reagents.maximum_volume * 0.25, reagents.maximum_volume - 0.01),
				"bad" = list(0, (reagents.maximum_volume * 0.25) - 0.01)
			)
		))

		for(var/r in reagents.reagent_list)
			var/datum/reagent/R = r
			fuel_stats += list(list( "name" = R.name, "type" = "AnimatedNumber", value = R.volume, unit = R.volume == 1 ? " unit" : " units" ))

		fuel_stats += list(list(
			"name" = "Fuel Cost",
			"type" = "ProgressBar",
			"value" = use_fuel_cost,
			"max" = initial(use_fuel_cost) * 10,
			"color" = initial(use_fuel_cost) > use_fuel_cost ? "good" : initial(use_fuel_cost) < use_fuel_cost ? "bad" : ""
		))
	stats["Fuel Stats"] = fuel_stats

	var/list/cell_stats = list()
	if(use_power_cost)
		if(cell)
			cell_stats += list(list(
				"name" = "Cell Charge",
				"type" = "ProgressBar",
				"value" = cell.percent(),
				"unit" = "%",
				"max" = 100,
				"ranges" = list(
					"good" = list(100, 100),
					"average" = list(25, 100),
					"bad" = list(0, 24.99)
				)
			))
		else
			cell_stats += list(list( "name" = "Cell Charge", "type" = "String", "value" = "No Cell Installed" ))

		cell_stats += list(list(
			"name" = "Power Cost",
			"type" = "ProgressBar",
			"value" = use_power_cost,
			"max" = initial(use_power_cost) * 10,
			"color" = initial(use_power_cost) > use_power_cost ? "good" : initial(use_power_cost) < use_power_cost ? "bad" : ""
		))

	stats["Power Cell"] = cell_stats

	data["stats"] = stats

	data["max_upgrades"] = max_upgrades

	var/list/attachments = list()
	for(var/atom/A in item_upgrades)
		var/datum/asset/spritesheet_batched/tool_upgrades/T = get_asset_datum(/datum/asset/spritesheet_batched/tool_upgrades)
		attachments += list(list("name" = A.name, "icon" = T.icon_class_name(sanitize_css_class_name("[A.type]"))))
	data["attachments"] = attachments

	return data

//Damaged tools are worth less matter for recycling
/obj/item/tool/get_matter()
	if(!matter || !matter.len || !degradation)
		return ..()

	//If it's this broken, you get nothing
	if(health <= 20)
		return null

	var/list/tm = matter.Copy()
	//Every point of damage reduces matter by 2% of total
	for (var/mat in tm)
		tm[mat] *= health / max_health

	return tm

/******************************
	/* Tool Usage */
*******************************/

//Simple form ideal for basic use. That proc will return TRUE only when everything was done right, and FALSE if something went wrong, ot user was unlucky.
//Additionaly, handle_failure proc will be called for a critical failure roll.
/obj/item/proc/use_tool(mob/living/user, atom/target, base_time, required_quality, fail_chance, required_stat, instant_finish_tier = 110, forced_sound = null, sound_repeat = 2.5 SECONDS)
	if(health)//Low health on a tool increases failure chance. Scaling up as it breaks further.
		fail_chance += get_tool_health_modifer(user)

	var/obj/item/tool/T
	if(istool(src))
		T = src
		T.tool_in_use = TRUE

	var/result = use_tool_extended(user, target, base_time, required_quality, fail_chance, required_stat, instant_finish_tier, forced_sound)

	if(T)
		T.tool_in_use = FALSE
	SStgui.update_uis(src)
	switch(result)
		if(TOOL_USE_CANCEL)
			return FALSE
		if(TOOL_USE_FAIL)
			handle_failure(user, target, required_stat = required_stat, required_quality = required_quality)	//We call it here because extended proc mean to be used only when you need to handle tool fail by yourself
			return FALSE
		if(TOOL_USE_SUCCESS)
			return TRUE

/obj/item/proc/get_tool_health_modifer(mob/living/user)
	var/fail_modifer = 0
	if(health)//Low health on a tool increases failure chance. Scaling up as it breaks further.
		if(health > max_health * 0.80)//100-80% is normal operation
		else if(health > max_health * 0.20)
			fail_modifer += 2//40-20% is -2 precision
		else if(health > max_health * 0.10)
			fail_modifer += 5//20-10% is -5 precision
		else if(health > max_health * 0.05)
			fail_modifer += 8//10-5% is -8 precision
		else
			fail_modifer += 10//below 5% is -10 precision. Good luck!

	//If a hooman does this with a the tool_breaker tasks they get less odds of failer
	if(isliving(user))
		var/mob/living/H = user
		var/task_level = H.learnt_tasks.get_task_mastery_level("TOOL_BREAKER")
		if(task_level)
			fail_modifer -= task_level


	return fail_modifer

//Use this proc if you want to handle all types of failure yourself. It used in surgery, for example, to deal damage to patient.
/obj/item/proc/use_tool_extended(mob/living/user, atom/target, base_time, required_quality, fail_chance, required_stat, instant_finish_tier = 110, forced_sound = null, sound_repeat = 2.5 SECONDS)

	var/obj/item/tool/T

	//Vars for Absolutist speed debuff
	var/holy_delay = 0
	var/cruciform_slow = 1.25

	if(istool(src))
		T = src
		T.last_tooluse = world.time

	if(!has_quality(required_quality))
		return TOOL_USE_CANCEL

	if(is_hot() >= HEAT_MOBIGNITE_THRESHOLD)
		if(isliving(target))
			var/mob/living/L = target
			L.IgniteMob()

	if(target.used_now)
		to_chat(user, SPAN_WARNING("[target.name] is used by someone. Wait for them to finish."))
		return TOOL_USE_CANCEL


	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.shock_stage >= 30)
			to_chat(user, SPAN_WARNING("Pain distracts you from your task."))
			fail_chance += round(H.shock_stage/120 * 40)
			base_time += round(H.shock_stage/120 * 40)

	if(user.stats.getPerk(PERK_COMMUNITY_SAINTS))
		holy_delay = cruciform_slow


	//Start time and time spent are used to calculate resource use
	var/start_time = world.time
	var/time_spent = 0

	//Precalculate worktime here
	var/time_to_finish = 0
	if(base_time)
		if(islist(required_stat))
			time_to_finish = base_time - get_tool_quality(required_quality) - user.stats.getMaxStat(required_stat)
		else
			time_to_finish = base_time - get_tool_quality(required_quality) - user.stats.getStat(required_stat)

		//Workspeed var, can be improved by upgrades
		if(T && T.workspeed > 0)
			time_to_finish /= T.workspeed
		//Slowdown for Absolutists. Sanctified tools don't get additional slowdown
		if(holy_delay > 0 && T?.sanctified == FALSE)
			time_to_finish *= holy_delay
		// the worse tool condition - the more time required
		if(T && T.degradation)
			// so basically we adding time based on percent of missing health multiplied by ADDITIONAL_TIME_LOWHEALTH for easier balancing
			time_to_finish = time_to_finish + (time_to_finish/100 * (ADDITIONAL_TIME_LOWHEALTH * (1 -(T.health/T.max_health))))

	if((instant_finish_tier < get_tool_quality(required_quality)) || time_to_finish < 0)
		time_to_finish = 0

	if(T && !T.check_tool_effects(user, time_to_finish))
		return TOOL_USE_CANCEL

	//Repeating sound code!
	//A datum/repeating_sound is a little object we can use to make a sound repeat a few times
	var/datum/repeating_sound/toolsound = null
	if(forced_sound != NO_WORKSOUND)
		var/volume = 70
		var/extrarange = 0

		if(T && T.item_flags & SILENT)
			volume = 3
			extrarange = -6

		else if(T && T.item_flags & LOUD)
			volume = 500
			extrarange = 10

		var/soundfile
		if(T && T.item_flags & HONKING)
			soundfile = WORKSOUND_HONK
		else if(forced_sound)
			soundfile = forced_sound
		else
			soundfile = worksound

		if(sound_repeat && time_to_finish)
			//It will repeat roughly every 2.5 seconds until our tool finishes
			toolsound = new/datum/repeating_sound(sound_repeat,time_to_finish,0.15, src, soundfile, volume, 1, extrarange)
		else
			playsound(src.loc, soundfile, volume, 1, extrarange)

	//The we handle the doafter for the tool usage
	if(time_to_finish)
		target.used_now = TRUE

		if(!do_after(user, time_to_finish, target))
			//If the doafter fails
			to_chat(user, SPAN_WARNING("You need to stand still to finish the task properly!"))
			target.used_now = FALSE
			time_spent = world.time - start_time //We failed, spent only part of the time working
			if(T)
				T.consume_resources(time_spent, user)
				T.last_tooluse = world.time
			if(toolsound)
				//We abort the repeating sound.
				//Stop function will delete itself too
				toolsound.stop()
				toolsound = null
			return TOOL_USE_CANCEL
		else
			if(T)
				T.last_tooluse = world.time

			target.used_now = FALSE

	//If we get here the operation finished correctly, we spent the full time working
	time_spent = time_to_finish
	if(T)
		T.consume_resources(time_spent, user)

	//Safe cleanup
	if(toolsound)
		toolsound.stop()
		toolsound = null

	var/stat_modifer = 0
	if(required_stat)
		stat_modifer = user.stats.getStat(required_stat)
	fail_chance = fail_chance - get_tool_quality(required_quality) - stat_modifer

	// handle tool breaking
	if(T && T.health <= 0)
		T.breakTool(user)
		return TOOL_USE_FAIL
	else if(T && !T.health_threshold)
		if(user.stats.getStat(STAT_MEC) >= STAT_LEVEL_BASIC && T.health < T.max_health/100 * 5)// tool health is < 5%
			if(T.lastNearBreakMessage > world.time + 60 SECONDS) // once in 1 minute
				T.lastNearBreakMessage = world.time
				to_chat(user, SPAN_DANGER("Your [src.name] is about to fall apart."))
		else if(user.stats.getStat(STAT_MEC) >= STAT_LEVEL_ADEPT && T.health < T.max_health/100 * 15) // tool health is < 15%
			if(T.lastNearBreakMessage > world.time + 300 SECONDS) // once in 5 minutes
				T.lastNearBreakMessage = world.time
				to_chat(user, SPAN_WARNING("Some parts in your [src.name] are reeling."))
		else
			//lets give peasants a chance
			if(T.health < T.max_health/100 * 5 && prob(10))// tool health is < 5% and chance a 10% to notice
				if(T.lastNearBreakMessage > world.time + 60 SECONDS) // once in 1 minute
					T.lastNearBreakMessage = world.time
					to_chat(user, SPAN_DANGER("Your [src.name] is about to fall apart."))

	//precision reduce failure rates
	if(T)
		fail_chance -= T.precision

	fail_chance = round(fail_chance) // Stops <1% failure chance tasks from faling. Also makes falure chance in failure message look less weird.

	if(fail_chance < 0)
		fail_chance = 0

	if(fail_chance >= 100)
		if(!user.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! Considering your skills and this tool, it is impossible."))
		else
			to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! The odds of succes are [fail_chance], this is infact impossible."))
		to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! Considering your skills and this tool, it is impossible."))
		return TOOL_USE_FAIL
	if(prob(fail_chance))
		var/chanceMessage = "near imposible"
		if(fail_chance < 5)
			chanceMessage = "great"
		else if(fail_chance < 25)
			chanceMessage = "good"
		else if(fail_chance < 50)
			chanceMessage = "moderate"
		else if(fail_chance < 75)
			chanceMessage = "small"
		else if(fail_chance < 95)
			chanceMessage = "tiny"

		if(!user.stats.getPerk(PERK_NO_OBFUSCATION))
			to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! There was a [chanceMessage] chance to succeed."))
		else
			to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! There was a [fail_chance]% chance to fail."))
		to_chat(user, SPAN_WARNING("You failed to finish your task with [src.name]! There was a [chanceMessage] chance to succeed."))
		return TOOL_USE_FAIL

	return TOOL_USE_SUCCESS

/obj/item/tool/proc/breakTool(mob/user)

	if(isbroken)
		var/T = get_turf(src)
		log_debug("breakTool 1, I [src.name] am broken and was called more then once, or am sticking around illegal! [jumplink(T)] User:[src]")
		return //We already ran through this once, if we stick around then thats a issue

	isbroken = TRUE

	if(user)
		if(isliving(user))
			var/mob/living/H = user
			H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/tool_breaker, "TOOL_BREAKER", skill_gained = 1, learner = H)

		to_chat(user, SPAN_DANGER("Your [src] broke!"))
		new /obj/item/material/shard/shrapnel(user.loc)
		playsound(get_turf(src), 'sound/effects/impacts/thud1.ogg', 50, 1 -3)
		user.unEquip(src)
		qdel(src)
		return

	new /obj/item/material/shard/shrapnel(get_turf(src))
	if(istype(loc, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/AD = loc
		AD.take_out_wedged_item()
	playsound(get_turf(src), 'sound/effects/impacts/thud1.ogg', 50, 1 -3)
	qdel(src)

/******************************
	/* Tool Failure */
*******************************/

//Critical failure rolls. If you use use_tool_extended, you might want to call that proc as well.
/obj/item/proc/handle_failure(var/mob/living/user, var/atom/target, var/required_stat, required_quality)
	var/obj/item/tool/T
	if(istype(src, /obj/item/tool))
		T = src

	var/crit_fail_chance = 25

	if(required_stat)
		if(islist(required_stat))
			crit_fail_chance = crit_fail_chance - user.stats.getMaxStat(required_stat)
		else
			crit_fail_chance = crit_fail_chance - user.stats.getStat(required_stat)

	if(crit_fail_chance <= 0)
		return

	//This list initially contains the fail types that are always valid, even for robots
	var/list/failtypes = list()

	if(T && T.use_fuel_cost)
		//Robots can do this one too
		failtypes["burn"] = 0.5

	if(canremove)
		failtypes["throw"] = 1

		if(T && T.degradation)
			failtypes["damage"] = 2.5

	if(user)
		failtypes["slip"] = 2
		failtypes["swing"] = 1
		if(ishuman(user))
			if(canremove)
				failtypes["drop"] = 2
			if(sharp)
				failtypes["stab"] = 1

			//This one is limited to humans only since robots often can't remove/replace their device cells
			if(locate(/obj/item/cell) in contents)
				failtypes["overload"] = 0.5

	if(prob(crit_fail_chance))
		var/fail_type = pickweight(failtypes)

		switch(fail_type)
			//Damage the tool
			if("damage")
				if(user)
					to_chat(user, SPAN_DANGER("Your hand slips and you damage [src] a bit."))
				if(T)
					T.adjustToolHealth(-(30 * T.degradation), user) //Failing incurs 30 uses worth of damage
				return
			//Drop the tool on the floor
			if("drop")
				if(user && !istype(src,/obj/item/mecha_parts/mecha_equipment))
					to_chat(user, SPAN_DANGER("You drop [src] on the floor."))
					user.drop_from_inventory(src)
				else if(istype(loc, /obj/machinery/door/airlock))
					var/obj/machinery/door/airlock/AD = loc
					AD.take_out_wedged_item()
				else
					forceMove(get_turf(src))
				return

			//Hit yourself
			if("slip")
				var/mob/living/carbon/human/H = user
				if(istype(src,/obj/item/mecha_parts/mecha_equipment)) //Mecha test
					var/obj/item/mecha_parts/mecha_equipment/E = src
					var/atom/U = E.chassis
					to_chat(user, SPAN_DANGER("Your controls slip while working with [src]!"))
					E.attack_object(U,H)
					return
				else
					to_chat(user, SPAN_DANGER("Your hand slips while working with [src]!"))
					attack(H, H, H.get_holding_hand(src))
					return

			//Hit a random atom around you
			if("swing")
				var/list/targets = list()
				for (var/atom/movable/AM in orange(user, 1))
					targets.Add(AM)
				if(!targets.len)
					return

				var/newtarget = pick(targets)
				var/mob/living/carbon/human/H = user

				to_chat(user, SPAN_DANGER("Your hand slips and you hit [target] with [src]!"))
				spawn()
					H.ClickOn(newtarget)
				return

			//Throw the tool in a random direction
			if("throw")
				if(user && !istype(src,/obj/item/mecha_parts/mecha_equipment))
					var/mob/living/carbon/human/H = user
					var/throw_target = pick(trange(6, user))
					to_chat(user, SPAN_DANGER("Your [src] flies away!"))
					H.unEquip(src)
					throw_at(throw_target, src.throw_range, src.throw_speed, H)
					return
				if(istype(loc, /obj/machinery/door/airlock))
					var/obj/machinery/door/airlock/AD = loc
					AD.take_out_wedged_item()
				else
					forceMove(get_turf(src))
				var/throw_target = pick(trange(6, src))
				throw_at(throw_target, src.throw_range, src.throw_speed)
				return

			//Stab yourself in the hand so hard your tool embeds
			if("stab")
				if(!istype(src,/obj/item/mecha_parts/mecha_equipment))
					var/mob/living/carbon/human/H = user
					to_chat(user, SPAN_DANGER("You accidentally stuck [src] in your hand!"))
					H.get_organ(H.get_holding_hand(src)).embed(src)
					return

			//The fuel in the tool ignites and sets you aflame
			if("burn")
				if(!istype(src,/obj/item/mecha_parts/mecha_equipment))
					to_chat(user, SPAN_DANGER("You ignite the fuel of the [src]!"))
					var/fuel = T.get_fuel()
					T.consume_fuel(fuel)
					user.adjust_fire_stacks(fuel/10)
					user.IgniteMob()
					T.update_icon()
					return

			//The cell explodes
			//This can happen even with non-tools which contain a cell
			if("overload")
				var/obj/item/cell/C
				if(T)
					C = T.cell
				else
					C = locate(/obj/item/cell) in contents


				if(user)
					to_chat(user, SPAN_DANGER("You overload the cell in the [src]!"))
				C.explode()
				if(T)
					T.cell = null

				update_icon()
				return





/******************************
	/* Data and Checking */
*******************************/
/obj/item/proc/has_quality(quality_id)
	return !quality_id || (quality_id in tool_qualities)

//A special version of the above that also checks the switched on list
//As a result, it checks what qualities the tool is ever capable of having, not just those it has right now
/obj/item/tool/proc/ever_has_quality(quality_id)
	.=has_quality(quality_id)
	if(!.)
		if(quality_id in switched_on_qualities)
			return TRUE

/obj/item/proc/get_tool_quality(quality_id)
	if(tool_qualities && tool_qualities.len)
		return tool_qualities[quality_id]
	return null

//We are cheking if our item got required qualities. If we require several qualities, and item posses more than one of those, we ask user to choose how that item should be used
/obj/item/proc/get_tool_type(mob/living/user, list/required_qualities, atom/use_on, datum/callback/CB)
	if(!tool_qualities) //This is not a tool, or does not have tool qualities
		return

	var/list/L = required_qualities & tool_qualities

	if(!(L.len))	//If the tool has none of the required qualities, the list is empty and thus we exit out of the proc
		return

	if(L.len == 1)
		return L[1]

	for(var/i in L)
		L[i] = image(icon = 'icons/mob/radial/tools.dmi', icon_state = i)
	return show_radial_menu(user, use_on ? use_on : user, L, tooltips = TRUE, require_near = TRUE, custom_check = CB)


/obj/item/tool/proc/turn_on(var/mob/user)
	if(use_power_cost)
		if(!cell)
			to_chat(user, SPAN_WARNING("\The [src] has no cell!"))
			return FALSE
		if(cell.charge < use_power_cost)
			to_chat(user, SPAN_WARNING("\The [src] does not have enough power!"))
			return FALSE
	if(user)
		to_chat(user, SPAN_NOTICE("\The [src] turns on."))
	switched_on = TRUE
	tool_qualities = switched_on_qualities
	if(switched_on_forcemult)
		force *= switched_on_forcemult
	if(switched_on_penmult)
		armor_divisor *= switched_on_penmult
	if(glow_color)
		set_light(l_range = 1.7, l_power = 1.3, l_color = glow_color)
	if(switched_on_icon_state)
		icon_state = switched_on_icon_state
	if(switched_on_item_state)
		item_state = switched_on_item_state
	START_PROCESSING(SSobj, src)
	update_icon()
	update_wear_icon()
	if(!active_time)
		return TRUE
	else
		spawn(active_time)
			to_chat(user, SPAN_NOTICE("\The [src] turns off automatically."))
			turn_off()

/obj/item/tool/proc/turn_off(var/mob/user)
	if(user)
		to_chat(user, SPAN_NOTICE("\The [src] turns off."))
	switched_on = FALSE
	STOP_PROCESSING(SSobj, src)
	tool_qualities = switched_off_qualities
	if(switched_on_forcemult)
		force /= switched_on_forcemult
	if(switched_on_penmult)
		armor_divisor /= switched_on_penmult
	if(glow_color)
		set_light(l_range = 0, l_power = 0, l_color = glow_color)
	if(switched_on_icon_state)
		icon_state = initial(icon_state)
	if(switched_on_item_state)
		icon_state = initial(item_state)
	update_icon()
	update_wear_icon()








/*********************
	Resource Consumption
**********************/
/obj/item/proc/consume_resources(var/timespent, var/user)
	return

/obj/item/tool/consume_resources(var/timespent, var/user)
	//We will always use a minimum of 0.5 second worth of resources
	if(timespent < 5)
		timespent = 5

	if(use_power_cost && isrobot(user))
		var/mob/living/silicon/robot/R = user
		if(R.cell)
			var/cost = use_power_cost
			if(R.cell.charge >= cost)
				R.cell.use(cost)
			return TRUE //we always use cell power, no need to check anything more

	if(use_power_cost)
		if(!cell?.checked_use(use_power_cost*timespent))
			to_chat(user, SPAN_WARNING("[src]'s battery is dead or missing."))
			return FALSE

	if(use_fuel_cost)
		if(!consume_fuel(use_fuel_cost*timespent))
			to_chat(user, SPAN_NOTICE("You need more welding fuel to complete this task."))
			return FALSE

	if(use_stock_cost)
		var/scost = use_stock_cost * timespent
		if(!allow_decimal_stock)
			scost = round(scost, 1)
		consume_stock(scost)

	//Makeshift tools get worse with each use
	if(degradation)
		adjustToolHealth(-degradation, user)

//Power and fuel drain, sparks spawn
/obj/item/tool/check_tool_effects(mob/living/user, time)
	//Check if our tool is something that needs to be turned on to spend resources
	var/can_spend_resources = (!toggleable || (toggleable && switched_on))
	if(use_power_cost)
		if(!cell || !cell.check_charge(use_power_cost*time) && can_spend_resources)
			to_chat(user, SPAN_WARNING("[src] battery is dead or missing."))
			return FALSE

	if(use_fuel_cost)
		if(get_fuel() < (use_fuel_cost*time) && can_spend_resources)
			to_chat(user, SPAN_NOTICE("You need more welding fuel to complete this task."))
			return FALSE

	if(use_stock_cost)
		if(stock < (use_stock_cost*time) && can_spend_resources)
			to_chat(user, SPAN_NOTICE("There is not enough left in [src] to complete this task."))
			return FALSE

	if(eye_hazard)
		eyecheck(user)

	if(sparks_on_use && !(item_flags & SILENT))
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, get_turf(src))
		sparks.start()

	update_icon()
	return TRUE

//Returns the amount of fuel in tool
/obj/item/proc/get_fuel()
	return ( reagents ? reagents.get_reagent_amount(my_fuel) : 0 )

/obj/item/tool/proc/consume_fuel(volume, forced)
	if(forced)
		reagents.remove_reagent(my_fuel, volume)
		return TRUE

	//Fixes tool off-state behavior
	if(toggleable && !switched_on)
		return TRUE
	if(get_fuel() >= volume)
		reagents.remove_reagent(my_fuel, volume)
		return TRUE
	return FALSE


/obj/item/tool/proc/consume_stock(number)
	if(stock >= number)
		stock -= number
	else
		stock = 0

	if(delete_when_empty && stock <= 0)
		qdel(src)


/***************************
	Tool Upgrades
****************************/
/obj/item/tool/refresh_upgrades()
//First of all, lets reset any var that could possibly be altered by an upgrade
	degradation = initial(degradation)
	workspeed = initial(workspeed)
	precision = initial(precision)
	suitable_cell = initial(suitable_cell)
	max_fuel = initial(max_fuel)
	health_threshold = initial(health_threshold)

	use_fuel_cost = initial(use_fuel_cost)
	use_power_cost = initial(use_power_cost)
	force = initial(force)
	armor_divisor = initial(armor_divisor)
	damtype = initial(damtype)
	force_upgrade_mults = initial(force_upgrade_mults)
	force_upgrade_mods = initial(force_upgrade_mods)

	hitcost = initial(hitcost)
	stunforce = initial(stunforce)
	agonyforce = initial(agonyforce)


	extra_bulk = initial(extra_bulk)
	item_flags = initial(item_flags)
	name = initial(name)
	max_upgrades = initial(max_upgrades)
	allow_greyson_mods = initial(allow_greyson_mods)
	color = initial(color)
	sharp = initial(sharp)
	extended_reach = initial(extended_reach)
	no_swing = initial(no_swing)
	LAZYNULL(name_prefixes)

	//Now lets have each upgrade reapply its modifications
	LEGACY_SEND_SIGNAL(src, COMSIG_APPVAL, src)

	for (var/prefix in name_prefixes)
		name = "[prefix] [name]"

	health_threshold = max(0, health_threshold)

	//Set the fuel volume, incase any mods altered our max fuel
	if(reagents)
		reagents.maximum_volume = max_fuel

	if(alt_mode_active)
		alt_mode_activeate_two()

	if(isliving(loc) && extended_reach)
		var/mob/living/location_of_item = loc
		if(location_of_item.stats.getPerk(PERK_NATURAL_STYLE))
			extended_reach += 1

	if(switched_on)
		if(switched_on_forcemult)
			force *= switched_on_forcemult
		if(switched_on_penmult)
			armor_divisor *= switched_on_penmult

	if(wielded)
		if(force_wielded_multiplier)
			force = force * force_wielded_multiplier
		else //This will give items wielded 30% more damage. This is balanced by the fact you cannot use your other hand.
			force = (force * 1.3) //Items that do 0 damage will still do 0 damage though.
		name = "[name] (Wielded)"

	SStgui.update_uis(src)

/obj/item/tool/examine(mob/user)
	if(isbroken)
		to_chat(user, SPAN_NOTICE("This tool is broken and falling apart!"))
		return

	if(!..(user,2))
		return

	if(use_power_cost)
		if(!cell)
			to_chat(user, SPAN_WARNING("There is no cell inside to power the tool"))
		else
			to_chat(user, "The charge meter reads [round(cell.percent())]%.")

	if(use_fuel_cost)
		to_chat(user, text("\icon[] [] contains []/[] units of fuel!", src, src.name, get_fuel(),src.max_fuel ))

	if(use_stock_cost)
		to_chat(user, SPAN_NOTICE("it has [stock] / [max_stock] units remaining."))

	//Display a bunch of stats but only if they're nondefault values
	if(precision != 0)
		to_chat(user, "Precision: [SPAN_NOTICE("[precision]")]")

	if(workspeed != 1)
		to_chat(user, "Work Speed: [SPAN_NOTICE("[workspeed*100]%")]")

	if(LAZYLEN(item_upgrades))
		to_chat(user, "It has the following upgrades installed:")
		for (var/obj/item/TU in item_upgrades)
			to_chat(user, SPAN_NOTICE(TU.name))

	if(health)
		if(health > max_health * 0.95)
			return
		else if(health > max_health * 0.80)
			to_chat(user, "It has a few light scratches.")
		else if(health > max_health * 0.40)
			to_chat(user, SPAN_NOTICE("It shows minor signs of stress and wear."))
		else if(health > max_health * 0.20)
			to_chat(user, SPAN_WARNING("It looks a bit cracked and worn."))
		else if(health > max_health * 0.10)
			to_chat(user, SPAN_WARNING("Whatever use this tool once had is fading fast."))
		else if(health > max_health * 0.05)
			to_chat(user, SPAN_WARNING("Attempting to use this thing as a tool is probably not going to work out well."))
		else
			to_chat(user, SPAN_DANGER("It's falling apart. This is one slip away from just being a pile of assorted trash."))

//Recharge the fuel at fueltank, also explode if switched on
/obj/item/tool/afterattack(obj/O, mob/user, proximity)
	if(isbroken)
		to_chat(user, SPAN_NOTICE("This tool is broken and falling apart!"))
		return
	if(use_fuel_cost)
		if(!proximity) return
		if((istype(O, /obj/structure/reagent_dispensers/fueltank) || istype(O, /obj/item/weldpack)) && get_dist(src,O) <= 1 && !has_quality(QUALITY_WELDING))
			O.reagents.trans_to_obj(src, max_fuel)
			to_chat(user, SPAN_NOTICE("[src] refueled"))
			playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
			update_icon()
			return
		else if((istype(O, /obj/structure/reagent_dispensers/fueltank) || istype(O, /obj/item/weldpack)) && get_dist(src,O) <= 1 && has_quality(QUALITY_WELDING))
			message_admins("[key_name_admin(user)] triggered an explosion with a welding tool.")
			log_game("[key_name(user)] triggered an explosion with a welding tool.")
			to_chat(user, SPAN_DANGER("You begin welding on the [O] and with a moment of lucidity you realize, this might not have been the smartest thing you've ever done."))
			if(istype(O, /obj/structure/reagent_dispensers/fueltank))
				var/obj/structure/reagent_dispensers/fueltank/T = O
				T.explode()
			else if(istype(O, /obj/item/weldpack))
				var/obj/item/weldpack/P = O
				P.explode()
			return
		else if(istype(O, /mob/living/carbon/superior/roach/nitro))
			var/mob/living/carbon/superior/roach/nitro/B = O
			if(B.stat != DEAD)
				if(has_quality(QUALITY_WELDING))
					B.fire_act()
				else
					O.reagents.trans_to_obj(src, max_fuel)
					to_chat(user, SPAN_NOTICE("[src] refueled"))
					playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
			return
		if(switched_on)
			var/turf/location = get_turf(user)
			if(isliving(O))
				var/mob/living/L = O
				L.IgniteMob()
			if(istype(location, /turf))
				location.hotspot_expose(700, 50, 1)

	if(has_quality(QUALITY_ADHESIVE) && proximity)
		//Tape can be used to repair other tools
		if(istool(O))
			var/obj/item/tool/T = O
			if(T.health)
				user.visible_message(SPAN_NOTICE("[user] begins repairing \the [O] with the [src]!"))
				//Toolception!
				if(use_tool(user, T, 60, QUALITY_ADHESIVE, FAILCHANCE_EASY, STAT_MEC))
					//Little notes about how this works
					//If a tool is REALLY damaged, they take more max hp damage, this helps encurages use tape and repairs
					//Otherwise small repairing isnt punished
					//Repairing a tool will **always** do to how this math works out be at full hp.
					var/tool_repair = T.max_health * (0.8 + (user.stats.getStat(STAT_MEC))/200)
					var/damage_to_repair = T.max_health - T.health
					tool_repair = min(tool_repair, damage_to_repair)
					var/perma_health_loss = tool_repair * 0.50 //50%

					T.max_health -= perma_health_loss
					T.adjustToolHealth(tool_repair, user)
					if(user.stats.getStat(STAT_MEC) > STAT_LEVEL_BASIC/2)
						to_chat(user, SPAN_NOTICE("You knowledge in tools helped you repair it better."))
					refresh_upgrades()
				return

		if(stick(O, user))
			return
	//Triggers degradation and resource use upon attacks
	if(!(flags & NOBLUDGEON) && (world.time - last_tooluse) > 2)
		consume_resources(5,user)

	return ..()

//Triggers degradation and resource use upon attacks
/obj/item/tool/resolve_attackby(atom/A, mob/user, params)
	.=..()
	//If the parent return value is true, then there won't be an attackby
	//If there will be an attackby, we'll handle it there
	//Checking the last tooluse time prevents consuming twice for a tool action
	if(. && loc == user && (!(flags & NOBLUDGEON)) && (world.time - last_tooluse) > 2)
		consume_resources(5,user)

//Decides whether or not to damage a player's eyes based on what they're wearing as protection
//Note: This should probably be moved to mob
/obj/item/proc/eyecheck(var/mob/user)
	if(!iscarbon(user))
		return TRUE
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES)
		if(!E)
			return
		if(BP_IS_ROBOTIC(E))
			to_chat(H, SPAN_WARNING("The world suddenly dims in response to the blindingly bright light, protecting you from its shine."))
			return
		var/safety = H.eyecheck()
		switch(safety)
			if(FLASH_PROTECTION_MINOR)
				to_chat(H, SPAN_WARNING("Your eyes sting a little."))
				E.take_damage(1, BURN)
				H.eye_blurry += rand(3,6)
			if(FLASH_PROTECTION_NONE)
				to_chat(H, SPAN_WARNING("Your eyes burn."))
				E.take_damage(rand(1, 2), BURN)
				H.eye_blurry += rand(6,8)
			if(FLASH_PROTECTION_REDUCED)
				to_chat(H, SPAN_DANGER("Your eyes melt."))
				H.eye_blurry += rand(12,20)
				E.take_damage(rand(4, 6))
			if(FLASH_PROTECTION_VULNERABLE)
				to_chat(H, SPAN_DANGER("Your eyes melt."))
				H.eye_blurry += rand(16,26)
				E.take_damage(rand(6, 8))
		if(safety<FLASH_PROTECTION_MAJOR)
			to_chat(user, SPAN_WARNING("Your eyes are really starting to hurt. This can't be good for you!"))


/obj/item/tool/attack(mob/living/M, mob/living/user, var/target_zone)
	if(isbroken)
		to_chat(user, SPAN_NOTICE("This tool is broken and falling apart!"))
		return
	if((user.a_intent == I_HELP) && ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/S = H.organs_by_name[user.targeted_organ]

		if(!istype(S) || !BP_IS_ROBOTIC(S))
			return ..()

		if(get_tool_type(user, list(QUALITY_WELDING), H)) //Prosthetic repair
			if(S.brute_dam)
				var/robotics_expert = user.stats.getPerk(PERK_ROBOTICS_EXPERT)
				if(S.brute_dam < ROBOLIMB_SELF_REPAIR_CAP || robotics_expert)
					if(use_tool(user, H, WORKTIME_FAST, QUALITY_WELDING, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
						var/repair_amount = 15
						M.UpdateDamageIcon()
						if(robotics_expert)
							repair_amount = user.stats.getStat(STAT_MEC)
						S.heal_damage(repair_amount,0,TRUE)
						user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
						user.visible_message(SPAN_NOTICE("\The [user] [robotics_expert ? "expertly" : ""] patches some dents on \the [H]'s [S.name] with \the [src]."))
						M.UpdateDamageIcon()
						return 1
				else if(S.open != 2)
					to_chat(user, SPAN_DANGER("The damage is far too severe to patch over externally."))
					return 1
			else if(S.open != 2) // For surgery.
				to_chat(user, SPAN_NOTICE("Nothing to fix!"))
				return 1

	return ..()

/obj/item/tool/update_icon()
	cut_overlays()

	if(switched_on && toggleable)
		add_overlay("[icon_state]_on")

	if(use_power_cost)
		var/ratio = 0
		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= use_power_cost && cell.maxcharge > 0) // Makes sure cell.maxcharge is greater than 0, or it will divide by 0 - Ryuu
			ratio = cell.charge / cell.maxcharge
			ratio = max(round(ratio, 0.25) * 100, 25)
			add_overlay("[icon_state]-[ratio]")

	if(use_fuel_cost)
		var/ratio = 0
		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(get_fuel() >= use_fuel_cost && max_fuel > 0) // Makes sure that max_fuel is greater than 0, or it will divide by 0 - Ryuu
			ratio = get_fuel() / max_fuel
			ratio = max(round(ratio, 0.25) * 100, 25)
			add_overlay("[icon_state]-[ratio]")

	if(ismob(loc))
		var/tooloverlay
		switch(mode)
			if(EXCAVATE)
				tooloverlay = "excavate"
			if(DIG)
				tooloverlay = "dig"
		add_overlay((tooloverlay))

/***************************
	Misc/utility procs
****************************/

//Used by adhesive tools to stick an item to stuff
/obj/item/tool/proc/stick(obj/item/target, mob/user)
	return


/obj/item/tool/admin_debug
	name = "Electric Boogaloo 3000"
	desc = "Either god has a sense of humor or this item should have never been..."
	icon_state = "omnitool"
	item_state = "omnitool"
	tool_qualities = list(QUALITY_BOLT_TURNING = 100,
							QUALITY_PRYING = 100,
							QUALITY_WELDING = 100,
							QUALITY_SCREW_DRIVING = 100,
							QUALITY_CLAMPING = 100,
							QUALITY_CAUTERIZING = 100,
							QUALITY_WIRE_CUTTING = 100,
							QUALITY_RETRACTING = 100,
							QUALITY_DRILLING = 100,
							QUALITY_SAWING = 100,
							QUALITY_VEIN_FIXING = 100,
							QUALITY_BONE_SETTING = 100,
							QUALITY_BONE_FIXING = 100,
							QUALITY_BONE_GRAFTING = 100,
							QUALITY_SHOVELING = 100,
							QUALITY_DIGGING = 100,
							QUALITY_EXCAVATION = 100,
							QUALITY_CUTTING = 100,
							QUALITY_LASER_CUTTING = 100,
							)

#undef ADDITIONAL_TIME_LOWHEALTH

/obj/screen/item_action/top_bar/tool_info
	icon = 'icons/mob/screen/gun_actions.dmi'
	screen_loc = "7.95,1.4"
	minloc = "7,2:13"
	ErisOptimized_minloc = "16,10.3"
	name = "Tool information"
	icon_state = "info"

/obj/item/tool/ui_action_click(mob/living/user, action_name)
	switch(action_name)
		if("Tool information")
			ui_interact(user)
