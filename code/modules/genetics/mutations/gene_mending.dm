
//Macro: MUTATION_GENE_MENDING
/datum/genetics/mutation/gene_mending
	name = "DNA Mending"
	key = "MUTATION_GENE_MENDING"
	desc = "Simply helps stability."
	gain_text = "Nothing seems to change."
	instability = -10

//Macro: MUTATION_GENE_MENDING_H
/datum/genetics/mutation/gene_mending_h
	name = "DNA Healing"
	key = "MUTATION_GENE_MENDING_H"
	desc = "Simply helps stability at the cost of users health."
	gain_text = "Nothing seems to change?"
	instability = -10

/datum/genetics/mutation/gene_mending_h/onPlayerImplant()
	..()
	var/mob/living/carbon/human/H = container.holder
	H.maxHealth -= 10

/datum/genetics/mutation/gene_mending_h/onMobImplant()
	..()
	var/mob/M = container.holder
	M.maxHealth -= 10

/datum/genetics/mutation/gene_mending_h/onPlayerRemove()
	..()
	var/mob/living/carbon/human/H = container.holder
	H.maxHealth += 10

/datum/genetics/mutation/gene_mending_h/onMobRemove()
	..()
	var/mob/M = container.holder
	M.maxHealth += 10

//Macro: MUTATION_GENE_MENDING_R
/datum/genetics/mutation/gene_mending_r
	name = "DNA Robusting"
	key = "MUTATION_GENE_MENDING_R"
	desc = "Simply helps stability at the cost of being much more sensitive to chemicals."
	gain_text = "Nothing seems to change..."
	instability = -10

/datum/genetics/mutation/gene_mending_r/onPlayerImplant()
	..()
	var/mob/living/carbon/human/H = container.holder
	H.metabolism_effects.nsa_mult -= 0.10 //10% less NSA,
	H.metabolism_effects.calculate_nsa()

/datum/genetics/mutation/gene_mending_r/onPlayerRemove()
	..()
	var/mob/living/carbon/human/H = container.holder
	H.metabolism_effects.nsa_mult += 0.10
	H.metabolism_effects.calculate_nsa()
