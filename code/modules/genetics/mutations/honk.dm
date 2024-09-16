//Macro: MUTATION_HONK
/datum/genetics/mutation/honk
	name = "Honk"
	key = "MUTATION_HONK"
	desc = "Causes the affected to honk annoyingly."
	gain_text = "You feel like a clown. HONK."
	var/cooldown = 1 MINUTES
	var/initial_time

/datum/genetics/mutation/honk/onMobImplant()
	initial_time = world.time
	initializeProcessing()

/datum/genetics/mutation/honk/onMobRemove()
	haltProcessing()

/datum/genetics/mutation/honk/Process()
	if(!..())
		return

	if(world.time < initial_time + cooldown)
		return

	initial_time = world.time
	container.holder.visible_message("<span class='name'>[container.holder]</span> honks.")
	return
