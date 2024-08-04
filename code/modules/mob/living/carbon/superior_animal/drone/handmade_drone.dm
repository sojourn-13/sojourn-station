/mob/living/carbon/superior_animal/handmade
	name = "Custom-made Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi' //roomba in this file was created by Toriate#0657
	faction = "neutral"
	pass_flags = PASSTABLE
	turns_per_move = 5
	see_in_dark = 10
	wander = FALSE
	stop_automated_movement_when_pulled = TRUE
	armor = list(melee = 7, bullet = 7, energy = 7, bomb = 50, bio = 100, rad = 100)
	mob_classification = CLASSIFICATION_SYNTHETIC
	breath_required_type = 0 // Doesn't need to breath
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	speak_emote = list("state")
	emote_see = list("looks around for a target.")
	speak_chance = 1
	attacktext = "slashed"
	meat_amount = 0
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	deathmessage = "blows apart!"
	light_range = 3
	light_color = COLOR_LIGHTING_RED_BRIGHT
	var/exam_message = null // Custom message that show when examined and is different for each model.
	var/cleaning = FALSE

	do_gibs = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	cant_be_pulled = FALSE
	reagent_immune = TRUE
	toxin_immune = TRUE
	cold_protection = 1
	heat_protection = 1

	known_languages = list(LANGUAGE_COMMON)

	var/obj/item/cell/cell = null // Hold the drone's power cell, default to a cheap one.
	follow_message = "state, \"Beginning Escort Protocol.\""
	stop_message = "state, \"Ending Escort Protocol.\""
	follow_distance = 2
	var/list/creator = list() // Who's the bot's creator.
	never_stimulate_air = TRUE

/mob/living/carbon/superior_animal/robot/death()
	..()
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	//qdel(src) we can rebuild!
	return


/mob/living/carbon/superior_animal/handmade/examine(mob/user)
	..()
	if(exam_message)
		to_chat(user, SPAN_NOTICE("[exam_message]"))
	if(iscarbon(user) || issilicon(user))
		var/robotics_expert = user.stats.getPerk(PERK_ROBOTICS_EXPERT)
		if(robotics_expert) // Are we an expert in robots?
			to_chat(user, SPAN_NOTICE("[name] is currently at [(health/maxHealth)*100]% integrity!")) // Give a more accurate reading.
		else if(health < maxHealth * 0.10)
			to_chat(user, SPAN_DANGER("It looks like they are on their last legs!"))
		else if (health < maxHealth * 0.20)
			to_chat(user, SPAN_DANGER("It's grievously wounded!"))
		else if (health < maxHealth * 0.30)
			to_chat(user, SPAN_DANGER("It's badly wounded!"))
		else if (health < maxHealth * 0.40)
			to_chat(user, SPAN_WARNING("Its wounds are mounting."))
		else if (health < maxHealth * 0.50)
			to_chat(user, SPAN_WARNING("It looks half dead."))
		else if (health < maxHealth * 0.60)
			to_chat(user, SPAN_WARNING("It looks like its been beaten up quite badly"))
		else if (health < maxHealth * 0.70)
			to_chat(user, SPAN_WARNING("It has accrued some lasting injuries."))
		else if (health < maxHealth * 0.80)
			to_chat(user, SPAN_WARNING("It has had minor damage done to it."))
		else if (health < maxHealth)
			to_chat(user, SPAN_WARNING("It has a few cuts and bruses."))

/mob/living/carbon/superior_animal/handmade/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0) //WE CLEAN!
	. = ..()
	if(cleaning)
		var/turf/tile = loc
		if(isturf(tile))
			tile.clean_blood()
			for(var/A in tile)
				if(istype(A, /obj/effect))
					if(istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay) && !istype(A, /obj/effect/overlay/water))
						qdel(A)
				else if(istype(A, /obj/item))
					var/obj/item/cleaned_item = A
					cleaned_item.clean_blood()
				else if(ishuman(A))
					var/mob/living/carbon/human/cleaned_human = A
					if(cleaned_human.lying)
						if(cleaned_human.head)
							cleaned_human.head.clean_blood()
							cleaned_human.update_inv_head(0)
						if(cleaned_human.wear_suit)
							cleaned_human.wear_suit.clean_blood()
							cleaned_human.update_inv_wear_suit(0)
						else if(cleaned_human.w_uniform)
							cleaned_human.w_uniform.clean_blood()
							cleaned_human.update_inv_w_uniform(0)
						if(cleaned_human.shoes)
							cleaned_human.shoes.clean_blood()
							cleaned_human.update_inv_shoes(0)
						cleaned_human.clean_blood(1)
						to_chat(cleaned_human, SPAN_DANGER("[src] cleans your face!"))

/mob/living/carbon/superior_animal/handmade/emp_act(severity)
	..()
	take_overall_damage(0, 50 * severity)

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/handmade/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name].")
										)
					if(user.stats.getPerk(PERK_ROBOTICS_EXPERT))
						heal_overall_damage(50, 50)
					else
						heal_overall_damage(rand(30, 50), rand(30, 50))
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return

		else if(QUALITY_PULSING in T.tool_qualities)
			if(stat != DEAD) // are we still alive?
				follow_distance = input(user, "How far should [src.name] follow?", "Distance to set", initial(follow_distance)) as null | anything in list(0, 1, 2, 3, 4, 5)
				if(density && follow_distance < 1)
					follow_distance = 1 // Making sure that the bot don't try to occupy your tile if it can't share it.
			else if(health >= maxHealth * 0.99) // We are dead, but are we at least intact?, not actual maxHealth in case something put the HP at least 399.9999999
				user.visible_message(
										SPAN_NOTICE("[user] start to reactivate [src.name]."),
										SPAN_NOTICE("You start to reactivate [src.name]..")
										)
				if(T.use_tool(user, src, user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? WORKTIME_LONG : WORKTIME_EXTREMELY_LONG, QUALITY_PULSING, FAILCHANCE_EASY, required_stat = STAT_COG)) // Bring the bot back. It's long as fuck. Bit faster if it's your job.
					rejuvenate() // That proc fully heal the bot, but we don't care because we make sure it is fully healed before calling it
			else
				to_chat(user, "[src] need to be fully repaired before reactivation is possible.")
			return

	// If nothing was ever triggered, continue as normal
	..()
