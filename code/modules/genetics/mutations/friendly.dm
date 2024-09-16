/datum/genetics/mutation/friendly
	name = "Naturally Friendly"
	key = "MUTATION_FRIENDLY"
	desc = "Causes an implanted (nonhuman) creature to become friendly."
	instability = 30
	var/isvalid = FALSE
	var/was_colony_friend
	var/was_friendly_to_colony
	var/old_faction
	var/was_destroying_surroundings
	var/was_smashing
	var/was_burrowing

/datum/genetics/mutation/friendly/onMobImplant()
	..()
	if(istype(container.holder, /mob/living/carbon/superior_animal))
		isvalid = TRUE
		var/mob/living/carbon/superior_animal/greater = container.holder

		was_colony_friend = greater.colony_friend
		greater.colony_friend = TRUE

		was_friendly_to_colony = greater.friendly_to_colony
		greater.friendly_to_colony = TRUE

		old_faction = greater.faction
		greater.faction = "neutral"

		was_destroying_surroundings = greater.destroy_surroundings
		greater.destroy_surroundings = FALSE

		was_smashing = greater.environment_smash
		greater.environment_smash = 0

		for (var/mob/living/carbon/human/ally in range(10, get_turf(container.holder)))
			greater.friends += ally

	else if(istype(container.holder, /mob/living/simple_animal))
		isvalid = TRUE
		var/mob/living/simple_animal/lesser = container.holder

		was_colony_friend = lesser.colony_friend
		lesser.colony_friend = TRUE

		was_friendly_to_colony = lesser.friendly_to_colony
		lesser.friendly_to_colony = TRUE

		old_faction = lesser.faction
		lesser.faction = "neutral"

		if(istype(container.holder, /mob/living/simple_animal/hostile))
			var/mob/living/simple_animal/hostile/hostie = container.holder

			was_destroying_surroundings = hostie.destroy_surroundings
			hostie.destroy_surroundings = FALSE

			was_burrowing = hostie.can_burrow
			hostie.can_burrow = FALSE

			was_destroying_surroundings = hostie.destroy_surroundings
			hostie.destroy_surroundings = FALSE

			was_smashing = hostie.environment_smash
			hostie.environment_smash = 0

			for (var/mob/living/carbon/human/ally in range(10, get_turf(container.holder)))
				hostie.friends += ally

	else
		isvalid = FALSE


/datum/genetics/mutation/friendly/onMobRemove()
	..()
	if(!isvalid)
		return

	if(istype(container.holder, /mob/living/carbon/superior_animal))
		var/mob/living/carbon/superior_animal/greater = container.holder
		greater.colony_friend = was_colony_friend
		greater.friendly_to_colony = was_friendly_to_colony
		greater.faction = old_faction
		greater.friends = list()
		greater.destroy_surroundings = was_destroying_surroundings
		greater.environment_smash = was_smashing


	else if(istype(container.holder, /mob/living/simple_animal))
		var/mob/living/simple_animal/lesser = container.holder
		lesser.colony_friend = was_colony_friend
		lesser.friendly_to_colony = was_friendly_to_colony
		lesser.faction = old_faction

		if(istype(container.holder, /mob/living/simple_animal/hostile))
			var/mob/living/simple_animal/hostile/hostie = container.holder
			hostie.destroy_surroundings = was_destroying_surroundings
			hostie.environment_smash = was_smashing
			hostie.can_burrow = was_burrowing
			hostie.friends = list()

