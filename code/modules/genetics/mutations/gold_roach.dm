/datum/genetics/mutation/gold_roach
	name = "Strange Roach"
	key = "MUTATION_GOLD_ROACH"
	desc = "A strand of DNA that contains barely-stabilized roach DNA. It might not work well in the presence of other mutations until used to clone something."
	clone_gene = TRUE
	var/cloned_successfully = FALSE
	var/product = /mob/living/carbon/superior/roach/golden

/datum/genetics/mutation/gold_roach/onClone()
	..()
	if(container.mutation_pool.len > 1)
		return pickweight(list(/mob/living/carbon/superior/roach = 7,
			/mob/living/carbon/superior/roach/fat = 2,
			/mob/living/carbon/superior/roach/tank = 2,
			/mob/living/carbon/superior/roach/toxic = 2,
			/mob/living/carbon/superior/roach/glowing = 2,
			/mob/living/carbon/superior/roach/nanite = 2,
			/mob/living/carbon/superior/roach/glowing = 1,
			/mob/living/carbon/superior/roach/hunter = 4,
			/mob/living/carbon/superior/roach/support = 4,
			/mob/living/carbon/superior/roach/fuhrer = 0.5))
	else
		return product

//If we cloned the right creature, purge this mutation so it'll generate a normal on_clone mutation when we go to butcher it.
/datum/genetics/mutation/gold_roach/postCloneCreation(var/result)
	if(!istype(result, /mob/living/carbon/superior/roach/golden))
		return
	#ifdef JANEDEBUG
	log_debug("Detected a bomb-ass roach in the cloner, running : [src] postCloneCreation script")
	#endif
	var/mob/living/carbon/superior/roach/golden/our_roach = result
	our_roach.unnatural_mutations.removeAllMutations()
