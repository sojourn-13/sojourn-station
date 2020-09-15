/mob/living/simple_animal/hostile/hivebot
	name = "Malfunctioning Autonomous Drone"
	desc = "An old machine of a long fallen alien empire. Looks like it just attacks everything on sight."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "melee"
	icon_dead = "melee_broken"
	health = 60
	maxHealth = 60
	melee_damage_lower = 5
	melee_damage_upper = 13
	attacktext = "sawed"
	projectilesound = 'sound/weapons/Laser.ogg'
	projectiletype = /obj/item/projectile/beam/drone
	faction = "hivebot"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	move_to_delay = 5

/mob/living/simple_animal/hostile/hivebot/range
	name = "Malfunctioning Autonomous Sentinel"
	icon_state = "range"
	icon_dead = "range_broken"
	ranged = 1

/mob/living/simple_animal/hostile/hivebot/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/republicon
	name = "Forgotten Engineer"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "republicon"
	icon_dead = "republicon_dead"
	health = 150
	maxHealth = 150
	melee_damage_lower = 15
	melee_damage_upper = 25
	attacktext = "clawed"
	projectilesound = 'sound/weapons/Laser.ogg'
	projectiletype = /obj/item/projectile/beam/heavylaser
	faction = "hivebot"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4
	light_range = 2
	light_color = COLOR_LIGHTING_RED_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	move_to_delay = 5

/mob/living/simple_animal/hostile/republicon/range
	name = "Forgotten Sentinel"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find. This one is equipped with a heavy laser cannon."
	icon_state = "republicon-armed"
	icon_dead = "republicon-armed_dead"
	ranged = 1