/datum/antagonist/borer
	id = ROLE_BORER
	landmark_id = "hidden-vent-antag"
	role_text = "Cortical Borer"
	role_text_plural = "Cortical Borers"
	mob_path = /mob/living/simple/borer/roundstart
	bantype = ROLE_BANTYPE_BORER
	welcome_text = "You are a cortical borer. An ancient Neurophage that has recently awoken, being both hiveminded, and having just awoken - you are understandably quite confused in this new world. Still, not everything is bad. Your psionic abilities remain just as sharp, your neural lance primed - and more importantly, an abundance of new hosts; though the One Mind has seemingly decided to take a new direction. Subtlety. For now, obey the treaty you have signed (if you are a Colony-spawned Borer!) to the best of your abilities. Speak with your fellow borers using :x, and remember. You ARE an antagonist, but this is not a license to avoid roleplay! You exist to enrich it."
	antaghud_indicator = "hudborer"

	outer = FALSE //Borers are only spawned via mapping spawns now. Don't teleport them randomly.
	only_human = FALSE

/datum/antagonist/borer/reproduced	//This antag datum will prevent all borers be rounstart
	id = ROLE_BORER_REPRODUCED
	selectable = FALSE
	mob_path = /mob/living/simple/borer

/datum/antagonist/borer/create_objectives(var/survive = FALSE)
	new /datum/objective/borer_survive (src)
	new /datum/objective/borer_reproduce (src)

/datum/antagonist/borer/create_survive_objective()
	return
