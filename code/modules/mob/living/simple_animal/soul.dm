/mob/living/simple_animal/soul
	name = "mining drill head"
	icon_state = "lightgeist"
	item_state = "lightgeist"
	desc = "The lifeforce of something that somehow came to be, nothing is known on what makes it but everything hates it."
	icon = 'icons/mob/mobs-domestic.dmi'
	faction = "target"
	health = 1
	maxHealth = 1
	canmove = 0
	blinded = 0
	anchored = 1	//  don't get pushed around
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	speak_chance = 0
	hunger_enabled = FALSE
	needs_environment = FALSE
	density = 0
	status_flags = GODMODE // ghooost!
	colony_friend = TRUE
	friendly_to_colony = TRUE
	min_oxy = 0
	minbodytemp = 0
	maxbodytemp = INFINITY
	autoseek_food = 0
	metabolic_factor = 0.0
	harm_intent_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	alpha = 0

/mob/living/simple_animal/soul/death()
	..()
	qdel(src)
	return

/mob/living/simple_animal/soul/MouseDrop(atom/over_object)
	return

/mob/living/simple_animal/soul/attack_hand(mob/living/carbon/human/M as mob)
	return

/mob/living/simple_animal/soul/bullet_act(var/obj/item/projectile/proj)
	return PROJECTILE_FORCE_MISS

/mob/living/simple_animal/soul/ex_act(severity)
	return

/mob/living/simple_animal/soul/singularity_act()
	return

/mob/living/simple_animal/soul/start_pulling(var/atom/movable/AM)
	return
