//Macro: MUTATION_IMBECILE
/datum/genetics/mutation/imbecile
	name = "Simpleton"
	key = "MUTATION_IMBECILE"
	desc = "Causes the mind to be a little dimmer than normal, a little slower on the draw."
	gain_text = "Your mind seems to slow, your thoughts become muddled. What were you doing again?"

/datum/genetics/mutation/imbecile/onPlayerImplant()
	if(!..())
		return
	container.holder.stats.changeStat(STAT_COG, -10)
	container.holder.stats.changeStat(STAT_MEC, -10)
	container.holder.stats.changeStat(STAT_BIO, -10)

/datum/genetics/mutation/imbecile/onPlayerRemove()
	if(!..())
		return
	container.holder.stats.changeStat(STAT_COG, 10)
	container.holder.stats.changeStat(STAT_MEC, 10)
	container.holder.stats.changeStat(STAT_BIO, 10)

