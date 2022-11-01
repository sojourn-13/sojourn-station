/datum/language/corticalborer
	name = LANGUAGE_CORTICAL
	desc = "Cortical borers possess a strange link between their tiny minds."
	speech_verb = list("sings")
	ask_verb = list("sings")
	exclaim_verb = list("sings")
	colour = "alien"
	key = "3"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	has_written_form = FALSE

/datum/language/corticalborer/broadcast(var/mob/living/speaker,var/message,var/speaker_mask)

	var/mob/living/simple_animal/borer/B

	if(iscarbon(speaker))
		var/mob/living/carbon/M = speaker
		B = M.has_brain_worms()
	else if(istype(speaker,/mob/living/simple_animal/borer))
		B = speaker

	if(B)
		speaker_mask = B.truename
	..(speaker,message,speaker_mask)
