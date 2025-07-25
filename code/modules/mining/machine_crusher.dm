/obj/machinery/mineral/ore_crusher
	name = "rock crusher"
	desc = "A retro-fitted kitchen processer retooled for crushing rocks. Somehow more safe then normale ones. \
	Takes only rocks and sand for sifting."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "processor"
	density = TRUE
	anchored = TRUE
	var/ore_loaded = 0
	var/ore_type = "Rock"

	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 1 //Processing power
	var/output_direction = SOUTH
	var/obj/machinery/power/apc/apc
	var/need_power = TRUE

/obj/machinery/mineral/ore_crusher/Initialize(mapload)
	..()
	var/area/A = get_area(src)
	if(A)
		if(!A.requires_power)
			need_power = FALSE //For places that are always powered like GP, CC debugging
		if(need_power)
			apc = A.apc

/obj/machinery/mineral/ore_crusher/Process()
	if(ore_loaded && ore_type)

		if(apc && need_power && ore_type)
			if(apc.terminal.powernet.avail < active_power_usage)
				return

		ore_loaded--
		icon_state = "processor1"
		switch(ore_type)
			if("Rock")
				active_power_usage = 750 //750ws per stone crushed
				new /obj/item/stack/ore/glass/dust(get_turf(src))
				if(prob(50))
					new /obj/random/material_ore_small(get_turf(src))
			//Sand dosnt cost much power as its more like sifting
			if(ORE_SAND)
				active_power_usage = 75
				new /obj/item/stack/ore/glass/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			//Real Materals get different costs based on how hard they are
			if(ORE_IRON)
				active_power_usage = 1000 //1kws per iron dusted
				new /obj/item/stack/ore/iron/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_CARBON)
				active_power_usage = 700
				new /obj/item/stack/ore/coal/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_PLASMA)
				active_power_usage = 200
				new /obj/item/stack/ore/plasma/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_SILVER)
				active_power_usage = 500
				new /obj/item/stack/ore/silver/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_GOLD)
				active_power_usage = 500
				new /obj/item/stack/ore/gold/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_URANIUM)
				active_power_usage = 1300
				new /obj/item/stack/ore/uranium/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_DIAMOND)
				active_power_usage = 1450
				new /obj/item/stack/ore/diamond/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_HYDROGEN)
				active_power_usage = 2450
				new /obj/item/stack/ore/hydrogen/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
			if(ORE_PLATINUM)
				active_power_usage = 1800
				new /obj/item/stack/ore/osmium/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))
		apc.terminal.powernet.draw_power(active_power_usage)


	var/turf/T = get_step(src, output_direction)
	if(T)
		for(var/obj/item/stack/ore/O in src?.loc?.contents)
			O.forceMove(T)

	if(!ore_loaded)
		icon_state = "processor"


/obj/machinery/mineral/ore_crusher/attackby(obj/item/W, mob/user)

	//Base rock needs its own fancy check
	if(W.type == /obj/item/stack/ore || W.type == /obj/item/stack/ore/slag)
		if(!ore_type == "Rock" && ore_loaded)
			to_chat(user, SPAN_WARNING("[src] is already processing ore!"))
			return
		var/obj/item/stack/ore/R = W
		active_power_usage = 1200
		ore_type = "Rock"
		ore_loaded = R.amount
		to_chat(user, SPAN_NOTICE("You load [R.amount], rocks and stones into [src]"))
		R.use(R.amount)
		return

	if(istype(W, /obj/item/stack/ore))
		var/obj/item/stack/ore/R = W
		if(!ore_type == R.material && ore_loaded)
			to_chat(user, SPAN_WARNING("[src] is already processing ore!"))
			return
		active_power_usage = 2500 //Assume its really hard and its computing power
		ore_type = R.material
		if(!ore_type)
			ore_type = "Rock"
		ore_loaded = R.amount
		to_chat(user, SPAN_NOTICE("You load [R.amount], rocks and stones into [src]"))
		R.use(R.amount)
		return

	if(ore_loaded)
		to_chat(user, SPAN_WARNING("[src] is processing ore, best to leave it alone."))
		return


	..()