/datum/genetics/mutation/plasma_roach
	name = "Composite Roach"
	key = "MUTATION_PLASMA_ROACH"
	desc = "A strand of DNA that contains barely-stabilized roach DNA mixed with a spider's. It might not work well in the presence of other mutations until used to clone something."
	clone_gene = TRUE
	var/cloned_successfully = FALSE
	var/product = /mob/living/carbon/superior_animal/roach/plasmaroach

/datum/genetics/mutation/plasma_roach/onClone()
	..()
	if(container.mutation_pool.len > 1)
		return pickweight(list(/mob/living/carbon/superior_animal/roach = 7,
			/mob/living/carbon/superior_animal/roach/toxic = 2,
			/mob/living/carbon/superior_animal/roach/tank = 2,
			/mob/living/carbon/superior_animal/roach/toxic = 2,
			/mob/living/carbon/superior_animal/roach/glowing = 2,
			/mob/living/carbon/superior_animal/roach/nanite = 2,
			/mob/living/carbon/superior_animal/roach/glowing = 1,
			/mob/living/carbon/superior_animal/roach/hunter = 4,
			/mob/living/carbon/superior_animal/roach/support = 4,
			/mob/living/carbon/superior_animal/roach/fuhrer = 0.5))
	else
		return product

/datum/genetics/mutation/sac_contents/postCloneCreation(var/result)
	if(!istype(result, /mob/living/carbon/superior_animal/roach/plasmaroach))
		return
	#ifdef GUH??
	log_debug("Detected a LITERAL bomb-ass roach in the cloner, running : [src] postCloneCreation script")
	#endif
	var/mob/living/carbon/superior_animal/roach/plasmaroach/our_roach = result
	our_roach.unnatural_mutations.removeAllMutations()