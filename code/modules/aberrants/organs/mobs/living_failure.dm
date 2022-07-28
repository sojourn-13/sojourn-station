/mob/living/carbon/superior_animal/living_failure
	name = "living failure"
	desc = "A man-made perversion of the human form."
	icon = 'icons/mob/living_failure.dmi'
	icon_state = "living_failure"
	icon_dead = "living_failure_dead"
	health = 500
	maxHealth = 500
	attacktext = "flung"
	mob_size = MOB_MEDIUM
	mob_classification = CLASSIFICATION_HUMANOID
	move_to_delay = 7

	density = TRUE

	attack_sound = 'sound/effects/blobattack.ogg'
	emote_see = list("squirms uncomfortably.")
	turns_per_move = 4
	turns_since_move = 0

	meat_type = /obj/item/organ/internal/scaffold/aberrant/teratoma/random
	meat_amount = 6		// Harvest() divides this by two

	// special drop
	var/harvest_loot_type = /obj/item/organ/internal/scaffold/aberrant/living_failure_brain
	var/harvest_probability = 5

	melee_damage_lower = 10
	melee_damage_upper = 15
	armor_penetration = 0

	ranged = TRUE
	rapid = TRUE
	//kept_distance = 3
	acceptableTargetDistance = 5 //consider all targets within this range equally
	projectiletype = /obj/item/projectile/parasitic_teratoma
	projectilesound = 'sound/effects/blobattack.ogg'
	ranged_cooldown = 4
	fire_verb = "ejects a teratoma"

	armor = list(
		melee = 40,
		bullet = 20,
		energy = 20,
		bomb = 20,
		bio = 100,
		rad = 100
	)

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	faction = "abomination"
	pass_flags = PASSTABLE
	randpixel = 4

	sanity_damage = 1

	can_burrow = FALSE

/mob/living/carbon/superior_animal/living_failure/UnarmedAttack()
	..()
	if(istype(target_mob, /atom/movable))
		var/atom/movable/AM = target_mob
		AM.throw_at_random(FALSE, 5, 2)
		if(isliving(target_mob))
			var/mob/living/L = target_mob
			L.apply_damage(5, BRUTE)
			L.apply_damage(10, HALLOSS)

/mob/living/carbon/superior_animal/living_failure/harvest(mob/user)
	..()
	if((stat == DEAD) && prob(harvest_probability))
		new harvest_loot_type(src)
