/obj/random/traps
	name = "random trap"
	icon_state = "trap-red"
	alpha = 128

/obj/random/traps/item_to_spawn()
	var/list/possible_traps = list(/obj/structure/wire_splicing = 1,
	/obj/item/mine/armed = 0.15,
	/obj/item/mine/improvised/armed = 0.30,
	/obj/item/beartrap/armed = 0.45,
	/obj/item/beartrap/makeshift/armed = 0.8)

	//Check that its possible to spawn the chosen trap at this location
	while (possible_traps.len)
		var/trap = pickweight(possible_traps)
		if (can_spawn_trap(loc, trap))
			return trap
		else
			possible_traps -= trap


/obj/random/traps/low_chance
	icon_state = "trap-red-low"
	spawn_nothing_percentage = 80

/obj/random/traps/wire_splicing
	name = "wire splicing"
	icon_state = "trap-orange"
	alpha = 128

/obj/random/traps/wire_splicing/item_to_spawn()
	return (/obj/structure/wire_splicing)

/obj/random/traps/wire_splicing/low_chance
	name = "low chance wire splicing"
	icon_state = "trap-orange-low"
	spawn_nothing_percentage = 70


//Checks if a trap can spawn in this location
/proc/can_spawn_trap(var/turf/T, var/trap)
	.=TRUE
	if(ispath(trap, /obj/structure/wire_splicing))
		if (locate(/obj/structure/cable) in dview(3, T))
			return TRUE
		return FALSE

//Spider trap, knocks a person down and spawns an emporer spider.
/obj/random/spider_trap
	name = "spider trap"
	icon_state = "trap-red"
	alpha = 128

/obj/random/spider_trap/item_to_spawn()
	return (/obj/item/spider_shadow_trap)

/obj/random/spider_trap/low_chance
	icon_state = "trap-red-low"
	spawn_nothing_percentage = 80

/obj/random/spider_trap_burrowing
	name = "burrow spider trap"
	icon_state = "trap-red"
	alpha = 128

/obj/random/spider_trap_burrowing/item_to_spawn()
	return (/obj/item/spider_shadow_trap/burrowing)

/obj/random/spider_trap_burrowing/low_chance
	icon_state = "trap-red-low"
	spawn_nothing_percentage = 80
