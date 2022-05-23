/obj/structure/ameridian_crystal
	name = "ameridian crystal"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal"
	anchored = TRUE
	density = FALSE // We can walk through them
	light_range = 1 // Glow in the dark
	light_color = COLOR_LIGHTING_GREEN_BRIGHT

	var/growth // the growth level of the crystal. The higher it is, the older the crystal is.
	var/max_growth = 5 // Maximum growth level, in case we want to do stuff relative to size
	var/growth_prob = 1 // The % of chance for the crystal to grow every tickv
	var/blue_crystal_prob = 5 // % chance of spawning a blue crystal instead of a green one when spreading
	var/spread_range = 1 // Radius that the crystal can spawn new crystals.

	var/rad_range = 2 // Radius that the crystal irradiate
	var/rad_damage = 0.5 // How much rad damage the crystal inflict per tick

	var/golem_threshold = 10 // How many fully-grown ameridian crystals need to be in a location for a golem to spawn
	var/golem_timer = 100 // How many ticks between golem spawning
	var/golem_range = 2 // Radius that the crystal check for the above threshold
	var/mob/living/carbon/superior_animal/ameridian_golem/golem // The golem that the growth spawned

/obj/structure/ameridian_crystal/Initialize(mapload, ...)
	..()
	START_PROCESSING(SSobj, src)
	AddRadSource(src, rad_damage, rad_range)

	// If the crystal was mapped in, spawn at full growth, else spawn as a seed.
	if(!growth) // As long as we didn't manually set a growth level
		if(mapload)
			growth = max_growth
		else
			growth = 1
	golem_timer = 0 // Reset the timer
	update_icon()

/obj/structure/ameridian_crystal/Destroy()
	..()
	STOP_PROCESSING(SSobj, src)
	golem?.node = null

/obj/structure/ameridian_crystal/Process()
	if(prob(growth_prob))
		handle_growth()
		handle_duplicate_crystals()

	// Only try to spawn golems if we are at maximum growth
	if(growth >= max_growth)
		handle_golems()

/obj/structure/ameridian_crystal/update_icon()
	transform = initial(transform)
	transform *= ((1/max_growth) * growth) // So the crystal is at 20% size at growth 1, 40% at growth 2, e.t.c.
	set_light(growth, growth)
	underlays.Cut()
	underlays += ("crystal_floor_[clamp(round(REMAP(growth, 1, max_growth, 1, 5)), 1, 5)]")

/obj/structure/ameridian_crystal/attackby(obj/item/I, mob/user)
	if(user.a_intent == I_HELP && user.Adjacent(src))
		var/tool_type = I.get_tool_type(user, list(QUALITY_EXCAVATION, QUALITY_DIGGING, QUALITY_SHOVELING), src)
		if(tool_type)
			visible_message(SPAN_NOTICE("[user] starts digging [src] up."), SPAN_NOTICE("You start digging [src] up."))
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_ROB))
				harvest_crystals()
			else
				to_chat(user, SPAN_WARNING("You must stay still to finish excavation."))
	else
		..()

/obj/structure/ameridian_crystal/bullet_act(var/obj/item/projectile/Proj)
	if(istype(Proj, /obj/item/projectile/sonic_bolt))
		visible_message("[src] shatters.")
		Destroy()
	else
		..()

// This proc handle the growth & spread of the crystal
/obj/structure/ameridian_crystal/proc/handle_growth()
	if(growth >= max_growth) // If we are at max growth.
		spread()
	else
		growth += 1 // Keep Growing
		update_icon()

/obj/structure/ameridian_crystal/proc/spread()
	var/list/turf_list = list()
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_spread_to_turf(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)
		var/crystal

		if(blue_crystal_prob == -1)
			crystal = /obj/structure/ameridian_crystal/red
		else if(prob(blue_crystal_prob))
			crystal = /obj/structure/ameridian_crystal/blue
		else
			crystal = /obj/structure/ameridian_crystal // We spread

		if(crystal)
			new crystal(T) // We spread

// Check the given turf to see if there is any special things that would prevent the spread
/obj/structure/ameridian_crystal/proc/can_spread_to_turf(var/turf/T)
	if(T)
		if(istype(T, /turf/space)) // We can't spread in SPACE!
			return FALSE
		if(istype(T, /turf/simulated/open)) // Crystals can't float. Yet.
			return FALSE
		if(locate(/obj/structure/ameridian_crystal) in T) // No stacking.
			return FALSE
		if(locate(/obj/machinery/shieldwall/ameridian) in T) // Sonic fence block spread.
			return FALSE
		if(locate(/obj/machinery/shieldwallgen/ameridian) in T) // Sonic fence block spread. We can't spread in corners
			return FALSE
	return TRUE

// This proc handle the spawning of golems
/obj/structure/ameridian_crystal/proc/handle_golems()
	if(golem)
		return FALSE

	if(++golem_timer >= initial(golem_timer))
		golem_timer = 0

		var/valid_crystal = 0
		for(var/obj/structure/ameridian_crystal/AC in range(golem_range, src))
			if(istype(AC, /obj/structure/ameridian_crystal/spire))
				continue // Ignore the ameridian spire if there's one
			if(AC.golem)
				return FALSE // Don't spawn a golem if any nearby growth spawned one, to prevent a fuckton of golems from spawning
			if(AC.growth >= max_growth)
				valid_crystal++
			if(valid_crystal >= golem_threshold)
				break // We have enough crystals, leave early

		if(valid_crystal >= golem_threshold)
			// Psions get an early warning
			var/sound/S = sound('sound/synthesized_instruments/chromatic/vibraphone1/c5.ogg')
			for(var/mob/living/carbon/human/H in view(src))
				if(H.stats.getPerk(PERK_PSION))
					to_chat(H, SPAN_PSION("[src] chimes."))
					H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that

			sleep((S.len + 1) SECONDS) // Wait until the sound is done, we're using S.len in case the sound change for another with a different duration. We add a second to give a slightly longer warning time.

			golem = new(get_turf(src)) // Spawn a golem
			golem.node = src
			src.visible_message("[src] create a crystal golem to defend itself.")
			return TRUE
		return FALSE

// Check for duplicate crystals in the same turf
/obj/structure/ameridian_crystal/proc/handle_duplicate_crystals()
	for(var/obj/structure/ameridian_crystal/TC in orange(0, src)) // Check the turf we are in
		if(TC.growth > growth)
			continue // Don't delete crystals bigger than us
		qdel(TC)

// Proc for admins to manually allow the crystals to process or not
/obj/structure/ameridian_crystal/proc/toggle_processing()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)
	else
		START_PROCESSING(SSobj, src)

/obj/structure/ameridian_crystal/proc/handle_golem_distance()
	return

/obj/structure/ameridian_crystal/proc/harvest_crystals()
	var/obj/item/stack/material/ameridian/T = new(get_turf(src))
	T.amount = growth // Drop more crystal the further along we are
	activate_mobs_in_range(src, 15) // Wake up the nearby golems
	qdel(src)
