//Small side function for defining what mutations a "failed" recipe can result in.
//Made its own thing so it can be found and changed easily
//Used in onRecipeFail() in code/modules/genetics/genetics.dm
/datum/genetics/proc/getFailList()
	var/list/fail_list = list(
		MUTATION_IMBECILE,
		MUTATION_MOO)
	return(fail_list)