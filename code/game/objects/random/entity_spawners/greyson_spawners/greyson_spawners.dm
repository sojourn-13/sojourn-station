/obj/entity_spawner/greyson //basetype, dont use
	name = "Greyson Positronics robot dispenser"
	desc = "What appears to be a heavily modified robotics exofab made in the distinctive bronze of greyson alloys."

	death_message = "'s lights dim, ceasing function as it falls apart!"

	color = PIPE_COLOR_ORANGE

	dropped = list(
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
				/obj/item/stock_parts/console_screen = 80,
				/obj/machinery/constructable_frame/machine_frame = 100
	)

/obj/entity_spawner/greyson/disassemble()

	do_sparks(1, FALSE, src)

	. = ..()


