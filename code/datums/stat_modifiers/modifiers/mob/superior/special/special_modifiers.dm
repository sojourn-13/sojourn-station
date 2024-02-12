/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive

	prefix = "Aggressive"

	description = "This one seems to be somewhat more aggressive than the others. It's likely to chase you down if it can't see you."

	stattags = RANGED_STATTAG //advancing only supported by ranged mobs

/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/remove()

	. = ..()

	if (issuperioranimal(holder))
		var/mob/living/carbon/superior_animal/superior_holder = holder

		superior_holder.advance = initial(superior_holder.advance)
		superior_holder.advance_if_cant_see = initial(superior_holder.advance_if_cant_see) //reset the values

/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/apply_to(atom/target)

	. = ..()

	if (issuperioranimal(target))
		var/mob/living/carbon/superior_animal/superior_target = target

		superior_target.advance = TRUE
		superior_target.advance_if_cant_see = TRUE

/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive/savage

	armor_adjustment = list(
		melee = -10,
		bullet = -8,
		energy = -8,
		bomb = -40,
		agony = 12 //it doesnt care, it just wants you dead
	)

	maxHealth_mult = 0.8 //80% hp

	move_to_delay_increment = -1.3 // fast

	projectile_armor_divisor_mult_increment = 0.5
	armor_divisor_mult = 1.5
	armor_divisor_zeroth = 0.1

	melee_damage_lower_mult = 1.5
	melee_damage_upper_mult = 1.5

	inherent_projectile_mult_increment = 0.5

	mutually_exclusive_with = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/aggressive
	)

	prefix = "Savage"

	stattags = RANGED_STATTAG | MELEE_STATTAG | NEGATIVE_DEFENSE_STATTAG

	description = "This one is always in a combat pose, looking for something to kill. You get the impression it might be too busy trying to kill you to care about it's own health."
