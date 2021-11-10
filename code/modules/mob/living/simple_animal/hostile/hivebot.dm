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
	leather_amount = 0
	bones_amount = 0
	//Drops
	var/drop1 = /obj/item/scrap_lump
	var/drop2 = null

	armor = list(melee = 15, bullet = 5, energy = 20, bomb = 25, bio = 100, rad = 25)


/mob/living/simple_animal/hostile/hivebot/emp_act(severity)
	..()
	adjustFireLoss(rand(20,30))
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

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
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
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
	projectiletype = /obj/item/projectile/beam //This basiclly nulls armor + deals 20 damage
	faction = "hivebot"

	//Death and harvest vars
	meat_amount = 3
	meat_type = /obj/item/scrap_lump
	blood_from_harvest = /obj/effect/decal/cleanable/blood/gibs/robot
	gibspawner = /obj/effect/gibspawner/robot

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

/mob/living/simple_animal/hostile/republicon/emp_act(severity)
	..()
	adjustFireLoss(rand(80,130))
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/simple_animal/hostile/republicon/range
	name = "Forgotten Sentinel"
	desc = "The creators of the malfunctioning autonomous drones, having long since gone haywire themselves they destroy anything they find. This one is equipped with a heavy laser cannon."
	icon_state = "republicon-armed"
	icon_dead = "republicon-armed_dead"
	ranged = 1

/mob/living/carbon/superior_animal/sentinal_seeker
	name = "Forgotten Seeker"
	desc = "An ancient and dangerous machine from a long forgotten time with a heavily armored body can shrug off bullets and melee strikes with ease. At some point, it had a purpose, now it has gone \
	mad and seeks only death, yours and its own."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "seeker"
	icon_dead = "seeker_dead"
	pass_flags = PASSTABLE

	mob_size = MOB_LARGE

	attack_sound = 'sound/weapons/rapidslice.ogg'
	speak_emote = list("screams")
	emote_see = list("sharpens its knives carefully.", "shudders and shakes for a moment!", "gushes red ichor!")
	deathmessage = "collapses into a pile of scrap!"
	speak_chance = 5

	friendly_to_colony = FALSE

	move_to_delay = 1
	turns_per_move = 4
	see_in_dark = 10

	melee_damage_lower = 35
	melee_damage_upper = 40

	armor = list(melee = 15, bullet = 10, energy = 20, bomb = 25, bio = 0, rad = 25)


	health = 900
	maxHealth = 900
	attacktext = "sliced"
	faction = "hivebot"
	viewRange = 14
	default_pixel_x = -16
	randpixel = 0

	//Death and harvest vars
	meat_amount = 3
	meat_type = /obj/item/scrap_lump
	gibspawner = /obj/effect/gibspawner/robot
	leather_amount = 0
	bones_amount = 0
	fleshcolor = "#080808"
	bloodcolor = "#080808"

	light_range = 6
	light_color = COLOR_LIGHTING_RED_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC

/mob/living/carbon/superior_animal/sentinal_seeker/New()
	..()
	pixel_x = -16
	pixel_y = 0
