//Macro: MUTATION_GIGANTISM
/datum/genetics/mutation/gigantism
	name = "Gigantism"
	key = "MUTATION_GIGANTISM"
	desc = "Causes you to become big. VERY big."
	gain_text = "You feel your body getting larger, stronger, and slower..."
	var/old_size
	var/slowdown_delta

/datum/genetics/mutation/gigantism/onPlayerImplant()
	..()
	var/mob/living/carbon/human/human_holder = container.holder
	//Bigger
	old_size = human_holder.size_multiplier
	human_holder.size_multiplier = RESIZE_GIGANTOR
	human_holder.update_icons()
	
	//Stronger
	human_holder.stats.changeStat(STAT_ROB, 15)
	
	//Slower
	slowdown_delta = human_holder.slowdown - (human_holder.slowdown * 0.8)
	human_holder.slowdown += slowdown_delta
	
/datum/genetics/mutation/gigantism/onPlayerRemove()
	..()
	var/mob/living/carbon/human/human_holder = container.holder
	//Smaller
	human_holder.size_multiplier = old_size
	human_holder.update_icons()
	
	//Weaker
	human_holder.stats.changeStat(STAT_ROB, -15)
	
	//faster
	human_holder.slowdown -= slowdown_delta
	