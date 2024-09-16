//Macro: MUTATION_SCREAMING
/datum/genetics/mutation/screaming
	name = "Screaming"
	key = "MUTATION_SCREAMING"
	desc = "Causes the subject to scream every now and then."
	gain_text = "Your feel the urge to call out to the world."
	var/cooldown = 1 MINUTES
	var/initial_time

/datum/genetics/mutation/screaming/onMobImplant()
	initial_time = world.time
	initializeProcessing()

/datum/genetics/mutation/screaming/onMobRemove()
	haltProcessing()

/datum/genetics/mutation/screaming/Process()
	if(!..())
		return

	if(world.time < initial_time + cooldown)
		return

	initial_time = world.time
	container.holder.emote("scream")
	return
