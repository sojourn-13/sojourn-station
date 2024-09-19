/datum/genetics/mutation/painless
	name = "Painless"
	key = "MUTATION_NO_PAIN"
	desc = "You no longer feel pain."
	gain_text = "Your sensation of pain fades completely."
	var/add_mutation = PAIN_LESS

/datum/genetics/mutation/painless/onMobImplant()
	..()
	container.holder.mutations.Add(add_mutation)

/datum/genetics/mutation/painless/onMobRemove()
	..()
	container.holder.mutations.Remove(add_mutation)
