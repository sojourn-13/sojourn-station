//Macro: MUTATION_XENO_TOX_RES
/datum/genetics/mutation/xeno_tox_res
	name = "Xenotoxin resistance"
	key = "MUTATION_XENO_TOX_RES"
	desc = "Allows for the processing of Xenotoxin to be less harmful."
	gain_text = "As blood pumps it feels warmer."
	instability = 20
	gene_research_value = 2000

//Macro: MUTATION_XENO_SKIN
/datum/genetics/mutation/xeno_skin
	name = "Helicon Cellarer Kevlar Scales"
	key = "MUTATION_XENO_SKIN"
	//Helps prevent delimbing and embeding, accually kinda cool
	desc = "When being hit by sharp a sharp object, your scales rapidly grow around the object reducing sharpness. This affect then rapidly fades away."
	gain_text = "Your skin feels waxy."
	instability = 50 //OP alien bs

	exclusive_type = MUT_TYPE_SKIN
	gene_research_value = 3000