/mob/living/simple/hostile/creature
	name = "creature"
	desc = "A sanity-destroying otherthing."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("gibbers")
	icon_state = "otherthing"
	health = 80
	maxHealth = 80
	melee_damage_lower = 25
	melee_damage_upper = 50
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "creature"
	speed = 4
	sanity_damage = 2
	meat_type = /obj/item/reagent_containers/snacks/meat/human
	research_value = 500

/mob/living/simple/hostile/creature/cult
	faction = "cult"
	meat_type = /obj/item/reagent_containers/snacks/meat/human
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	supernatural = 1

/mob/living/simple/hostile/creature/tissue
	name  = "Mutated Tissue"
	desc = "An amalgamation of flesh and bone"
	color = "#8B0000"
	health = 200
	maxHealth = 200
	melee_damage_lower = 20
	melee_damage_upper = 35
	research_value = 800

/mob/living/simple/hostile/retaliate/spaceman
	name = "spaceman"
	desc = "This strange being resembles a human, but is something different entirely."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "old"
	icon_dead = "old_dead"
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "punches"
	health = 100
	maxHealth = 100
	melee_damage_lower = 5
	melee_damage_upper = 10
	attacktext = "hits"
	meat_type = /obj/item/reagent_containers/snacks/meat/human
	research_value = 150

/mob/living/simple/hostile/retaliate/spaceman/leader
	name = "spaceman leader"
	desc = "This appears to be an important figure among its strange kind."
	icon_state = "old2"
	icon_dead = "old2_dead"
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "punches"
	health = 200
	maxHealth = 200
	melee_damage_lower = 20
	melee_damage_upper = 40
	attacktext = "hits"
	meat_type = /obj/item/reagent_containers/snacks/meat/human
	research_value = 300

/mob/living/simple/hostile/madminer
	name = "thing"
	desc = "It isn't a person."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "plasma_miner"
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "punches"
	health = 100
	maxHealth = 100
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "hits"
	sanity_damage = 1
	meat_type = /obj/item/reagent_containers/snacks/meat/human
	attack_sound = 'sound/weapons/rapierhit.ogg'
	research_value = 250

/mob/living/simple/hostile/madminer/armed
	desc = "It isn't a person and its armed."
	melee_damage_lower = 20
	melee_damage_upper = 25
	research_value = 350

/mob/living/simple/hostile/madminer/death(gibbed, deathmessage = "vanishes with a scream of agony!")
	..()
	playsound(src, 'sound/hallucinations/wail.ogg', 75, 1, -3)
	qdel(src)

/mob/living/simple/hostile/madminer/faceless
	name = "faceless"
	desc = "Nothing is right."
	icon_state = "faceless"
	health = 1000
	maxHealth = 1000
	sanity_damage = 4
	research_value = 5000

/mob/living/simple/hostile/madminer/cultist
	name = "cultist"
	desc = "Some things are older than we can ever understand."
	icon_state = "cultist"
	melee_damage_lower = 20
	melee_damage_upper = 25
	health = 150
	maxHealth = 150
	research_value = 400

/mob/living/simple/hostile/sargoyle
	name = "sargoyle"
	desc = "A large flying creature native to the planet, with leathery wings and a toothy maw. Though blind, this creature uses sonar, making it highly skilled at fighting in the dark ."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("gibbers")
	icon_state = "devil"
	health = 120 * CAVEMOB_HEALTH_MOD
	maxHealth = 120 * CAVEMOB_HEALTH_MOD
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "scarybat"
	speed = 6
	has_special_parts = TRUE
	inherent_mutations = list(MUTATION_BLINDNESS, MUTATION_ECHOLOCATION, MUTATION_TOXIN_RESISTANCE, MUTATION_BLOOD_BANK)
	special_parts = list(/obj/item/animal_part/sarg_horn, /obj/item/animal_part/sarg_horn)
	armor = list(melee = 1, bullet = 2, energy = 0, bomb = 25, bio = 0, rad = 25)
	research_value = 300

/*
#define MOOK_ATTACK_NEUTRAL 0
#define MOOK_ATTACK_WARMUP 1
#define MOOK_ATTACK_ACTIVE 2
#define MOOK_ATTACK_RECOVERY 3
#define ATTACK_INTERMISSION_TIME 5

//Fragile but highly aggressive wanderers that pose a large threat in numbers.
//They'll attempt to leap at their target from afar using their hatchets.
/mob/living/simple/hostile/mook
	name = "wanderer"
	desc = "This unhealthy looking primitive is wielding a rudimentary hatchet, swinging it with wild abandon. One isn't much of a threat, but in numbers they can quickly overwhelm a superior opponent."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "mook"
	icon_living = "mook"
	icon_dead = "mook_dead"
	pixel_x = -16
	maxHealth = 45
	health = 45
	melee_damage_lower = 30
	melee_damage_upper = 30
	pixel_y = -8
	ranged = TRUE
	var/ranged_cooldown_time = 10
	attack_sound = 'sound/weapons/rapierhit.ogg'
	aggro_vision_range = 15 //A little more aggressive once in combat to balance out their really low HP
	var/attack_state = MOOK_ATTACK_NEUTRAL
	var/struck_target_leap = FALSE
/*
/mob/living/simple/hostile/mook/CanAllowThrough(atom/movable/O)
	. = ..()
	if(istype(O, /mob/living/simple/hostile/mook))
		var/mob/living/simple/hostile/mook/M = O
		if(M.attack_state == MOOK_ATTACK_ACTIVE && M.throwing)
			return TRUE
*/
/mob/living/simple/hostile/mook/death()
	playsound(src.loc, 'sound/voice/mook_death.ogg', 100, 1)
	desc = "A deceased primitive. Upon closer inspection, it was suffering from severe cellular degeneration and its garments are machine made..."//Can you guess the twist
	return ..()

/mob/living/simple/hostile/mook/AttackingTarget()
	if(isliving(target_mob))
		if(ranged_cooldown <= world.time && attack_state == MOOK_ATTACK_NEUTRAL)
			var/mob/living/L = target_mob
			if(L.incapacitated())
				WarmupAttack(forced_slash_combo = TRUE)
				return
			WarmupAttack()
		return
	return ..()

/mob/living/simple/hostile/mook/MoveToTarget()
	if(attack_state != MOOK_ATTACK_NEUTRAL)
		return
	return ..()

/mob/living/simple/hostile/mook/Move()
	if(attack_state == MOOK_ATTACK_WARMUP || attack_state == MOOK_ATTACK_RECOVERY)
		return
	return ..()

/mob/living/simple/hostile/mook/proc/WarmupAttack(forced_slash_combo = FALSE)
	if(attack_state == MOOK_ATTACK_NEUTRAL && target_mob)
		attack_state = MOOK_ATTACK_WARMUP
		walk(src,0)
		update_icons()
		if(prob(50) && get_dist(src,target_mob) <= 3 || forced_slash_combo)
			addtimer(CALLBACK(src, PROC_REF(SlashCombo)), ATTACK_INTERMISSION_TIME)
			return
		addtimer(CALLBACK(src, PROC_REF(LeapAttack)), ATTACK_INTERMISSION_TIME + rand(0,3))
		return
	attack_state = MOOK_ATTACK_RECOVERY
	ResetNeutral()

/mob/living/simple/hostile/mook/proc/SlashCombo()
	if(attack_state == MOOK_ATTACK_WARMUP && !stat)
		attack_state = MOOK_ATTACK_ACTIVE
		update_icons()
		SlashAttack()
		addtimer(CALLBACK(src, PROC_REF(SlashAttack)), 3)
		addtimer(CALLBACK(src, PROC_REF(SlashAttack)), 6)
		addtimer(CALLBACK(src, PROC_REF(AttackRecovery)), 9)

/mob/living/simple/hostile/mook/proc/SlashAttack()
	if(target_mob && !stat && attack_state == MOOK_ATTACK_ACTIVE)
		melee_damage_lower = 15
		melee_damage_upper = 15
		var/mob_direction = get_dir(src,target_mob)
		if(get_dist(src,target_mob) > 1)
			step(src,mob_direction)
		//if(targets_from && isturf(targets_from.loc) && target_mob.Adjacent(targets_from) && isliving(target_mob))
			//var/mob/living/L = target_mob
			//L.attack_animal(src)
			//return
		var/swing_turf = get_step(src,mob_direction)
		new /obj/effect/temp_visual/kinetic_blast(swing_turf)
		playsound(src, 'sound/weapons/slashmiss.ogg', 50, TRUE)

/obj/effect/temp_visual/kinetic_blast
	name = "kinetic explosion"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "kinetic_blast"
	layer = ABOVE_ALL_MOB_LAYER
	duration = 4

/mob/living/simple/hostile/mook/proc/LeapAttack()
	if(target_mob && !stat && attack_state == MOOK_ATTACK_WARMUP)
		attack_state = MOOK_ATTACK_ACTIVE
		density = FALSE
		melee_damage_lower = 30
		melee_damage_upper = 30
		update_icons()
		new /obj/effect/temp_visual/mook_dust(get_turf(src))
		playsound(src, 'sound/weapons/thudswoosh.ogg', 25, TRUE)
		playsound(src, 'sound/voice/mook_leap_yell.ogg', 100, TRUE)
		var/target_turf = get_turf(target_mob)
		throw_at(target_turf, 7, 1, src, FALSE, callback = CALLBACK(src, PROC_REF(AttackRecovery)))
		return
	attack_state = MOOK_ATTACK_RECOVERY
	ResetNeutral()

/mob/living/simple/hostile/mook/proc/AttackRecovery()
	if(attack_state == MOOK_ATTACK_ACTIVE && !stat)
		attack_state = MOOK_ATTACK_RECOVERY
		density = TRUE
		face_atom(target_mob)
		if(!struck_target_leap)
			update_icons()
		struck_target_leap = FALSE
		if(prob(40))
			attack_state = MOOK_ATTACK_NEUTRAL
			if(target_mob)
				if(isliving(target_mob))
					var/mob/living/L = target_mob
					if(L.incapacitated() && L.stat != DEAD)
						addtimer(CALLBACK(src, PROC_REF(WarmupAttack), TRUE), ATTACK_INTERMISSION_TIME)
						return
			addtimer(CALLBACK(src, PROC_REF(WarmupAttack)), ATTACK_INTERMISSION_TIME)
			return
		addtimer(CALLBACK(src, PROC_REF(ResetNeutral)), ATTACK_INTERMISSION_TIME)

/mob/living/simple/hostile/mook/proc/ResetNeutral()
	if(attack_state == MOOK_ATTACK_RECOVERY)
		attack_state = MOOK_ATTACK_NEUTRAL
		ranged_cooldown = world.time + ranged_cooldown_time
		update_icons()
		if(target_mob && !stat)
			update_icons()
			MoveToTarget(target_mob, move_to_delay, minimum_distance)

/mob/living/simple/hostile/mook/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(isliving(hit_atom) && attack_state == MOOK_ATTACK_ACTIVE)
		var/mob/living/L = hit_atom
		if(AttackTarget(L))
			//L.attack_animal(src)
			struck_target_leap = TRUE
			density = TRUE
			update_icons()
	var/mook_under_us = FALSE
	for(var/A in get_turf(src))
		if(struck_target_leap && mook_under_us)
			break
		if(A == src)
			continue
		if(isliving(A))
			var/mob/living/ML = A
			if(!struck_target_leap && AttackTarget(ML))//Check if some joker is attempting to use rest to evade us
				struck_target_leap = TRUE
				//ML.attack_animal(src)
				density = TRUE
				struck_target_leap = TRUE
				update_icons()
				continue
			if(istype(ML, /mob/living/simple/hostile/mook) && !mook_under_us)//If we land on the same tile as another mook, spread out so we don't stack our sprite on the same tile
				var/mob/living/simple/hostile/mook/M = ML
				if(!M.stat)
					mook_under_us = TRUE
					var/anydir = pick(GLOB.cardinals)
					Move(get_step(src, anydir), anydir)
					continue
/*
/mob/living/simple/hostile/mook/handle_automated_action()
	if(attack_state)
		return
	return ..()
*/
/mob/living/simple/hostile/mook/OpenFire()
	if(isliving(target_mob))
		var/mob/living/L = target_mob
		if(L.incapacitated())
			return
	WarmupAttack()

/mob/living/simple/hostile/mook/update_icons()
	. = ..()
	if(!stat)
		switch(attack_state)
			if(MOOK_ATTACK_NEUTRAL)
				icon_state = "mook"
			if(MOOK_ATTACK_WARMUP)
				icon_state = "mook_warmup"
			if(MOOK_ATTACK_ACTIVE)
				if(!density)
					icon_state = "mook_leap"
					return
				if(struck_target_leap)
					icon_state = "mook_strike"
					return
				icon_state = "mook_slash_combo"
			if(MOOK_ATTACK_RECOVERY)
				icon_state = "mook"

/obj/effect/temp_visual/mook_dust
	name = "dust"
	desc = "It's just a dust cloud!"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "mook_leap_cloud"
	layer = BELOW_MOB_LAYER
	pixel_x = -16
	pixel_y = -16
	duration = 10

#undef MOOK_ATTACK_NEUTRAL
#undef MOOK_ATTACK_WARMUP
#undef MOOK_ATTACK_ACTIVE
#undef MOOK_ATTACK_RECOVERY
#undef ATTACK_INTERMISSION_TIME
*/
