/mob/living/carbon/superior_animal/lodge/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()
	if(message == "Follow." && !following) // Is he telling us to follow?
		following = speaker
		visible_emote("nods and start following [speaker.name].")

	if(message == "Stop." && following) // Else, is he telling us to stop?
		following = null
		visible_emote("nods and stop following [speaker.name].")
