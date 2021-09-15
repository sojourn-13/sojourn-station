//Macro: MUTATION_COPY
/datum/genetics/mutation/copy_mob
	name = "Genetic Copy of a disappointing placeholder"
	embryo_descriptions = list(/datum/genetics/embryo_state/copy_mob_1)
	clone_gene = TRUE

/datum/genetics/mutation/copy_mob/New(var/mob/living/source)
		source_mob = source
		name = "Genetic Copy of [source_mob.name]"


/datum/genetics/embryo_state/copy_mob_1
	desc = "The embryo resembles its parent closely."
	active_stage = 2 //What stage of development the descriptor becomes active.

/datum/genetics/mutation/copy_mob/onClone()
	..()
	//TODO: Spawn perfect copy in cloner.
