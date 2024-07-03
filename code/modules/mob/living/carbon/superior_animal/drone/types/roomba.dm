/mob/living/carbon/superior_animal/handmade/roomba
	name = "Custom-Made Roomba Drone"
	desc = "Built from the Soteria robotics division's craftsmanship, and gathered designs of Greyson positronics, each of these fully robotic automatons is a unique, handmade, heavily armored assembly. Capable of IFF."
	faction = "neutral"
	icon_state = "roomba"
	melee_damage_lower = 10
	melee_damage_upper = 15
	health = 100
	maxHealth = 100
	colony_friend = TRUE
	friendly_to_colony = TRUE
	mob_size = MOB_SMALL
	stop_automated_movement_when_pulled = TRUE
	density = FALSE
	cleaning = TRUE

	// Default armor values so that we can reference them.
	var/default_armor = list(
		melee = 3,
		bullet = 3,
		energy = 3,
		bomb = 3,
		bio = 100, // It is a robot, shouldn't be affected by viruses or pain
		agony = 100
	)

	var/panel_locked = FALSE // Is the panel locked?
	var/panel_open = FALSE // Is the panel open?
	var/obj/item/bot_part/roomba/roomba_plating/armored = null // Hold the roomba armor plating so that we can get it back.
	var/obj/item/weaponry = null // Hold the roomba's gun so that we can get it back.
	var/obj/item/mine/kamikaze = null // Store the mine the roomba can hold.
	cell = new /obj/item/cell/medium/moebius // Hold the roomba's power cell, but default to a cheap one

	follow_message = "emits an affirmative blip and starts following you."
	stop_message = "emits an affirmative blip and stops in place."
	exam_message = null

/mob/living/carbon/superior_animal/handmade/roomba/New()
	armor = default_armor // Give the roomba it's default armor.
	..()
	update_icon()

/*\
 * The attackby() is basically a decision tree with branches.
 * Since most of the branches are binary choices, there will be 'if' which return, and if you don't enter the 'if', consider it the 'else'.
\*/
/mob/living/carbon/superior_animal/handmade/roomba/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		// Check if it is a roomba part
		if(istype(W, /obj/item/bot_part/roomba))
			T = W

		// Check if it is a gun
		if(istype(W, /obj/item/gun))
			T = W

		// Check if it is a mine
		if(istype(W, /obj/item/mine))
			T = W

		// Check if the weapon is an ID.
		if(istype(W, /obj/item/card/id))

			// Don't lock or unlock the panel if it is open.
			if(panel_open)
				to_chat(user, "Close the panel first")
				return

			// Make a new ID var so that we can use the ID-unique variable.
			var/obj/item/card/id/C = W

			// Check for robotic access
			if(!(access_robotics in C.access))
				to_chat(user, "You do not have access.")
				return

			// Is the panel locked? If so, unlock it.
			if(panel_locked)
				panel_locked = FALSE
				to_chat(user, "You unlock [src]'s panel.")
				return

			// If we're here, then the panel wasn't open, the ID has robotic access and it wasn't locked, so we don't need another check to lock the panel.
			panel_locked = TRUE
			to_chat(user, "You lock [src]'s panel.")
			return

		// Is the weapon able to be used as a screwdriver and is the panel unlocked?
		else if((QUALITY_SCREW_DRIVING in T.tool_qualities) && !(panel_locked))

			// Skill check to open or close the panel.
			if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_MEC))

				// If the panel is already open, close it.
				if(panel_open)
					panel_open = FALSE
					to_chat(user, "You close [src]'s panel.")
					update_icon()
					return

				// If we're here, then the panel wasn't open, so let's open it.
				panel_open = TRUE
				to_chat(user, "You open [src]'s panel.")
				update_icon()
				return

		// Are we attacking with the roomba plating and is the panel open?
		else if((istype(T, /obj/item/bot_part/roomba/roomba_plating)) && (panel_open))

			// Check if the roomba is already armored.
			if(armored)
				to_chat(user, "There is already armor plating on [src].")
				return

			// Here we know there isn't any armor.
			armored = W // Store the plating so that we can drop it later.
			to_chat(user, "you install the [W.name] on [src].")
			armor = armored.armor_stat // Replace the roomba's armor values with the plating's.
			maxHealth += armored.health_bonus
			health += armored.health_bonus

			// Get rid of the plating
			user.remove_from_mob(W)
			W.forceMove(src)
			update_icon()
			return

		// Is it the taped knife and is the panel open?
		else if((istype(T, /obj/item/bot_part/roomba/roomba_knife)) && (panel_open))

			// The roomba can only have one weapon at the time.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			// New var to use the knife's unique property bla bla bla you know how it goes.
			var/obj/item/bot_part/roomba/roomba_knife/K = W

			src.weaponry = K // Store the knife in the bot
			to_chat(user, "You tape the [W.name] on [src].")

			// Give the roomba the damage bonus of the knife.
			melee_damage_lower += K.damage_boost
			melee_damage_upper += K.damage_boost

			// Remove the knife from the user and give it to the roomba.
			user.remove_from_mob(W)
			W.forceMove(src)
			update_icon()
			return

		// Typical 'is it a gun and is the panel open'.
		else if((istype(T, /obj/item/gun)) && (panel_open))

			// Roomba already got a weapon.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			// Roomba can only use energy guns.
			if(istype(T, /obj/item/gun/energy))
				var/obj/item/gun/energy/G = W // New variable to use unique var.
				weaponry = G // Store the weapon
				projectiletype = G.projectile_type // Allow the roomba to fire the type of laser
				ranged = TRUE // Let the roomba know it can attack at range.
				to_chat(user, "You install the [W.name] on [src].")

				// Remove the gun from the user and give it ot the roomva.
				user.remove_from_mob(W)
				G.forceMove(src)
				update_icon()
				return

			// We cannot use that gun.
			to_chat(user, "[src] cannot use this type of weaponry.")
			return

		// Are we trying to install a mine?
		else if((istype(T, /obj/item/mine)) && (panel_open))

			// Roomba already got a weapon.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			var/obj/item/mine/M = W // New variable to use unique var.
			weaponry = M // Store the weapon
			kamikaze = M // Store the mine itself.
			to_chat(user, "You install the [W.name] on [src].")

			// Remove the gun from the user and give it ot the roomba.
			user.remove_from_mob(W)
			M.forceMove(src)
			update_icon()
			return

		// Use a crowbar to remove armor and weapons
		else if((QUALITY_PRYING in T.tool_qualities) && (panel_open))

			// Show a list to let the user decide what they want to remove.
			var/response = input(user, "What do you want to remove?") in list("Armor", "Weapon")

			// We want to remove the armor.
			if(response == "Armor")

				// Can't remove what isn't there.
				if(armored == null)
					to_chat(user, "[src] doesn't have any armor.")
					return

				// Skill check.
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PRYING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					armored.forceMove(src.loc) // Spawn the armor plating on the ground.
					armored = null // Remove the armor plating from the roomba
					armor = default_armor // Give the roomba back its default armor values.
					maxHealth -= armored.health_bonus // Remove the health bonus.
					if(health > maxHealth)
						health = maxHealth // If the current health of the roomba is over the current maximum health, reduce it to the maximum health.
					to_chat(user, "You remove [src]'s armor plating.")
					update_icon()
					return

			// We want to remove the weapon.
			if(response == "Weapon")

				// Can't remove something not there.
				if(weaponry == null)
					to_chat(user, "[src] doesn't have any weapons.")
					return

				// Skill Check.
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PRYING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					weaponry.forceMove(src.loc) // Spawn the weapon the roomba had.

					// Was the weapon the knife ?
					if(istype(weaponry, /obj/item/bot_part/roomba/roomba_knife))
						var/obj/item/bot_part/roomba/roomba_knife/K = weaponry // Unique stat e.t.c.

						// Cancel the melee damage bonus the knife gave to the roomba.
						melee_damage_lower -= K.damage_boost
						melee_damage_upper -= K.damage_boost
						to_chat(user, "You remove the [weaponry.name] from [src].")
						weaponry = null // It got no weapons now.
						return

					// If we're here then it isn't a knife, so it must be a gun.
					projectiletype = null // The roomba don't have a projectile to shoot now.
					ranged = FALSE // Tell the roomba it can't shoot anymore.
					to_chat(user, "You remove the [weaponry.name] from [src].")
					weaponry = null // It got no weapons now.
					update_icon()
					return

	// If nothing was ever triggered, continue as normal
	..()

// Custom examine message to show it's various states.
/mob/living/carbon/superior_animal/handmade/roomba/examine(mob/user)
	..() // Default stuff

	// Is the panel open.
	if(panel_open)
		to_chat(user, "The roomba's panel is open.")

	// If it is open then of course it is unlocked, but if it isn't open, we must show if it is locked or not.
	else if(!panel_locked)
		to_chat(user, "The roomba's panel is unlocked.")

	// Does it have a knife or a gun ?
	if(weaponry)
		to_chat(user, "The roomba got a [weaponry.name] attached to it.")

// Make it drop its loot on death.
/mob/living/carbon/superior_animal/handmade/roomba/death()
	if(weaponry) // Only if it does have a weapon.
		weaponry.forceMove(src.loc) // Drop the weapon
		weaponry = null // No more weapon in the roomba
	if(kamikaze) // Check if the roomba got a mine.
		src.visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
		kamikaze.explode() // Make the mine explode.
		kamikaze = null // No more mine in the roomba
	..()
	update_icon()
	return

/mob/living/carbon/superior_animal/handmade/roomba/UnarmedAttack()
	. = ..()
	if((.) && (kamikaze)) // If we succeeded in hitting and the roomba got a bomb.
		death() // Kill the roomba which will in turn trigger the bomb.

/mob/living/carbon/superior_animal/handmade/roomba/update_icon()
	cut_overlays()
	if(panel_open)
		add_overlay(image(icon, "roomba_panel"))
	if(armored)
		add_overlay(image(icon, "roomba_plating"))
	if(weaponry)
		add_overlay(image(icon, "roomba_gun"))
