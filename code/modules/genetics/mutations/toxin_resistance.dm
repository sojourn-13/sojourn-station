//Macro: MUTATION_TOXIN_RESISTANCE
/datum/genetics/mutation/toxin_resistance
	name = "Toxin Resistance"
	key = "MUTATION_TOXIN_RESISTANCE"
	desc = "Causes the body to process certain poisons easier."
	gain_text = "Your body feels clean."
	instability = 20

/datum/genetics/mutation/toxin_resistance/onMobImplant()
	..()
	container.holder.toxin_mod_perk -= 0.1

/datum/genetics/mutation/toxin_resistance/onMobRemove()
	..()
	container.holder.toxin_mod_perk += 0.1
