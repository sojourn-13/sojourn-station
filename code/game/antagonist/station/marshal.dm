/datum/antagonist/marshal
	id = ROLE_MARSHAL
	role_text = "Commando"
	role_text_plural = "Commandos"
	bantype = ROLE_BANTYPE_CREW_SIDED
	antaghud_indicator = "huddeathsquad"

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_ROB = 10,
		STAT_VIG = 20
	)

	welcome_text = "You are a specially promoted member of the colony under orders of the provost marshal and brigadier to accomplish a specific objective.\n\
	Local members of the blackshield and marshals are unaware of your presence and should remain so if possible, you are to accomplish your objectives \n\
	discretely and quietly unless orders dictate otherwise."

/datum/antagonist/marshal/can_become_antag(var/datum/mind/M)
	if(!..())
		return FALSE
	return TRUE

/datum/antagonist/marshal/equip()
	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])
		L.stats.addPerk(PERK_CODESPEAK)

	if(!owner.current)
		return FALSE

	spawn_uplink(owner.current)

	return TRUE
