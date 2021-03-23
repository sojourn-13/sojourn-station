/datum/technology/GP_Cog
	name = "Greyson Positronic Cog"
	desc = "The first laser gun ever produced and duplicated endless, the Cog."
	tech_type = RESEARCH_GREYSON

	x = 0.1 //Bottom left corner
	y = 0.1
	icon = "cog" //cog

	required_technologies = list()
	required_tech_levels = list(RESEARCH_COMBAT = 3, RESEARCH_POWERSTORAGE = 3)
	cost = 2500

	unlocks_designs = list(/datum/design/autolathe/gun/greyson_cog)

/datum/technology/GP_armor
	name = "Greyson Positronic Armor Vests"
	desc = "GP Laser resistant armor vests that were supplied and branded as Iron Lock, the bases of all other laser armor."
	tech_type = RESEARCH_GREYSON

	x = 0.1 //top right
	y = 0.3
	icon = "greysonarmor"

	required_technologies = list(/datum/technology/advanced_armor, /datum/technology/GP_Cog)
	required_tech_levels = list()
	cost = 2500 //Cheap do to being already done in other nodes but less good*

	unlocks_designs = list(/datum/design/autolathe/clothing/iron_lock_security_armor,
						   /datum/design/autolathe/clothing/iron_lock_security_helmet)

/datum/technology/GP_window
	name = "Greyson Positronic Glass-Widow Infuser"
	desc = "The GP Glass Widow Infuser design and manufacturing."
	tech_type = RESEARCH_GREYSON

	x = 0.3 //Bottom left
	y = 0.1
	icon = "window"

	required_technologies = list(/datum/technology/GP_Cog,
								 /datum/technology/exotic_gunmods)
	required_tech_levels = list(RESEARCH_COMBAT = 10)
	cost = 15000

	unlocks_designs = list(/datum/design/research/item/greyson/glass_widow)

/datum/technology/GP_unmaker
	name = "Greyson Positronic Master Unmaker Infuser"
	desc = "The rare and highly vauleable GP Master Unmaker Infuser gun mod."
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Bottom middle
	y = 0.1
	icon = "mastermind"

	required_technologies = list(/datum/technology/GP_window)
	required_tech_levels = list(RESEARCH_COMBAT = 14)
	cost = 50000

	unlocks_designs = list(/datum/design/research/item/greyson/unmaker)

/datum/technology/GP_cells
	name = "Greyson Positronic Cells"
	desc = "A mix of old cell manufacturing with a GP characteristics."
	tech_type = RESEARCH_GREYSON

	x = 0.7 //Top left corner
	y = 0.1
	icon = "greysoncells"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 13)
	cost = 7500

	unlocks_designs = list(/datum/design/research/item/powercell/large/grayson,
						   /datum/design/research/item/powercell/medium/grayson,
						   /datum/design/research/item/powercell/small/grayson)


/datum/technology/GP_stockparts
	name = "Greyson Positronic Stock Parts"
	desc = "GP Manipulator, Laser, Matter Bin, Scanner and Capacitor"
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Top left corner
	y = 0.9
	icon = "greysonstockparts"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_ENGINEERING = 20, RESEARCH_BIOTECH = 10)
	cost = 7500

	unlocks_designs = list(/datum/design/autolathe/greyson/laser,
						   /datum/design/autolathe/greyson/matter,
						   /datum/design/autolathe/greyson/module,
						   /datum/design/autolathe/greyson/capacitor,
						   /datum/design/autolathe/greyson/manipulator)

/datum/technology/GP_misc_tools
	name = "Greyson Positronic Tools"
	desc = "Old Greyson Positronic basic tools."
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Middle center
	y = 0.5
	icon = "greysonsaw"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_ENGINEERING = 20)

	unlocks_designs = list(/datum/design/autolathe/tool/crowbar_onestar,
						   /datum/design/autolathe/tool/onestar_saw,
						   /datum/design/autolathe/tool/onestar_pliers,
						   /datum/design/autolathe/tool/onestar_shovel,
						   /datum/design/autolathe/greyson/manipulator,
						   /datum/design/autolathe/tool/pickaxe_onestar)

	cost = 10000

/datum/technology/GP_fuel_tools
	name = "Greyson Positronic Fuel Tools"
	desc = "Old Greyson Positronic diesel based tools."
	tech_type = RESEARCH_GREYSON

	x = 0.6
	y = 0.5
	icon = "greysonwelder"

	required_technologies = list(/datum/technology/GP_misc_tools)
	required_tech_levels = list()
	cost = 7500 //Mostly a stop gate to the power tools

	unlocks_designs = list(/datum/design/autolathe/tool/weldertool_onestar,
						   /datum/design/autolathe/tool/drill_onestar)

/datum/technology/GP_power_tools
	name = "Greyson Positronic Power Tools"
	desc = "Old Greyson Positronic energy based tools."
	tech_type = RESEARCH_GREYSON

	x = 0.7
	y = 0.5
	icon = "greysondrill"

	required_technologies = list(/datum/technology/GP_fuel_tools)
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 13)
	cost = 5000

	unlocks_designs = list(/datum/design/autolathe/tool/combi_driver_onestar,
						   /datum/design/autolathe/tool/multitool/multitool_onestar,
						   /datum/design/autolathe/tool/hammer_onestar,
						   /datum/design/autolathe/tool/omni_surgery_onestar,
						   /datum/design/autolathe/tool/jackhammer_onestar)

/datum/technology/GP_nano_toolmods
	name = "Greyson Positronic Nano Reapir & NanoAI"
	desc = "GP pre-programed self replicating nanites to fit onto any ."
	tech_type = RESEARCH_GREYSON

	x = 0.6 //Middle right
	y = 0.5
	icon = "greysonai"

	required_technologies = list(/datum/technology/GP_misc_tools)
	required_tech_levels = list(RESEARCH_ROBOTICS = 16)

	unlocks_designs = list(/datum/design/research/item/greyson/repair_nano,
						   /datum/design/research/item/greyson/ai_tool)
	cost = 10000

/datum/technology/GP_fuel_toolmods
	name = "Greyson Positronic Bluespace Holding Tank & Randomizer"
	desc = "GP pre-programed Randomizer blue paint and Bluespace Fuel Tank ."
	tech_type = RESEARCH_GREYSON

	x = 0.8 //Middle right
	y = 0.5
	icon = "greysonfuel"

	required_technologies = list(/datum/technology/GP_fuel_tools,
								 /datum/technology/bluespace_extended)
	required_tech_levels = list()

	unlocks_designs = list(/datum/design/research/item/greyson/holding_tank,
						   /datum/design/research/item/greyson/randomizer)
	cost = 5000 //Not THAT high-tech, but still...

/datum/technology/GP_robotics
	name = "Greyson Positronic Positronics"
	desc = "GP Robotic lims."
	tech_type = RESEARCH_GREYSON

	x = 0.8 //top right
	y = 0.8
	icon = "greysonroboticleg"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 15, RESEARCH_ROBOTICS = 16) //Max bio and good robotics

	unlocks_designs = list(/datum/design/research/item/mechfab/prosthesis_grayson/r_arm,
						   /datum/design/research/item/mechfab/prosthesis_grayson/l_arm,
						   /datum/design/research/item/mechfab/prosthesis_grayson/r_leg,
						   /datum/design/research/item/mechfab/prosthesis_grayson/l_leg)

	cost = 7500

/datum/technology/GP_thermals
	name = "Greyson Positronic Thermals"
	desc = "GP Thermal goggles."
	tech_type = RESEARCH_GREYSON

	x = 0.7 //top right
	y = 0.8
	icon = "greysonthermals"

	required_technologies = list(/datum/technology/thermal_sight)
	required_tech_levels = list()

	unlocks_designs = list(/datum/design/research/item/greyson/thermals)

	cost = 2500 //Already really end game stuff for something thats illegal and costly so its cheap