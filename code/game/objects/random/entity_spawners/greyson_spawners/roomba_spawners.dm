/obj/entity_spawner/greyson/roomba

	name = "Greyson Positronics roomba dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top?"

	maximum_spawned = 20

	spawn_delay = 5
	spawn_delay_initial = 5

	spawn_probability = 100

	default_spawn = list(
						list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba)
	)


/obj/entity_spawner/greyson/roomba/mixed

	to_spawn = list(
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/slayer, 65),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip, 45),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored, 35),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical, 20),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med, 10),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba, 35),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/plasma, 30),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/armored, 25),
					list(1, /mob/living/carbon/superior_animal/robot/greyson/roomba/boomba, 5)
	)

/obj/entity_spawner/greyson/roomba/ranged

	default_spawn = list(
						list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba),
	)

	to_spawn = list(
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/plasma, 50),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/armored, 50)
	)

/obj/entity_spawner/greyson/roomba/melee

	to_spawn = list(
					list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba/slayer, 85),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip, 65),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored, 55),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical, 35),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med, 15)
	)

/obj/entity_spawner/greyson/roomba/healing

	maximum_spawned = 5

	default_spawn = list(
						list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med/healer)
	)
	to_spawn = null

/obj/entity_spawner/greyson/roomba/melee/claymore
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top? ARE THOSE CLAYMORES ON TOP OF THEM?"

	maximum_spawned = 5

	death_message = "falls apart, the remaining explosive materials inside, claymores/roombas and all, detonate violently!"

	default_spawn = list(
						list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/boomba) //fuck you
	)
	to_spawn = null

/obj/entity_spawner/greyson/roomba/melee/claymore/disassemble()

	explosion(get_turf(loc), 0, 1, 2, 3)

	. = ..()

/obj/entity_spawner/greyson/roomba/melee/claymore/deathmessage()
	visible_message("As the [src] [death_message]")
