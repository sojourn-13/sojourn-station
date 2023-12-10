/mob/living/simple_animal/soteria_roomba
	name = "7K-Ten"
	desc = "A pink roomba, the research overseers pet."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba_pink"
	mob_size = MOB_SMALL
	speak_chance = 0
	hunger_enabled = FALSE
	turns_per_move = 1
	maxHealth = 125 //Lets not die to a single roach bit
	health = 125 //Most things deal 40 at a time
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "whacks"
	cleaning = TRUE //we do clean prase us!
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	leather_amount = 0
	bones_amount = 0
	colony_friend = TRUE
	friendly_to_colony = TRUE
	needs_environment = FALSE
	//Drops
	var/drop1 = /obj/item/scrap_lump
	var/drop2 = null
	var/cell_drop = null
	sanity_damage = -2

/mob/living/simple_animal/soteria_roomba/medical
	name = "Hibikleaner Morikroomba"
	desc = "An orange roomba that someone seems to have attached fox ears to along with a name tag. Its servos whine slightly as it cleans."
	icon_state = "roomba_SI_fox"

// For repairing damage to the synths.
/mob/living/simple_animal/soteria_roomba/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
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

/mob/living/simple_animal/soteria_roomba/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
	if(cell_drop)
		new cell_drop (src.loc)
		cell_drop = null
	qdel(src)
	return
