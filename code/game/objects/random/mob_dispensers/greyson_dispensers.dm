/obj/machinery/mob_dispenser/greyson //basetype, dont use
	name = "Greyson Positronics robot dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys."

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

/obj/machinery/mob_dispenser/greyson/roomba

	name = "Greyson Positronics roomba dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top?"

	maximum_spawned = 15

	spawn_delay = 2
	spawn_delay_initial = 2

	spawn_probability = 100

/obj/machinery/mob_dispenser/greyson/roomba/melee

	default_spawn = list(list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba))
	to_spawn = list(
					list(15, /mob/living/carbon/superior_animal/robot/greyson/roomba/slayer, 35),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip, 25),
					list(10, /mob/living/carbon/superior_animal/robot/greyson/roomba/trip/armored, 20),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical, 15),
					list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/chemical/med, 5))

/obj/machinery/mob_dispenser/greyson/roomba/melee/claymore
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys. Are those roombas in its glass top? DO THEY ALL HAVE CLAYMORES ON TOP OF THEM?"

	maximum_spawned = 5

	default_spawn = list(list(5, /mob/living/carbon/superior_animal/robot/greyson/roomba/boomba)) //fuck you
	to_spawn = null

/obj/machinery/mob_dispenser/greyson/roomba/melee/claymore/dismantle()

	visible_message(SPAN_DANGER("As \the [src] falls apart, the remaining explosive materials inside, claymores/roombas and all, detonate violently!"))
	explosion(get_turf(loc), 0, 1, 2, 3)

	. = ..()

