// A blue crystal that spawn 3 runtling golems when fell.
// It also boost the growth of nearby crystals.
// It spawn more golems, but spend longer between spawns.
/obj/structure/ameridian_crystal/blue
	name = "blue ameridian crystal"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon_state = "ameridian_crystal_blue"
	anchored = TRUE
	density = FALSE
	light_range = 5 // Glow brighter in the dark
	growth_prob = 2.5 // Spread crystals faster
	blue_crystal_prob = 0 // Cannot spawn more blue crystal
	rad_damage = 0.75
	rad_range = 2
	golem_timer = 150
	var/boost_range = 2
	var/amount_runtlings_spawn = 5
	var/amount_runtling_destruction = 3 // Amount of runtlings spawned on destruction

// Spawn golems in groups.
/obj/structure/ameridian_crystal/blue/handle_golems()
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
			spawn_runtling(amount_runtlings_spawn)
			return TRUE
		return FALSE

/obj/structure/ameridian_crystal/blue/spread()
	..()
	for(var/obj/structure/ameridian_crystal/AC in range(boost_range))
		if(istype(AC, /obj/structure/ameridian_crystal/blue) || istype(AC, /obj/structure/ameridian_crystal/spire))
			continue // To prevent infinite loops
		else
			AC.handle_growth() // The crystal grow & spread faster

/obj/structure/ameridian_crystal/blue/proc/spawn_runtling(var/runtling_amt = 1)
	var/list/turf_list = list()
	for(var/turf/T in view(1, src))
		if(istype(T, /turf/simulated/open) || istype(T, /turf/space) || locate(/obj/machinery/shieldwall/ameridian) in T || locate(/obj/machinery/shieldwallgen/ameridian) in T)
			continue // Ignore turfs that are actually air
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	var/sound/S = sound('sound/effects/screech.ogg')
	for(var/mob/living/carbon/human/H in viewers(src))
		if(H.stats.getPerk(PERK_PSION))
			to_chat(H, SPAN_PSION("[src] whistles..."))
			H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that

	sleep((S.len + 4) SECONDS) // 5 Seconds before the golems spawn

	for(var/I = 0, I < runtling_amt, I++)
		if(!golem) // Only one golem out of the pack get to be our main golem
			golem = new /mob/living/carbon/superior_animal/ameridian_golem/runtling(pick(turf_list))
			golem.node = src
		else
			new /mob/living/carbon/superior_animal/ameridian_golem/runtling(pick(turf_list))

	return runtling_amt

/obj/structure/ameridian_crystal/blue/harvest_crystals()
	visible_message("[src] crumbles into a pile of crystals...")
	icon_state = ""
	underlays.Cut()
	spawn_runtling(amount_runtling_destruction)
	visible_message(SPAN_DANGER("[src] reforms into multiple golems!"))
	activate_mobs_in_range(src, 15) // Wake up the nearby golems
	qdel(src)
