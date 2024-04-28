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
	return pickweight(list(/obj/machinery/hivemind_machine/node = 0.1,
		/obj/machinery/hivemind_machine/turret = 2,
		/obj/machinery/hivemind_machine/mob_spawner = 3,
		/obj/machinery/hivemind_machine/babbler = 5,
		/obj/machinery/hivemind_machine/screamer = 1,
		/obj/machinery/hivemind_machine/supplicant = 4,
		/obj/machinery/hivemind_machine/distractor = 2,
		))

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