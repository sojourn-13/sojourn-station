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
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	stop_automated_movement = 1
	friendly = "pinches"
	mob_size = 5
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	possession_candidate = 1

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
	name = "Coffee"
	real_name = "Coffee"
	desc = "It's Coffee, the other pet!"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"

/mob/living/simple_animal/frog
	name = "frog"
	desc = "Ribbit!"
	icon_state = "tinyfrog"
	mob_size = MOB_TINY
	speak_emote = list("ribbits")
	emote_see = list("ribbits")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	mob_size = 3
	faction = "pond"
	density = 0
	wander = 1

/mob/living/simple_animal/rat
	name = "rat"
	real_name = "rat"
	icon = 'icons/mob/mobs-mouse.dmi'
	icon_state = "rat_brown"
	item_state = "rat_brown"
	icon_living = "rat_brown"
	icon_dead = "mouse_brown_splat"
	icon_rest = "mouse_brown_sleep"
	desc = "A large disgusting rodent known for carrying disease and stealing food. The larger tougher cousin of the mouse, the noble rat."
	can_nap = FALSE
	maxHealth = 20
	health = 20
	melee_damage_upper = 5
	melee_damage_lower = 3
	meat_amount = 2

/mob/living/simple_animal/frog/rare
	name = "Pepe"
	desc = "It's quite colorful but you can't help but feel he is incredibly smug and super rare."
	icon_state = "rare_frog"
	mob_size = MOB_TINY
	speak_emote = list("ribbits smugly")
	emote_see = list("ribbits smugly")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	mob_size = 3
	faction = "pond"

/mob/living/simple_animal/snail
	name = "snail"
	desc = "Taking things slowly, one day at a time."
	icon_state = "snail"
	mob_size = MOB_TINY
	speak_chance = 0
	turns_per_move = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	mob_size = 3
	faction = "pond"
	density = 0