/mob/living/carbon/superior_animal/lodge
	name = "Lodge Farming Animals"
	desc = "Report to Kaz if you see this"
	icon = 'icons/mob/mobs-domestic.dmi'
	faction = "neutral"
	pass_flags = PASSTABLE
	turns_per_move = 5
	see_in_dark = 10
	wander = TRUE
	stop_automated_movement_when_pulled = TRUE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	obey_friends = FALSE
	follow_distance = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat
	attack_sound = 'sound/xenomorph/alien_bite1.ogg'
	target_dummy = TRUE

/mob/living/carbon/superior_animal/lodge/attack_hand(mob/living/carbon/human/M as mob)
	..()

/mob/living/simple_animal/attack_hand(mob/living/carbon/human/M as mob)
	..()

	switch(M.a_intent)

		if(I_HELP)
			M.visible_message("\blue [M] pets \the [src]")

		if(I_DISARM)
			M.visible_message("\blue [M] shakes \the [src]")

		if(I_GRAB)

			M.visible_message("\red [M] hugged [src] passively!")

		if (I_HURT)

			M.visible_message("\red [M] abused \the [src]")
