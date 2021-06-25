/mob/living/carbon/superior_animal/handmade/findTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/handmade/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()
	if(speaker in friends) // Is the one talking a friend?
		if(message == "Follow.") // Is he telling us to follow?
			following = speaker
			visible_emote("state, \"Beginning Escort Protocol on [speaker.name].\"")

		if(message == "Stop.") // Else, is he telling us to stop?
			following = null
			visible_emote("state, \"Ending Escort Protocol.\"")
