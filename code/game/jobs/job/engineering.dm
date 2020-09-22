/datum/job/chief_engineer
	title = "Guild Master"
	flag = GUILDMASTER
	head_position = 1
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#c7b97b"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	ideal_character_age = 50
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/engineering/exultant

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors, access_network,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload
	)

	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	known_recipes = list(
			/datum/craft_recipe/guild/melee,
			/datum/craft_recipe/guild/bullet,
			/datum/craft_recipe/guild/energy,
			/datum/craft_recipe/guild/bomb,
			/datum/craft_recipe/guild/arcwelder,
			/datum/craft_recipe/guild/railgunpistol,
			/datum/craft_recipe/guild/railgunrifle,
			/datum/craft_recipe/guild/mace,
			/datum/craft_recipe/guild/claymore,
			/datum/craft_recipe/guild/machete,
			/datum/craft_recipe/guild/katana,
			/datum/craft_recipe/guild/technosuit,
			/datum/craft_recipe/guild/technohelmet,
			/datum/craft_recipe/guild/webbing,
			/datum/craft_recipe/guild/plasmablock,
			/datum/craft_recipe/guild/rubbermesh,
			/datum/craft_recipe/guild/booster,
			/datum/craft_recipe/guild/injector,
			/datum/craft_recipe/guild/weintraub,
			/datum/craft_recipe/guild/overshooter,
			/datum/craft_recipe/guild/dangerzone,
			/datum/craft_recipe/guild/forged,
			/datum/craft_recipe/guild/silencer,
			/datum/craft_recipe/guild/turretcircuit
			)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control,
							 /datum/computer_file/program/reports)

	description = "The Guild Master is the head of the Artificers Guild, a group of skilled engineers. This colony is your pride.<br>\
	You are to keep the colony running and constantly improve it as much as you are able. Let none question the efficacy of your labours.<br>\
	As a leader, it is far more efficient for you to delegate work than attempting to solve everything yourself - spread the labour.<br>\
	Machinery across the station is your responsibility. Let no outsiders interfere or intrude into your domain - even Command staff are no exception.<br>\
	Treat every Guild member like your family. Keep them paid, fed, and safe. You may be a part of the wider colony, but your own come first."

	duties = "Manage the Guild Adepts - set tasks and areas of focus.<br>\
	Strive to protect the rights of your Adepts, as well as their safety and health.<br>\
	Conduct your own repairs and projects as required - especially when low staffed. "

	perks = list(/datum/perk/inspiration, /datum/perk/handyman)

/obj/landmark/join/start/chief_engineer
	name = "Guild Master"
	icon_state = "player-orange-officer"
	join_tag = /datum/job/chief_engineer


/datum/job/technomancer
	title = "Guild Adept"
	flag = ADEPT
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Guild Master"
	difficulty = "Medium."
	selection_color = "#d5c88f"
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	known_recipes = list(
			/datum/craft_recipe/guild/melee,
			/datum/craft_recipe/guild/bullet,
			/datum/craft_recipe/guild/energy,
			/datum/craft_recipe/guild/bomb,
			/datum/craft_recipe/guild/arcwelder,
			/datum/craft_recipe/guild/railgunpistol,
			/datum/craft_recipe/guild/railgunrifle,
			/datum/craft_recipe/guild/mace,
			/datum/craft_recipe/guild/claymore,
			/datum/craft_recipe/guild/machete,
			/datum/craft_recipe/guild/katana,
			/datum/craft_recipe/guild/technosuit,
			/datum/craft_recipe/guild/technohelmet,
			/datum/craft_recipe/guild/webbing,
			/datum/craft_recipe/guild/plasmablock,
			/datum/craft_recipe/guild/rubbermesh,
			/datum/craft_recipe/guild/booster,
			/datum/craft_recipe/guild/injector,
			/datum/craft_recipe/guild/weintraub,
			/datum/craft_recipe/guild/overshooter,
			/datum/craft_recipe/guild/dangerzone,
			/datum/craft_recipe/guild/forged,
			/datum/craft_recipe/guild/silencer,
			/datum/craft_recipe/guild/turretcircuit
			)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "The Guild Adept is a member of one of the greatest engineering guilds in the galaxy, contracted to maintain this colony.<br>\
Your main priority is ensuring the setup and maintenance of the supermatter engine. Seek guidance on this complex machine if untrained.<br>\
Outside of this, you should devote time to learning and configuring various systems. Everything can be improved, and new constructs can be made.<br>\
This upgrade culture extends to your own arsenal - mod and upgrade your tools with parts from maintenance, or purchased from Lonestar or the Prospectors.<br>\
Do not let outsiders, even Command Staff, interfere with the duties of the Guild. And remember - be ready to respond to emergency calls at any time."

	duties = "Start up the supermatter.<br>\
	Repair anything and anyone that needs some maintenance.<br>\
	Respond to distress calls and patch breaches in the walls.<br>\
	Keep every part of the colony powered, oxygenated, and ready to use."

	perks = list(/datum/perk/inspiration, /datum/perk/handyman)

/obj/landmark/join/start/technomancer
	name = "Guild Adept"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
