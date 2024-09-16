//Macro: MUTATION_ROACH_BLOOD
/datum/genetics/mutation/roachblood
	name = "Roach Blood"
	key = "MUTATION_ROACH_BLOOD"
	desc = "Causes the blood to run green, and allows the body to process blattedin as a healing agent."
	var/mutation = ROACH_BLOOD
	gain_text = "Your blood tingles... And your veins turn green."

/datum/genetics/mutation/roachblood/onMobImplant()
	..()
	container.holder.mutations.Add(mutation)
	
/datum/genetics/mutation/roachblood/onMobRemove()
	..()
	container.holder.mutations.Remove(mutation)
