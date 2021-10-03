/mob/living/carbon/superior_animal/robot
	name = "Robot"
	desc = "Beep Boop!"
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "robot"
	attacktext = "bonked"
	breath_required_type = 0 // Doesn't need to breath, in a space suit
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	move_to_delay = 4
	turns_per_move = 5
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	projectiletype = /obj/item/projectile/beam/drone

	armor = list(melee = 30, bullet = 20, energy = 35, bomb = 30, bio = 100, rad = 100) //We want to be gunned down, not lasered

	do_gibs = FALSE

	attack_sound = 'sound/weapons/slice.ogg' //So we dont make bite sounds

	deathmessage = "blows apart!"
	health = 25
	maxHealth = 25
	melee_damage_lower = 5
	melee_damage_upper = 10
	leather_amount = 0
	bones_amount = 0
	randpixel = 0
	viewRange = 8
	var/cleaning = TRUE
	var/emp_damage = TRUE // Does EMP & Ion weapons cause damage?

	can_burrow = FALSE
	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_COMMON)

	//Drops
	var/drop1 = /obj/item/scrap_lump
	var/drop2 = null
	var/cell_drop = null

/mob/living/carbon/superior_animal/robot/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0) //WE CLEAN!
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

/mob/living/carbon/superior_animal/robot/death()
	..()
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

/mob/living/carbon/superior_animal/robot/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE
	if(emp_damage)
		adjustFireLoss(rand(50,80)*severity)

/mob/living/carbon/superior_animal/robot/examine(mob/user)
	..()
	if(iscarbon(user) || issilicon(user))
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