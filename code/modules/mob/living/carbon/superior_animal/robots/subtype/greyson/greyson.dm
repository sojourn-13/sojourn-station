/*
/mob/living/carbon/superior_animal/robot/greyson
	name = "Greyson Positronic RMB-A unit"
	desc = "A small round drone, usually tasked with carrying out menial tasks. This one seems pretty harmless."
	icon = 'icons/mob/battle_roomba.dmi'
	icon_state = "roomba"
	faction = "greyson"
	emp_damage = FALSE // Greyson is immune to EMP

//spawners
/obj/random/mob/roomba
	name = "random greyson bot"
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
				))

/obj/random/mob/roomba/post_spawn(var/list/spawns)
	for(var/mob/living/simple_animal/A in spawns)
		A.stasis = TRUE
*/