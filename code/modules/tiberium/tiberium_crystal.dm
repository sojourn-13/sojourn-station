/obj/structure/tiberium_crystal
	name = "tiberium crystal"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/tiberium.dmi'
	icon_state = "tiberium_crystal"
	anchored = TRUE
	density = FALSE // We can walk through them
	light_range = 3 // Glow in the dark
	light_color = COLOR_LIGHTING_GREEN_BRIGHT

	var/growth // the growth level of the crystal. The higher it is, the older the crystal is.
	var/max_growth = GROWTH_HUGE // Maximum growth level, in case we want to do stuff relative to size
	var/growth_prob = 1 // The % of chance for the crystal to grow every tick
	var/spread_range = 1 // Radius that the crystal can spawn new crystals.

	var/rad_range = 2 // Radius that the crystal irradiate
	var/rad_damage = 1 // How much rad damage the crystal inflict per tick

	var/golem_threshold = 10 // How many fully-grown tiberium crystals need to be in a location for a golem to spawn
	var/golem_timer = 100 // How many ticks between golem spawning
	var/golem_range = 2 // Radius that the crystal check for the above threshold
	var/mob/living/carbon/superior_animal/tiberium_golem/golem // The golem that the growth spawned

/obj/structure/tiberium_crystal/Initialize(mapload, ...)
	..()
	START_PROCESSING(SSobj, src)

	// If the crystal was mapped in, spawn at full growth, else spawn as a seed.
	if(!growth) // As long as we didn't manually set a growth level
		if(mapload)
			growth = max_growth
		else
			growth = GROWTH_SEED
	golem_timer = 0 // Reset the timer
	update_icon()

/obj/structure/tiberium_crystal/Process()
	irradiate()

	if(prob(growth_prob))
		handle_growth()

	// Only try to spawn golems if we are at maximum growth
	if(growth >= max_growth)
		handle_golems()

/obj/structure/tiberium_crystal/update_icon()
	transform = initial(transform)
	transform *= ((1/max_growth) * growth) // So the crystal is at 20% size at growth 1, 40% at growth 2, e.t.c.

/obj/structure/tiberium_crystal/attackby(obj/item/I, mob/user)
	if(user.a_intent == I_HELP && user.Adjacent(src) && I.has_quality(QUALITY_EXCAVATION))
		src.visible_message(SPAN_NOTICE("[user] starts excavating crystals from [src]."), SPAN_NOTICE("You start excavating crystal from [src]."))
		if(do_after(user, WORKTIME_SLOW, src))
			var/obj/item/stack/material/tiberium/T = new(get_turf(src))
			T.amount = growth // Drop more crystal the further along we are
			src.visible_message(SPAN_NOTICE("[user] excavates a crystal from [src]."), SPAN_NOTICE("You excavate a crystal from [src]."))
			qdel(src)
		else
			to_chat(user, SPAN_WARNING("You must stay still to finish excavation."))
	else
		..()

// This proc is responsible for giving radiation damage to every nearby organics.
/obj/structure/tiberium_crystal/proc/irradiate()
	for(var/mob/living/l in range(src, rad_range))
		if(issynthetic(l)) // Don't irradiate synths
			continue
		l.apply_effect(rad_damage, IRRADIATE)

// This proc handle the growth & spread of the crystal
/obj/structure/tiberium_crystal/proc/handle_growth()
	if(growth >= max_growth) // If we are at max growth.
		spread()
	else
		growth += 1 // Keep Growing
		update_icon()

/obj/structure/tiberium_crystal/proc/spread()
	var/list/turf_list = list()
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(locate(/obj/structure/tiberium_crystal) in T) // skip turfs that already have a crystal
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)
		new /obj/structure/tiberium_crystal(T) // We spread

// This proc handle the spawning of golems
/obj/structure/tiberium_crystal/proc/handle_golems()
	if(golem)
		return FALSE

	if(++golem_timer >= initial(golem_timer))
		golem_timer = 0

		var/valid_crystal = 0
		for(var/obj/structure/tiberium_crystal/TC in range(golem_range, src))
			if(istype(TC, /obj/structure/tiberium_crystal/spire))
				continue // Ignore the tiberium spire if there's one
			if(TC.golem)
				return FALSE // Don't spawn a golem if any nearby growth spawned one, to prevent a fuckton of golems from spawning
			if(TC.growth >= max_growth)
				valid_crystal++

		if(valid_crystal >= golem_threshold)
			// Psions get an early warning
			var/sound/S = sound('sound/synthesized_instruments/chromatic/vibraphone1/c5.ogg')
			for(var/mob/living/carbon/human/H in view(src))
				if(H.stats.getPerk(PERK_PSION))
					to_chat(H, "<b><font color='purple'>[src] chimes.</b></font>")
					H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that

			sleep((S.len + 1) SECONDS) // Wait until the sound is done, we're using S.len in case the sound change for another with a different duration. We add a second to give a slightly longer warning time.

			golem = new(get_turf(src)) // Spawn a golem
			golem.node = src
			src.visible_message("[src] create a crystal golem to defend itself.")
			return TRUE
		return FALSE
