//Macro: MUTATION_COPY

//A special mutation type for determining what a creature becomes when cloned.
/datum/genetics/mutation/copy_mob
	name = "Genetic Copy of a disappointing placeholder"
	key = "MUTATION_COPY_SHOULD/NOT/SHOW"
	desc = "An isolated section of the gene pool that can be used for cloning a creature."
	clone_gene = TRUE
	instability = 0

/datum/genetics/mutation/copy_mob/New(var/incoming_type, var/incoming_name)
		source_mob = incoming_type
		source_name = incoming_name
		name = "Genetic Copy of \a [source_name]"
		key = "MUTATION_COPY_[source_mob]"

/datum/genetics/mutation/copy_mob/onClone()
	..()
	return source_mob