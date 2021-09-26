//Macro: MUTATION_COPY
/datum/genetics/mutation/copy_mob
	name = "Genetic Copy of a disappointing placeholder"
	key = "MUTATION_COPY_SHOULD/NOT/SHOW"
	embryo_descriptions = list(/datum/genetics/embryo_state/copy_mob_1)
	clone_gene = TRUE

/datum/genetics/mutation/copy_mob/New(var/source_type, var/source_name)
		source_mob = source_type
		source_name = source_name
		name = "Genetic Copy of [source_name]"
		key = "MUTATION_COPY_[source_mob]"

/datum/genetics/embryo_state/copy_mob_1
	desc = "The embryo resembles its parent closely."
	active_stage = 2 //What stage of development the descriptor becomes active.

/datum/genetics/mutation/copy_mob/onClone()
	..()
	return source_mob

	
