//Look Sir, free crabs!
/mob/living/simple_animal/crab
	name = "crab"
	desc = "A hard-shelled crustacean. Seems quite content to lounge around all the time."
	icon_state = "crab"
	mob_size = MOB_SMALL
	speak_emote = list("clicks")
	emote_see = list("clacks")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	stop_automated_movement = 1
	friendly = "pinches"
	faction = "pond"
	leather_amount = 0
	bones_amount = 0
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	possession_candidate = 1
	colony_friend = TRUE
	sanity_damage = -1

/mob/living/simple_animal/crab/Life()
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(isturf(src.loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				step_glide(src,pick(4,8), DELAY2GLIDESIZE(0.5 SECONDS))
				turns_since_move = 0
	regenerate_icons()

//COFFEE! SQUEEEEEEEEE!
/mob/living/simple_animal/crab/Coffee
	name = "Graves"
	real_name = "Graves"
	icon_state = "evilcrab"
	desc = "It's Graves, the other pet! Despite his rather evil appearence he is utterly harmless. Best friends with Tea the Frog."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	faction = "neutral"
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/frog
	name = "frog"
	desc = "Ribbit!"
	icon_state = "tinyfrog"
	mob_size = MOB_TINY
	speak_emote = list("ribbits")
	emote_see = list("ribbits")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	faction = "pond"
	density = 0
	wander = 1
	colony_friend = TRUE
	sanity_damage = -1

/mob/living/simple_animal/hostile/ratking
	name = "rat king"
	icon = 'icons/mob/mobs-mouse.dmi'
	icon_state = "rat_king"
	icon_dead = "mouse_brown_splat"
	icon_rest = "mouse_brown_sleep"
	desc = "The rat king cordially invites you to the sewer for a tasteful dining experience. Do you accept with gratitude or with enthusiasm?"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	faction = "neutral"
	maxHealth = 120
	health = 120
	melee_damage_upper = 20
	melee_damage_lower = 15
	meat_amount = 3

/mob/living/simple_animal/frog/rare
	name = "Tea"
	desc = "It's quite colorful but you can't help but feel he is incredibly smug given the fact this fatass just sits in his own personal pond all day."
	icon_state = "rare_frog"
	mob_size = MOB_TINY
	speak_emote = list("ribbits smugly")
	emote_see = list("ribbits smugly")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	faction = "neutral"
	colony_friend = TRUE
	friendly_to_colony = TRUE
	sanity_damage = -1

/mob/living/simple_animal/snail
	name = "snail"
	desc = "Taking things slowly, one day at a time."
	icon_state = "snail"
	mob_size = MOB_TINY
	speak_chance = 0
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	faction = "pond"
	density = 0
	colony_friend = TRUE
	sanity_damage = -1
