/*
I was too lazy to put the friendly roombas with the handmade drones, so now they are here. -R4d6
*/

//Non-hostile to regular colonists.
//Roomba
/mob/living/carbon/superior_animal/robot/greyson/roomba/allied
	name = "SI Combat Roomba"
	desc = "A small round soteria branded research drone, usually tasked with menial work. For whatever reason, this one has been tasked for combat."
	faction = "neutral"
	icon_state = "roomba_SI"
	melee_damage_lower = 10
	melee_damage_upper = 15
	colony_friend = TRUE
	friendly_to_colony = TRUE
	mob_size = MOB_SMALL
	stop_automated_movement_when_pulled = 1
	density = 1

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/roomba/allied/attackby(obj/item/weapon/W as obj, mob/user as mob)
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

/mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored/allied
	name = "SI Armored Roomba"
	desc = "A small round soteria branded research drone, usually tasked with menial work. For whatever reason, this one has been tasked for combat and given additional armor."
	faction = "neutral"
	icon_state = "roomba_SI_armor"
	melee_damage_lower = 12
	melee_damage_upper = 17
	colony_friend = TRUE
	friendly_to_colony = TRUE
	mob_size = MOB_SMALL
	stop_automated_movement_when_pulled = TRUE
	density = 0

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored/allied/attackby(obj/item/weapon/W as obj, mob/user as mob)
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

/mob/living/carbon/superior_animal/robot/greyson/roomba/custom
	name = "Custom Roomba"
	desc = "A small round roomba that can be customized for various tasks."
	faction = "neutral"
	icon = 'icons/mob/custom_bot.dmi'
	icon_state = "roomba"
	melee_damage_lower = 10
	melee_damage_upper = 15
	health = 50
	maxHealth = 50
	colony_friend = TRUE
	friendly_to_colony = TRUE
	can_buckle = TRUE
	mob_size = MOB_SMALL
	stop_automated_movement_when_pulled = TRUE
	density = 1

	// Default armor values so that we can reference them.
	var/default_armor = list(
		melee = 15,
		bullet = 15,
		energy = 15,
		bomb = 15,
		bio = 100, // It is a robot, shouldn't be affected by viruses or pain
		agony = 100
	)

	var/panel_locked = TRUE // Is the panel locked?
	var/panel_open = FALSE // Is the panel open?
	var/obj/item/weapon/bot_part/roomba/roomba_plating/armored = null // Hold the roomba armor plating so that we can get it back.
	var/obj/item/weapon/weaponry = null // Hold the roomba armor plating so that we can get it back.
	var/obj/item/weapon/mine/kamikaze = null // Store the mine the roomba can hold.
	var/obj/item/weapon/cell/medium/cell = null // Hold the roomba's power cell.

/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/New()
	armor = default_armor // Give the roomba it's default armor.
	..()

/*\
 * The attackby() is basically a decision tree with branches.
 * Since most of the branches are binary choices, there will be 'if' which return, and if you don't enter the 'if', consider it the 'else'.
\*/
/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/attackby(obj/item/weapon/W as obj, mob/user as mob)
	var/obj/item/weapon/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/weapon/tool))
			T = W

		// Check if it is a roomba part
		if(istype(W, /obj/item/weapon/bot_part/roomba))
			T = W

		// Check if it is a gun
		if(istype(W, /obj/item/weapon/gun))
			T = W

		// Check if it is a mine
		if(istype(W, /obj/item/weapon/mine))
			T = W

		// Check if the weapon is an ID.
		if(istype(W, /obj/item/weapon/card/id))

			// Don't lock or unlock the panel if it is open.
			if(panel_open)
				to_chat(user, "Close the panel first")
				return

			// Make a new ID var so that we can use the ID-unique variable.
			var/obj/item/weapon/card/id/C = W

			// Check for robotic access
			if(!access_robotics in C.access)
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
					return

				// If we're here, then the panel wasn't open, so let's open it.
				panel_open = TRUE
				to_chat(user, "You open [src]'s panel.")
				return

		// Are we attacking with the roomba plating and is the panel open?
		else if((istype(T, /obj/item/weapon/bot_part/roomba/roomba_plating)) && (panel_open))

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
			return

		// Is it the taped knife and is the panel open?
		else if((istype(T, /obj/item/weapon/bot_part/roomba/roomba_knife)) && (panel_open))

			// The roomba can only have one weapon at the time.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			// New var to use the knife's unique property bla bla bla you know how it goes.
			var/obj/item/weapon/bot_part/roomba/roomba_knife/K = W

			src.weaponry = K // Store the knife in the bot
			to_chat(user, "You tape the [W.name] on [src].")

			// Give the roomba the damage bonus of the knife.
			melee_damage_lower += K.damage_boost
			melee_damage_upper += K.damage_boost

			// Remove the knife from the user and give it to the roomba.
			user.remove_from_mob(W)
			W.forceMove(src)
			return

		// Typical 'is it a gun and is the panel open'.
		else if((istype(T, /obj/item/weapon/gun)) && (panel_open))

			// Roomba already got a weapon.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			// Roomba can only use energy guns.
			if(istype(T, /obj/item/weapon/gun/energy))
				var/obj/item/weapon/gun/energy/G = W // New variable to use unique var.
				weaponry = G // Store the weapon
				projectiletype = G.projectile_type // Allow the roomba to fire the type of laser
				ranged = TRUE // Let the roomba know it can attack at range.
				to_chat(user, "You install the [W.name] on [src].")

				// Remove the gun from the user and give it ot the roomva.
				user.remove_from_mob(W)
				G.forceMove(src)
				return

			// We cannot use that gun.
			to_chat(user, "[src] cannot use this type of weaponry.")
			return

		// Are we trying to install a mine?
		else if((istype(T, /obj/item/weapon/mine)) && (panel_open))

			// Roomba already got a weapon.
			if(weaponry)
				to_chat(user, "There is already a weapon on [src].")
				return

			var/obj/item/weapon/mine/M = W // New variable to use unique var.
			weaponry = M // Store the weapon
			kamikaze = M // Store the mine itself.
			to_chat(user, "You install the [W.name] on [src].")

			// Remove the gun from the user and give it ot the roomva.
			user.remove_from_mob(W)
			M.forceMove(src)
			return

		// Using a welder to repair it.
		else if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					health = maxHealth
					to_chat(user, "You repair the damage to [src].")
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
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
					if(istype(weaponry, /obj/item/weapon/bot_part/roomba/roomba_knife))
						var/obj/item/weapon/bot_part/roomba/roomba_knife/K = weaponry // Unique stat e.t.c.

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
					return

	// If nothing was ever triggered, continue as normal
	..()

// Custom examine message to show it's various states.
/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/examine(mob/user)
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
/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/death()
	if(cell) // Only if it does have a cell
		cell.forceMove(src.loc) // Drop the power cell
		cell = null // No more cell in the roomba
	if(weaponry) // Only if it does have a weapon.
		weaponry.forceMove(src.loc) // Drop the weapon
		weaponry = null // No more weapon in the roomba
	if(kamikaze) // Check if the roomba got a mine.
		src.visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
		kamikaze.explode() // Make the mine explode.
		kamikaze = null // No more mine in the roomba
	..()
	return

/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/findTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/robot/greyson/roomba/custom/UnarmedAttack()
	. = ..()
	if((.) && (kamikaze)) // If we succeeded in hitting and the roomba got a bomb.
		death() // Kill the roomba which will in turn trigger the bomb.

//Robots
/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied
	name = "SI Sword Drone"
	desc = "A soteria branded sword drone, fully robotic and carrying out its combat duty by slaying animals and non-colony humanoids on sight."
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "soteria"
	attacktext = "slashed"
	move_to_delay = 2
	turns_per_move = 7
	health = 250
	maxHealth = 250
	melee_damage_lower = 20
	melee_damage_upper = 30
	stop_automated_movement_when_pulled = TRUE
	wander = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/attackby(obj/item/weapon/W as obj, mob/user as mob)
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

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/findTarget()
	. = ..()
	if(.)
		visible_emote("lets out a buzz as it detects a target!")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1, -3)

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/advanced
	name = "SI Mantis Drone"
	desc = "A soteria branded heavily armored mantis drone, fully robotic and carrying out its combat duty by slaying animals and non-colony humanoids on sight."
	icon_state = "soteria_mantis"
	health = 350
	maxHealth = 350
	melee_damage_lower = 30
	melee_damage_upper = 40
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/junkbot
	name = "Prospector Junkbot"
	desc = "A prospector forged robot, its made from spare parts, love, and duct tape. Using designs 'borrowed' from the Soteria the prospector salvagers made these bots to function as disposable shields or \
	to gaurd specific locations since they do not wander. While lightweight, fast, and capable of a wickedly damaging slash with its armblade, they are not that durable."
	icon_state = "junkbot"
	health = 125
	maxHealth = 125
	melee_damage_lower = 15
	melee_damage_upper = 25
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/rook
	name = "Rook Golem"
	desc = "A massive gold gilded robotic golem made designed by Brown to help protect the Absolutism and guard areas of portents form local wildlife." //Todo: Have kaz rewrite this and better lore, maybe Greyson AI helped make it?
	faction = "neutral"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "rook"
	attacktext = "pumbles"
	move_to_delay = 2
	turns_per_move = 2
	health = 550
	maxHealth = 550
	melee_damage_lower = 20 //Big slow things dont deal a lot do to bullet sponges
	melee_damage_upper = 20
	drop1 = /obj/item/stack/material/gold/random
	drop2 = /obj/item/weapon/book/ritual/cruciform
