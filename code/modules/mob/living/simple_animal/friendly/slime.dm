/mob/living/simple_animal/slime
	name = "pet slime"
	desc = "A lovable, domesticated slime."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "grey baby slime"
	icon_dead = "grey baby slime dead"
	speak_emote = list("chirps")
	health = 100
	maxHealth = 100
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "stomps on"
	emote_see = list("jiggles", "bounces in place")
	leather_amount = 0
	bones_amount = 0
	var/colour = "grey"
	var/got_goods = FALSE
	var/mob/living/Leader = null // AI variable - tells the slime to follow this person
	var/holding_still = 0 // AI variable, cooloff-ish for how long it's going to stay in one place
	var/list/speech_buffer = list() // Last phrase said near it and person who said it
	sanity_damage = -2

/mob/living/simple_animal/slime/New()
	..()
	add_overlay("aslime-:33")
	handle_AI()

/mob/living/simple_animal/slime/proc/handle_AI()  // the master AI process

	if(stat == DEAD || client) // If we're dead or have a client, we don't need AI
		return

	handle_speech() //how the slime hears and talks back.
	if (Leader) //handle orders to stay or follow
		if (holding_still)
			holding_still = max(holding_still - 1, 0)
		else if(canmove && isturf(loc))
			step_to(src, Leader)

	var/sleeptime = movement_delay()
	if(sleeptime <= 5) sleeptime = 5 // Maximum one action per half a second
	spawn (sleeptime)
		if(stat == DEAD)//we want to double check to stop the Ai if the slime dies for some reason.
			return
		else handle_AI()
	return
// code blow is how the slime hears things.
/mob/living/simple_animal/slime/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	speech_buffer = list()
	speech_buffer.Add(speaker)
	speech_buffer.Add(lowertext(html_decode(message)))

/mob/living/simple_animal/slime/proc/handle_speech()
	var/to_say
	if (speech_buffer.len > 0)
		var/who = speech_buffer[1] // Who said it?
		var/phrase = speech_buffer[2] // What did they say?
		if (findtext(phrase, "slimes")) // Talking to us
			if (findtext(phrase, "hello") || findtext(phrase, "hi"))
				to_say = pick("Hello...", "Hi...")
			else if (findtext(phrase, "follow"))
				if (Leader)
					if (Leader == who) // Already following him
						to_say = pick("Yes...", "Lead...", "Following...")
					else
						to_say = "No... I follow [Leader]..."
				else
					Leader = who
					to_say = "I follow..."
			else if (findtext(phrase, "stop"))
				if (Leader == who)
					to_say = "Yes... I'll stay..."
					Leader = null
				else to_say = "No... I'll come with..."
			else if (findtext(phrase, "stay"))
				if (Leader == who)
					holding_still = 30
					to_say = "Yes... Staying..."
				else to_say = "No... I'll keep following..."
		speech_buffer = list()
	if (to_say)
		say (to_say)

/mob/living/simple_animal/slime/say(var/message) //this cleans up the slimes speak.

	message = sanitize(message)
	message = capitalize(trim_left(message))
	var/verb = say_quote(message)

	if(copytext(message,1,2) == get_prefix_key(/decl/prefix/custom_emote))
		return emote(copytext(message,2))

	if(stat)
		var/last_symbol = copytext(message, length(message))
		if(stat == DEAD)
			return say_dead(message)
		else if(last_symbol=="@")
			if(src.stats.getPerk(PERK_CODESPEAK))
				return
			else
				to_chat(src, "You don't know the codes, pal.")
				return
		return

	return ..(message, null, verb)

/mob/living/simple_animal/slime/attackby(var/obj/item/storage/s, mob/living/user as mob)
	if(stat == DEAD) // we don't add things to dead slimes.
		return
	if(got_goods == FALSE && istype(s, /obj/item/storage))
		user.visible_message(SPAN_NOTICE("[user] hands [s] to the [src]."))
		user.drop_item()
		src.contents += s
		got_goods = TRUE
		cut_overlays()
		add_overlay("aslime-stuffed")
		return
	else if (istype(s, /obj/item/storage)) //is it a bag or something else we are trying to give the overburdened slime?
		to_chat(user, ("[src] looks a little flustered at having TWO things to carry."))
	else to_chat(user, ("[src] can't seem to carry this."))

/mob/living/simple_animal/slime/attack_hand(mob/living/user as mob)
	if (got_goods == FALSE && stat != DEAD)
		to_chat(user, "The [src] nuzzles your hand.")
		return
	else if (got_goods == TRUE && src.contents.len > 0)
		for(var/obj/item/storage/s in src.contents)
			s.loc = usr.loc
		got_goods = FALSE
		cut_overlays()
		if (stat != DEAD) // we only want it to get a updated face and show things when its alive.
			add_overlay("aslime-:3")
			user.visible_message(SPAN_NOTICE("[user] has [src] put the bag down."))

/mob/living/simple_animal/slime/can_force_feed(var/feeder, var/food, var/feedback)
	if(feedback)
		to_chat(feeder, "Where do you intend to put \the [food]? \The [src] doesn't have a mouth!")
	return 0


/mob/living/simple_animal/slime/adultslime
	health = 200
	maxHealth = 200
	icon_state = "grey adult slime"

/mob/living/simple_animal/slime/adult/death()
	..()
	var/mob/living/simple_animal/slime/S1 = new /mob/living/simple_animal/slime (src.loc)
	S1.icon_state = "[src.colour] baby slime"
	S1.icon_living = "[src.colour] baby slime"
	S1.icon_dead = "[src.colour] baby slime dead"
	S1.colour = "[src.colour]"
	var/mob/living/simple_animal/slime/S2 = new /mob/living/simple_animal/slime (src.loc)
	S2.icon_state = "[src.colour] baby slime"
	S2.icon_living = "[src.colour] baby slime"
	S2.icon_dead = "[src.colour] baby slime dead"
	S2.colour = "[src.colour]"
	qdel(src)
