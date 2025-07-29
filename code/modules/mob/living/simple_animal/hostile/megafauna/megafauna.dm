/mob/living/simple/hostile/megafauna
	name = "boss of this gym"
	desc = "Attack the weak point for massive damage."
	health = 1000
	maxHealth = 1000
	a_intent = I_HURT
	environment_smash = ENVIRONMENT_SMASH_WALLS
	light_range = 3
	faction = list("mining", "boss")
	var/atom/target
	minbodytemp = 0
	maxbodytemp = INFINITY
	mob_size = MOB_LARGE
	status_flags = 0 //No pushing, no stunning, no paralyze and no weaken.
	layer = 4.4 //Looks weird with them slipping under mineral walls and cameras and shit otherwise
	mouse_opacity = MOUSE_OPACITY_OPAQUE // Easier to click on in melee, they're giant targets anyway
	leather_amount = 0
	bones_amount = 0
	var/anger_modifier = 0
	var/recovery_time = 0
	var/chosen_attack = 1 // chosen attack num
	var/list/attack_action_types = list()
	var/megafauna_min_cooldown = 10
	var/megafauna_max_cooldown = 20
	var/emp_proof = FALSE

	needs_environment = FALSE
	research_value = 3000

//More complicated verson of movement and targeting fire
/mob/living/simple/hostile/megafauna/MoveToTarget()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	stop_automated_movement = TRUE
	if(!targetted_mob || SA_attackable(targetted_mob))
		stance = HOSTILE_STANCE_IDLE
	if(targetted_mob in ListTargets(10))
		if(ranged)
			var/mob/living/simple/hostile/megafauna/megafauna = src
			sleep(rand(megafauna.megafauna_min_cooldown,megafauna.megafauna_max_cooldown))
			if(istype(src, /mob/living/simple/hostile/megafauna/one_star))
				if(prob(rand(15,25)))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
				else
					OpenFire(targetted_mob)
			else
				if(prob(45))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
				else
					OpenFire(targetted_mob)
		else
			stance = HOSTILE_STANCE_ATTACKING
			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
			SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
	return FALSE


/mob/living/simple/hostile/megafauna/Initialize(mapload)
	. = ..()
	for(var/action_type in attack_action_types)
		var/datum/action/innate/megafauna_attack/attack_action = new action_type()
		attack_action.Grant(src)

/mob/living/simple/hostile/megafauna/proc/prevent_content_explosion()
	return TRUE

/mob/living/simple/hostile/megafauna/death(gibbed, var/list/force_grant)
	..()
	qdel(src)

/mob/living/simple/hostile/megafauna/gib()
	qdel(src)

/mob/living/simple/hostile/megafauna/dust(just_ash, drop_items, force)
	qdel(src)

/mob/living/simple/hostile/megafauna/AttackingTarget()
	if(recovery_time >= world.time)
		return
	. = ..()
	if(. && isliving(target))
		var/mob/living/L = target
		if(L.stat != DEAD)
			if(!client && ranged && ranged_cooldown <= world.time)
				OpenFire()
		else
			devour(L)

/mob/living/simple/hostile/megafauna/proc/devour(mob/living/L)
	if(!L)
		return FALSE
	visible_message(
		SPAN_DANGER("[src] devours [L]!</span>"),
		SPAN_DANGER("You feast on [L], restoring your health!"))
	if(client)
		adjustBruteLoss(-L.maxHealth/2)
	L.gib()
	return TRUE

/mob/living/simple/hostile/megafauna/ex_act(severity, target)
	if(emp_proof)
		return
	switch (severity)

		if(1)
			adjustFireLoss(rand(250,500))
		if(2)
			adjustFireLoss(rand(100,250))
		if(3)
			adjustFireLoss(rand(50,100))

/mob/living/simple/hostile/megafauna/proc/SetRecoveryTime(buffer_time)
	recovery_time = world.time + buffer_time
	ranged_cooldown = world.time + buffer_time

/datum/action/innate/megafauna_attack
	name = "Megafauna Attack"
	button_icon_state = ""
	var/mob/living/simple/hostile/megafauna/M
	var/chosen_message
	var/chosen_attack_num = 0

/datum/action/innate/megafauna_attack/Grant(mob/living/L)
	if(istype(L, /mob/living/simple/hostile/megafauna))
		M = L
		return ..()
	return FALSE

/datum/action/innate/megafauna_attack/Activate()
	M.chosen_attack = chosen_attack_num
	to_chat(M, chosen_message)


/mob/living/simple/hostile/megafauna/proc/select_spiral_attack()
	if(health < maxHealth/3)
		return double_spiral()
	return spiral_shoot()

/mob/living/simple/hostile/megafauna/proc/double_spiral()
	INVOKE_ASYNC(src, PROC_REF(spiral_shoot), FALSE)
	INVOKE_ASYNC(src, PROC_REF(spiral_shoot), TRUE)

/mob/living/simple/hostile/megafauna/proc/telegraph()
	for(var/mob/M in range(10,src))
		if(M.client)
			shake_camera(M, 4, 3)
	visible_message(SPAN_DANGER(pick("Prepare to die!", "JUSTICE", "Run!")))
	sleep(rand(megafauna_min_cooldown, megafauna_max_cooldown))

/mob/living/simple/hostile/megafauna/proc/spiral_shoot(negative = pick(TRUE, FALSE), rounds = 20)
	set waitfor = 0
	var/turf/start_turf = get_step(src, pick(GLOB.alldirs))
	var/incvar = negative ? -1 : 1
	var/dirpoint = 1
	var/list/alldirs = GLOB.alldirs.Copy()
	var/firedir = alldirs[dirpoint]
	for(var/i = 0 to rounds)
		shoot_projectile(start_turf, firedir)
		dirpoint += incvar
		if(dirpoint < 1)
			dirpoint = alldirs.len
		else if(dirpoint > alldirs.len)
			dirpoint = 1
		firedir = alldirs[dirpoint]
		sleep(rand(1,3))

/mob/living/simple/hostile/megafauna/proc/shoot_projectile(turf/marker, var/dir)
	if(!marker || marker == loc)
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new projectiletype(startloc)
	P.firer = src
	if(target)
		P.original = target
	P.launch(get_step(marker, dir))

/mob/living/simple/hostile/megafauna/proc/random_shots()
	ranged_cooldown = world.time + 30
	var/turf/U = get_turf(src)
	for(var/T in RANGE_TURFS(12, U) - U)
		if(prob(6))
			sleep(rand(0,1))
			shoot_projectile(T, pick(GLOB.alldirs))

/mob/living/simple/hostile/megafauna/proc/wave_shots()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	ranged_cooldown = world.time + 30
	var/turf/U = get_turf(src)
	for(var/T in RANGE_TURFS(12, U) - U)
		set_dir(get_dir(T, targetted_mob))
		if(get_dir(T, U) == get_dir(T, targetted_mob))
			if(prob(15))
				sleep(rand(0,1))
				shoot_projectile(T)
