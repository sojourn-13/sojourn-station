/mob/living/simple/hostile/plant
	name = "Mycus"
	desc = "Is that a mushroom person? It's wearing a loin cloth and a hide mantle. Weird."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "shroom_1"
	speak_chance = 5
	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 2
	stop_automated_movement_when_pulled = 1
	wander = 0
	maxHealth = 200
	health = 200
	vision_range = 12
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "slammed"
	attack_sound = 'sound/weapons/punch1.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0
	meat_amount = 0
	meat_type = null
	leather_amount = 0
	bones_amount = 0
	faction = "neutral"
	research_value = 200

/mob/living/simple/hostile/plant/alt
	icon_state = "shroom_2"
	desc = "Is that a mushroom person? It's wearing a loin cloth and a black cloak. Weird."
	research_value = 200

/mob/living/simple/hostile/plant/folken
	name = "Folken"
	desc = "Is that a plant person? It's wearing a scavenged poncho and a flat cap."
	icon_state = "plant_1"
	research_value = 220

/mob/living/simple/hostile/plant/folken/alt
	icon_state = "plant_2"
	desc = "Is that a plant person? It's wearing a scavenged pair of jeans and shirt with a dusty cowboy hat."
	research_value = 220
