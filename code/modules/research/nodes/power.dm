/datum/technology/basic_power
	name = "Basic Power Storing"
	desc = "Basic power storing and control system."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.1
	y = 0.9
	icon = "cell"

	required_technologies = list()
	required_tech_levels = list()
	cost = 0

	unlocks_designs = list(	/datum/design/research/circuit/powermonitor,
							/datum/design/research/item/part/basic_capacitor,
							/datum/design/research/item/powercell/large/basic,
							/datum/design/research/item/powercell/large/high,
							/datum/design/research/item/powercell/medium/basic,
							/datum/design/research/item/powercell/medium/high,
							/datum/design/research/item/powercell/small/basic,
							/datum/design/research/item/powercell/small/high,
							/datum/design/research/circuit/batteryrack)

/datum/technology/advanced_power
	name = "Advanced Power Storing"
	desc = "Advanced Power Storing"
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.2
	y = 0.7
	icon = "supercell"

	required_technologies = list(/datum/technology/basic_power)
	required_tech_levels = list()
	cost = 150

	unlocks_designs = list(	/datum/design/research/item/part/adv_capacitor,
							/datum/design/research/item/powercell/large/super,
							/datum/design/research/item/powercell/medium/super,
							/datum/design/research/item/powercell/small/super
							)

/datum/technology/advanced_power_storage
	name = "Advanced Power Storage (SMES)"
	desc = "Advanced Power Storage (SMES)"
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.25
	y = 0.8
	icon = "smes"

	required_technologies = list(/datum/technology/advanced_power)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(	/datum/design/research/circuit/smes_cell,
							/datum/design/research/item/part/smes_coil/weak)

/datum/technology/energy_distribution
	name = "Energy Distribution"
	desc = "Breaker boxes and better robotic power saving, that give more comfortable control of powernets and system engery saving."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.5
	y = 0.8
	icon = "smes"

	required_technologies = list(/datum/technology/advanced_power_storage)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(	/datum/design/research/circuit/breakerbox,
							/datum/design/research/item/robot_upgrade/power_saver)

/datum/technology/super_power
	name = "Super Power Storing"
	desc = "Super Power Storing"
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.4
	y = 0.7
	icon = "hypercell"

	required_technologies = list(/datum/technology/advanced_power)
	required_tech_levels = list()
	cost = 900

	unlocks_designs = list(	/datum/design/research/item/part/super_capacitor,
							/datum/design/research/item/powercell/large/hyper,
							/datum/design/research/item/powercell/medium/hyper,
							/datum/design/research/item/powercell/small/hyper,
							/datum/design/research/item/part/smes_coil/super_io,
							/datum/design/research/item/part/smes_coil/super_capacity,
							/datum/design/research/circuit/tesla_turret)

/datum/technology/solar_power
	name = "Basic Power Generation"
	desc = "Solar panels control, PACMAN MK1."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.1
	y = 0.1
	icon = "solarcontrol"

	required_technologies = list()
	required_tech_levels = list()
	cost = 300

	unlocks_designs = list(	/datum/design/research/circuit/solarcontrol,
							/datum/design/research/circuit/camp,
							/datum/design/research/circuit/pacman
						)

/datum/technology/improved_power_generation
	name = "Improved Power Generation"
	desc = "PACMAN MK2, uranium based power, hand crank generator for cells."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.25
	y = 0.20
	icon = "generator"

	required_technologies = list(/datum/technology/solar_power)
	required_tech_levels = list()
	cost = 450

	unlocks_designs = list(/datum/design/research/circuit/superpacman,
							/datum/design/research/item/hand_charger,
							/datum/design/research/circuit/diesel)

/datum/technology/advanced_power_generation
	name = "Basic Fusion Power"
	desc = "MRSPACMAN, fusion generator, need tritium for power generation."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.4
	y = 0.3
	icon = "supergenerator"

	required_technologies = list(/datum/technology/improved_power_generation)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(/datum/design/research/circuit/mrspacman)

/datum/technology/fusion_power_generation
	name = "Fusion Power Generation"//"R-UST Mk. 8"
	desc = "Using and harvesting fussion levels of power."//"R-UST Mk. 8" - get on that?
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.6
	y = 0.4
	icon = "rignuclearreactor"//"fusion"

	required_technologies = list(/datum/technology/advanced_power_generation)
	required_tech_levels = list()
	unlocks_designs = list(/datum/design/research/circuit/miss,
								 /datum/design/research/structure/solar,
								 /datum/design/research/circuit/hydrogen_gen)

	cost = 1500

	//unlocks_designs = list()"fusion_core_control", "fusion_fuel_compressor", "fusion_fuel_control", "gyrotron_control", "fusion_core", "fusion_injector", "gyrotron")

/datum/technology/omega_power
	name = "Fusion Based Power"
	desc = "The last steps into packing in power into a cell."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.6
	y = 0.5
	icon = "omegacell"

	required_technologies = list(
									/datum/technology/super_power,
									/datum/technology/fusion_power_generation,
									/datum/technology/energy_distribution
								)

	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/item/powercell/large/ameridian,
							/datum/design/research/item/powercell/large/omega,
							/datum/design/research/item/powercell/medium/omega,
							/datum/design/research/item/powercell/small/omega
						)

/datum/technology/atom_small_power
	name = "Atomic Based Cell"
	desc = "The first steps into nuclear based cells."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.5
	y = 0.5
	icon = "atomsmall"

	required_technologies = list(
									/datum/technology/omega_power
								)

	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/item/powercell/small/nuclear,
							/datum/design/research/item/powercell/small/nuclear/pda
						)

/datum/technology/atom_m_power
	name = "Medium Atom Based Cell"
	desc = "The larger verson of the small Atom Cell."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.4
	y = 0.5
	icon = "bluespacecell"

	required_technologies = list(
									/datum/technology/atom_small_power
								)

	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/item/powercell/medium/nuclear
						)

/datum/technology/atom_l_power
	name = "Large Atom Based Cell"
	desc = "The larger verson of the small Atom Cell."
	tech_type = RESEARCH_POWERSTORAGE

	x = 0.3
	y = 0.5
	icon = "atomlarge"

	required_technologies = list(
									/datum/technology/atom_m_power
								)

	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/item/powercell/large/nuclear
						)
