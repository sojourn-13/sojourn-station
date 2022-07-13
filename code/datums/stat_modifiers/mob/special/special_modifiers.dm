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
		melee = -30,
		bullet = -25,
		energy = -25,
		bomb = -20,
		agony = 50 //it doesnt care, it just wants you dead
	)

	max_health_adjustment = -15

	movement_adjust = -1 // fast

	projectile_armor_penetration_adjustment = 15
	armor_penetration_mult = 1.3
	armor_penetration_zeroth = 0.1

	melee_lower_mult = 1.5
	melee_upper_mult = 1.5

	inherent_projectile_mult = 1.5

	prefix = "Savage"

	stattags = RANGED_STATTAG | MELEE_STATTAG | NEGATIVE_DEFENSE_STATTAG

	description = "This one is always in a combat pose, looking for something to kill. You get the impression it might be too busy trying to kill you to care about it's own health."
