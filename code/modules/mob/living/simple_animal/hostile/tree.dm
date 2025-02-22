/mob/living/simple/hostile/tree
	name = "pine tree"
	desc = "A pissed off tree-like alien. It seems annoyed with the festivities..."
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	icon_dead = "pine_1"
	icon_gib = "pine_1"
	speak_chance = 0
	turns_per_move = 5
	meat_type = /obj/item/reagent_containers/snacks/meat/carp
	response_help = "brushes"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = -1
	maxHealth = 125
	health = 125
	sanity_damage = 1

	pixel_x = -16

	harm_intent_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 12
	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'

	//Space carp aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	leather_amount = 0
	bones_amount = 0

	faction = "carp"

/mob/living/simple/hostile/tree/FindTarget()
	. = ..()
	if(.)
		visible_message("growls at [.]")

/mob/living/simple/hostile/tree/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

/mob/living/simple/hostile/tree/death()
	..(null,"is hacked into pieces!")
	new /obj/item/stack/material/wood(loc)
	qdel(src)
