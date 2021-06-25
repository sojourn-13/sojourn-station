/mob/living/carbon/superior_animal/fungi
	name = "strange fungi"
	desc = "Is that a mushroom? Maybe it escaped from the Soteria labs? It certainly doesn't look like the usual walking mushrooms one would see in xenoflora."
	faction = "neutral"
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "mushroom"
	icon_living = "mushroom"
	icon_dead = "mushroom_dead"
	icon_rest = "mushroom_rest"
	move_to_delay = 1
	maxHealth = 150
	health = 150
	turns_per_move = 4
	melee_damage_lower = 10
	melee_damage_upper = 15
	viewRange = 4
	attacktext = "slammed"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_chance = 5
	emote_see = list("emits a low pleasent warble.","bounces.","hops back and forth.")
	meat_amount = 2
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/fungi
	mob_size = MOB_TINY
	colony_friend = TRUE

		//Hunger/feeding vars
	var/hunger_enabled = 1//If set to 0, a creature ignores hunger
	max_nutrition = 100
	hunger_factor = 0.5//A multiplier on how fast nutrition is lost. used to tweak the rates on a per-animal basis

	//Food behaviour vars
	var/autoseek_food = 1//If 0. this animal will not automatically eat
	var/beg_for_food = 1//If 0, this animal will not show interest in food held by a person
	var/min_scan_interval = 1//Minimum and maximum number of procs between a foodscan. Animals will slow down if there's no food around for a while
	var/max_scan_interval = 30
	var/scan_interval = 5//current scan interval, clamped between min and max
	//It gradually increases up to max when its left alone, to save performance
	//It will drop back to 1 if it spies any food.
		//This short time makes animals more responsive to interactions and more fun to play with
	var/seek_speed = 2//How many tiles per second the animal will move towards food
	var/seek_move_delay
	var/scan_range = 6//How far around the animal will look for food
	var/foodtarget = 0
	var/atom/movement_target = null//Thing we're moving towards
	var/turns_since_scan = 0

	stop_automated_movement_when_pulled = 1 //or just drag it around since it doesn't mind.
	break_stuff_probability = 0
	leather_amount = 0
	bones_amount = 0
	var/mob/following = null // Who are we following?
	var/atom/eat_target // Current food.

/mob/living/carbon/superior_animal/fungi/New()
	..()
	nutrition = 20 // Else they make a bottle as soon as they spawn.
