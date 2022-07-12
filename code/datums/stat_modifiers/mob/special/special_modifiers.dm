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
