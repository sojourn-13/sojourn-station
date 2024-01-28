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

//Macro: MUTATION_BLOOD_RIVER
/datum/genetics/mutation/blood_river
	name = "Blood River"
	key = "MUTATION_BLOOD_RIVER"
	desc = "Increases the amount of blood the person has."
	gain_text = "You feel like your heart is working harder."
	exclusive_type = MUT_TYPE_NONE //Just free
	instability = 15

/datum/genetics/mutation/blood_river/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  += 100

/datum/genetics/mutation/blood_river/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  -= 100

//Macro: MUTATION_BLOOD_LAKE
/datum/genetics/mutation/blood_lake
	name = "Blood Lake"
	key = "MUTATION_BLOOD_LAKE"
	desc = "Greatly increases the amount of blood the person has."
	gain_text = "You feel like your more blood then flesh."
	exclusive_type = MUT_TYPE_NONE
	instability = 20

/datum/genetics/mutation/blood_lake/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  += 140
	//Slower
	human_holder.slowdown += 0.5 //for refence shoes are -1

/datum/genetics/mutation/blood_lake/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  -= 140
	//Slower
	human_holder.slowdown -= 0.5

//Macro: MUTATION_BLOOD_SEA
/datum/genetics/mutation/blood_sea
	name = "Blood Sea"
	key = "MUTATION_BLOOD_SEA"
	desc = "Massively increases the amount of blood the person has."
	gain_text = "You feel like your a blood-loon!"
	exclusive_type = MUT_TYPE_NONE //Just free
	instability = 40 //This one is accully a bad step before it gets better

/datum/genetics/mutation/blood_sea/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  += 180
	//Slower
	human_holder.slowdown += 1.5 //for refence shoes are -1

/datum/genetics/mutation/blood_sea/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  -= 180
	//Slower
	human_holder.slowdown -= 1.5

//Macro: MUTATION_BLOOD_TEMPLE
/datum/genetics/mutation/blood_temple
	name = "Blood Temple"
	key = "MUTATION_BLOOD_TEMPLE"
	desc = "Insanely increases the amount of blood the person has."
	gain_text = "Blood and body are one in the same now."
	exclusive_type = MUT_TYPE_NONE
	instability = 35 //Massive change as this is like 1/3s increase

/datum/genetics/mutation/blood_temple/onPlayerImplant()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  += 180

/datum/genetics/mutation/blood_temple/onPlayerRemove()
	if(!..())
		return
	var/mob/living/carbon/human/human_holder = container.holder
	human_holder.vessel.maximum_volume  -= 180