/obj/item/circuitboard/pacman/scrap
	build_name = "S.C.R.A.P PACMAN-type generator"
	build_path = /obj/machinery/power/port_gen/pacman/scrap
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_PLASMA = 3, TECH_ENGINEERING = 3)

/datum/design/research/circuit/pacman/scrap
	name = "S.C.R.A.P PACMAN-type generator"
	build_path = /obj/item/circuitboard/pacman/scrap
	starts_unlocked = TRUE //We want to be able to make these

/obj/machinery/power/port_gen/pacman/scrap
	name = "S.C.R.A.P.M.A.N portable generator"
	desc = "An oldfashen power generator that runs on refined scrap. Rated for 80 kW maximum safe output!"
	icon_state = "portgen1"                 // Get a spriter to do something with this perhaps.
	sheet_name = "refined scrap"
	sheet_path = /obj/item/stack/material/refined_scrap
	power_gen = 10000
	time_per_fuel_unit = 80

/obj/machinery/power/port_gen/pacman/scrap/overheat()
	explosion(loc, 1, 5, 2, 0)
