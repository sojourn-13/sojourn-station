/datum/technology/cleaner
	name = "SI \"Spot\" Cleaning Pistol"
	desc = "A mix of less than legal schematics to create a lesser but far more compact version of the cleaning carbine."
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.4
	icon = "cleaner"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 3, RESEARCH_ENGINEERING = 5) //Got to get 2 others
	cost = 1000

	unlocks_designs = list(/datum/design/research/item/cleaner)

/datum/technology/matter_bin
	name = "Hydraulic Pression"
	desc = "By desiding to turn off the saftys on a matter bins internal compression you can forcefully fit more matter into them!"
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.4
	icon = "exl_bin"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_ENGINEERING = 15)
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/part/copy_matter_bin)

/datum/technology/scanner
	name = "Pulse Radiation Scanning"
	desc = "By using radiation pulses and lighter cases the scanning modules can get more and more accurate."
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.5
	icon = "exl_scanner"

	required_technologies = list(/datum/technology/matter_bin)
	required_tech_levels = list()
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/part/copy_sensor)

/datum/technology/laser
	name = "Unregulated Burner Lenses"
	desc = "Using diamonds, and a higher current in a metal case for a laser can increase its reading power."
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.6
	icon = "exl_laser"

	required_technologies = list(/datum/technology/scanner)
	required_tech_levels = list()
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/part/copy_micro_laser)

/datum/technology/cap
	name = "Overcharging Defusing "
	desc = "Removing power limiters and making as little use of a fuse as possable can lead to quite a zap!"
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.7
	icon = "exl_cap"

	required_technologies = list(/datum/technology/laser)
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 10)
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/part/copy_capacitor)

/datum/technology/manip
	name = "Pin Point Clamping"
	desc = "A much more tougher grip on the materials well manipulating them leads to them shaking around less and more affective printing."
	tech_type = TECH_EXCELSIOR

	x = 0.1
	y = 0.8
	icon = "exl_manip"

	required_technologies = list(/datum/technology/cap)
	required_tech_levels = list(RESEARCH_BIOTECH = 10)
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/part/copy_mani)
