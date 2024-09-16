/obj/random/aberrant_machine
	name = "aberrant machine"
	icon_state = "machine-orange"

/obj/random/aberrant_machine/item_to_spawn()
	return pickweight(list(/obj/machinery/vending/organfridge_aberrant = 6,
				/obj/machinery/vending/organfridge_aberrant/alt = 4,
				/obj/machinery/vending/organfridge_aberrant/simple = 2,
				/obj/machinery/vending/organfridge_aberrant/alcoholic = 4,
				/obj/machinery/vending/organfridge_aberrant/addict = 4,
				/obj/machinery/sleeper/sarcophagus = 2,
				/obj/machinery/sleeper/sarcophagus/hive = 8))
