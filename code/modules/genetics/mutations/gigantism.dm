//Macro: MUTATION_GIGANTISM
/datum/genetics/mutation/gigantism
	name = "Gigantism"
	key = "MUTATION_GIGANTISM"
	desc = "Causes you to become big. VERY big."
	gain_text = "You feel your body getting larger, stronger, and slower..."
	var/old_size
	var/slowdown_delta
	var/brute_mod_delta
	var/oxy_mod_delta

/datum/genetics/mutation/gigantism/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	//Bigger
	old_size = human_holder.size_multiplier
	human_holder.size_multiplier = RESIZE_GIGANTOR
	human_holder.update_icons()

	//Stronger
	human_holder.stats.changeStat(STAT_ROB, 20)
	human_holder.stats.changeStat(STAT_TGH, 15)

	brute_mod_delta = (human_holder.brute_mod_perk * 0.2)
	human_holder.brute_mod_perk -= brute_mod_delta

	//Bigger need for air
	oxy_mod_delta = (human_holder.oxy_mod_perk * 0.2)
	human_holder.oxy_mod_perk += oxy_mod_delta

	//Slower
	slowdown_delta = human_holder.slowdown - (human_holder.slowdown * 0.8)
	human_holder.slowdown += slowdown_delta

/datum/genetics/mutation/gigantism/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	//Smaller
	human_holder.size_multiplier = old_size
	human_holder.update_icons()

	//Weaker
	human_holder.stats.changeStat(STAT_ROB, -20)
	human_holder.stats.changeStat(STAT_TGH, -15)

	human_holder.brute_mod_perk += brute_mod_delta

	//Need less air
	human_holder.oxy_mod_perk -= oxy_mod_delta

	//faster
	human_holder.slowdown -= slowdown_delta
