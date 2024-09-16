// Ameridian Spire, an indestructible building that constantly refill missing ameridian around it.
/obj/structure/ameridian_crystal/spire
	name = "ameridian spire"
	desc = "A strange crystal formation that seems to have grown from a rarer crystal core."
	icon_state = "ameridian_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_power = 7
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	resize = FALSE
	randomized_colour = FALSE
	colour_type = "PURPLE"
	growth = 5 //We start out always maxed as to save on preformance
	grower_helper = TRUE
	self_improvement = FALSE
	is_growing = TRUE

/obj/structure/ameridian_crystal/spire/dormit
	spread_range = -1
	is_growing = FALSE

/obj/structure/ameridian_crystal/spire/range_2
	spread_range = 2

/obj/structure/ameridian_crystal/spire/range_3
	spread_range = 3

/obj/structure/ameridian_crystal/spire/fake
	spread_range = -1 //Invest 3 into me before a return
	name = "artificial ameridian spire growth"
	desc = "An artificially constructed version of a sprite growth, made with a pure ameridian core pulsing around tons of ameridian shards."
	colour_type = "FAKE"
	is_growing = FALSE

/obj/structure/ameridian_crystal/spire/examine(mob/user)
	..()
	if(spread_range > 0)
		to_chat(user, "<span class='angelsay'>The shard mass seems to have </span><span class='rose'>[spread_range] core/s</span><span class='moderate'> inside...</span>")
	else
		to_chat(user, "<span class='info'>The fragmented shard mass needs at least one core in its center before it could ever begin to grow.</span>")

/obj/structure/ameridian_crystal/spire/New()
	..()

/obj/structure/ameridian_crystal/spire/attackby(obj/item/I, mob/user)
	..()
	if(istype(I, /obj/item/ameridian_core))
		if(!is_growing)
			addtimer(CALLBACK(src, PROC_REF(spread)), rand(40,90)) //So people have time to prepare for the worst
			is_growing = TRUE
			to_chat(user, "<span class='info'>The spire begins to</span><span class='rose'> grow rapidly as it consumes the </span><span class='angelsay'>[I]</span><span class='moderate'> whole.</span>")
			if(!rads_producter)
				rads_producter = TRUE
				add_rads()
		else
			to_chat(user, "<span class='info'>The spire begins to</span><span class='rose'> grow even faster as it consumes the </span><span class='angelsay'>[I]</span><span class='moderate'> whole.</span>")
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
	activate_mobs_in_range(src, 7) // Wake up the nearby golems
	qdel(src)

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
		if(istype(T, /turf/simulated/floor/asteroid))
			return TRUE
		if(istype(T, /turf/simulated/floor/beach))
			return TRUE
	return FALSE
