/mob/living/carbon/superior_animal
	name = "superior animal"
	desc = "You should not see this."

	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_push_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_size = MOB_SMALL //MOB_MINISCULE MOB_TINY MOB_SMALL MOB_MEDIUM MOB_LARGE
	a_intent = I_HURT
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "tomato"

	// AI activation for players is handled in sanity , if it has sanity damage it activates AI.
	sanity_damage = 0.5

	var/eating_time = 900

	/// How many tiles we will advance forward from our current position if we can't hit our current target.
	var/advancement = 3

	/// Var used to track if we are currently advancing. Blocks most walk_to-s that might come up.
	var/advancing = FALSE

	///How delayed are our ranged attacks, in ticks. Reduces DPS.
	var/fire_delay = 0

	/// Value used when resetting fire_delay. initial() works but breaks vareditting.
	var/fire_delay_initial = 0

	///How delayed are our melee attacks, in ticks. Reduces DPS.
	var/melee_delay = 0

	/// Value used when resetting melee_delay. initial() works but breaks vareditting.
	var/melee_delay_initial = 0

	/// Do we charge our melee attacks if we aren't adjacent?
	var/do_melee_if_not_adjacent = TRUE

	/// Number of delayed AI ticks, used for delaying ranged attacks. At 9, ranged mobs will be delayed by one tick after target. TODO: Create a override.
	var/delayed = 0
	/// How much we increment this mob's delayed var each time.
	var/delay_amount = 0
	/// If this is more than the world timer, and we retarget, we will immediately attack.
	var/retarget_rush_timer = 0
	/// For this amount of time after a retarget, any retargets will cause a instant attack.
	var/retarget_rush_timer_increment = 10 SECONDS //arbitrary value for now
	/// Will this mob continue to fire even if LOS has been broken?
	var/fire_through_wall = FALSE
	/// How many ticks are we willing to wait before untargetting a mob that we can't see?
	var/patience = 5

	/// Telegraph message base for mobs that are range
	var/range_telegraph = "aims their weapon at"
	/// Telegraph message base for mobs that are melee
	var/melee_telegraph = "readies to strike"

	/// Telegraph message base for mobs that are targetting
	var/target_telegraph = "prepares to fire at"
	/// Telegraph message base for mobs that are retargetting shortly after losing target
	var/rush_target_telegraph = "shifts its attention to"

	/// Telegraph messages for when a mob is ticking down it's attack delays
	var/range_charge_telegraph = "steadies their aim apon"
	var/melee_charge_telegraph = "gathers their strength to attack"

	/// What color is our telegraph beam?
	var/telegraph_beam_color = COLOR_YELLOW

	/// Alpha value of our telegraph beam.
	var/telegraph_beam_alpha = 50

	var/moved = FALSE
	var/move_attack_mult = 0.6
	universal_understand = TRUE //QoL to admins controling mobs
	var/do_gibs = TRUE //Do we gib?
	var/gibspawner_type = /obj/effect/gibspawner/generic //what we use as are gib spawner
	//Not to be confused with - gibspawner
	var/icon_living
	var/icon_dead
	var/icon_rest //resting/unconscious animation
	var/icon_gib //gibbing animation
	var/icon_dust //dusting animation
	var/dust_remains = /obj/effect/decal/cleanable/ash //what remains if mob turns to dust
	var/randpixel = 9 //Mob may be offset randomly on both axes by this much

	var/overkill_gib = 17 //0 to disable, gib when at maxHealth*2 brute loss and hit with at least overkill_gib brute damage
	var/overkill_dust = 20 //0 to disable, dust when at maxHealth*2 fire loss and hit with at least overkill_dust fire damage, or from 2*max_bodytemperature

	var/emote_see = list() //chat emotes
	var/speak_chance = 2 //percentage chance of speaking a line from 'emote_see'

	var/comfy_range = 6 //How far we like to be form are targets when we fire!
	/// comfy_range - comfy_distance = how far away mobs will try to be from their targets. Not how far they fire from.
	var/comfy_distance = 1

	var/grabbed_by_friend = FALSE //is this superior_animal being wrangled?

	var/turns_per_move = 3 //number of life ticks per random movement
	var/turns_since_move = 0 //number of life ticks since last random movement
	var/wander = 1 //perform automated random movement when idle
	var/stop_automated_movement = 0 //use this to temporarely stop random movement
	var/stop_automated_movement_when_pulled = 0

	var/flash_resistances = 0 //Normal flash done by a hand held is 10, 10+ is for bombs

	var/toxin_immune = FALSE
	var/reagent_immune = FALSE

	var/contaminant_immunity = FALSE //if TRUE, mob is immune to harmful contaminants in air (plasma), skin contact, does not relate to breathing
	var/cold_protection = 0 //0 to 1 value, which corresponds to the percentage of protection, affects only bodytemperature
	var/heat_protection = 0
	var/breath_required_type = "oxygen" //0 to disable, oxyloss if absent in sufficient quantity
	var/breath_poison_type = "plasma" //0 to disable, toxloss if present in sufficient quantity
	var/min_breath_required_type = 16 //minimum portion of gas in a single breath
	var/min_breath_poison_type = 0.2 //minimum portion of gas in a single breath
	var/light_dam = 0 //0 to disable, minimum amount of lums to cause damage, otherwise heals in darkness
	var/hunger_factor = 0 //0 to disable, how much nutrition is consumed per life tick

	colony_friend = FALSE


	var/min_air_pressure = 50 //below this, brute damage is dealt
	var/max_air_pressure = 300 //above this, brute damage is dealt
	var/min_bodytemperature = 200 //below this, burn damage is dealt
	var/max_bodytemperature = 360 //above this, burn damage is dealt

	var/deathmessage = "dies."
	var/attacktext = "bitten"
	var/list/attack_sound = 'sound/weapons/spiderlunge.ogg'
	var/attack_sound_chance = 100
	var/attack_sound_volume = 90

	var/meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	var/meat_amount = 3
	//Lodge related products
	var/leather_amount = 0 //The amount of leather sheets dropped.
	var/bones_amount = 0 //The amount of bone sheets dropped.
	var/has_special_parts = FALSE //var for checking during the butcher process.
	var/special_parts = list() //Any special body parts.

	var/melee_damage_lower = 0
	var/melee_damage_upper = 10

	var/list/objectsInView //memoization for getObjectsInView()
	var/viewRange = 7 //how far the mob AI can see
	var/acceptableTargetDistance = 1 //consider all targets within this range equally

	var/stance = HOSTILE_STANCE_IDLE //current mob AI state
	/**
	 * Currently chased target, in weakref form.
	 *
	 * IF YOU EVER ACCESS THIS VAR, OR ASSIGN A VALUE TO IT, you NEED to use target_mob.Resolve() to access it,
	 * or wrap whatever youre assigning it as with WEAKREF()
	 *
	 * Otherwise, you will access the pointer in memory to the actual target, instead of the target itself.
	 */
	var/datum/weakref/target_mob
	var/attack_same = 0 //whether mob AI should target own faction members for attacks
	var/list/friends = list() //list of mobs to consider friends, not types
	var/environment_smash = 1
	var/destroy_surroundings = 1
	var/break_stuff_probability = 100
	can_burrow = TRUE
	var/extra_burrow_chance = 0 //The chance that this animal will spawn another burrow in its vicinity
	//This is in addition to the single guaranteed burrow that always exists in sight of any burrowing mob

	var/bad_environment = FALSE //Briefly set true whenever anything in the atmosphere damages this mob
	//When this is true, mobs will attempt to evacuate via the nearest burrow

	var/busy = 0 // status of the animal, if it is doing a special task (eating, spinning web) we still want it
	// in HOSTILE_STANCE_IDLE to react to threat but we don't want stop_automated_movement set back to 0 in Life()

	var/ticks_processed = 0

	var/fleshcolor = "#DB0000"
	var/bloodcolor = "#DB0000"
	//Armor values for the mob. Works like normal armor values.
	var/give_randomized_armor = FALSE
	var/gives_prefex = FALSE
	var/prefex = "bugged"

	var/armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	var/add_armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	var/ranged = FALSE  //Do we have a range based attack?
	var/rapid = FALSE   //Do we shoot in groups?
	var/rapid_fire_shooting_amount = 3 //By default will rapid fire in 3 shots per.
	var/obj/item/projectile/projectiletype  //What are we shooting?
	var/projectilesound //What sound do we make when firing
	var/casingtype      //Do we leave casings after shooting?
	var/ranged_cooldown //What is are modular cooldown, in seconds.
	var/ranged_middlemouse_cooldown = 0 //For when people are controling them and firing, do we have a cooldown? Modular for admins to tweak.
	var/fire_verb = "fires"      //what does it do when it shoots?
	//ammo stuff
	var/limited_ammo = FALSE //Do we run out of ammo?
	var/mag_drop = FALSE //Do we drop are mags?
	var/rounds_left = 5 //Debug number
	var/mag_type = /obj/item/ammo_magazine/pistol_35/empty//What is are mag/cell used?
	var/mags_left = 3 //How many mags do we have?
	var/rounds_per_fire = 1 //how many bullets do we eat per shot, NOTE: rapid fire will use rounds_per_fire * 3
	var/reload_message = "performs a tactical reload!" //Are reload message.
	var/full_reload_message = "" //name + reload message above

	// Variables for the following AI
	var/obey_friends = TRUE // Do we obey only friends ?
	var/mob/following = null // Who are we following?
	/// The last mob this mob has followed, nulled on the first tick the mob is not following anymore. Make sure to assign this to the same value as following.
	var/mob/last_followed = null // Who did we follow last?
	var/follow_distance = 2 // How close do we stay?
	var/follow_message = "nods and start following." // Message that the mob emote when they start following. Include the name of the one who follow at the end
	var/stop_message = "nods and stop following." // Message that the mob emote when they stop following. Include the name of the one who follow at the end

	var/list/known_languages = list() // The languages that the superior mob know.

	//Simple delays for mobs, only for super mobs at this time, simple can stay much more deadly.
	//This makes it so they wait in seconds seconds before doing their attack
	delay_for_range = 1.5 SECONDS
	delay_for_rapid_range = 0.75 SECONDS
	delay_for_melee = 0 SECONDS
	delay_for_all = 0.5 SECONDS

/mob/living/carbon/superior_animal/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	full_reload_message  = "[reload_message]"
	reload_message = "[name] [full_reload_message]"

	verbs -= /mob/verb/observe
	pixel_x = RAND_DECIMAL(-randpixel, randpixel)
	pixel_y = RAND_DECIMAL(-randpixel, randpixel)

	GLOB.superior_animal_list += src

	for(var/language in known_languages)
		add_language(language)

/mob/living/carbon/superior_animal/Initialize(var/mapload)
	.=..()
	if (mapload && can_burrow)
		find_or_create_burrow(get_turf(src))
		if (prob(extra_burrow_chance))
			create_burrow(get_turf(src))

/mob/living/carbon/superior_animal/Destroy()
	GLOB.superior_animal_list -= src

	target_mob = null

	friends.Cut()
	. = ..()

/mob/living/carbon/superior_animal/u_equip(obj/item/W as obj)
	return

/mob/living/carbon/superior_animal/proc/visible_emote(message)
	if(islist(message))
		message = safepick(message)
	if(message)
		visible_message("<span class='name'>[src]</span> [message]")

/mob/living/carbon/superior_animal/update_icons()
	. = ..()
	transform = null
	if (stat == DEAD)
		icon_state = icon_dead
	else if ((stat == UNCONSCIOUS) || resting || lying)
		if (icon_rest)
			icon_state = icon_rest
		else
			if (icon_living)
				icon_state = icon_living
			var/matrix/M = matrix()
			M.Turn(180)
			//M.Translate(1,-6)
			transform = M
	else if (icon_living)
		icon_state = icon_living


/mob/living/carbon/superior_animal/regenerate_icons()
	. = ..()
	update_icons()

/mob/living/carbon/superior_animal/updateicon()
	. = ..()

/mob/living/carbon/superior_animal/examine(mob/user)
	..()
	if (health < maxHealth * 0.10)
		to_chat(user, SPAN_DANGER("It looks like they are on their last legs!"))
	else if (health < maxHealth * 0.20)
		to_chat(user, SPAN_DANGER("It's grievously wounded!"))
	else if (health < maxHealth * 0.30)
		to_chat(user, SPAN_DANGER("It's badly wounded!"))
	else if (health < maxHealth * 0.40)
		to_chat(user, SPAN_WARNING("Its wounds are mounting."))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_WARNING("It looks half dead."))
	else if (health < maxHealth * 0.60)
		to_chat(user, SPAN_WARNING("It looks like its been beaten up quite badly"))
	else if (health < maxHealth * 0.70)
		to_chat(user, SPAN_WARNING("It has accrued some lasting injuries."))
	else if (health < maxHealth * 0.80)
		to_chat(user, SPAN_WARNING("It has had minor damage done to it."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It has a few cuts and bruses."))


// Same as breath but with innecesarry code removed and damage tripled. Environment pressure damage moved here since we handle moles.

/mob/living/carbon/superior_animal/proc/handle_cheap_breath(datum/gas_mixture/breath as anything)
	var/breath_pressure = (breath.total_moles*R_IDEAL_GAS_EQUATION*breath.temperature)/BREATH_VOLUME
	var/breath_required = breath_pressure > 15 && (breath_required_type || breath_poison_type)
	if(!breath_required) // 15 KPA Minimum
		return FALSE
	adjustOxyLoss(breath.gas[breath_required_type] ? 0 : ((((breath.gas[breath_required_type] / breath.total_moles) * breath_pressure) < min_breath_required_type) ? 0 : 6))
	adjustToxLoss(breath.gas[breath_poison_type] ? 0 : ((((breath.gas[breath_poison_type] / breath.total_moles) * breath_pressure) < min_breath_poison_type) ? 0 : 6))

/mob/living/carbon/superior_animal/proc/handle_cheap_environment(datum/gas_mixture/environment as anything)
	var/pressure = environment.return_pressure()
	var/enviro_damage = (bodytemperature < min_bodytemperature) || (pressure < min_air_pressure) || (pressure > max_air_pressure)
	if(enviro_damage) // its like this to avoid extra processing further below without using goto
		bodytemperature += (bodytemperature - environment.temperature) * (environment.total_moles / MOLES_CELLSTANDARD) * (bodytemperature < min_bodytemperature ? 1 - heat_protection : -1 + cold_protection)
		adjustFireLoss(bodytemperature < min_bodytemperature ? 0 : 15)
		adjustBruteLoss((pressure < min_air_pressure  || pressure > max_air_pressure) ? 0 : 6)
		bad_environment = TRUE
		return FALSE
	bad_environment = FALSE
	if (!contaminant_immunity)
		for(var/g in environment.gas)
			if(gas_data.flags[g] & XGM_GAS_CONTAMINANT && environment.gas[g] > gas_data.overlay_limit[g] + 1)
				pl_effects()
				break

	if (overkill_dust && (getFireLoss() >= maxHealth*2))
		dust()
		return FALSE

// branchless isincapacited check made for roaches.
/mob/living/carbon/superior_animal/proc/cheap_incapacitation_check() // This works based off constants ,override it if you want it to be dynamic . Based off isincapacited
	return stunned > 0 || weakened > 0 || resting || pinned.len > 0 || stat || paralysis || sleeping || (status_flags & FAKEDEATH) || buckled() > 0

/mob/living/carbon/superior_animal/proc/cheap_update_lying_buckled_and_verb_status_()

	if(cheap_incapacitation_check())
		lying = FALSE
		canmove = TRUE
	else
		canmove = FALSE
		if(buckled)
			anchored = buckled.buckle_movable
			lying = buckled.buckle_lying
	if(lying)
		set_density(FALSE)
	if(stat == DEAD)
		set_density(FALSE)
	else
		canmove = TRUE
		set_density(initial(density))

/mob/living/carbon/superior_animal/proc/handle_ai()

	if(ckey)
		return

	objectsInView = null

	//CONSCIOUS UNCONSCIOUS DEAD

	if (!check_AI_act())
		return

	var/atom/targetted_mob
	if (target_mob)
		targetted_mob = (target_mob?.resolve())
	if (!targetted_mob) //will be false if there is no target_mob or if the resolved value is null
		loseTarget()
	else if (!targetted_mob.check_if_alive(TRUE)) //else if because we dont want a runtime
		loseTarget()

	switch(stance)
		if(HOSTILE_STANCE_IDLE)
			if (!busy) // if not busy with a special task
				stop_automated_movement = FALSE
			if (!targetted_mob)
				target_mob = WEAKREF(findTarget()) //no target? try to find one
				targetted_mob = (target_mob?.resolve())
			if (targetted_mob) // is it still null?
				stance = HOSTILE_STANCE_ATTACK
				handle_hostile_stance(targetted_mob)

		if(HOSTILE_STANCE_ATTACK)
			handle_hostile_stance(targetted_mob)

		if(HOSTILE_STANCE_ATTACKING)
			if (delayed == 0)
				handle_attacking_stance(targetted_mob)
			else
				delayed--

	//random movement
	if(wander && !stop_automated_movement && !anchored)
		if(isturf(loc) && !resting && !buckled && canmove)
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				if(!(stop_automated_movement_when_pulled && pulledby))
					var/moving_to = pick(cardinal)
					set_dir(moving_to)
					step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS))
					turns_since_move = 0

	//Speaking
	if(speak_chance && prob(speak_chance))
		visible_emote(emote_see)

/mob/living/carbon/superior_animal/proc/handle_hostile_stance(var/atom/targetted_mob) //here so we can jump instantly to it if hostile stance is established
	var/already_destroying_surroundings = FALSE
	var/calculated_walk = (comfy_range - comfy_distance)
	if(weakened) return
	if(destroy_surroundings)
		destroySurroundings()
		already_destroying_surroundings = TRUE
	if(ranged)

		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		walk_to(src, targetted_mob, calculated_walk, move_to_delay) //lets get a little closer than our optimal range
		if (!(retarget_rush_timer > world.time)) //Only true if the timer is less than the world.time
			visible_message(SPAN_WARNING("[src] [target_telegraph] <font color = 'green'>[targetted_mob]</font>!"))
			delayed = delay_amount
			return //return to end the switch early, so we delay our attack by one tick. does not happen if rush timer is less than world.time
		else
			visible_message(SPAN_WARNING("[src] [rush_target_telegraph] <font color = 'green'>[targetted_mob]</font>!"))

	else if (!ranged)
		stop_automated_movement = TRUE
		stance = HOSTILE_STANCE_ATTACKING
		set_glide_size(DELAY2GLIDESIZE(move_to_delay))
		walk_to(src, targetted_mob, 1, move_to_delay)
		moved = 1
	handle_attacking_stance(targetted_mob, already_destroying_surroundings)

/mob/living/carbon/superior_animal/proc/handle_attacking_stance(var/atom/targetted_mob, var/already_destroying_surroundings = FALSE)
	var/projectile_passflags
	var/projectile_flags
	var/calculated_walk = (comfy_range - comfy_distance)
	retarget_rush_timer += ((world.time) + retarget_rush_timer_increment) //we put it here because we want mobs currently angry to be vigilant
	if(destroy_surroundings && !already_destroying_surroundings)
		destroySurroundings()
	if (!((can_see(src, targetted_mob, get_dist(src, targetted_mob))) && !fire_through_wall)) //why attack if we can't even see the enemy
		if (patience <= 0)
			loseTarget()
			patience = initial(patience)
		else
			patience--
		return
	else if (projectiletype) // if we can see, let's prepare to see if we can hit
		if (projectiletype == initial(projectiletype)) // typepaths' vars are only accessable through initial() or objects
			projectile_passflags = initial(projectiletype.pass_flags)
			projectile_flags = initial(projectiletype.flags)
		else // in case for some reason this var was editted post-compile
			var/obj/item/projectile/temp_proj = new projectiletype(null) //create it in nullspace
			projectile_passflags = temp_proj.pass_flags
			projectile_flags = temp_proj.flags
		if (ranged)
			var/obj/item/projectile/test/impacttest/trace = new /obj/item/projectile/test/impacttest(get_turf(src))
			RegisterSignal(trace, COMSIG_TRACE_IMPACT, .proc/handle_trace_impact)
			addtimer(CALLBACK(src, .proc/handle_advancement_var), 5) // we dont want this walk overridden immediately
			trace.pass_flags = projectile_passflags
			trace.flags = projectile_flags
			trace.launch(targetted_mob)

	patience = initial(patience)
	if(!ranged)
		prepareAttackOnTarget()
	else if(ranged)
		if (!(targetted_mob.check_if_alive(TRUE)))
			loseTarget()
			return
		if (!check_if_alive())
			return
		if(get_dist(src, targetted_mob) <= comfy_range)
			prepareAttackPrecursor(targetted_mob, .proc/OpenFire, RANGED_TYPE)
			if (!advancing) //we dont want to prematurely end a advancing walk
				walk_to(src, targetted_mob, calculated_walk, move_to_delay) //we still want to reset our walk
		else
			if(weakened)
				return
			if (!advancing)
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				walk_to(src, targetted_mob, calculated_walk, move_to_delay)
			prepareAttackPrecursor(targetted_mob, .proc/OpenFire, RANGED_TYPE)

/// If critcheck = FALSE, will check if health is more than 0. Otherwise, if is a human, will check if theyre in hardcrit.
/atom/proc/check_if_alive(var/critcheck = FALSE) //A simple yes no if were alive
	if (critcheck)
		if (istype(src, /mob/living/carbon/human))
			if(health > HEALTH_THRESHOLD_CRIT) //only matters for humans
				return TRUE
			else
				return FALSE
	if(health > 0)
		return TRUE
	return FALSE

// Same as overridden proc but -3 instead of -1 since its 3 times less frequently envoked, if checks removed
/mob/living/carbon/superior_animal/handle_status_effects()
	paralysis = max(paralysis-3,0)
	stunned = max(stunned-3,0)
	weakened = max(weakened-3,0)

/mob/living/carbon/superior_animal/proc/handle_cheap_regular_status_updates()
	health = maxHealth - getOxyLoss() - getToxLoss() - getFireLoss() - getBruteLoss() - getCloneLoss() - halloss
	if(health <= 0 && stat != DEAD)
		death()
		// STOP_PROCESSING(SSmobs, src) This is handled in Superior animal Life().
		blinded = TRUE
		silent = FALSE
		return TRUE
	return FALSE

/mob/living/carbon/superior_animal/proc/handle_cheap_chemicals_in_body()
	if(reagents)
		chem_effects.Cut()
		if(touching)
			touching.metabolize()
		if(bloodstr)
			bloodstr.metabolize()

	/*
	if(light_dam)
		var/light_amount = 0
		if(isturf(loc))
			var/turf/T = loc
			light_amount = round((T.get_lumcount()*10)-5)
		if(light_amount > light_dam) //if there's enough light, start dying
			take_overall_damage(1,1)
		else //heal in the dark
			heal_overall_damage(1,1)
	// nutrition decrease
	if (hunger_factor && (nutrition > 0) && (stat != DEAD))
		nutrition = max (0, nutrition - hunger_factor)
	updatehealth()
	*/

/mob/living/carbon/superior_animal/Life()
	ticks_processed++
	var/datum/gas_mixture/environment = loc.return_air_for_internal_lifeform()
	/// Fire handling , not passing the whole list because thats unefficient.
	handle_fire(environment.gas["oxygen"], loc)
	handle_regular_hud_updates()
	handle_cheap_chemicals_in_body()
	if(!(ticks_processed%3))
		// handle_status_effects() this is handled here directly to save a bit on procedure calls
		if((weakened - 3 <= 1 && weakened > 1) || (stunned - 3 <= 1 && stunned > 1))
			spawn(5) update_icons()
		paralysis = max(paralysis-3,0)
		stunned = max(stunned-3,0)
		weakened = max(weakened-3,0)
		cheap_update_lying_buckled_and_verb_status_()
		var/datum/gas_mixture/breath = environment.remove_volume(BREATH_VOLUME)
		handle_cheap_breath(breath)
		handle_cheap_environment(environment)
		updateicon()
		ticks_processed = 0
	if(handle_cheap_regular_status_updates()) // They have died after all of this, do not scan or do not handle AI anymore.
		return PROCESS_KILL

	if (can_burrow && bad_environment)
		evacuate()

	if (!weakened)

		if(!AI_inactive) //we dont need to handle ai if we're disabled
			handle_ai()
			//Speaking

			if(speak_chance && prob(speak_chance))
				visible_emote(emote_see)

			if (following)
				if (!target_mob) // Are we following someone and not attacking something?
					walk_to(src, following, follow_distance, move_to_delay) // Follow the mob referenced in 'following' and stand almost next to them.
			else if (!target_mob && last_followed)
				walk_to(src, 0)
				last_followed = null // this exists so we only stop the following once, no need to constantly end our walk

	if(life_cycles_before_sleep)
		life_cycles_before_sleep--
		return TRUE
	if(!(AI_inactive && life_cycles_before_sleep))
		AI_inactive = TRUE

	if(life_cycles_before_scan)
		life_cycles_before_scan--
		return FALSE
	if(check_surrounding_area(viewRange))
		activate_ai()
		life_cycles_before_scan = initial(life_cycles_before_scan)/6 //So it doesn't fall asleep just to wake up the next tick
		return TRUE
	life_cycles_before_scan = initial(life_cycles_before_scan)
	return FALSE

/**
 *  To be used when, instead of raw attack procs, you want to add a timer.
 *  Will telegraph this attack to any within range, visually, with a message and a beam effect.
 *
 *	Args:
 *	atom/targetted_mob-Atom this timer will be targetted to, and the target of the telegraphs.
 *	proctocall: The proc the timer will call.
 *	attack_type-The delay that will be used for this timer. Defines used by this defined in mobs.dm. Example: MELEE_TYPE.
 *	telegraph-Boolean. If false, no visual emote will be made.
 *	cast_beam-Boolean. If true, a beam will be cast from src to targetted_mob as a visual telegraph.
**/
/mob/living/carbon/superior_animal/proc/prepareAttackPrecursor(var/atom/targetted_mob, proctocall, var/attack_type, var/telegraph = TRUE, var/cast_beam = TRUE)
	if (check_if_alive()) //sanity
		var/time_to_expire
		switch(attack_type)
			if (MELEE_TYPE)
				if (do_melee_if_not_adjacent || Adjacent(targetted_mob))
					time_to_expire = delay_for_melee
					if (telegraph)

						if (!(melee_delay == 0)) //are we still charging our attack?
							melee_delay--
							visible_message(SPAN_WARNING("[src] [melee_charge_telegraph] <font color = 'orange'>[targetted_mob]</font>!"))
							return
						else
							melee_delay = melee_delay_initial

						if (time_to_expire > 0)
							visible_message(SPAN_WARNING("[src] [melee_telegraph] <font color = 'blue'>[targetted_mob]</font>!"))
					addtimer(CALLBACK(src, proctocall), time_to_expire) //awful hack because melee attacks are handled differently

			if (RANGED_TYPE || RANGED_RAPID_TYPE)
				time_to_expire = delay_for_range
				if (telegraph) //no telegraph needed if the attack is instant

					if (!(fire_delay == 0)) //are we still charging our attack?
						fire_delay--
						visible_message(SPAN_WARNING("[src] [range_charge_telegraph] <font color = 'orange'>[targetted_mob]</font>!"))
						return
					else
						fire_delay = fire_delay_initial

					if (time_to_expire > 0)
						visible_message(SPAN_WARNING("[src] [range_telegraph] <font color = 'blue'>[targetted_mob]</font>!"))
					if (cast_beam)
						Beam(targetted_mob, icon_state = "1-full", time=(time_to_expire/10), maxdistance=(viewRange + 2), alpha_arg=telegraph_beam_alpha, color_arg = telegraph_beam_color)
				addtimer(CALLBACK(src, proctocall, targetted_mob), time_to_expire)

/**
 * Signal handler for COMSIG_TRACE_IMPACT signal.
 * Apon impact of the trace projectile, it will fire this signal, which will decide if the entity it impacted is our target. If no, we then
 * advance advancement turfs forward towards our target.
 *
 * Args:
 * trace: obj/item/projectile/test/impacttest. The trace we are registered to.
 * atom/impact_atom: The atom the trace impacted.
**/
/mob/living/carbon/superior_animal/proc/handle_trace_impact(var/obj/item/projectile/test/impacttest/trace, var/atom/impact_atom)
	SIGNAL_HANDLER

	UnregisterSignal(trace, COMSIG_TRACE_IMPACT)

	var/targetted_mob = (target_mob?.resolve())

	var/calculated_walk = (comfy_range - comfy_distance)

	if (impact_atom != targetted_mob)
		var/distance = (get_dist(src, targetted_mob))
		if (distance <= calculated_walk) //if we are within our comfy range but we cant attack, we need to reposition
			var/advance_steps = (distance - advancement)
			if (advance_steps <= 0)
				advance_steps = 1 //1 is the minimum distance
			walk_to(src, targetted_mob, advance_steps, move_to_delay) //advance forward, forcing us to pathfind
			advancing = TRUE // we dont want this overridden instantly

/// For when we want to set the mob's advancing var to false on a delay.
/mob/living/carbon/superior_animal/proc/handle_advancement_var()
	advancing = FALSE
