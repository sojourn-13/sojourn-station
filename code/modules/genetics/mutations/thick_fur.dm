//Macro: THICK_FUR
/datum/genetics/mutation/thick_fur
	var/mutation=0
	name="Thick Fur"
	key = "MUTATION_THICK_FUR"
	desc = "We've isolated the gene that causes thick warm fur to be present."
	gain_text="Your body feels warm and safe."
	exclusive_type = MUT_TYPE_SKIN
	instability = 20
	mutation=COLD_RESISTANCE
//Gives cold resistance and even brute resistance. But your fur is flammable. Dont get lit~

/datum/genetics/mutation/thick_fur/onPlayerImplant()
	if(!..())
		return
	container.holder.brute_mod_perk *= 0.75
	container.holder.burn_mod_perk *= 1.25
	if(mutation && !(mutation in container.holder.mutations))
		container.holder.mutations.Add(mutation)

/datum/genetics/mutation/thick_fur/onPlayerRemove()
	if(!..())
		return
	container.holder.brute_mod_perk /= 0.75
	container.holder.burn_mod_perk /= 1.25
	if(mutation && (mutation in container.holder.mutations))
		container.holder.mutations.Remove(mutation)
