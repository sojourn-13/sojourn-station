/obj/machinery/portable_atmospherics/hydroponics
	name = "hydroponics tray"
	icon = 'icons/obj/hydroponics_machines.dmi'
	icon_state = "hydrotray"
	density = 1
	anchored = 1
	reagent_flags = OPENCONTAINER
	volume = 100
	price_tag = 150 //Mostly just to have a price for the beacon, but I guess you could sell them if you were REALLY desperate?

	blue_ink_tk_blocker = TRUE //Removes bugs with teleportion

	var/mechanical = 1         // Set to 0 to stop it from drawing the alert lights.
	var/base_name = "tray"

	// Plant maintenance vars.
	var/waterlevel = 100       // Water
	var/waterlevel_max = 100   // Water Cap
	var/nutrilevel = 10        // Nutrient
	var/nutrilevel_max = 10    // Nutrient Cap
	var/pestlevel = 0          // Pests (max 10)
	var/weedlevel = 0          // Weeds (max 10)

	// Tray state vars.
	var/dead = 0               // Is it dead?
	var/harvest = 0            // Is it ready to harvest?
	var/age = 0                // Current plant age
	var/sampled = 0            // Have we taken a sample?

	// Harvest/mutation mods.
	var/yield_mod = 0          // Modifier to yield, post harvest
	var/potency_mod = 0        // Modifier to potency, post harvest
	var/mutation_mod = 0       // Modifier to mutation chance
	var/toxins = 0             // Toxicity in the tray?
	var/mutation_level = 0     // When it hits 100, the plant mutates.
	var/tray_light = 1         // Supplied lighting.

	// Mechanical concerns.
	health = 0             // Plant health. atleast its suppose to be if health wasent defined in atom. prepear for unforseen consiquences
	var/lastproduce = 0        // Last time tray was harvested
	var/lastcycle = 0          // Cycle timing/tracking var.
	var/cycledelay = 150       // Delay per cycle.
	var/closed_system          // If set, the tray will attempt to take atmos from a pipe.
	var/force_update           // Set this to bypass the cycle time check.
	var/obj/temp_chem_holder   // Something to hold reagents during process_reagents()
	var/labelled
	var/frozen = 0			   //Is the plant frozen? -1 is used to define trays that can't be frozen. 0 is unfrozen and 1 is frozen.

	// Seed details/line data.
	var/datum/seed/seed = null // The currently planted seed

	// Reagent information for process(), consider moving this to a controller along
	// with cycle information under 'mechanical concerns' at some point.
	var/global/list/toxic_reagents = list(
		"anti_toxin" =     -2,
		"toxin" =           2,
		"hydrazine" =       2.5,
		"acetone" =	        1,
		"sacid" =           1.5,
		"hclacid" =         1.5,
		"pacid" =           3,
		"plantbgone" =      3,
		"cryoxadone" =     -3,
		"radium" =          2
		)
	var/global/list/nutrient_reagents = list(
		"milk" =            0.1,
		"beer" =            0.25,
		"phosphorus" =      0.1,
		"sugar" =           0.1,
		"sodawater" =       0.1,
		"ammonia" =         1,
		"diethylamine" =    2,
		"nutriment" =       1,
		"adminordrazine" =  1,
		"eznutrient" =      1,
		"robustharvest" =   1,
		"left4zed" =        1,
		"protein" =         5
		)
	var/global/list/weedkiller_reagents = list(
		"hydrazine" =      -4,
		"phosphorus" =     -2,
		"sugar" =           2,
		"sacid" =          -2,
		"hclacid" =        -2,
		"pacid" =          -4,
		"plantbgone" =     -8,
		"adminordrazine" = -5
		)
	var/global/list/pestkiller_reagents = list(
		"sugar" =           2,
		"protein" =         3,
		"toxin" =          -1,
		"beer" =           -0.5,
		"ethanol" =        -1,
		"diethylamine" =   -2,
		"adminordrazine" = -5
		)
	var/global/list/water_reagents = list(
		"water" =           1,
		"adminordrazine" =  1,
		"milk" =            0.9,
		"beer" =            0.7,
		"hydrazine" =      -2,
		"phosphorus" =     -0.5,
		"water" =           1,
		"sodawater" =       1,
		)

	// Beneficial reagents also have values for modifying:
	// health | yield_mod | mut_mod - in this order
	var/global/list/beneficial_reagents = list(
		"beer" =           list( -0.05, 0,   0  ),
		"ethanol" =        list( -0.25, 0,   0  ),
		"hydrazine" =      list( -2,    0,   0  ),
		"phosphorus" =     list( -0.75, 0,   0  ),
		"sodawater" =      list(  0.1,  0,   0  ),
		"sacid" =          list( -1,    0,   0  ),
		"hclacid" =        list( -1,    0,   0  ),
		"pacid" =          list( -2,    0,   0  ),
		"plantbgone" =     list( -2,    0,   0.2),
		"cryoxadone" =     list(  3,    0,   0  ),
		"ammonia" =        list(  0.5,  0,   0  ),
		"diethylamine" =   list(  1,    0,   0  ),
		"nutriment" =      list(  0.5,  0.1, 0  ),
		"carbon" =         list(  0.1,  0.01,0  ),
		"radium" =         list( -1.5,  0,   0.2),
		"adminordrazine" = list(  1,    1,   1  ),
		"robustharvest" =  list(  0,    0.2, 0  ),
		"left4zed" =       list(  0,    0,   0.2)
		)

	// Mutagen list specifies minimum value for the mutation to take place, rather
	// than a bound as the lists above specify.
	var/global/list/mutagenic_reagents = list(
		"radium" =  8,
		"mutagen" = 15
		)

	var/global/list/potency_reagents = list(
		"diethylamine" =    1,
		"carbon" =          0.01
	)

/obj/machinery/portable_atmospherics/hydroponics/AltClick()
	if(mechanical && !usr.incapacitated() && Adjacent(usr))
		close_lid(usr)
		return 1
	return ..()

/obj/machinery/portable_atmospherics/hydroponics/New()
	..()
	temp_chem_holder = new()
	temp_chem_holder.create_reagents(10)
	temp_chem_holder.reagent_flags |= OPENCONTAINER
	create_reagents(200)
	if(mechanical)
		connect()
	update_icon()

/obj/machinery/portable_atmospherics/hydroponics/bullet_act(var/obj/item/projectile/Proj)

	if (!(Proj.testing))

		//Don't act on seeds like dionaea that shouldn't change.
		if(seed && seed.get_trait(TRAIT_IMMUTABLE) > 0)
			return

		//Override for somatoray projectiles.
		if(istype(Proj ,/obj/item/projectile/energy/floramut) && prob(20))
			mutate(prob(25) ? 3 : 1)
			return
		else if(istype(Proj ,/obj/item/projectile/energy/florayield) && prob(20))
			yield_mod = min(10,yield_mod+rand(1,2))
			return
		else if(istype(Proj ,/obj/item/projectile/energy/floraevolve) && prob(20))
			mutate(4)
			return

	..()

/obj/machinery/portable_atmospherics/hydroponics/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1

	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	else
		return 0

/obj/machinery/portable_atmospherics/hydroponics/proc/check_health()
	if(seed && !dead && health <= 0)
		die()
	check_level_sanity()
	update_icon()

/obj/machinery/portable_atmospherics/hydroponics/proc/die()
	dead = 1
	mutation_level = 0
	harvest = 0
	weedlevel += 1 * HYDRO_SPEED_MULTIPLIER
	pestlevel = 0

//Process reagents being input into the tray.
/obj/machinery/portable_atmospherics/hydroponics/proc/process_reagents()

	if(!reagents) return

	if(reagents.total_volume <= 0)
		return

	reagents.trans_to_obj(temp_chem_holder, min(reagents.total_volume,rand(1,3)))

	for(var/datum/reagent/R in temp_chem_holder.reagents.reagent_list)

		var/reagent_total = temp_chem_holder.reagents.get_reagent_amount(R.id)

		if(seed && !dead)
			//Handle some general level adjustments.
			if(toxic_reagents[R.id])
				toxins += toxic_reagents[R.id]         * reagent_total
			if(weedkiller_reagents[R.id])
				weedlevel -= weedkiller_reagents[R.id] * reagent_total
			if(pestkiller_reagents[R.id])
				pestlevel += pestkiller_reagents[R.id] * reagent_total

			// Beneficial reagents have a few impacts along with health buffs.
			if(beneficial_reagents[R.id])
				health += beneficial_reagents[R.id][1]       * reagent_total
				yield_mod += beneficial_reagents[R.id][2]    * reagent_total
				mutation_mod += beneficial_reagents[R.id][3] * reagent_total
			//potency reagents boost the plats genetic potency, tweaking needed
			if(potency_reagents[R.id])
				//While I myself would love to see this limit removed, 400 potency bluespace tomato's are a little to powerfull
				if((seed.get_trait(TRAIT_POTENCY) + potency_mod) < 100)
					potency_mod = min(100, potency_mod + potency_reagents[R.id] * reagent_total)
				//else  - If are plant is over 100 potency then adding a chemical that would *raise it* shouldnt lower it
				//	seed.set_trait(TRAIT_POTENCY, 100)

			// Mutagen is distinct from the previous types and mostly has a chance of proccing a mutation.
			if(mutagenic_reagents[R.id])
				mutation_level += reagent_total*mutagenic_reagents[R.id]+mutation_mod

		// Handle nutrient refilling.
		if(nutrient_reagents[R.id])
			nutrilevel += nutrient_reagents[R.id]  * reagent_total

		// Handle water and water refilling.
		var/water_added = 0
		if(water_reagents[R.id])
			var/water_input = water_reagents[R.id] * reagent_total
			water_added += water_input
			waterlevel += water_input

		// Water dilutes toxin level.
		if(water_added > 0)
			toxins -= round(water_added/4)

	temp_chem_holder.reagents.clear_reagents()
	check_health()

//Harvests the product of a plant.
/obj/machinery/portable_atmospherics/hydroponics/proc/harvest(var/mob/user)

	//Harvest the product of the plant,
	if(!seed || !harvest)
		return

	if(closed_system)
		if(user) to_chat(user, "You can't harvest from the plant while the lid is shut.")
		return
/*
	if(user.stats.getPerk(PERK_MASTER_HERBALIST))
		yield_mod += 2
		seed.harvest(user,yield_mod)
	else
*/
	var/post_moder_yield_mod = yield_mod

	if(seed.get_trait(TRAIT_HARVEST_REPEAT))
		post_moder_yield_mod  *= 0.5

/*
	//Fast growing crops dont get hit by the first harvest being elder
	if(age >= 70)
		post_moder_yield_mod -= (age * 0.005)
	if(age >= 120 && user) //Losing yield slowly now
		to_chat(user, "This plant appears to be deteriorating with age, surpassing any reasonable life expectancy for a [seed.display_name]. It's yield is suffering as a result.")
*/

	post_moder_yield_mod = round(post_moder_yield_mod)
	yield_mod = post_moder_yield_mod
//	to_chat(user, "yield_mod [seed.display_name]. post_moder_yield_mod [post_moder_yield_mod].")

	if(user)
		seed.harvest(user,yield_mod,potency_mod)
	else
		seed.selfharvest(get_turf(src),yield_mod,potency_mod)
	// Reset values.
	harvest = 0
	lastproduce = age

	if(!seed.get_trait(TRAIT_HARVEST_REPEAT))
		yield_mod = 0
		potency_mod = 0
		seed = null
		dead = 0
		age = 0
		sampled = 0
		mutation_mod = 0

	check_health()
	return

//Clears out a dead plant.
/obj/machinery/portable_atmospherics/hydroponics/proc/remove_dead(var/mob/user)
	if(!user || !dead) return

	if(closed_system)
		to_chat(user, "You can't remove the dead plant while the lid is shut.")
		return

	seed = null
	dead = 0
	sampled = 0
	age = 0
	yield_mod = 0
	potency_mod = 0
	mutation_mod = 0

	to_chat(user, "You remove the dead plant.")
	lastproduce = 0
	check_health()
	return

// If a weed growth is sufficient, this proc is called.
/obj/machinery/portable_atmospherics/hydroponics/proc/weed_invasion()

	//Remove the seed if something is already planted.
	if(seed) seed = null
	seed = plant_controller.seeds[pick(list("reishi","nettles","amanita","chanterelle","plumphelmet","towercap","harebells","weeds","grass","wheat"))]
	if(!seed) return //Weed does not exist, someone fucked up.

	dead = 0
	age = 0
	health = seed.get_trait(TRAIT_ENDURANCE)
	lastcycle = world.time
	harvest = 0
	weedlevel = 0
	pestlevel = 0
	sampled = 0
	update_icon()
	visible_message(SPAN_NOTICE("[src] has been overtaken by [seed.display_name]."))

	return

/obj/machinery/portable_atmospherics/hydroponics/proc/mutate(var/severity)

	// No seed, no mutations.
	if(!seed)
		return
	switch(severity)
		if (4)
			if (seed.evolutions && seed.evolutions.len)
				for(var/rid in seed.evolutions)

					var/list/checkEvoChems = seed.evolutions[rid]?:Copy()

					if (checkEvoChems ~= (checkEvoChems & seed.chems))
						evolve_species(rid)

			return
		if (3)
			if(seed.greatMutants && seed.greatMutants.len)

				mutate_species(seed.greatMutants)
			return
		if (2)
			if(seed.mutants && seed.mutants.len)
				mutate_species(seed.mutants)
			return

	// We need to make sure we're not modifying one of the global seed datums.
	// If it's not in the global list, then no products of the line have been
	// harvested yet and it's safe to assume it's restricted to this tray.
	if(!isnull(plant_controller.seeds[seed.name]))
		seed = seed.diverge()
	seed.mutate(severity,get_turf(src))

	return

/obj/machinery/portable_atmospherics/hydroponics/verb/remove_label()

	set name = "Remove Label"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return
	if(ishuman(usr) || isrobot(usr))
		if(labelled)
			to_chat(usr, "You remove the label.")
			labelled = null
			update_icon()
		else
			to_chat(usr, "There is no label to remove.")
	return

/obj/machinery/portable_atmospherics/hydroponics/verb/setlight()
	set name = "Set Light"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return
	if(ishuman(usr) || isrobot(usr))
		var/new_light = input("Specify a light level.") as null|anything in list(0,1,2,3,4,5,6,7,8,9,10)
		if(new_light)
			tray_light = new_light
			to_chat(usr, "You set the tray to a light level of [tray_light] lumens.")
	return

/obj/machinery/portable_atmospherics/hydroponics/proc/check_level_sanity()
	//Make sure various values are sane.
	if(seed)
		health =     max(0,min(seed.get_trait(TRAIT_ENDURANCE),health))
	else
		health = 0
		dead = 0

	mutation_level = max(0,min(mutation_level,100))
	nutrilevel =     max(0,min(nutrilevel,nutrilevel_max))
	waterlevel =     max(0,min(waterlevel,waterlevel_max))
	pestlevel =      max(0,min(pestlevel,10))
	weedlevel =      max(0,min(weedlevel,10))
	toxins =         max(0,min(toxins,10))

/obj/machinery/portable_atmospherics/hydroponics/proc/mutate_species(var/list/strains)

	var/previous_plant = seed.display_name
	var/newseed = seed.get_mutant_variant(strains)
	if(newseed in plant_controller.seeds)
		seed = plant_controller.seeds[newseed]
	else
		return

	dead = 0
	mutate(1)
	age = 0
	health = seed.get_trait(TRAIT_ENDURANCE)
	lastcycle = world.time
	harvest = 0
	weedlevel = 0

	update_icon()
	visible_message(SPAN_DANGER("The </span><span class='notice'>[previous_plant]</span><span class='danger'> has suddenly mutated into </span><span class='notice'>[seed.display_name]!"))

	return

/obj/machinery/portable_atmospherics/hydroponics/proc/evolve_species(var/strain)


	var/previous_plant = seed.display_name
	var/newseed = strain
	if (newseed in plant_controller.seeds)
		seed = plant_controller.seeds[newseed]
	else
		return

	dead = 0
	mutate(1)
	age = 0
	health = seed.get_trait(TRAIT_ENDURANCE)
	lastcycle = world.time
	harvest = 0
	weedlevel = 0

	update_icon()
	visible_message(SPAN_DANGER("The </span><span class='notice'>[previous_plant]</span><span class='danger'> has suddenly evolved into </span><span class='notice'>[seed.display_name]!"))

	return

/obj/machinery/portable_atmospherics/hydroponics/attackby(obj/item/I, var/mob/user as mob)

	var/tool_type = I.get_tool_type(user, list(QUALITY_SHOVELING, QUALITY_CUTTING,QUALITY_DIGGING, QUALITY_WIRE_CUTTING, QUALITY_BOLT_TURNING, QUALITY_PULSING), src)
	switch(tool_type)

		if(QUALITY_SHOVELING)
			if(weedlevel == 0)
				to_chat(user, SPAN_WARNING("This plot is completely devoid of weeds. It doesn't need uprooting."))
				if(user.a_intent == I_HURT)
					if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
						user.visible_message(SPAN_DANGER("[user] starts damage the plants root."))
						dead = 1
						update_icon()
					else
						user.visible_message(SPAN_DANGER("[user] fails to kill the plant."))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
				user.visible_message(SPAN_DANGER("[user] starts uprooting the weeds."), SPAN_DANGER("You remove the weeds from the [src]."))
				weedlevel = 0
				update_icon()
				return
			return

		if(QUALITY_WIRE_CUTTING)
			if(!seed)
				to_chat(user, SPAN_NOTICE("There is nothing to take a sample from in \the [src]."))
				return

			if(sampled > 2) //3 harvests. and the 4th one will kill the plant
				to_chat(user, SPAN_NOTICE("You have already sampled from this plant."))
				if(user.a_intent == I_HURT)
					to_chat(user, SPAN_NOTICE("You start killing it for one last sample."))
					seed.harvest(user,yield_mod,potency_mod,1)
					dead = 1
					update_icon()
				return

			if(dead)
				to_chat(user, SPAN_WARNING("The plant is dead."))
				return

			if(I.use_tool(user, src, WORKTIME_FAST, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
				// Create a sample.
				seed.harvest(user,yield_mod, potency_mod,1)
				health -= (rand(3,5)*10)
				sampled += 1 //no RnG not anymore

				// Bookkeeping.
				check_health()
				force_update = 1
				Process()
				return
			return


		if(QUALITY_PULSING)
			if(!anchored)
				to_chat(user, "<span class='warning'>Anchor it first!</span>")
				return
			if(frozen == -1)
				to_chat(user, "<span class='warning'>You see no way to use \the [I] on [src].</span>")
				return
			to_chat(user, "<span class='notice'>You [frozen ? "disable" : "enable"] the cryogenic freezing.</span>")
			frozen = !frozen
			update_icon()
			return

		if(QUALITY_BOLT_TURNING)
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_BIO))
				if(locate(/obj/machinery/atmospherics/portables_connector/) in loc)
					if(connected_port)
						disconnect()
						to_chat(user, SPAN_NOTICE("You disconnect \the [src] from the port."))
						update_icon()
						return
					else
						var/obj/machinery/atmospherics/portables_connector/possible_port = locate(/obj/machinery/atmospherics/portables_connector/) in loc
						if(possible_port)
							if(connect(possible_port))
								to_chat(user, SPAN_NOTICE("You connect \the [src] to the port."))
								update_icon()
								return
							else
								to_chat(user, SPAN_NOTICE("\The [src] failed to connect to the port."))
								return
						else
							to_chat(user, SPAN_NOTICE("Nothing happens."))
							return
				to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
				anchored = !anchored
				return
			return

		if(ABORT_CHECK)
			return

	if (I.is_drainable())
		return 0

	else if(istype(I, /obj/item/reagent_containers/syringe))

		var/obj/item/reagent_containers/syringe/S = I

		if (S.mode == 1)
			if(seed)
				return ..()
			else
				to_chat(user, "There's no plant to inject.")
				return 1
		else
			if(seed)
				//Leaving this in in case we want to extract from plants later.
				to_chat(user, "You can't get any extract out of this plant.")
			else
				to_chat(user, "There's nothing to draw something from.")
			return 1

	else if (istype(I, /obj/item/seeds))

		if(!seed)

			var/obj/item/seeds/S = I
			user.remove_from_mob(I)

			if(!S.seed)
				to_chat(user, "The packet seems to be empty. You throw it away.")
				qdel(I)
				return

			to_chat(user, "You plant the [S.seed.seed_name] [S.seed.seed_noun].")
			lastproduce = 0
			seed = S.seed //Grab the seed datum.
			dead = 0
			age = 1
			//Snowflakey, maybe move this to the seed datum
			health = (istype(S, /obj/item/seeds/cutting) ? round(seed.get_trait(TRAIT_ENDURANCE)/rand(2,5)) : seed.get_trait(TRAIT_ENDURANCE))
			lastcycle = world.time

			qdel(I)

			check_health()

		else
			to_chat(user, SPAN_DANGER("\The [src] already has seeds in it!"))

	else if (istype(I, /obj/item/storage/bag/produce))

		attack_hand(user)

		var/obj/item/storage/bag/produce/S = I
		var/at_least_one = FALSE
		for (var/obj/item/reagent_containers/snacks/grown/G in locate(user.x,user.y,user.z))
			if(!S.can_be_inserted(G))
				return
			if(!at_least_one)
				at_least_one = TRUE
			S.handle_item_insertion(G, suppress_warning = TRUE)
		if(at_least_one)
			to_chat(usr, SPAN_NOTICE("You put an assortment of produce in \the [I]."))

	else if ( istype(I, /obj/item/plantspray) )

		var/obj/item/plantspray/spray = I
		user.remove_from_mob(I)
		toxins += spray.toxicity
		pestlevel -= spray.pest_kill_str
		weedlevel -= spray.weed_kill_str
		to_chat(user, "You spray [src] with [I].")
		playsound(loc, 'sound/effects/spray3.ogg', 50, 1, -6)
		qdel(I)
		check_health()

	else if (istype(I, /obj/item/hydro_tray_plant_bag_water))
		var/obj/item/hydro_tray_plant_bag_water/htpbw = I
		user.remove_from_mob(htpbw)
		waterlevel_max += htpbw.max_water_give

		to_chat(user, "You add [htpbw] to [src].")
		qdel(htpbw)
		check_health()

	else if (istype(I, /obj/item/hydro_tray_plant_bag_nutrient))
		var/obj/item/hydro_tray_plant_bag_nutrient/htpbn = I
		user.remove_from_mob(htpbn)
		nutrilevel_max += htpbn.max_nutrient_give

		to_chat(user, "You add [htpbn] to [src].")
		qdel(htpbn)
		check_health()

	else if(I.force && seed)
		if(user.a_intent == I_HURT)
			if(!dead)
				health = -100 //So even if we have bees around or other healing chems inside we still die
				user.visible_message(SPAN_DANGER("\The [seed.display_name] has been hacked, and uprooted by [user] with \the [I]!"))
				check_health()
				harvest(user)
				return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.visible_message(SPAN_DANGER("\The [seed.display_name] has been whacked by [user] with \the [I]!"))
		if(!dead)
			health -= I.force
			check_health()
	return

/obj/machinery/portable_atmospherics/hydroponics/attack_tk(mob/user as mob)
	if(blue_ink_tk_blocker)
		to_chat(usr, SPAN_WARNING("\blue Your psionic power has been inhibited by a force."))
		return

	//if forwhatever reason we allow teleportation trays

	if(dead)
		remove_dead(user)
	else if(harvest)
		harvest(user)

/obj/machinery/portable_atmospherics/hydroponics/attack_hand(mob/user as mob)

	if(issilicon(usr))
		return
	if(frozen == 1)
		to_chat(user, "<span class='warning'>Disable the cryogenic freezing first!</span>")
	if(harvest)
		harvest(user)
	else if(dead)
		remove_dead(user)

/obj/machinery/portable_atmospherics/hydroponics/examine()

	..()

	if(!seed)
		to_chat(usr, "[src] is empty.")
		to_chat(usr, "Water: [round(waterlevel,0.1)]/[waterlevel_max]")
		to_chat(usr, "Nutrient: [round(nutrilevel,0.1)]/[nutrilevel_max]")
		return

	to_chat(usr, SPAN_NOTICE("[seed.display_name] are growing here."))

	if(!Adjacent(usr))
		return

	to_chat(usr, "Water: [round(waterlevel,0.1)]/[waterlevel_max]")
	to_chat(usr, "Nutrient: [round(nutrilevel,0.1)]/[nutrilevel_max]")

	if(weedlevel >= 5)
		to_chat(usr, "\The [src] is <span class='danger'>infested with weeds</span>!")
	if(pestlevel >= 5)
		to_chat(usr, "\The [src] is <span class='danger'>infested with tiny harmful pests</span>!")

	if(dead)
		to_chat(usr, SPAN_DANGER("The plant is dead."))
	else if(health <= (seed.get_trait(TRAIT_ENDURANCE)/ 2))
		to_chat(usr, "The plant looks <span class='danger'>unhealthy</span>.")
	if (frozen == 1)
		to_chat(usr, "<span class='notice'>It is cryogenically frozen.</span>")

	if(mechanical)
		var/turf/T = loc
		var/datum/gas_mixture/environment

		if(closed_system && (connected_port || holding))
			environment = air_contents

		if(!environment)
			if(istype(T))
				environment = T.return_air()

		if(!environment) //We're in a crate or nullspace, bail out.
			return

		var/light_string
		if(closed_system && mechanical)
			light_string = "that the internal lights are set to [tray_light] lumens"
		else
			var/light_available
			light_available = round((T.get_lumcount()*10)-5)
			light_string = "a light level of [light_available] lumens"

		to_chat(usr, "The tray's sensor suite is reporting [light_string] and a temperature of [environment.temperature]K.")

/obj/machinery/portable_atmospherics/hydroponics/verb/close_lid_verb()
	set name = "Toggle Tray Lid"
	set category = "Object"
	set src in view(1)
	if(usr.incapacitated())
		return

	if(ishuman(usr) || isrobot(usr))
		close_lid(usr)
	return

/obj/machinery/portable_atmospherics/hydroponics/proc/close_lid(var/mob/living/user)
	closed_system = !closed_system
	to_chat(user, "You [closed_system ? "close" : "open"] the tray's lid.")
	update_icon()
