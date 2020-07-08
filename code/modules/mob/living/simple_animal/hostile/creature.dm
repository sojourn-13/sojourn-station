/mob/living/simple_animal/hostile/creature
	name = "creature"
	desc = "A sanity-destroying otherthing."
	icon = 'icons/mob/mobs-monster.dmi'
	speak_emote = list("gibbers")
	icon_state = "otherthing"
	health = 80
	maxHealth = 80
	melee_damage_lower = 25
	melee_damage_upper = 50
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "creature"
	speed = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human

/mob/living/simple_animal/hostile/creature/cult
	faction = "cult"
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	supernatural = 1

/mob/living/simple_animal/hostile/retaliate/spaceman
	name = "spaceman"
	desc = "This strange being resembles a human, but is something different entirely."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "old"
	icon_dead = "old_dead"
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "punches"
	health = 100
	maxHealth = 100
	melee_damage_lower = 5
	melee_damage_upper = 10
	attacktext = "hits"
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human

/mob/living/simple_animal/hostile/retaliate/spaceman/leader
	name = "spaceman leader"
	desc = "This appears to be an important figure among its strange kind."
	icon_state = "old2"
	icon_dead = "old2_dead"
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "punches"
	health = 200
	maxHealth = 200
	melee_damage_lower = 20
	melee_damage_upper = 40
	attacktext = "hits"
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/human