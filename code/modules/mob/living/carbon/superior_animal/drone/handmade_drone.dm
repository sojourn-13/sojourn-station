/mob/living/carbon/superior_animal/handmade
	name = "Custom-made Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly."
	icon = 'icons/mob/custom_bot.dmi'
	faction = "neutral"
	turns_per_move = 5
	see_in_dark = 10
	stop_automated_movement_when_pulled = TRUE
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100)
	colony_friend = TRUE
	breath_required_type = 0 // Doesn't need to breath
	breath_poison_type = 0 // Can't be poisoned
	attacktext = "slash"
	meat_amount = 0
	mob_size = MOB_MEDIUM

	var/obj/item/weapon/cell/large/cell = /obj/item/weapon/cell/large/moebius // Hold the drone's power cell, default to a cheap one.

/mob/living/carbon/superior_animal/handmade/death()
	if(cell) // Only if it does have a cell
		cell.forceMove(src.loc) // Drop the power cell
		cell = null // No more cell in the drone
	..()
	return

// For repairing damage to the synths.
/mob/living/simple_animal/hostile/roomba/synthetic/allied/attackby(obj/item/weapon/W as obj, mob/user as mob)
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