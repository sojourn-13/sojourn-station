//Macro: MUTATION_BLOOD_BANK
/datum/genetics/mutation/blood_bank
	name = "Blood Banks"
	key = "MUTATION_BLOOD_BANK"
	desc = "Slightly increases the amount of blood the person has."
	gain_text = "You feel your veins tingle and pulsate."
	exclusive_type = MUT_TYPE_NONE //Just free
	instability = 10 //10 as this isnt all that big of a game changer

//Normally the hooman body has 560 drams of blood that can be stored, this gives it an additional 11~% blood

/datum/genetics/mutation/blood_bank/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  += 60

/datum/genetics/mutation/blood_bank/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  -= 60