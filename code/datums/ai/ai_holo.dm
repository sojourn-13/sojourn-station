/decl/ai_holo
	var/icon = 'icons/mob/hologram.dmi'
	var/icon_state = "Face"
	var/name

/decl/ai_holo/New()
	..()
	name = icon_state

/decl/ai_holo/default
	icon_state = "Default"

/decl/ai_holo/face
	icon_state = "Face"

/decl/ai_holo/carp
	icon_state = "Carp"

/decl/ai_holo/info
	icon_state = "Info"

/decl/ai_holo/cursor
	icon_state = "Cursor"

/decl/ai_holo/caution
	icon_state = "Caution"

/decl/ai_holo/chevrons
	icon_state = "Chevrons"

/decl/ai_holo/question
	icon_state = "Question"

/decl/ai_holo/singularity
	icon_state = "Singularity"

/decl/ai_holo/nullicon
	icon_state = "Null"

/decl/ai_holo/cat
	icon_state = "Cat"
