//Macro: MUTATION_RAND_UNSTABLE

/datum/genetics/mutation/rand_unstable
	name = "Unstable Genome"
	key = "MUTATION_RAND_SHOULD/NOT/SHOW"

/datum/genetics/mutation/rand_unstable/New()
		instability = rand(10,70)
		key = "MUTATION_RAND_UNSTABLE_[instability]"
