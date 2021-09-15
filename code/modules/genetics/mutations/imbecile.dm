//Macro: MUTATION_IMBECILE
/datum/genetics/mutation/imbecile
	name = "Simpleton"
	desc = "Causes the mind to be a little dimmer than normal, a little slower on the draw."
	gain_text = "Your mind seems to slow, your thoughts become muddled. What were you doing again?"

/datum/genetics/mutation/imbecile/onPlayerImplant()
	..()
	container.holder.stats.changeStat(STAT_COG, -10)
	container.holder.stats.changeStat(STAT_MEC, -10)
	container.holder.stats.changeStat(STAT_BIO, -10)

/datum/genetics/mutation/imbecile/onPlayerRemove()
	..()
	container.holder.stats.changeStat(STAT_COG, 10)
	container.holder.stats.changeStat(STAT_MEC, 10)
	container.holder.stats.changeStat(STAT_BIO, 10)

