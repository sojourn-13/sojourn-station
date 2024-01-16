/datum/technology/GP_Cog
	name = "Greyson Positronic Cog"
	desc = "The first laser gun ever produced and duplicated endless, the Cog."
	tech_type = RESEARCH_GREYSON

	x = 0.1 //Bottom left corner
	y = 0.3
	icon = "cog" //cog

	required_technologies = list()
	required_tech_levels = list(RESEARCH_COMBAT = 3, RESEARCH_POWERSTORAGE = 3)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/greyson/cog)

/datum/technology/GP_Cog_alt
	name = "Greyson Positronic Alternative Laser Carbine Designs"
	desc = "Further changes made to the already successful Cog design."
	tech_type = RESEARCH_GREYSON

	x = 0.1 //Bottom left corner
	y = 0.1
	icon = "cog_alt" //cog

	required_technologies = list(/datum/technology/GP_Cog)
	required_tech_levels = list(RESEARCH_COMBAT = 3, RESEARCH_POWERSTORAGE = 5, RESEARCH_ILLEGAL = 2)
	cost = 1000

	unlocks_designs = list(/datum/design/research/item/greyson/cog_sawn,
						   /datum/design/research/item/greyson/cog_sprocket) // Making the Gear Marshal-only, Soteria gets their own version

/datum/technology/GP_roomba
	name = "Greyson Positronic Roomba Creation"
	desc = "Small deployable kits for deploying Roomba's and GP FPBs."
	tech_type = RESEARCH_GREYSON

	x = 0.2 //Bottom left corner
	y = 0.3
	icon = "roomba_kit"

	required_technologies = list(/datum/technology/GP_Cog)
	required_tech_levels = list(RESEARCH_COMBAT = 5, RESEARCH_ROBOTICS = 10)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/greyson/manhacks_roomba,
						   /datum/design/research/item/greyson/manhacks_roomba_tripper,
						   /datum/design/research/item/greyson/manhacks_roomba_gunne,
						   /datum/design/research/item/greyson/manhacks_roomba_fbp
						   )

/datum/technology/GP_armor
	name = "Greyson Positronic Armor Vests"
	desc = "GP Laser resistant armor vests that were supplied and branded as Iron Lock, the bases of all other laser armor."
	tech_type = RESEARCH_GREYSON

	x = 0.1 //top right
	y = 0.5
	icon = "greysonarmor"

	required_technologies = list(/datum/technology/advanced_armor, /datum/technology/GP_Cog)
	required_tech_levels = list()
	cost = 1875 //Cheap do to being already done in other nodes but less good*

	unlocks_designs = list(/datum/design/research/item/greyson/iron_lock_security_armor,
						   /datum/design/research/item/greyson/iron_lock_security_helmet,
						   /datum/design/research/item/greyson/iron_lock_security_gloves,
						   /datum/design/research/item/greyson/iron_lock_security_boots)

/datum/technology/GP_window
	name = "Greyson Positronic Glass-Widow Infuser"
	desc = "The GP Glass Widow Infuser design and manufacturing."
	tech_type = RESEARCH_GREYSON

	x = 0.3 //Bottom left
	y = 0.3
	icon = "window"

	required_technologies = list(/datum/technology/GP_Cog,
								 /datum/technology/exotic_gunmods)
	required_tech_levels = list(RESEARCH_COMBAT = 10)
	cost = 11250
	unlocks_designs = list(/datum/design/research/item/greyson/glass_widow)

/datum/technology/GP_unmaker
	name = "Greyson Positronic Tyrant Destroyers"
	desc = "The rare and highly vauleable GP Master Unmaker Infuser gun mod and portable self charging combat shields."
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Bottom middle
	y = 0.3
	icon = "mastermind"

	required_technologies = list(/datum/technology/GP_window)
	required_tech_levels = list(RESEARCH_COMBAT = 13)
	cost = 37500

	unlocks_designs = list(/datum/design/research/item/greyson/unmaker,
			       /datum/design/research/item/greyson/combat_shield)

/datum/technology/GP_cells
	name = "Greyson Positronic Cells"
	desc = "A mix of old cell manufacturing with a GP characteristics."
	tech_type = RESEARCH_GREYSON

	x = 0.7 //Top left corner
	y = 0.1
	icon = "greysoncells"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 12)
	cost = 5625

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

	required_technologies = list(/datum/technology/advanced_biotech,
								 /datum/technology/super_power) // no cheating past level 3s
	required_tech_levels = list(RESEARCH_ENGINEERING = 20)
	cost = 5625

	unlocks_designs = list(/datum/design/research/item/part/greyson_laser,
						   /datum/design/research/item/part/greyson_matter,
						   /datum/design/research/item/part/greyson_module,
						   /datum/design/research/item/part/greyson_capacitor,
						   /datum/design/research/item/part/greyson_manipulator)

/datum/technology/GP_misc_tools
	name = "Greyson Positronic Tools"
	desc = "Old Greyson Positronic basic tools."
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Middle center
	y = 0.5
	icon = "greysonsaw"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_ENGINEERING = 20)

	unlocks_designs = list(/datum/design/research/item/tool/crowbar_onestar,
						   /datum/design/research/item/tool/onestar_saw,
						   /datum/design/research/item/tool/onestar_pliers,
						   /datum/design/research/item/tool/onestar_shovel,
						   /datum/design/research/item/tool/pickaxe_onestar)

	cost = 7500

/datum/technology/GP_fuel_tools
	name = "Greyson Positronic Fuel Tools"
	desc = "Old Greyson Positronic diesel based tools."
	tech_type = RESEARCH_GREYSON

	x = 0.6
	y = 0.5
	icon = "greysonwelder"

	required_technologies = list(/datum/technology/GP_misc_tools)
	required_tech_levels = list()
	cost = 5625 //Mostly a stop gate to the power tools

	unlocks_designs = list(/datum/design/research/item/tool/weldertool_onestar,
						   /datum/design/research/item/tool/drill_onestar)

/datum/technology/GP_power_tools
	name = "Greyson Positronic Power Tools"
	desc = "Old Greyson Positronic energy based tools."
	tech_type = RESEARCH_GREYSON

	x = 0.7
	y = 0.5
	icon = "greysondrill"

	required_technologies = list(/datum/technology/GP_fuel_tools)
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 12)
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/tool/combi_driver_onestar,
						   /datum/design/research/item/tool/multitool/multitool_onestar,
						   /datum/design/research/item/tool/hammer_onestar,
						   /datum/design/research/item/tool/omni_surgery_onestar,
						   /datum/design/research/item/tool/jackhammer_onestar)

/datum/technology/GP_nano_toolmods
	name = "Greyson Positronic Nano Reapir & NanoAI"
	desc = "GP pre-programed self replicating nanites to fit onto any ."
	tech_type = RESEARCH_GREYSON

	x = 0.5 //Middle right
	y = 0.6
	icon = "greysonai"

	required_technologies = list(/datum/technology/GP_misc_tools)
	required_tech_levels = list(RESEARCH_ROBOTICS = 15)

	unlocks_designs = list(/datum/design/research/item/greyson/repair_nano,
						   /datum/design/research/item/greyson/ai_tool)
	cost = 7500

/datum/technology/GP_fuel_toolmods
	name = "Greyson Positronic Bluespace Holding Tank"
	desc = "GP Bluespace Fuel Tank ."
	tech_type = RESEARCH_GREYSON

	x = 0.6
	y = 0.6
	icon = "greysonfuel"

	required_technologies = list(/datum/technology/GP_fuel_tools,
								 /datum/technology/bluespace_extended)
	required_tech_levels = list()

	unlocks_designs = list(/datum/design/research/item/greyson/holding_tank)
	cost = 1750 //Not THAT high-tech, but still...

/datum/technology/GP_robotics
	name = "Greyson Positronic Positronics"
	desc = "GP Robotic lims."
	tech_type = RESEARCH_GREYSON

	x = 0.8 //top right
	y = 0.8
	icon = "greysonroboticleg"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 13, RESEARCH_ROBOTICS = 15) //Max bio and good robotics

	unlocks_designs = list(/datum/design/research/item/mechfab/prosthesis_grayson/r_arm,
						   /datum/design/research/item/mechfab/prosthesis_grayson/l_arm,
						   /datum/design/research/item/mechfab/prosthesis_grayson/r_leg,
						   /datum/design/research/item/mechfab/prosthesis_grayson/l_leg)

	cost = 5625

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

	cost = 1875 //Already really end game stuff for something thats illegal and costly so its cheap
