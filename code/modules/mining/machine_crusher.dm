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
	active_power_usage = 7500 //7.5kws per stone crushed
	var/output_direction = SOUTH

/obj/machinery/mineral/ore_crusher/Process()
	if(ore_loaded)
		ore_loaded--
		icon_state = "processor1"
		switch(ore_type)
			if("Rock")
				use_power(active_power_usage)
				new /obj/item/stack/ore/glass/dust(get_turf(src))
				if(prob(50))
					new /obj/random/material_ore_small(get_turf(src))
			//Sand dosnt cost much power as its more like sifting
			if("Sand")
				new /obj/item/stack/ore/glass/dust(get_turf(src))
				if(prob(30))
					new /obj/random/material_ore_small(get_turf(src))

	var/turf/T = get_step(src, output_direction)
	if(T)
		for(var/obj/item/stack/ore/O in src?.loc?.contents)
			O.forceMove(T)

	if(!ore_loaded)
		icon_state = "processor"


/obj/machinery/mineral/ore_crusher/attackby(obj/item/W, mob/user)

	if(W.type == /obj/item/stack/ore)
		if(!ore_type == "Rock" && ore_loaded)
			to_chat(user, SPAN_WARNING("[src] is already processing ore!"))
			return
		var/obj/item/stack/ore/R = W
		ore_type = "Rock"
		ore_loaded = R.amount
		to_chat(user, SPAN_NOTICE("You load [R.amount], rocks and stones into [src]"))
		R.use(R.amount)
		return

	if(W.type == /obj/item/stack/ore/glass)
		if(!ore_type == "Sand" && ore_loaded)
			to_chat(user, SPAN_WARNING("[src] is already processing ore!"))
			return
		var/obj/item/stack/ore/S = W
		ore_type = "Sand"
		ore_loaded = S.amount
		to_chat(user, SPAN_NOTICE("You load [S.amount], sand and dirt into [src]"))
		S.use(S.amount)
		return

	if(ore_loaded)
		to_chat(user, SPAN_WARNING("[src] is processing ore, best to leave it alone."))
		return


	..()