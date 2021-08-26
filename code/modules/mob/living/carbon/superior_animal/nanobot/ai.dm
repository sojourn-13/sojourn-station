#define AUTODOC_MODE 1
#define RADIO_MODE 2
#define FOOD_MODE 4

/mob/living/carbon/superior_animal/nanobot/findTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/nanobot/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()

	if(speaker in creator) // Is it the creator speaking?

		// Autodoc mode.
		if(AUTODOC_MODE & hearing_flag) // Is Autodoc mode activated?
			if(findtext(message, "Activate Autodoc") && findtext(message, "[src.name]"))
				visible_emote("state, \"Activating Autodoc Mode.\"")
				// TODO : Make it inject chems based on damage. -R4d6

		// Radio mode.
		if(RADIO_MODE & hearing_flag) // Is Radio mode activated?
			if(findtext(message, "Activate Radio") && findtext(message, "[src.name]"))
				visible_emote("state, \"Activating Internal Radio.\"")
				// TODO : Make it turn on its radio. -R4d6

		// Opifex Food mode.
		if(FOOD_MODE & hearing_flag) // Is Autodoc mode activated?
			if(findtext(message, "Activate Food") && findtext(message, "[src.name]"))
				visible_emote("state, \"Activating Food Mode.\"")
				// TODO : Make it create food that poison non-opifex. -R4d6

		// Add mobs as friends
		if(findtext(message, "Add User") && findtext(message, "[src.name]")) // Do we say the magic words with the bot's name?
			for(var/mob/target in range(viewRange, src)) // Check every mob that it can see
				if(target != src) // Not include the bot
					if(findtext(message, target.name)) // Was the mob named in the order?
						if(friends.Find(target)) // Is it already a user?
							visible_emote("state, \"Error, [target.name] is already a registered user.\"")
						else
							visible_emote("state, \"Registering [target.name] as a new user.\"")
							friends += target // Add the mob as a user

		// Remove mobs as friends
		if(findtext(message, "Remove User") && findtext(message, "[src.name]")) // Do we say the magic words with the bot's name?
			for(var/mob/target in range(viewRange, src)) // Check every mob that it can see
				if(target != src) // Not include the bot
					if(findtext(message, target.name)) // Was the mob named in the order?
						if(friends.Find(target)) // Is the user in the list?
							visible_emote("state, \"Removing [target.name] as a user.\"")
							friends -= target // Remove the mob as a user
						else
							visible_emote("state, \"Error, [target.name] is not a registered user.\"")
