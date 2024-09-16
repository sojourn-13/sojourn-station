//Macro: MUTATION_MOO
/datum/genetics/mutation/cow_moo
	name = "Moo"
	key = "MUTATION_MOO"
	desc = "Causes the affected to moo intermittantly."
	gain_text = "Your feel the urge to graze in a meadow. Moo..."
	var/cooldown = 3 MINUTES
	var/initial_time

/datum/genetics/mutation/cow_moo/onMobImplant()
	initial_time = world.time
	initializeProcessing()
	
/datum/genetics/mutation/cow_moo/onMobRemove()
	haltProcessing()

/datum/genetics/mutation/cow_moo/Process()
	if(!..())
		return

	if(world.time < initial_time + cooldown)
		return
	
	initial_time = world.time
	container.holder.visible_message("<span class='name'>[container.holder]</span> emits a haunting Moo.")
	return
