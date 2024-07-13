/obj/structure/ameridian_crystal
	name = "ameridian crystal"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal"
	anchored = TRUE					// Its growing in the ground
	density = FALSE					// We can walk through them
	light_range = 1					// Glow in the dark
	light_color = COLOR_LIGHTING_GREEN_BRIGHT

	var/growth = 1					// The growth level of the crystal. The higher it is, the older the crystal is.
	var/max_growth = 5				// Maximum growth level, in case we want to do stuff relative to size

	var/colour_type = "GREEN"

	var/is_growing = FALSE			// If weather or not we are growing for self improvement, mostly affects shard amounts on mining
	var/spread_range = 1			// Radius that the crystal can spawn new crystals. this is basically atm a 3x3 - Gains 1x1 every additonal core added so people can make their own size fields how they want!

	var/resize = TRUE				// Used for basic crystal on update icon to help controle its size and affects
	var/randomized_colour = TRUE	// If we on spawn have different colours

	var/self_improvement = TRUE		// Weather or not we are able to grow leading to more shards when mined
	var/fast_improvement = 320		// Minium amount of time it takes for a growing crystal to grow
	var/slow_improvement = 680		// Maxium amount of time it takes for a growing crystal to grow
	var/grower_helper = FALSE		// Used by spires to have shards it proces grow

	var/spread_speed_slow = 100		// Minium amount of time it takes for a grown crystal to spread
	var/spread_speed_high = 280		// Maxium amount of time it takes for a grown crystal to spread

	var/rads_producter = FALSE		// A simple check to make sure that we dont stack these in case thats a issue
	var/rad_range = 3				// Radius that the crystal irradiate
	var/rad_amounts = 4				// Amount of Radition the crystal will produce if its activated to do so

/obj/structure/ameridian_crystal/spreading
	is_growing = TRUE

/obj/structure/ameridian_crystal/Initialize(mapload, ...)
	update_icon()
	. = ..()

/obj/structure/ameridian_crystal/New()
	..()
	update_icon()
	if(is_growing)
		addtimer(CALLBACK(src, PROC_REF(spread)), rand(fast_improvement,slow_improvement))
	if(!randomized_colour)
		gooners()
		return
	if(prob(33))
		colour_type = "BLUE"
		icon_state = "ameridian_crystal_blue"
		fast_improvement = 120
		slow_improvement = 220
	else if(prob(33))
		colour_type = "RED"
		icon_state = "ameridian_crystal_red"
		fast_improvement = 60
		slow_improvement = 90
	gooners()
	self_improvements()


/obj/structure/ameridian_crystal/proc/self_improvements()
	light_range = growth //More growth = more light
	if(!self_improvement)
		return
	if(growth >= 5)
		self_improvement = FALSE
		return
	addtimer(CALLBACK(src, PROC_REF(self_improvements)), rand(fast_improvement,slow_improvement)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time
	growth += 1
	update_icon()

/obj/structure/ameridian_crystal/proc/add_rads()
	AddRadSource(src, rad_amounts, rad_range)

/obj/structure/ameridian_crystal/proc/gooners()
	if(colour_type == "BLUE") //Slower but less danger - kinda this needs to be better worked on
		new /obj/random/mob/golem/high_chance (src.loc)
		growth = pick(1,1,1,1,2,2,2,3,3,3,3,4,5)
		light_color = COLOR_LIGHTING_BLUE_BRIGHT
	if(colour_type == "RED") //Red things grow faster
		new /obj/random/mob/golem/low_chance (src.loc)
		new /obj/random/mob/golem/high_chance (src.loc)
		growth = pick(1,2,2,3,3,3,4,4,4,4,5,5,5)
		light_color = COLOR_LIGHTING_RED_BRIGHT
	if(colour_type == "GREEN")
		new /obj/random/mob/golem (src.loc)
		new /obj/random/mob/golem/low_chance (src.loc)
		growth = pick(1,1,2,2,2,3,3,3,4,4,4,5,5)
	if(colour_type == "PURPLE")
		growth = 5 // A just in case to allow us to still spread and grow.
		light_color = COLOR_LIGHTING_PURPLE_BRIGHT
		icon_state = "ameridian_crystal_purple"
		new /obj/random/cluster/golem_hoard(src.loc)
	if(colour_type == "FAKE")
		growth = 5 // A just in case to allow us to still spread and grow.
		light_color = COLOR_LIGHTING_PURPLE_DARK
		icon_state = "ameridian_crystal_purple"
	update_icon()

/obj/structure/ameridian_crystal/add_initial_transforms()
	if (resize)
		add_new_transformation(/datum/transform_type/ameridian_structures/crystal_resizing)
	. = ..()

/obj/structure/ameridian_crystal/Destroy()
	. = ..()

/obj/structure/ameridian_crystal/update_icon()
	set_light(growth, growth)
	underlays.Cut()
	underlays += ("crystal_floor_[clamp(round(REMAP(growth, 1, max_growth, 1, 5)), 1, 5)]")
	. = ..()

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
		if (!(Proj.testing))
			visible_message("[src] shatters.")
			Destroy()
	else
		..()

/obj/structure/ameridian_crystal/ex_act(severity)
	if(severity)
		harvest_crystals(src)

/obj/structure/ameridian_crystal/proc/harvest_crystals()
	var/obj/item/stack/material/ameridian/T = new(get_turf(src))
	T.amount = growth // Drop more crystal the further along we are
	activate_mobs_in_range(src, 7) // Wake up the nearby golems
	qdel(src)


/obj/structure/ameridian_crystal/proc/spread()
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

	if(turf_list.len && growth >= 5)
		var/turf/T = pick(turf_list)
		var/crystal

		crystal = /obj/structure/ameridian_crystal // We spread are basic type

		if(grower_helper)
			crystal = /obj/structure/ameridian_crystal/spreading

		if(crystal)
			new crystal(T) // We spread


	addtimer(CALLBACK(src, PROC_REF(spread)), rand(spread_speed_slow,spread_speed_high)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time

/obj/structure/ameridian_crystal/proc/toggle_growing()
	is_growing = !is_growing
