/datum/storyteller/mime
	config_tag = "mime"
	name = "The Mime"
	welcome = "Welcome to the Nadezhda colony! We hope you enjoy your stay!"
	description = "A storyteller which will not do anything."
	votable = TRUE //For lower pops

	gain_mult_mundane = 0
	gain_mult_moderate = 0
	gain_mult_major = 0
	gain_mult_roleset = 0

	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 0, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)

/datum/storyteller/mime/handle_points() //the mime does not run any events, and points are frozen while the mime is in charge.
	return

/datum/storyteller/mime/announce() //the mime does not talk.
	return