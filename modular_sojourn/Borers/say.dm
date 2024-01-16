/mob/living/simple_animal/borer/say(var/message)

	message = sanitize(message)
	message = capitalize(message)

	if(!message)
		return

	var/last_symbol = copytext(message, length(message))
	if (stat == 2)
		return say_dead(message)
	else if(last_symbol=="@")
		if(!src.stats.getPerk(PERK_CODESPEAK))
			to_chat(src, "You don't know the codes, pal.")
			return

	if (stat)
		return

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "\red You cannot speak in IC (muted).")
			return
		if (src.client.handle_spam_prevention(message,MUTE_IC))
			return

	if (copytext(message, 1, 2) == "*")
		return emote(copytext(message, 2))

	var/datum/language/L = parse_language(message)
	if(L && L.flags & HIVEMIND)
		L.broadcast(src,trim(copytext(message,3)),src.truename)
		return

	var/list/warm_bodies = list()
	var/mob/living/surrogate = null
	for(var/mob/living/victim in ohearers(8))
		if(victim?.stat == CONSCIOUS)
			warm_bodies += victim
	if(!host)
		surrogate = safepick(warm_bodies)
		return surrogate.say(message) //No host, no audible speech.

	to_chat(src, "You drop words into [host]'s mind: \"[message]\"")
	to_chat(host, "Your own thoughts speak: \"[message]\"")

	for (var/mob/M in GLOB.player_list)
		if (isnewplayer(M))
			continue
		else if(M.stat == DEAD && M.get_preference_value(/datum/client_preference/ghost_ears) == GLOB.PREF_ALL_SPEECH)
			if(!host)
				to_chat(M, "[src.truename] whispers to [surrogate], \"[message]\"")
			else
				to_chat(M, "[src.truename] whispers to [host], \"[message]\"")
