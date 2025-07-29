//
// Abstract Class
//
/mob/living/simple/hostile/mimic
	name = "suspicious object"
	desc = "It seems rather.. gooey. Is that thing organic?"
	icon = 'icons/mob/mobs-monster.dmi'
	//icon_state = "trashcart_mimic"
	icon_dead = "mimic_dead"

	meat_type = /obj/item/reagent_containers/snacks/meat/carp
	response_help = "touches"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = 1
	maxHealth = 100
	health = 100

	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "attacked"
	attack_sound = 'sound/weapons/bite.ogg'
	sanity_damage = 1

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

	faction = "mimic"
	move_to_delay = 2
	research_value = 300

/mob/living/simple/hostile/mimic/Initialize()
	icon_state = "mimic_[pick("trashcart","crate","bin","steel","wood","med","freezer","wep","stool","body","ore")]"
