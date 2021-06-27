/mob/living/carbon/superior_animal/handmade
	name = "Custom-made Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi'
	faction = "neutral"
	pass_flags = PASSTABLE
	turns_per_move = 5
	see_in_dark = 10
	wander = FALSE
	stop_automated_movement_when_pulled = TRUE
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100)
	mob_classification = CLASSIFICATION_SYNTHETIC
	breath_required_type = 0 // Doesn't need to breath
	breath_poison_type = 0 // Can't be poisoned
	speak_emote = list("state")
	emote_see = list("looks around for a target.")
	speak_chance = 1
	attacktext = "slashed"
	meat_amount = 0
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	waring_faction = "onestar"
	waring_faction_multy = 2 // Doesn't like Greyson
	deathmessage = "blows apart!"
	light_range = 3
	light_color = COLOR_LIGHTING_RED_BRIGHT
	var/exam_message = "If you see this, report it to Kaz or R4d6." // Custom message that show when examined and is different for each model.

	colony_friend = TRUE
	friendly_to_colony = TRUE

	var/obj/item/weapon/cell/large/cell = new /obj/item/weapon/cell/large/moebius // Hold the drone's power cell, default to a cheap one.
	var/mob/following = null // Who are we following?
	var/list/creator = list() // Who's the bot's creator.

/mob/living/carbon/superior_animal/handmade/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("[exam_message]"))
	var/robotics_expert = user.stats.getPerk(PERK_ROBOTICS_EXPERT)
	if(robotics_expert) // Are we an expert in robots?
		to_chat(user, SPAN_NOTICE("[name] is currently at [(health/maxHealth)*100]% integrity!")) // Give a more accurate reading.
	else if (health < maxHealth * 0.25)
		to_chat(user, SPAN_DANGER("It's grievously wounded!"))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_DANGER("It's badly wounded!"))
	else if (health < maxHealth * 0.75)
		to_chat(user, SPAN_WARNING("It's wounded."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It's a bit wounded."))

/mob/living/carbon/superior_animal/handmade/death(var/gibbed, var/message = "blows apart!")
	if (stat != DEAD)
		new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)

		if(cell) // Only if it does have a cell
			cell.forceMove(src.loc) // Drop the power cell
			cell = null // No more cell in the drone

		.=..()
		if(src)
			qdel(src)

/mob/living/carbon/superior_animal/handmade/emp_act(severity)
	..()
	health -= 50 * severity

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/handmade/attackby(obj/item/weapon/W as obj, mob/user as mob)
	var/obj/item/weapon/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/weapon/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					health = maxHealth
					to_chat(user, "You repair the damage to [src].")
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return
	// If nothing was ever triggered, continue as normal
	..()