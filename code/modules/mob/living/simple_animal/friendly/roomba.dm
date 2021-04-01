/mob/living/simple_animal/soteria_roomba
	name = "7K-Ten"
	desc = "A pink roomba, the research overseers pet."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba_pink"
	mob_size = MOB_SMALL
	speak_chance = 0
	turns_per_move = 1
	maxHealth = 5
	health = 5
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "whacks"
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

	//Drops
	var/drop1 = /obj/item/weapon/scrap_lump
	var/drop2 = null
	var/cell_drop = null

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