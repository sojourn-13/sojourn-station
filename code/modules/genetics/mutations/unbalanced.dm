//Macro: MUTATION_UNBALANCED
/datum/genetics/mutation/unbalanced
	name = "Unbalanced"
	key = "MUTATION_UNBALANCED"
	desc = "Removes any sense of balance from the effected."
	gain_text = "The ground doesn't feel stable anymore..."
	var/cooldown = 0 //start at a high probability

/datum/genetics/mutation/unbalanced/onMobImplant()
	cooldown = 30
	initializeProcessing()

/datum/genetics/mutation/unbalanced/onMobRemove()
	haltProcessing()

/datum/genetics/mutation/unbalanced/Process()
	if(!..())
		return

	if(!prob(cooldown)) //Steadily building, but still unpredictable chance that the cooldown procs
		cooldown++
		return

	cooldown = 0

	if(!container.holder.weakened && !container.holder.lying)
		to_chat(container.holder, SPAN_NOTICE("You lose your balance for a bit, and fall over!"))

	container.holder.Weaken(10)
	return
