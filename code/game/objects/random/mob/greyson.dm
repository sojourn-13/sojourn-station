//spawners
/obj/random/mob/roomba
	name = "random guntlet greyson bot (100% Spawns Any) stasis"
	icon_state = "hostilemob-black"
	has_postspawn = TRUE
	alpha = 128

/obj/random/mob/roomba/item_to_spawn()
	return pickweight(list(
				/mob/living/carbon/superior_animal/robot/greyson/roomba = 17,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/slayer = 15,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/trip = 10,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored = 3,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/boomba = 7,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/armored = 5,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba = 10,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/plasma = 4,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical = 5,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med = 3,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med/healer = 3,
				/mob/living/carbon/superior_animal/robot/greyson/custodian = 25,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/chef = 10,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer = 15,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic = 10,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol = 15,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/esmg = 12,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/rifle = 9,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/heavy = 4,
				/mob/living/carbon/superior_animal/robot/greyson/stalker = 2,
				/mob/living/carbon/superior_animal/robot/greyson/stalker/dual = 1,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley = 3,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon = 2
				))

/obj/random/mob/roomba/post_spawn(var/list/spawns)
	for(var/mob/living/simple_animal/A in spawns)
		A.stasis = TRUE

/obj/random/mob/roomba/any
	name = "random greyson bot (100% Spawns Any)"
	has_postspawn = FALSE

/obj/random/mob/roomba/job
	name = "random greyson bot (100% Spawns Job based)"
	has_postspawn = FALSE

/obj/random/mob/roomba/job/item_to_spawn()
	return pickweight(list(
				/mob/living/carbon/superior_animal/robot/greyson/roomba = 15,
				/mob/living/carbon/superior_animal/robot/greyson/custodian = 25,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/chef = 10,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer = 15,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic = 5,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley = 1
				))

/obj/random/mob/roomba/melee
	name = "random greyson bot (100% Spawns melee based)"
	has_postspawn = FALSE

/obj/random/mob/roomba/melee/item_to_spawn()
	return pickweight(list(
				/mob/living/carbon/superior_animal/robot/greyson/roomba = 25,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/slayer = 20,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/trip = 15,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored = 10,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/boomba = 7,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical = 10,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med = 6,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med/healer = 6,
				/mob/living/carbon/superior_animal/robot/greyson/custodian = 25,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic = 20,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley = 2,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon = 1
				))

/obj/random/mob/roomba/range
	name = "random greyson bot (100% Spawns range based)"
	has_postspawn = FALSE

/obj/random/mob/roomba/range/low
	name = "random greyson bot (10% Spawns range based)"
	has_postspawn = FALSE
	spawn_nothing_percentage = 90

/obj/random/mob/roomba/range/item_to_spawn()
	return pickweight(list(
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/armored = 7,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba = 12,
				/mob/living/carbon/superior_animal/robot/greyson/roomba/gun_ba/plasma = 8,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/chef = 12,
				/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer = 15,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol = 15,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/esmg = 6,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/rifle = 5,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/epistol/heavy = 4,
				/mob/living/carbon/superior_animal/robot/greyson/stalker = 3,
				/mob/living/carbon/superior_animal/robot/greyson/stalker/dual = 1
				))

/obj/random/mob/roomba/mecha
	name = "random greyson bot (100% Spawns mecha based)"
	has_postspawn = FALSE

/obj/random/mob/roomba/mecha/low
	name = "random greyson bot (10% Spawns mecha based)"
	spawn_nothing_percentage = 90

/obj/random/mob/roomba/mecha/item_to_spawn()
	return pickweight(list(
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley = 10,
				/mob/living/carbon/superior_animal/robot/greyson/synthetic/ripley/phazon = 1
				))

