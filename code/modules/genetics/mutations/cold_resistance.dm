//Macro: COLD_RESISTANCE
/datum/genetics/mutation/cold_resistance
	var/mutation=0
	name="Bear Fur"
	key = "MUTATION_COLD_RESISTANCE"
	desc = "We've isolated the gene that keeps bears warm in winter."
	gain_text="Your body feels warm."
	mutation=COLD_RESISTANCE

/datum/genetics/mutation/disability/onPlayerImplant()
	if(!..())
		return
	if(mutation && !(mutation in container.holder.mutations))
		container.holder.mutations.Add(mutation)

/datum/genetics/mutation/disability/onPlayerRemove()
	if(!..())
		return
	if(mutation && (mutation in container.holder.mutations))
		container.holder.mutations.Remove(mutation)
