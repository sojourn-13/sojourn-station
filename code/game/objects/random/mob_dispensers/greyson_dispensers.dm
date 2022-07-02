/obj/machinery/mob_dispenser/greyson //basetype, dont use
	name = "Greyson Positronics robot dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys."

	death_message = "'s lights dim, ceasing function as it falls apart!"

	color = PIPE_COLOR_ORANGE

	loot = list(
				/obj/item/stack/material/steel/{amount = 15} = 100,
				/obj/item/stack/material/glass/random = 95,
				/obj/item/stack/material/plasteel/random = 15,
				/obj/item/stack/cable_coil{amount = 5} = 90,
				/obj/item/trash/material/circuit = 100,
				/obj/item/stock_parts/matter_bin/one_star = 32,
				/obj/item/stock_parts/matter_bin/one_star = 32,
				/obj/item/stock_parts/manipulator/one_star = 32,
				/obj/item/stock_parts/manipulator/one_star = 32,
				/obj/item/stock_parts/micro_laser/one_star = 32,
				/obj/item/stock_parts/console_screen = 80
	)

/obj/machinery/mob_dispenser/greyson/on_deconstruction()

	do_sparks(1, FALSE, src)

	. = ..()


/obj/machinery/mob_dispenser/greyson/roomba

	name = "Greyson Positronics roomba dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top?"

	maximum_spawned = 20

	spawn_delay = 5
	spawn_delay_initial = 5

	spawn_probability = 100

/obj/machinery/mob_dispenser/greyson/roomba/melee

	default_spawn = list(list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba))
	to_spawn = list(
					list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba/slayer, 85),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip, 65),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored, 55),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical, 35),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med, 15))

/obj/machinery/mob_dispenser/greyson/roomba/melee/claymore
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top? ARE THOSE CLAYMORES ON TOP OF THEM?"

	maximum_spawned = 5

	death_message = "falls apart, the remaining explosive materials inside, claymores/roombas and all, detonate violently!"

	default_spawn = list(list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/boomba)) //fuck you
	to_spawn = null

/obj/machinery/mob_dispenser/greyson/roomba/melee/claymore/dismantle()

	explosion(get_turf(loc), 0, 1, 2, 3)

	. = ..()

/obj/machinery/mob_dispenser/greyson/roomba/melee/claymore/deathmessage()
	visible_message("As the [src] [death_message]")

