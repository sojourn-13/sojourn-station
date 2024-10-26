/obj/entity_spawner
	name = "entity spawner basetype"
	desc = "dont use this"

	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "mechfab"

	anchored = TRUE
	density = TRUE

	health = 500
	maxHealth = 500

	/// Damage taken if a incoming explosion's severity is "1"/devastate
	var/devastate_damage = 200
	/// Damage taken if a incoming explosion's severity is "2"/heavy
	var/heavy_damage = 100
	/// Damage taken if a incoming explosion's severity is "3"/light
	var/light_damage = 50
	/// Damage taken if a incoming EMP's severity is "1"/heavy
	var/heavy_emp_damage = 70
	/// Amount of ticks a heavy EMP will stun for
	var/heavy_emp_stun = 20
	/// Damage taken if a incoming EMP's severity is "2"/light
	var/light_emp_damage = 20
	/// Amount of ticks a light EMP will stun for
	var/light_emp_stun = 8

	/**
	 * Associative list, enter typepaths as the key, chance to drop as the value. Each item will be considered individually in terms of probability.
	 * Very literal. Apon deconstruction of the spawner, aka when it gets shot a lot, it drops whatever is in this list. Even mobs.
	 * Each entry is one instance of it that will be spawned.
	**/
	var/list/atom/movable/dropped = list(
									/obj/item/stack/material/steel/{amount = 15} = 100,
									/obj/item/stack/material/glass/random = 95,
									/obj/item/stack/material/plasteel/random = 15,
									/obj/item/stack/cable_coil{amount = 5} = 90,
									/obj/item/trash/material/circuit = 100,
									/obj/item/stock_parts/matter_bin/ = 32,
									/obj/item/stock_parts/matter_bin/ = 32,
									/obj/item/stock_parts/manipulator/ = 32,
									/obj/item/stock_parts/manipulator/ = 32,
									/obj/item/stock_parts/micro_laser = 32,
									/obj/item/stock_parts/console_screen = 80,
									/obj/machinery/constructable_frame/machine_frame = 100
	)

	/// If TRUE, will perform check/tick spawn_delay every tick and/or call spawn_entities.
	var/active = TRUE

	/// Does this dispenser get affected by EMPs?
	var/emp_vulnerable = TRUE

	/**
	 * Associative. If this is not null, anything spawned will be spawned at these coordinates. X = horizontal, Y = vertical, Z = z-level.
	 * Format: list(x = coordinate, y = coordinate, z = coordinate). If a value is null, it defaults to src's respective coordinate. Set the entire var to null to disable.
	**/
	var/list/spawn_override = null
	/**
	 * Associative. Any value here will shift the spawns that many tiles away, using coordinates. X = horizontal shifting, Y = vertical shifting, Z = z-level shifting.
	 * Format: list(x = offset, y = offset, z = offset). If a value is null, it defaults to 0, AKA no offset. Set the entire var to null to disable.
	**/
	var/list/spawn_offset = null

	/// Maximum total amount of mobs this machine can have created
	var/maximum_spawned = 50

	/// Used as \the [src] [spawn_message] [spawned_mob]
	var/spawn_message = "constructs a"
	/// The message sent on deconstruction, used as \the [src] [death_message]
	var/death_message = "stops working!"
	/// Message sent when EMPed
	var/emp_message = "shudders, it's lights going dark!"
	/// Message sent when they recover from an EMP
	var/emp_recover_message = "'s lights slowly brighten, the inner machinery beginning to churn once more."

	///Will only allow mobs to spawn if 0. Decremented every process tick if above 0 and reset to spawn_delay_initial if 0.
	var/spawn_delay = 0
	/// The value to which spawn_delay will be reset to
	var/spawn_delay_initial = 0
	/// used in prob() to determine if this will spawn a mob this process tick
	var/spawn_probability = 50

	///List of lists. If to_spawn is empty or if none of the probabilities proc, we spawn one of these at random. Format: list(list(maximum, typepath), ...) Please don't put any typepaths in here that are in to_spawn.
	var/list/default_spawn = list(
								list(9, /mob/living/carbon/superior_animal/giant_spider/)
	)

	///List of lists. Format for usage: list(list(maximum, typepath, probability for prob()), ...) Please dont put any typepaths in here that are in default_spawn.
	var/list/to_spawn = list(
							list(30, /mob/living/carbon/superior_animal/giant_spider/hunter, 7),
							list(1, /mob/living/carbon/superior_animal/giant_spider/tarantula/ogre, 5)
	)

	/// Do we use currently_spawned?
	var/track_spawned = TRUE
	/// List of associative lists. each key is a typepath, each value is a instance of that typepath spawned by this machine.
	var/list/currently_spawned = list()

	/// How many mobs do we spawn per successful spawn?
	var/spawn_per_spawn = 1

/obj/entity_spawner/Initialize()

	START_PROCESSING(SSobj, src)

	. = ..()


/obj/entity_spawner/Destroy()

	for (var/list/containing_list in currently_spawned)
		for (var/mob/spawned in containing_list)
			spawned.spawned_from = null
		containing_list.Cut()

	. = ..()

/obj/entity_spawner/examine(mob/user) //yoinked from hivemind code
	..()
	if (health < maxHealth * 0.1)
		to_chat(user, SPAN_DANGER("It's falling apart!"))
	else if (health < maxHealth * 0.25)
		to_chat(user, SPAN_DANGER("There are noticable holes in it! You can even see the components!"))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_DANGER("It is very heavily dented, a few places having caved in!"))
	else if (health < maxHealth * 0.75)
		to_chat(user, SPAN_WARNING("It has numerous dents and deep scratches."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It's a bit scratched and has dents."))

/obj/entity_spawner/Process()

	if (active)
		if (spawn_delay == 0)
			if (prob(spawn_probability))
				spawn_entities()
			spawn_delay = spawn_delay_initial
		else
			spawn_delay--
		return TRUE
	return FALSE

/// Top layer proc for mob dispenser spawn logic. Checks to_spawn for anything, and if there is none, uses default_spawn instead.
/obj/entity_spawner/proc/spawn_entities()
// Not perfect, I could clean the code more
	for (var/i = 0, i < spawn_per_spawn, i++) //infinitely loops, each time incrementing i, and when i is equal or above spawn_per_spawn, terminate the loop
		var/length = 0
		if (currently_spawned)
			if (currently_spawned.len)
				for (var/key in currently_spawned) //check each key in our assoc list of mobs we own
					var/list/mobs = currently_spawned[key]
					length += (mobs.len) //add the length of each key's value to length
			if (length < maximum_spawned) //check the total amount of mobs we currently have active against our max
				if (to_spawn && to_spawn.len) //if its less, proceed
					var/list/successful_rolls = list()
					for (var/list/containing_list in to_spawn)
						var/probability_to_spawn = containing_list[3]
						if (prob(probability_to_spawn))
							var/maximum = containing_list[1]
							var/typepath = containing_list[2] // the 1st 2nd and 3rd entries in the list are always supposed to be the same exact type of thing, so we assume it
							if (!(currently_spawned[typepath])) //if the list doesnt exist, make it
								currently_spawned[typepath] = list()
							var/list/specific_mobs = currently_spawned[typepath]
							if ((specific_mobs.len) < maximum) // if we havent hit the limit of this mob, add it to the list of mobs we might spawn
								successful_rolls[typepath] += containing_list
							continue

					if (successful_rolls.len) // if the previous code block had anything successfully pass every check, let's pick one of them at random
						var/random = pick(successful_rolls)
						var/list/random_list = successful_rolls[random]
						handle_spawn_logic(random_list)
						continue

				if (default_spawn && default_spawn.len) //if everything in to_spawn fails to roll, or to_spawn is empty, use a random default
					var/list/random_list = pick(default_spawn)
					handle_spawn_logic(random_list)
					continue

			else
				return FALSE //we have reached our mob cap
	return TRUE

/obj/entity_spawner/proc/handle_spawn_logic(var/list/list_arg)

	var/maximum = list_arg[1]
	var/typepath = list_arg[2]

	if (!(currently_spawned[typepath]))
		currently_spawned[typepath] = list()

	var/list/specific_mobs = currently_spawned[typepath]
	if ((specific_mobs.len) < maximum)
		var/location = (src.loc)

		if (spawn_override)
			for (var/coordinate in spawn_override)
				if (spawn_override[coordinate] == null) //dont use ! here, we need to accept 0 values
					spawn_override[coordinate] = src[coordinate]
			var/x_temp = spawn_override[1]
			var/y_temp = spawn_override[2]
			var/z_temp = spawn_override[3]
			location = (locate(x_temp, y_temp, z_temp))

		else if (spawn_offset)
			for (var/coordinate in spawn_offset)
				if (spawn_offset[coordinate] == null) //dont use ! here, we need to accept 0 values
					spawn_offset[coordinate] = 0
			var/x_temp = (src.x + spawn_offset[1])
			var/y_temp = (src.y + spawn_offset[2])
			var/z_temp = (src.z + spawn_offset[3])
			location = (locate(x_temp, y_temp, z_temp))

		var/mob/spawned_mob = new typepath(location)

		spawnmessage(spawned_mob)

		if (track_spawned)
			spawned_mob.spawned_from = src
			currently_spawned[typepath] += spawned_mob

	return TRUE

// i wish this was just on machinery god damn
/obj/entity_spawner/proc/take_damage(damage = 0, attacking_item = null)
	health -= damage
	if (health <= 0)
		disassemble()

/obj/entity_spawner/bullet_act(obj/item/projectile/Proj)
	if (!(Proj.testing))
		take_damage(Proj.get_structure_damage(), Proj)
		if(istype(Proj, /obj/item/projectile/ion))
			Proj.on_hit(loc)
	. = ..()

/obj/entity_spawner/attackby(obj/item/I, mob/user)
	if(!(I.flags & NOBLUDGEON) && I.force)
		user.do_attack_animation(src)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		var/clear_damage = I.force

		if(clear_damage)
			. = ..()
			take_damage(clear_damage, I)
		else
			to_chat(user, SPAN_WARNING("You try to hit the [src] with [I], but it seems useless."))
			playsound(src, 'sound/weapons/Genhit.ogg', 30, 1)
		return
	return TRUE

/obj/entity_spawner/ex_act(severity)
	switch(severity)
		if(1) //devastate
			take_damage(devastate_damage)
		if(2) //heavy
			take_damage(heavy_damage)
		if(3) //light
			take_damage(light_damage)
	return TRUE

/obj/entity_spawner/emp_act(severity)
	if (emp_vulnerable)
		switch(severity)
			if(1)
				take_damage(heavy_emp_damage)
				deactivate(heavy_emp_stun, TRUE)
			if(2)
				take_damage(light_emp_damage)
				deactivate(light_emp_stun, TRUE)
		new /obj/effect/overlay/pulse(loc)
		if (emp_message && (stat ~! EMPED))
			visible_message(SPAN_WARNING("\the [src] [emp_message]"))
		return TRUE
	return FALSE

/obj/entity_spawner/proc/deactivate(duration = 0, emped = FALSE)
	active = FALSE
	if (duration != 0)
		addtimer((CALLBACK(src, PROC_REF(reactivate), emped)), duration)
	if (emped)
		stat |= EMPED
	return TRUE

/obj/entity_spawner/proc/reactivate(emped = FALSE)
	active = TRUE
	if (emped)
		stat &= ~EMPED
		visible_message(SPAN_WARNING("\the [src] [emp_recover_message]"))
	return TRUE

/obj/entity_spawner/proc/disassemble()

	if (dropped && dropped.len)
		for (var/entity in dropped)
			if (prob(dropped[entity]))
				new entity(loc)

	if (death_message)
		deathmessage()

	qdel(src)

	return TRUE

/obj/entity_spawner/proc/deathmessage() //here for modularity
	visible_message("\the [src] [death_message]")

	return TRUE

/obj/entity_spawner/proc/spawnmessage(var/atom/movable/spawned_mob)
	visible_message(SPAN_WARNING("\the [src] [spawn_message] [spawned_mob]!"))

	return TRUE
