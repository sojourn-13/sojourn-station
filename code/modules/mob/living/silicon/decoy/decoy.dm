/mob/living/silicon/decoy
	name = "AI"
	icon = 'icons/mob/AI.dmi'//
	icon_state = "ai"
	anchored = 1 // -- TLE
	movement_handlers = list(/datum/movement_handler/no_move)

	death_threshold = HEALTH_THRESHOLD_DEAD

/mob/living/silicon/decoy/Initialize()
	src.icon = 'icons/mob/AI.dmi'
	src.icon_state = "ai"
	src.anchored = TRUE
	src.canmove = 0
	return INITIALIZE_HINT_NORMAL
