/mob/living/carbon/superior_animal/fungi
	name = "strange fungi"
	desc = "Is that a mushroom? Maybe it escaped from the Soteria labs? It certainly doesn't look like the usual walking mushrooms one would see in xenoflora."
	faction = "neutral"
	pass_flags = PASSTABLE
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "mushroom"
	icon_living = "mushroom"
	icon_dead = "mushroom_dead"
	icon_rest = "mushroom_rest"
	move_to_delay = 1
	maxHealth = 150
	health = 150
	turns_per_move = 2
	melee_damage_lower = 10
	melee_damage_upper = 15
	viewRange = 3
	attacktext = "slammed"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	emote_see = list("emits a low pleasent warble.","bounces.","hops back and forth.")
	meat_amount = 2
	meat_type = /obj/item/reagent_containers/food/snacks/meat/fungi
	mob_size = MOB_TINY
	randpixel = 0
	can_burrow = FALSE

	colony_friend = TRUE
	friendly_to_colony = TRUE

	//Hunger/feeding vars
	max_nutrition = 200
	hunger_factor = 0.5//A multiplier on how fast nutrition is lost. used to tweak the rates on a per-animal basis

	stop_automated_movement_when_pulled = 1 //or just drag it around since it doesn't mind.
	break_stuff_probability = 0
	leather_amount = 0
	bones_amount = 0
	follow_message = "says, \"I follow friend.\""
	stop_message ="says, \"I stop follow friend.\""

/mob/living/carbon/superior_animal/fungi/New()
	..()
	nutrition = 20 // Else they make a bottle as soon as they spawn.
	switch(pick("red","blue","green","gray","purple","yellow","orange","aqua"))
		if("red")
			color = "#ca8289"
		if("blue")
			color = "#aeccfe"
		if("green")
			color = "#72caa6"
		if("gray")
			return
		if("purple")
			color = "#a4a4c3"
		if("yellow")
			color = "#ffd56f"
		if("orange")
			color = "#ffba66"
		if("aqua")
			color = "#98ffdc"