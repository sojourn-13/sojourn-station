/mob/living/simple/hostile/hivebot
	name = "Malfunctioning Autonomous Drone"
	desc = "An old machine of a long fallen alien empire. Looks like it just attacks everything on sight."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "melee"
	icon_dead = "melee_broken"
	health = 50 * REPUBLICON_HEALTH_MOD
	maxHealth = 50 * REPUBLICON_HEALTH_MOD
	melee_damage_lower = 5
	melee_damage_upper = 13
	attacktext = "sawed"
	projectilesound = 'sound/weapons/energy/Laser.ogg'
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
	leather_amount = 0
	bones_amount = 0
	//Drops
	var/drop1 = /obj/item/scrap_lump
	var/drop2 = null
	needs_environment = FALSE
	armor = list(melee = 3, bullet = 1, energy = 5, bomb = 25, bio = 100, rad = 25)
	cant_gib = TRUE
	sanity_damage = 1
	research_value = 175

/mob/living/simple/hostile/hivebot/emp_act(severity)
	..()
	adjustFireLoss(rand(20,30))
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/simple/hostile/hivebot/range
	name = "Malfunctioning Autonomous Sentinel"
	icon_state = "range"
	icon_dead = "range_broken"
	ranged = 1

/mob/living/simple/hostile/hivebot/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
	qdel(src)
	return
