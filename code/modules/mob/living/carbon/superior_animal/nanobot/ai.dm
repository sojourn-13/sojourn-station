#define AUTODOC_MODE 1 // To act like a medibot
#define RADIO_MODE 2 // To act like a radio
#define FOOD_MODE 4 // To give food.
#define CONSOLE_MODE 8 // To act as a console

/mob/living/carbon/superior_animal/nanobot/findTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/nanobot/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()

	if(speaker in creator) // Is it the creator speaking?

		// Autodoc mode.
		if(ai_flag & AUTODOC_MODE) // Is Autodoc Mode installed?
			if(findtext(message, "Toggle Medibot") && findtext(message, "[src.name]"))
				medbot = !medbot
				visible_emote("state, \"[medbot ? "Activating" : "Deactivating"] Medibot Mode.\"")
				return

		// Radio mode.
		if(ai_flag & RADIO_MODE) // Is Radio Mode installed?
			if(findtext(message, "Toggle Radio") && findtext(message, "[src.name]"))
				Radio.broadcasting = !Radio.broadcasting
				visible_emote("state, \"[Radio.broadcasting ? "Activating" : "Deactivating"] Radio Transmissions.\"")
				return

		// Console Mode
		if(ai_flag & CONSOLE_MODE)
			if(!Console && findtext(message, "Console")) // Check if the console wasn't deleted
				visible_emote("state, \"Error. No Console Detected\"")
				return
			if(findtext(message, "Deploy Console") && findtext(message, "[src.name]") && Console.loc == src)
				anchored = TRUE // The bot can't move
				following = null
				Console.forceMove(src.loc) // Deploy the console
				visible_emote("state, \"Deploying console and terminating follow protocol.\"")
			else if(findtext(message, "Store Console") && findtext(message, "[src.name]") && Console.loc != src)
				anchored = FALSE // We can move
				Console.forceMove(src) // Store the console

		// Opifex Food mode.
		if(ai_flag & FOOD_MODE) // Is Food Mode installed?
			if(findtext(message, "Dispense Food") && findtext(message, "[src.name]"))
				spawn_food() // The food-spawning and the visible emote is handled in the proc.
				return

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
				return

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
			return

/mob/living/carbon/superior_animal/nanobot/UnarmedAttack(var/mob/living/carbon/human/H, var/proximity)
	if(medbot) // Are we in healing mode?
		if(H == patient) // Are we "attacking" our patient?
			var/t = valid_healing_target(H)
			if(!t)
				visible_emote("state, \"Patient healed.\"")
				playsound(loc, "robot_talk_light", 100, 0, 0)
				patient = null
				return

			visible_emote("state, \"Injecting [t].\"")
			visible_message(SPAN_WARNING("[src] is trying to inject [H]!"))
			currently_healing = TRUE
			if(do_mob(src, H, 30))
				H.reagents.add_reagent(t, injection_amount)
				visible_message(SPAN_WARNING("[src] injects [H] with the syringe!"))
			currently_healing = FALSE
			return // Leave early before we hit them in the face,

	..() // Hit them in the face

/mob/living/carbon/superior_animal/nanobot/proc/valid_healing_target(var/mob/living/carbon/human/H)
	if(H.stat == DEAD) // He's dead, Jim
		return null

	if((H.getBruteLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_brute)))
		return treatment_brute //If they're already medicated don't bother!

	if((H.getOxyLoss() >= (15 + heal_threshold)) && (!H.reagents.has_reagent(treatment_oxy)))
		return treatment_oxy

	if((H.getFireLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_fire)))
		return treatment_fire

	if((H.getToxLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_tox)))
		return treatment_tox

/mob/living/carbon/superior_animal/nanobot/attack_hand(mob/living/user as mob)
	if(user in creator) // Does the user has access?
		if(ai_flag & CONSOLE_MODE) // Do we have console mode enabled?
			Console.attack_hand(user) // "Attack" the console instead.
			return
	..() // Continue the normal behavior

/mob/living/carbon/superior_animal/nanobot/MouseDrop(atom/over_object)
	if(holder_type && !anchored) // We need a defined holder type in order for picking up to work, and the bot need to not be anchored.
		var/mob/living/carbon/H = over_object
		if(!istype(H) || !Adjacent(H))
			return ..()
		get_scooped(H, usr)
		return
	return ..()

