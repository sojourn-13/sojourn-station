/mob/living/simple_animal/hostile/roomba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "onestar"
	attacktext = "bonked"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	move_to_delay = 2
	turns_per_move = 5
	minbodytemp = 0
	speed = 4
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	projectiletype = /obj/item/projectile/beam/drone
	move_to_delay = 9
	health = 25
	maxHealth = 25
	melee_damage_lower = 5
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/roomba/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return


/mob/living/simple_animal/hostile/roomba/slayer
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems to have a knife taped to it..?"
	icon_state = "roomba_knife"
	health = 35
	maxHealth = 35
	speed = 2
	melee_damage_lower = 12
	melee_damage_upper = 17



/mob/living/simple_animal/hostile/roomba/boomba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. Is that a fucking anti-personel mine?!"
	icon_state = "boomba"
	health = 15
	maxHealth = 15
	speed = 0
	melee_damage_lower = 10
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/roomba/boomba/AttackTarget()
	. = ..()
	if(.) // If we succeeded in hitting.
		src.visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
		explosion(get_turf(loc), -1, -1, 2, 3)
		death()

/mob/living/simple_animal/hostile/roomba/gun_ba
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. And this one has a gun."
	icon_state = "roomba_lmg"
	health = 30
	maxHealth = 30
	speed = 3
	melee_damage_lower = 5
	melee_damage_upper = 10
	ranged = 1

/mob/living/simple_animal/hostile/roomba/synthetic
	name = "Greyson Positronic FBP-Utility unit"
	desc = "A full body positronic, tasked with carrying out a variety of duties. This one is unarmed."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "nanotrasen"
	attacktext = "punched"
	move_to_delay = 2
	turns_per_move = 7
	speed = 6
	move_to_delay = 4
	health = 125
	maxHealth = 125

/mob/living/simple_animal/hostile/roomba/synthetic/epistol
	name = "Greyson Positronic FBP-SEC Mark I unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an old style energy pistol built into its arm."
	icon_state = "nanotrasenranged"
	ranged = 1

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/esmg
	name = "Greyson Positronic FBP-SEC Mark II unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified burst fire cog laser rifle built into its arm."
	icon_state = "nanotrasenrangedsmg"
	rapid = 1
	projectiletype = /obj/item/projectile/beam/pulse/drone

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/rifle
	name = "Greyson Positronic FBP-SEC Mark III unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has a modified heavy duty cog carbine built into its arm."
	icon_state = "nanotrasenrangedassault"
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/simple_animal/hostile/roomba/synthetic/epistol/heavy
	name = "Greyson Positronic FBP-SEC Heavy unit"
	desc = "A full body positronic, tasked with carrying out security duty without emotion, remorse, or questions. This one is has an overclocked super cog laser rifle built in his arm."
	icon_state = "nanotrasen_ert"
	projectiletype = /obj/item/projectile/beam/heavylaser

//spawners
/obj/random/mob/roomba
	name = "random greyson bot"
	icon_state = "hostilemob-black"
	has_postspawn = TRUE
	alpha = 128

/obj/random/mob/roomba/item_to_spawn()
	return pickweight(list(/mob/living/simple_animal/hostile/roomba = 17,
				/mob/living/simple_animal/hostile/roomba/slayer = 15,
				/mob/living/simple_animal/hostile/roomba/boomba = 7,
				/mob/living/simple_animal/hostile/roomba/gun_ba = 10,
				/mob/living/simple_animal/hostile/onestar_custodian = 25,
				/mob/living/simple_animal/hostile/onestar_custodian/chef = 10,
				/mob/living/simple_animal/hostile/onestar_custodian/engineer = 15,
				/mob/living/simple_animal/hostile/roomba/synthetic = 10,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol = 15,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/esmg = 12,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/rifle = 9,
				/mob/living/simple_animal/hostile/roomba/synthetic/epistol/heavy = 4,
				))

/obj/random/mob/roomba/post_spawn(var/list/spawns)
	for(var/mob/living/simple_animal/A in spawns)
		A.stasis = TRUE