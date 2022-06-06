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
