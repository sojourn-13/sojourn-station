/mob/living/carbon/superior_animal/roach/golden
	name = "golden roach"
	desc = "A weighty insect almost identical to some of the roaches that inhabit the colony. Though it seems related to the local roaches, it lacks many of features that make them an annoyance to colonists."
	icon = 'icons/mob/genetics/seuche_gold.dmi'
	icon_state = "seuche_gold"
	blattedin_revives_left = 0
	meat_amount = 4
	eating_time = 1 MINUTES
	snacker = TRUE
	clone_difficulty = CLONE_EASY
	can_burrow = FALSE
	faction = "neutral"
	colony_friend = TRUE
	friendly_to_colony = TRUE
	inherent_mutations = list()
	sanity_damage = 0 //they are peaceful thus not damaging sanity

/mob/living/carbon/superior_animal/roach/golden/blattin
	name = "Adept Blattin"
	desc = "Adept Blattin is a golden roach, an special and harmless breed that was made by soteria to be pets and in general help with the trash problem without being a nuisance to the colony. \
	But this one was adopted by the guild and being called 'Adept Blattin'. \
	A valuable member of the Artificer's Guild."

/obj/item/roach_egg/gold
	name = "roach egg"
	desc = "A cockroach egg, can be eaten with proper preparation. It seems to pulse slightly with an inner life."
	icon = 'icons/obj/genetics/g_roach_egg.dmi'
	icon_state = "gold_egg"
	preloaded_reagents = list("egg" = 9)
	spawn_type = /mob/living/carbon/superior_animal/roach/roachling_gold


/mob/living/carbon/superior_animal/roach/roachling_gold
	name = "Golden Roachling"
	desc = "A tiny cockroach, colored a shimmering gold. It never stays still for long."
	icon = 'icons/mob/genetics/roachling_gold.dmi'
	icon_state = "roachling_gold"

	turns_per_move = 3
	maxHealth = 10
	health = 10
	move_to_delay = 3.5

	knockdown_odds = 3
	melee_damage_lower = 2
	melee_damage_upper = 3

	armor = list(melee = 1, bullet = 0, energy = 0, bomb = 0, bio = 5, rad = 0, agony = 0)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	meat_amount = 1
	eating_time = 30 SECONDS //Takes less time
	life_cycles_before_sleep = 800 //We need more time to eat
	probability_egg_laying = 0 //We are too young to lay eggs!
	var/amount_grown = 0
	snacker = TRUE
	can_burrow = FALSE
	faction = "neutral"
	colony_friend = TRUE
	friendly_to_colony = TRUE
	inherent_mutations = list()


/mob/living/carbon/superior_animal/roach/roachling_gold/Life()
	.=..()
	if(!stat)
		if(amount_grown >= 50 && fed > 0) // Old enough to turn into an adult
			var/mob/living/carbon/superior_animal/roach/golden/roach = new (src.loc, src)
			roach.unnatural_mutations = src.unnatural_mutations.Copy()
			qdel(src)
		else
			amount_grown += rand(0,2) // Roachling growing up
