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
	density = FALSE
	cant_be_pulled = FALSE

	get_stat_modifier = FALSE

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/roomba/allied/attackby(obj/item/W as obj, mob/user as mob)
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
	density = FALSE
	cant_be_pulled = FALSE

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored/allied/attackby(obj/item/W as obj, mob/user as mob)
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
	// If nothing was ever triggered, continue as normal
	..()

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
	cant_be_pulled = FALSE

	get_stat_modifier = FALSE

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if (!isnull(T))
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
	// If nothing was ever triggered, continue as normal
	..()

/mob/living/carbon/superior_animal/robot/greyson/synthetic/allied/doTargetMessage()
	. = ..()

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
	target_dummy = TRUE
