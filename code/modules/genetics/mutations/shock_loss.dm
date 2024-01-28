//Macro: MUTATION_SHOCK_LESS
/datum/genetics/mutation/shock_less
	name = "Pain Shock Tolerance"
	key = "MUTATION_SHOCK_LESS"
	desc = "Nerve dulling that aids in preventing a person from locking up from pain."
	var/mutation = SHOCK_LESS
	gain_text = "Your nerves twitch and flex a little."
	instability = 25

/datum/genetics/mutation/shock_less/onMobImplant()
	..()
	container.holder.mutations.Add(mutation)

/datum/genetics/mutation/shock_less/onMobRemove()
	..()
	container.holder.mutations.Remove(mutation)
