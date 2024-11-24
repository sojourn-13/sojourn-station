/datum/genetics/mutation/miner_sight
	name = "Miner Sight"
	key = "MUTATION_MINER_SIGHT"
	desc = "The holder is able to mine more ore veins and close burrows with ease."
	var/mutation = MINING
	gain_text = "When looking at burrows and ore veins its hard to ignore the glints that now seem to shimmer."
	instability = 25

/datum/genetics/mutation/miner_sight/onMobImplant()
	..()
	container.holder.mutations.Add(mutation)

/datum/genetics/mutation/miner_sight/onMobRemove()
	..()
	container.holder.mutations.Remove(mutation)
