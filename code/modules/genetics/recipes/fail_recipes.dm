//Small side function for defining what mutations a "failed" recipe can result in.
//Made its own thing so it can be found and changed easily
//Used in onRecipeFail() in code/modules/genetics/genetics.dm
/datum/genetics/proc/getFailList()
	var/list/fail_list = list(
		MUTATION_IMBECILE,
		MUTATION_MOO,
		MUTATION_IMBECILE,
		MUTATION_EPILEPSY,
		MUTATION_COUGHING,
		MUTATION_CLUMSY,
		MUTATION_TOURETTES,
		MUTATION_NERVOUSNESS,
		MUTATION_BLINDNESS,
		MUTATION_DEAF,
		MUTATION_NEARSIGHTED,
		MUTATION_UNBALANCED,
		MUTATION_RAND_UNSTABLE)
	return(fail_list)