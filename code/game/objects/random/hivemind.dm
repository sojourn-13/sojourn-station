/obj/random/structures/hivemind_mob
	name = "random hivemind mob"
	icon_state = "hostilemob-purple"
	alpha = 128

/obj/random/structures/hivemind_mob/item_to_spawn()
	return pickweight(list(/mob/living/simple_animal/hostile/hivemind/stinger = 5,
		/mob/living/simple_animal/hostile/hivemind/bomber = 0.5,
		/mob/living/simple_animal/hostile/hivemind/lobber = 3,
		/mob/living/simple_animal/hostile/hivemind/hiborg = 5,
		/mob/living/simple_animal/hostile/hivemind/himan = 1,
		/mob/living/simple_animal/hostile/hivemind/phaser = 2,
		/mob/living/simple_animal/hostile/hivemind/mechiver = 1
		))

/obj/random/structures/hivemind_machine
	name = "random hivemind machine"
	icon_state = "hostilemob-purple"
	alpha = 128

/obj/random/structures/hivemind_machine/item_to_spawn()
	var/list/machines_to_pick = list(/obj/machinery/hivemind_machine/node = 0.1,
		/obj/machinery/hivemind_machine/turret = 2,
		/obj/machinery/hivemind_machine/mob_spawner = 3,
		/obj/machinery/hivemind_machine/screamer = 1,
		/obj/machinery/hivemind_machine/supplicant = 4,
		/obj/machinery/hivemind_machine/distractor = 2,
		)
	//So we dont runtime
	if(hive_mind_ai)
		//So we dont instantly give away that we have spawned
		if(hive_mind_ai.evo_level > 2)
			machines_to_pick += list(/obj/machinery/hivemind_machine/babbler = 3)
	else //In case we are spawning these without a hivemind for some reason
		machines_to_pick += list(/obj/machinery/hivemind_machine/babbler = 3)

	return pickweight(machines_to_pick)

/obj/random/structures/hivemind_machine_or_mob
	name = "random hivemind machine or mob"
	icon_state = "hostilemob-purple"
	alpha = 128

/obj/random/structures/hivemind_machine_or_mob/item_to_spawn()
	return pickweight(list(/obj/machinery/hivemind_machine/node = 0.1,
		/obj/machinery/hivemind_machine/turret = 5,
		/obj/machinery/hivemind_machine/mob_spawner = 3,
		/obj/machinery/hivemind_machine/screamer = 1,
		/obj/machinery/hivemind_machine/supplicant = 4,
		/obj/machinery/hivemind_machine/distractor = 2,
		/mob/living/simple_animal/hostile/hivemind/stinger = 5,
		/mob/living/simple_animal/hostile/hivemind/bomber = 0.5,
		/mob/living/simple_animal/hostile/hivemind/lobber = 3,
		/mob/living/simple_animal/hostile/hivemind/hiborg = 5,
		/mob/living/simple_animal/hostile/hivemind/himan = 1,
		/mob/living/simple_animal/hostile/hivemind/phaser = 2,
		/mob/living/simple_animal/hostile/hivemind/mechiver = 1
		))