//Macro: MUTATION_CLOAKING
/datum/genetics/mutation/cloaking
	name = "Cloaking"
	key = "MUTATION_CLOAKING"
	desc = "Causes light to bend around the affected target, making them see-through and harder to hit with ranged attacks."
	gain_text = "Your hands turn see-though..."
	instability = 30
	var/old_alpha
	var/mutation = CLOAKING

/datum/genetics/mutation/cloaking/onMobImplant()
	if(!..())
		return
	//Sneakier
	container.holder.mutations.Add(mutation)
	old_alpha = container.holder.alpha
	container.holder.alpha = 30
	container.holder.update_icons()

/datum/genetics/mutation/cloaking/onMobRemove()
	if(!..())
		return
	//Visible again
	container.holder.mutations.Remove(mutation)
	container.holder.alpha = old_alpha
	container.holder.update_icons()

