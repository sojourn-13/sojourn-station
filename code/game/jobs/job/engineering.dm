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
	selection_color = "#c7b97b"
	req_admin_notify = 1
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 25)
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

	description = "You are the guild master, the head of a artificers guild, skilled specialist engineers. You and your guild have taken up residence on the colony, it is your work, your home, and your pride. <br>\
You are to keep the colony running and constantly improve it as much as you are able. Let none question the efficacy of your labours."

	loyalties = "Your first loyalty is to your pride and the colony. The engineering department is your territory and machinery across the station are your responsibility. Do not tolerate others interfering with them, intruding on your space, or questioning your competence. You don't need inspections, oversight, or micromanagement. Outsiders should only enter your spaces by invitation, or out of necessity. Even the premier and other command staff are no exception.<br>\

Your second loyalty is to your guild. Ensure they are paid, fed and safe. Don't risk their lives unnecessarily. If an area is infested with monsters, there's no reason to risk lives trying to repair anything inside there. If one of your people is imprisoned, endangered, or accused you should fight for them. Treat every guild adept like your family"

	perks = list(/datum/perk/inspiration)

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
	selection_color = "#d5c88f"
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 5)
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

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "You are a guild adept, member of one of the greatest guild of engineers in the galaxy. Your guild makes their living by offering their services to colonies and starships alike and you have thusly taken up residence here in the Nadezhda apart of your training. Maintaining the colony is your responsibility, ensure the engine is running, the lights are on, the walls are intact, and the air is breathable.<br>\
<br>\
Your duties on the colony are many and varied. For a start, at the beginning of a shift, you should make sure the supermatter engine is started up. This is a complex task, and you should learn from others in your group rather than attempting it yourself.<br>\
<br>\
Once these core systems are setup, you may relax a bit, but you should also devote time to learning and configuring various systems. Every system from atmos, power, to regular machines, can be improved upon.<br>\
<br>\
With the power of construction, you are free to customise the ship to your own uses. Build and remove walls to make things more efficient, or more secure. Construct new machines to extend capabilities and make everyone's lives easier. You can even place traps or construct turrets to keep nosy outsiders out of sensitive areas. The ship is yours to improve and build upon<br>\
<br>\
Make sure your atmos gear is prepared and you're fully equipped with tools. Modding and upgrading your tools is strongly advised for optimal performance. Toolmods can be found while scavenging maintenance or purchased from cargo and scavengers. And always, always carry duct tape.<br>\
You should carry materials too for field repair work, but don't steal entire stacks for yourself - the other adepts are your brothers and you should share evenly, take only what you need.<br>\
 <br>\
Most importantly, be ready to respond to emergency calls at any time. Parts of the colony may be damaged or explode and its your job to fix it. No matter the cost, no matter the danger, you have the equipment and skills to march into places that would be death to most mortals. It is your responsibility to keep the ship more-or-less in one piece and still able to fly.<br>\
<br>\
The colony is your home, your life, and your livelihood. Take pride in it, and in your responsibilities. You should be hesitant to halt any repairs and try your hardest to prevent that becoming necessary. The engineering department is your base of operations, and you should be very wary of outsiders entering uninvited. Your fellow adepts should be treated like family. Take care of them, treat them well, share everything with them, and solve your problems internally."

	duties = "	-Start up the supermatter.<br>\
	-Repair anything and anyone that needs repaired.<br>\
	-Respond to distress calls and patch breaches in the walls.<br>\
	-Keep every part of the colony powered, oxygenated, and ready to use"

	loyalties = "As a guild adept, your first loyalty is to your guild. Ensure they are safe and well supplied, defend them, assist them, and share everything with them. If problems arise between you, ask the guild master to rule on it. Don't snitch on your fellow clanmates by calling the marshals. The Guild Master is the boss of your group and in many ways a father figure. Trust in their wisdom and follow their instructions above anyone elses.<br>\
	<br>\
	Your second loyalty is to the colony. Unlike most of your crew, who simply live there, your guild BUILT the colony. Avoid letting it fall to ruin at all costs. This is where you live and it's worth sacrificing for. Take pride in your work, and make the colony something to be cherished."

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/technomancer
	name = "Guild Adept"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
