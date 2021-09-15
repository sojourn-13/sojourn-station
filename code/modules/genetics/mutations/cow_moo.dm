//Macro: MUTATION_MOO
/datum/genetics/mutation/cow_moo
	name = "Cow Skin"
	desc = "Causes the skin to become a little more leathery- the uncured sort."
	embryo_descriptions = list(/datum/genetics/embryo_state/cow_skin)
	gain_text = "Your skin feels a little thicker than usual. Wait, are those... Cow splotches?"
	var/cooldown = 3 MINUTES
	var/initial_time

/datum/genetics/embryo_state/cow_moo
	desc = "The embryo has large splotches on its skin."
	active_stage = 1 //What stage of development the descriptor becomes active.

/datum/genetics/mutation/cow_moo/onPlayerImplant()
	..()
	initial_time = world.time
	initializeProcessing()

/datum/genetics/mutation/cow_moo/onPlayerRemove()
	remove()

/datum/genetics/mutation/cow_moo/onMobImplant()
	..()
	initial_time = world.time
	initializeProcessing()
	
/datum/genetics/mutation/cow_moo/onMobRemove()
	remove()

/datum/genetics/mutation/cow_moo/on_process()
	if(!..())
		return

	if(container.holder.species.flags & NO_BREATHE)
		return

	if(world.time < initial_time + cooldown)
		return
	
	initial_time = world.time
	container.holder.visible_emote("emits a haunting Moo.")
