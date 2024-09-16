#define TURRET_PRIORITY_TARGET 2
#define TURRET_SECONDARY_TARGET 1
#define TURRET_NOT_TARGET 0


/obj/machinery/power/os_turret
	name = "Greyson Positronic turret"
	desc = "A turret of the Greyson Positronic variety."
	icon = 'icons/obj/machines/one_star/machines.dmi'
	icon_state = "os_gauss" // sprite by Infrared Baron
	circuit = /obj/item/circuitboard/os_turret
	var/faction_iff = "greyson"
	idle_power_usage = 30
	active_power_usage = 2500
	density = TRUE
	anchored = TRUE

	// Targeting
	var/should_target_players = TRUE			// TRUE targets players, FALSE targets superior animals (roaches, golems, and spiders)
	var/firing_range = 7						// 15x15 atm, so we dont no-scope off screen target
	var/returning_fire = FALSE					// Will attempt to fire at the nearest target when attacked and no one is in range
	var/last_target								//last target fired at, prevents turrets from erratically firing at all valid targets in range

	// Shooting
	var/obj/item/projectile/projectile = /obj/item/projectile/bullet/os_trurret_gauss
	var/number_of_shots = 3
	var/time_between_shots = 0.5 SECONDS
	var/list/shot_timer_ids = list()
	var/cooldown_time = null
	var/shot_sound = 'sound/weapons/energy/energy_shotgun.ogg'


	// Internal
	var/emp_cooldown = 8 SECONDS
	var/emp_timer_id
	var/on_cooldown = FALSE
	var/cooldown_timer_id

	health = 120			//the turret's health
	maxHealth = 120		//turrets maximal health.
	var/auto_repair = TRUE

/obj/machinery/power/os_turret/laser
	icon_state = "os_laser"
	circuit = /obj/item/circuitboard/os_turret/laser
	projectile = /obj/item/projectile/beam/os_turret
	number_of_shots = 3
	time_between_shots = 0.3 SECONDS
	cooldown_time = 2 SECONDS
	shot_sound = 'sound/weapons/guns/misc/laser_searwall.ogg'

/obj/machinery/power/os_turret/Initialize()
	. = ..()
	update_icon()
	RefreshParts()
	firing_range = world.view
	if(!cooldown_time)
		cooldown_time = time_between_shots * number_of_shots

/obj/machinery/power/os_turret/Process()

//Sparks that are not seeable by players are valueless
//	if(stat)
//		if(prob(2))
//			do_sparks(1, TRUE, src)
//		return

	if(health <= 0)
		stat |= BROKEN
		update_icon()
		return

	if(!on_cooldown)
		use_power = IDLE_POWER_USE
	else
		use_power = ACTIVE_POWER_USE
		return

	update_icon()

	var/list/targets = list()			//list of primary targets
	var/list/secondarytargets = list()	//targets that are least important

	for(var/mob/living/M in view(firing_range, src)) //WE USED WORLD.VIEW BEFORE THATS FUCKING PSYCHOPATHIC
		assess_and_assign(M, targets, secondarytargets) //might want to not use a proc due to proc overhead cost

	for(var/obj/mecha/mech in GLOB.mechas_list)
		if (mech.z == z && (get_dist(mech, src) < firing_range) && can_see(src, mech, firing_range))
			var/mob/living/occupant = mech.get_mob()
			if (occupant)
				assess_and_assign(occupant, targets, secondarytargets)

	if(!tryToShootAt(targets))
		if(!tryToShootAt(secondarytargets)) // if no valid targets, go for secondary targets
			if(auto_repair && (health < maxHealth))
				use_power(20000)
				health = min(health+1, maxHealth) // 1HP for 20kJ


/obj/machinery/power/os_turret/proc/tryToShootAt(var/list/mob/living/targets)
	if(targets.len && last_target && (last_target in targets) && target(last_target))
		return TRUE

	while(targets.len > 0)
		var/mob/living/M = pick(targets)
		targets -= M
		if(target(M))
			return TRUE

/obj/machinery/power/os_turret/proc/target(var/mob/living/target)
	if(target)
		last_target = target
		set_dir(get_dir(src, target))	//even if you can't shoot, follow the target
		try_shoot(target)
		return TRUE
	return

/obj/machinery/power/os_turret/proc/assess_and_assign(var/mob/living/L, var/list/targets, var/list/secondarytargets)
	switch(assess_living(L))
		if(TURRET_PRIORITY_TARGET)
			targets += L
		if(TURRET_SECONDARY_TARGET)
			secondarytargets += L

/obj/machinery/power/os_turret/proc/assess_living(var/mob/living/L) //TODO: optimize
	if(L.faction == "greyson") //The cheatcode
		return TURRET_NOT_TARGET

	if(!istype(L))
		return TURRET_NOT_TARGET

	if(L.invisibility >= INVISIBILITY_LEVEL_ONE) // Cannot see him. see_invisible is a mob-var
		return TURRET_NOT_TARGET

	if(L.stat)		//if the perp is dead/dying, no need to bother really
		return TURRET_NOT_TARGET	//move onto next potential victim!

	if(!L)
		return TURRET_NOT_TARGET

	if(get_dist(src, L) > firing_range)	//if it's too far away, why bother?
		return TURRET_NOT_TARGET

	if(!check_trajectory(L, src))	//check if we have true line of sight
		return TURRET_NOT_TARGET

	if(!should_target_players && ishuman(L))
		return TURRET_NOT_TARGET

	if(!should_target_players && issilicon(L)) //We shoot non GP robots
		return TURRET_NOT_TARGET

	return TURRET_PRIORITY_TARGET	//if the perp has passed all previous tests, congrats, it is now a "shoot-me!" nominee


/obj/machinery/power/os_turret/Destroy()
	if(cooldown_timer_id)
		deltimer(cooldown_timer_id)
	if(emp_timer_id)
		deltimer(emp_timer_id)
	if(shot_timer_ids.len)
		for(var/id in shot_timer_ids)
			deltimer(id)
	..()

/obj/machinery/power/os_turret/examine(mob/user)
	..()
	if(should_target_players)
		to_chat(user, SPAN_NOTICE("It is set to target humans, androids, and cyborgs."))
	else
		to_chat(user, SPAN_NOTICE("It is set to target golems and large bugs."))

/obj/machinery/power/os_turret/update_icon()
	underlays.Cut()
	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]_broken"
		underlays += image(icon, "osframe_broken")
	else
		underlays += image(icon, "osframe")

/obj/machinery/power/os_turret/emp_act()
	..()
	stat |= EMPED
	emp_timer_id = addtimer(CALLBACK(src, PROC_REF(emp_off)), emp_cooldown, TIMER_STOPPABLE|TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/machinery/power/os_turret/bullet_act(obj/item/projectile/proj)
	var/damage = proj.get_structure_damage()

	if(!damage)
		if(istype(proj, /obj/item/projectile/ion))
			proj.on_hit(loc)
		return

	..()

	take_damage(damage*proj.structure_damage_factor)

	if(!returning_fire && !stat)
		returning_fire = TRUE
		var/turf/proj_start_turf = proj.starting
		for(var/obj in proj_start_turf.contents)
			if(istype(obj, /obj/machinery/power/os_turret))
				return		// Don't shoot other turrets
		try_shoot(proj_start_turf)

/obj/machinery/power/os_turret/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(!damage)
		return 0
	attack_animation(user)
	take_damage(damage)

/obj/machinery/power/os_turret/attackby(obj/item/I, mob/user)
	var/mec_or_cog = max(user.stats.getStat(STAT_MEC), user.stats.getStat(STAT_COG))

	if(mec_or_cog < STAT_LEVEL_EXPERT)
		to_chat(user, SPAN_WARNING("You lack the knowledge or skill to perform work on \the [src]."))
	else
		if(default_deconstruction(I, user))
			return
		if(default_part_replacement(I, user))
			return

	// If the turret is friendly, you can unanchor it. If not, you bash it.
	if(should_target_players)
		if(!(I.flags & NOBLUDGEON) && I.force && !(stat & BROKEN))
			// If the turret was attacked with the intention of harming it:
			user.do_attack_animation(src)
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

			if(take_damage(I.force * I.structure_damage_factor))
				playsound(src, 'sound/weapons/smash.ogg', 70, 1)
			else
				playsound(src, 'sound/weapons/Genhit.ogg', 25, 1)
			return
	else
		var/list/usable_qualities = list(QUALITY_BOLT_TURNING)

		var/tool_type = I.get_tool_type(user, usable_qualities, src)
		switch(tool_type)
			if(QUALITY_BOLT_TURNING)
				if(istype(get_turf(src), /turf/space) && !anchored)
					to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
					return
				if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_MEC))
					to_chat(user, SPAN_NOTICE("You [anchored ? "un" : ""]anchor the brace with [I]."))
					anchored = !anchored
					if(anchored)
						connect_to_network()
					else
						disconnect_from_network()
			if(ABORT_CHECK)
				return

/obj/machinery/power/os_turret/RefreshParts()
	var/obj/item/circuitboard/os_turret/C = circuit
	should_target_players = C.should_target_players

/obj/machinery/power/os_turret/on_deconstruction()
	var/obj/item/circuitboard/os_turret/C = circuit
	C.should_target_players = FALSE

/obj/machinery/power/os_turret/proc/take_damage(amount)
	health = max(health - amount, 0)
	if(health <= 0)
		stat |= BROKEN
		update_icon()
	else if(prob(50))
		do_sparks(1, 0, loc)
	return amount

/obj/machinery/power/os_turret/proc/try_shoot(target)
	if(on_cooldown && !returning_fire)
		return

	if(stat) //We are ded jim
		return

	// Delete previously queued shots to prevent overlap
	if(shot_timer_ids.len)
		for(var/id in shot_timer_ids)
			deltimer(id)
		shot_timer_ids = list()

	var/def_zone

	if(istype(target, /mob/living/carbon/human))
		def_zone = pick(
			organ_rel_size[BP_CHEST]; BP_CHEST,
			organ_rel_size[BP_GROIN]; BP_GROIN,
			organ_rel_size[BP_L_ARM]; BP_L_ARM,
			organ_rel_size[BP_R_ARM]; BP_R_ARM,
			organ_rel_size[BP_L_LEG]; BP_L_LEG,
			organ_rel_size[BP_R_LEG]; BP_R_LEG,
		)

	if(number_of_shots)
		var/to_shoot = number_of_shots - 1
		var/timer = time_between_shots
		shoot(target, def_zone)
		for(var/i in 1 to to_shoot)
			shot_timer_ids += addtimer(CALLBACK(src, PROC_REF(shoot), target, def_zone), timer, TIMER_STOPPABLE)
			timer += time_between_shots

	if(cooldown_time && !returning_fire)
		on_cooldown = TRUE
		cooldown_timer_id = addtimer(CALLBACK(src, PROC_REF(cooldown)), cooldown_time, TIMER_STOPPABLE)

	if(returning_fire)
		returning_fire = FALSE

/obj/machinery/power/os_turret/proc/shoot(atom/target, def_zone)
	if(QDELETED(target) || stat & BROKEN)
		return
	set_dir(get_dir(src, target))
	var/obj/item/projectile/P = new projectile(loc)
	P.original_firer = src
	P.faction_iff = faction_iff
	if(!should_target_players)
		P.friendly_to_colony = TRUE
	P.launch(target, def_zone)
	playsound(src, shot_sound, 60, 1)

/obj/machinery/power/os_turret/proc/cooldown()
	on_cooldown = FALSE
	cooldown_timer_id = null

/obj/machinery/power/os_turret/proc/emp_off()
	stat &= ~EMPED
	emp_timer_id = null

#undef TURRET_PRIORITY_TARGET
#undef TURRET_SECONDARY_TARGET
#undef TURRET_NOT_TARGET
