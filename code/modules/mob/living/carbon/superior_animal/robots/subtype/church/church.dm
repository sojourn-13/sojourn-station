/mob/living/carbon/superior_animal/robot/church
	name = "Absolute"
	desc = "You shouldn't be seeing this"
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = ""
	faction = "neutral"
	light_range = 3
	light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT
	colony_friend = TRUE
	friendly_to_colony = TRUE
	emp_damage = FALSE // They're golems, not robots, can't be EMP'ed
	termiation = FALSE
	cleaning = FALSE
	meat_type = /obj/item/stack/material/biomatter/random

/mob/living/carbon/superior_animal/robot/church/obey_check(mob/living/speaker = null)
	. = ..() // Check for fren.
	if(speaker?.get_core_implant(/obj/item/implant/core_implant/cruciform))
		return TRUE // We obey everyone with a cruciform

/mob/living/carbon/superior_animal/robot/church/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [name].")
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
