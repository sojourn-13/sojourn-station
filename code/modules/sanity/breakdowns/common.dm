
/datum/breakdown/common/power_hungry
	name = "Power Hungry"
	duration = 15 MINUTES
	insight_reward = 20
	restore_sanity_post = 80

	start_messages = list("You think this doesn’t feel real... you have to make sure this is real! Get a jump from electrictiy!")
	end_messages = list("You feel alive again.")
	var/message_time = 0
	var/messages = list("You want to receive an electric shock to make sure you're really alive.",
						"You think about a way to make sure this is real.. a shock, that's it!.",
						"Pain is real, numbiness is false. I must.. feel!.")

/datum/breakdown/common/power_hungry/can_occur()
	if(holder.owner.species.siemens_coefficient > 0)
		return TRUE
	return FALSE

/datum/breakdown/common/power_hungry/occur()
	RegisterSignal(holder.owner, COMSIG_CARBON_ELECTROCTE, PROC_REF(check_shock))
	RegisterSignal(holder.owner, COMSIG_LIVING_STUN_EFFECT, PROC_REF(check_shock))
	return ..()

/datum/breakdown/common/power_hungry/update()
	. = ..()
	if(!.)
		return FALSE
	if(world.time >= message_time)
		message_time = world.time + BREAKDOWN_ALERT_COOLDOWN
		to_chat(holder.owner, SPAN_NOTICE(pick(messages)))

/datum/breakdown/common/power_hungry/conclude()
	UnregisterSignal(holder.owner, COMSIG_CARBON_ELECTROCTE)
	UnregisterSignal(holder.owner, COMSIG_LIVING_STUN_EFFECT)
	..()

/datum/breakdown/common/power_hungry/proc/check_shock()
	finished = TRUE

/datum/breakdown/common/desire_for_chrome
	name = "Desire for Chrome"
	insight_reward = 30
	restore_sanity_post = 60
	start_messages = list("Flesh is weak, you are disgusted by the weakness of your own body.")
	end_messages = list("Nothing like a mechanical upgrade to feel like new.")

/datum/breakdown/common/desire_for_chrome/can_occur()
	for(var/obj/item/organ/external/Ex in holder.owner.organs)
		if(!BP_IS_ROBOTIC(Ex))
			return TRUE
	return FALSE

/datum/breakdown/common/desire_for_chrome/occur()
	RegisterSignal(holder.owner, COMSIG_HUMAN_ROBOTIC_MODIFICATION, PROC_REF(check_organ))
	return ..()

/datum/breakdown/common/desire_for_chrome/conclude()
	UnregisterSignal(holder.owner, COMSIG_HUMAN_ROBOTIC_MODIFICATION)
	..()

/datum/breakdown/common/desire_for_chrome/proc/check_organ()
	finished = TRUE


/datum/breakdown/common/false_nostalgy
	name = "False Nostalgy"
	duration = 10 MINUTES
	insight_reward = 10
	restore_sanity_post = 50
	var/message_time = 0
	var/area/target
	var/messages
	end_messages = list("Just like you remembered it.")

/datum/breakdown/common/false_nostalgy/occur()
	var/list/candidates = ship_areas.Copy()
	message_time = world.time + BREAKDOWN_ALERT_COOLDOWN
	for(var/area/A in candidates)
		if(A.is_maintenance)
			candidates -= A
			continue
	target = pick(candidates)
	messages = list("Remember your last time in [target], those were the days",
					"You feel like you’re drawn to [target] because you were always happy there. Right..?",
					"When you are in [target] you feel like home... You want to feel like home.",
					"[target] reminds you of the hunt.")

	to_chat(holder.owner, SPAN_NOTICE(pick(messages)))
	return ..()

/datum/breakdown/common/false_nostalgy/update()
	. = ..()
	if(!.)
		return FALSE
	if(get_area(holder.owner) == target)
		finished = TRUE
		conclude()
		return FALSE
	if(world.time >= message_time)
		message_time = world.time + BREAKDOWN_ALERT_COOLDOWN
		to_chat(holder.owner, SPAN_NOTICE(pick(messages)))

/datum/breakdown/common/new_heights
	name = "New Heights"
	duration = 10 MINUTES
	insight_reward = 25
	restore_sanity_post = 80
	start_messages = list("This no longer suffices. You turned stale and gray. You need more! Reach for a new horizon!")
	end_messages = list("You have lost the desire to go further.")
	var/message_time = 0
	var/messages = list("You want to test your endurance, what better way to do it than consuming drugs?",
						"It doesn't matter if they judge you, they miss out on the pleasure of drugs.",
						"Drugs are life, drugs are love, they are never enough.",
						"A little more, a little more, you would pay anything to consume a little more.")

/datum/breakdown/common/new_heights/update()
	. = ..()
	if(!.)
		return FALSE
	if(holder.owner.metabolism_effects.nsa_current >= 100)
		finished = TRUE
		conclude()
		return FALSE
	if(world.time >= message_time)
		message_time = world.time + BREAKDOWN_ALERT_COOLDOWN
		to_chat(holder.owner, SPAN_NOTICE(pick(messages)))

#define KLEPTOMANIA_COOLDOWN rand(30 SECONDS, 60 SECONDS)

/datum/breakdown/common/kleptomania
	name = "Kleptomania"
	duration = 5 MINUTES
	restore_sanity_post = 50
	var/pickup_time = 0

	start_messages = list(
		"You feel the need to hold something that you perhaps shouldn't...",
		"You feel like others don't value what they have - but you on the other hand...",
		"You feel like everything should be in your possession...",
		"You feel like everything can be yours, with just the smallest effort...",
		"You feel like some things have a strong aura around them. It won't hurt to take them for a while..."
	)
	end_messages = list(
		"You feel easier about not stealing things now."
	)

/datum/breakdown/common/kleptomania/update()
	. = ..()
	if(!. || holder.owner.incapacitated())
		return
	if(world.time >= pickup_time)
		pickup_time = world.time + KLEPTOMANIA_COOLDOWN
		var/list/obj/item/candidates = oview(1, holder.owner)
		while(candidates.len)
			var/obj/item/I = pick(candidates)
			if(!istype(I) || I.anchored || !I.Adjacent(holder.owner) || !I.pre_pickup(holder.owner))
				candidates -= I
				continue
			if(!holder.owner.put_in_hands(I) && prob(50))
				holder.owner.unEquip(holder.owner.get_inactive_hand())
				holder.owner.put_in_hands(I)
			break

/datum/breakdown/common/signs
	name = "Signs"
	restore_sanity_post = 70
	insight_reward = 5
	var/message

	start_messages = list(
		"You feel like the fabric of reality is visible to you...",
		"You feel that the truth is hidden somewhere, within your mind...",
		"You feel like your mind has spoken to you, after centuries of silence...",
		"You feel like you were blind, but now you see...",
		"You feel like the universe itself is speaking to you..."
	)
	end_messages = list(
		"The truth have spoken. You feel it again. The melody of sound returns to you."
	)

/datum/breakdown/common/signs/New()
	..()
	message = "Etiam tempor orci eu lobortis elementum nibh tellus molestie."

/datum/breakdown/common/signs/update()
	. = ..()
	if(!.)
		return
	if(!prob(40))
		return
	var/list/words = splittext(message, " ")
	var/phrase_len = rand(1,2)
	var/phrase_pos = rand(1, words.len - phrase_len)
	to_chat(holder.owner,"...[jointext(words, " ", phrase_pos, phrase_pos + phrase_len + 1)]...")

/datum/breakdown/common/signs/occur()
	RegisterSignal(holder.owner, COMSIG_HUMAN_SAY, PROC_REF(check_message))
	return ..()

/datum/breakdown/common/signs/conclude()
	UnregisterSignal(holder.owner, COMSIG_HUMAN_SAY)
	..()

/datum/breakdown/common/signs/proc/check_message(msg)
	if(msg == message)
		finished = TRUE

/datum/breakdown/common/noinsight
	name = "Stagnation"
	duration = 10 MINUTES
	restore_sanity_post = 150

	start_messages = list(
		"You feel stuck in a rut",
		"You glumb unable to get inspration for craft or self improvement"
	)

/datum/breakdown/common/noinsight/occur()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		H.sanity.insight_passive_gain_multiplier -= 0.5
	return ..()

/datum/breakdown/common/noinsight/conclude()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		H.sanity.insight_passive_gain_multiplier += 0.5
	..()

//Church based common powers

//names are based on classification/implied lore.

//Spends some power to heal some sanity
/datum/breakdown/common/church
	name = "Auto Recovery Prayer"
	duration = 0
	restore_sanity_post = 0
	var/ran_once = FALSE
	var/power_use = 2
	var/sanity_heal = 120

	start_messages = list(
		"Your chest feels warm.",
		"Your crusiform automatically activates a unknown prayer."
	)

/datum/breakdown/common/church/can_occur()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			return TRUE
	return FALSE

/datum/breakdown/common/church/conclude()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			if(power_use && I.power > power_use)
				I.power -= power_use
				restore_sanity_post = sanity_heal
	..()

/datum/breakdown/common/church/injector
	name = "Auto Injection Prayer"
	duration = 0
	restore_sanity_post = 0
	ran_once = FALSE
	power_use = 10
	sanity_heal = 25

	start_messages = list(
		"Your chest feels warm.",
		"Your crusiform automatically activates a unknown prayer."
	)

/datum/breakdown/common/church/injector/conclude()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			if(power_use && I.power > power_use)
				I.power -= power_use
				restore_sanity_post = sanity_heal
				holder.owner.reagents.add_reagent("holydexalinp", 2)
				holder.owner.reagents.add_reagent("holytricord", 2)
				holder.owner.reagents.add_reagent("holycilin", 3)
				holder.owner.reagents.add_reagent("holyquickclot", 1)

	..()

/datum/breakdown/common/church/random_player
	name = "Auto Prayer"
	duration = 0
	restore_sanity_post = 0
	ran_once = FALSE
	power_use = 1
	sanity_heal = 25

	start_messages = list(
		"Your chest feels warm.",
		"Your crusiform automatically activates a prayer?"
	)

/datum/breakdown/common/church/random_player/conclude()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/H = holder.owner
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			if(power_use && I.power > power_use)
				I.power -= power_use
				restore_sanity_post = sanity_heal
				//Looks gross as we have to daisy chain this to function (unless another easier way is found)
				var/prayer =  pick(\
				/datum/ritual/cruciform/base/flare, \
				/datum/ritual/cruciform/base/reveal, \
				/datum/ritual/cruciform/base/relief, \
				/datum/ritual/cruciform/base/soul_hunger)
				var/datum/ritual/cruciform/base/P = new prayer
				P.activate(H, I)
	..()

//Psionic based breakdowns
//Just heal 25 sanity, thats it
/datum/breakdown/common/psionic
	name = "Psionic Recovery"
	duration = 0
	restore_sanity_post = 25

	var/use_power = FALSE

	start_messages = list(
		"Your head pluses with a headack then clears up.",
		"Your mind goes blank for a second."
	)

/datum/breakdown/common/psionic/conclude()
	if(ishuman(holder.owner))
		var/mob/living/carbon/human/T = holder.owner
		var/obj/item/organ/internal/psionic_tumor/PT = T.random_organ_by_process(BP_PSION)
		if(PT)
			if(use_power && PT.psi_points > use_power)
				PT.psi_points -= use_power
	..()

/datum/breakdown/common/psionic/can_occur()
	if(ishuman(holder.owner)) // Check if it's an actual mob and not a wall
		var/mob/living/carbon/human/T = holder.owner
		var/obj/item/organ/internal/psionic_tumor/PT = T.random_organ_by_process(BP_PSION)
		if(PT)
			return TRUE
	return FALSE


//Disabled breakdowns that we dislike

/* Soj Edit, dont be a creep
/datum/breakdown/common/obsession
	name = "Obsession"
	insight_reward = 20
	restore_sanity_post = 70
	var/mob/living/carbon/human/target
	var/message_time = 0
	var/obsession_time = 3 MINUTES
	var/last_time
	var/delta_time


	end_messages = list(
		"You feel at ease again, suddenly."
	)

/datum/breakdown/common/obsession/can_occur()
	var/list/candidates = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - holder.owner
	if(candidates.len)
		target = pick(candidates)
		start_messages = list("[target.name] knows the way out. [target.name] is hiding something. [target.name] is the key! [target.name] is yours!")
		return TRUE
	return FALSE

/datum/breakdown/common/obsession/update()
	. = ..()
	if(!.)
		return FALSE
	if(QDELETED(target))
		to_chat(holder.owner, SPAN_WARNING("[target.name] is lost!"))
		finished = TRUE
		conclude()
		return FALSE
	if(target in view(holder.owner))
		delta_time += abs(world.time - last_time)
		last_time = world.time
		holder.owner.whisper_say("[target.name]")
		if(delta_time >= obsession_time)
			finished = TRUE
			conclude()
			return FALSE
	else
		last_time = world.time
		if(world.time >= message_time)
			message_time = world.time + BREAKDOWN_ALERT_COOLDOWN
			var/message = pick(list("[target.name] knows the way out.",
									"[target.name] is hiding something.",
									"[target.name] is the key!",
									"[target.name] smells good.",
									"you want to be close to [target.name].",
									"Seeing [target.name] makes you happy."
									))
			to_chat(holder.owner, SPAN_NOTICE(message))

/datum/breakdown/common/obsession/occur()
	for(var/stat in ALL_STATS)
		holder.owner.stats.addTempStat(stat, -5, INFINITY, "Obsession")
	return ..()

/datum/breakdown/common/obsession/conclude()
	for(var/stat in ALL_STATS)
		holder.owner.stats.removeTempStat(stat, "Obsession")
	..()
*/


/*
/datum/breakdown/common/herald
	name = "Herald"
	restore_sanity_pre = 5
	restore_sanity_post = 45
	duration = 5 MINUTES
	start_messages = list("You've seen the abyss too long, and now forbidden knowledge haunts you.")
	end_messages = list("You feel like you've forgotten something important. But this comforts you.")
	var/message_time = 0
	var/cooldown_message = 10 SECONDS


/datum/breakdown/common/herald/update()
	. = ..()
	if(!.)
		return FALSE
	if(world.time >= message_time)
		message_time = world.time + cooldown_message
		var/chance = rand(1, 100)
		holder.owner.say(chance <= 50 ? "[holder.pick_quote_20()]" : "[holder.pick_quote_40()]")
*/
