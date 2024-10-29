/datum/genetics/mutation/miner_sight
	name = "Miner Sight"
	key = "MUTATION_MINER_SIGHT"
	desc = "The holder is able to mine out ore vains and burrows with much more easy."
	var/mutation = MINING
	gain_text = "When looking at burrows and ore vains its hard to ignore the glints that sparkle now."
	instability = 25

/datum/genetics/mutation/miner_sight/onMobImplant()
	..()
	container.holder.mutations.Add(mutation)

/datum/genetics/mutation/miner_sight/onMobRemove()
	..()
	container.holder.mutations.Remove(mutation)
