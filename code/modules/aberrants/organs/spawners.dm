/*
/obj/random/aberrant_organs
	name = "aberrant organ"
	icon_state = "machine-orange"
	tags_to_spawn = list(SPAWN_ABERRANT_ORGAN)

/obj/random/aberrant_organs/normal
	name = "strange organ"
	icon_state = "machine-orange"
	tags_to_spawn = list(SPAWN_ABERRANT_ORGAN_NORMAL)

/obj/random/aberrant_organs/rare
	name = "aberrant organ"
	icon_state = "machine-orange"
	tags_to_spawn = list(SPAWN_ABERRANT_ORGAN_RARE
*/

/obj/random/aberrant_machine
	name = "aberrant machine"
	icon_state = "machine-orange"
	//tags_to_spawn = list(SPAWN_ABERRANT_MACHINERY_ORGANS)	// Add more as they are created

/obj/random/aberrant_machine/item_to_spawn()
	return pickweight(list(/obj/machinery/vending/organfridge_aberrant = 6,
				/obj/machinery/vending/organfridge_aberrant/simple = 10,
				/obj/machinery/vending/organfridge_aberrant/alcoholic = 2,
				/obj/machinery/vending/organfridge_aberrant/addict = 2,
				/obj/machinery/sleeper/sarcophagus = 2,
				/obj/machinery/sleeper/sarcophagus/abomination = 16))
