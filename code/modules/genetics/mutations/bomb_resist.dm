//Macro: MUTATION_BOMB_RESIST
/datum/genetics/mutation/bomb_resist
	name = "Explosive Protection"
	key = "MUTATION_BOMB_RESIST"
	desc = "Your skin feels puffy. Like thick foam has formed under it."
	exclusive_type = MUT_TYPE_SKIN // no stacking it all together
	gain_text = "You feel protected from an invisible threat"
	instability = 30

/datum/genetics/mutation/bomb_resist/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.mob_bomb_defense += 50 // Gives the player a hefty bomb resistance. Not perfect but can be stacked with rough life.

/datum/genetics/mutation/bomb_resist/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.mob_bomb_defense -= 50
