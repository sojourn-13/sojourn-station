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
	var/cleaning = TRUE //we do clean prase us!
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

/mob/living/simple_animal/soteria_roomba/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0) //WE CLEAN!

	. = ..()

	if(cleaning)
		var/turf/tile = loc
		if(isturf(tile))
			tile.clean_blood()
			for(var/A in tile)
				if(istype(A, /obj/effect))
					if(istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay))
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
	return

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
