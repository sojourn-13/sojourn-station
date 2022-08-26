// Ameridian Spire, an indestructible building that constantly refill missing ameridian around it.
/obj/structure/ameridian_crystal/spire
	name = "ameridian spire"
	desc = "A strange crystal formation that seems to have grown form a more rare crystal core."
	icon_state = "ameridian_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_power = 7
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	resize = FALSE
	var/is_growing = FALSE
	var/spread_range = 1 // Radius that the crystal can spawn new crystals. this is basically atm a 3x3 - Gains 1x1 every additonal core added so people can make their own size fields how they want!
	randomized_colour = FALSE
	colour_type = "PURPLE"

/obj/structure/ameridian_crystal/spire/fake
	spread_range = -1 //Invest 3 into me before a return
	name = "artificial ameridian spire growth"
	desc = "A colony planted verson of a sprite growth, made with tons of fragmented shards, and some pure ameridain cores."
	colour_type = "FAKE"

/obj/structure/ameridian_crystal/spire/examine(mob/user)
	..()
	if(spread_range > 0)
		to_chat(user, "<span class='angelsay'>The shard mass seems to have </span><span class='rose'>[spread_range] cores</span><span class='moderate'> inside it all pulsing together...</span>")
	else
		to_chat(user, "<span class='info'>The fragmented shard mass seems to have need more cores inside it before it could ever begine to grow.</span>")

/obj/structure/ameridian_crystal/spire/New()
	..()

/obj/structure/ameridian_crystal/spire/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/ameridian_core))
		to_chat(user, "<span class='info'>The spire begines to</span><span class='rose'> grow rapidly as it comuses the </span><span class='angelsay'>pure core </span><span class='moderate'>whole.</span>")
		if(!is_growing)
			addtimer(CALLBACK(src, .proc/spread), rand(40,90)) //So people have time to prepare for the worst
			is_growing = TRUE
		else
			to_chat(user, "<span class='info'>The spire begines to</span><span class='rose'> grow even faster as it comuses the </span><span class='angelsay'>pure core </span><span class='moderate'>whole.</span>")
			spread_range += 1 //this can quickly
		qdel(I)
		return

/obj/structure/ameridian_crystal/spire/add_initial_transforms()
	add_new_transformation(/datum/transform_type/modular, list(scale_x = 1.5, scale_y = 1.5, flag = AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM, priority = AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM_PRIORITY))
	. = ..()

/obj/structure/ameridian_crystal/spire/harvest_crystals()
	var/obj/item/stack/material/ameridian/T = new(get_turf(src))
	///new /obj/item/ameridian_core(T) - So SI cant sneakly get these and start their own farms without LSS or what ever
	T.amount = 60 //Half a stack for a rare find
	activate_mobs_in_range(src, 15) // Wake up the nearby golems
	qdel(src)

/obj/structure/ameridian_crystal/spire/proc/spread()
	if(!src) //Just in case
		return
	if(!is_growing)
		return
	var/list/turf_list = list()
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_spread_to_turf(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)
		var/crystal

		crystal = /obj/structure/ameridian_crystal // We spread are basic type

		if(crystal)
			new crystal(T) // We spread
	addtimer(CALLBACK(src, .proc/spread), rand(60,90)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time

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