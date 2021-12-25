//Macro: MUTATION_MKNEWAIFUHAIR
/datum/genetics/mutation/bald
	name = "Bald"
	key = "MUTATION_MKNEWAIFUHAIR"
	desc = "Causes your hairline to recede... by alot."
	gain_text = "Your head feels a little itchy."

/datum/genetics/mutation/bald/onPlayerImplant(var/mob/living/carbon/mob)
	//calls proc in living carbon human to remove hair
	if(ishuman(mob))
		var/mob/living/carbon/human/H = mob
		H.ChangeHairToBald()
	//For those who are willing to take the hit and powergame. Fucking savages.
	container.holder.stats.changeStat(STAT_COG, 10)

/datum/genetics/mutation/bald/onPlayerRemove()
	gain_text = "Your head feels normal again."
	container.holder.stats.changeStat(STAT_COG, -10)
