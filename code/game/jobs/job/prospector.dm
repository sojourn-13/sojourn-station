/datum/job/foreman
	title = "Foreman"
	flag = FOREMAN
	head_position = 1
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_NONE
	also_known_languages = list(LANGUAGE_CYRILLIC = 60, LANGUAGE_SERBIAN = 100)

	outfit_type = /decl/hierarchy/outfit/job/foreman

	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 10,
		STAT_BIO = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "You are the foreman to the prospectors, a group of independent scavengers seeking their fortune looting old ruins and finding diamonds among the trash piles.<br>\
	<br>\
	Your goal is to lead your team into hostile locations and take everything of value that isn't nailed down and even then take the nails if they're not properly secured.<br>\
	As potentially the youngest head of staff and the one expected to be in the most danger at all times you should be independent and cunning, able to survive the worst situations."

	duties = "Assemble your team of prospectors and salvagers by equipping them with whatever you can find in your prep area or buy around the station.<br>\
		Lead your team through dangerous areas and ensure they recover everything of value.<br>\
		Keep everyone stays alive and ensure nobody is left behind.<br>\
		Fill in any missing role on your team be it as muscle , medical, or technical support."

	loyalties = "As foreman, your first loyalty is to your fellow prospectors. Nobody can survive alone out there so always look out for your fellow mercenaries.<br>\
		<br>\
		You're secondary loyalty is to the colony and Nadezhda council, you are to listen to them and aid them when asked."

/obj/landmark/join/start/foreman
	name = "Foreman"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/foreman


/datum/job/salvager
	title = "Salvager"
	flag = SALVAGER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Foreman"
	selection_color = "#a7bbc6"
	wage = WAGE_NONE
	also_known_languages = list(LANGUAGE_CYRILLIC = 30)

	outfit_type = /decl/hierarchy/outfit/job/salv

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_MEC = 20,
		STAT_COG = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10,
	)


	description = "You are a 'trained' specialist for the prospectors who functions as both an engineer and a doctor. Maybe you were a paramedic with a knack for machines or a roboticist looking to take on a hands on approach to testing machines.<br>\
	<br>\
	Within the prospectors you have two primary roles to carry out to the best of your ability.<br>\
	<br>\
	1. Field Medic. <br>\
	You may be expected to serve on the backlines in a combat situation, treating and stabilizing the wounded, making the call as to whether they can return to combat or leave by medivac. You may need to perform emergency trauma surgery in undesireable conditions. <br>\
	You are allowed to be armed, but remember that saving lives, not taking them, is your first duty. Don't be afraid to send patients to soteria medical for proper specialist care.<br>\
	<br>\
	2. Technician.<br>\
	Your secondary task is providing technical support to the prospector teams by breaching walls, building forward operating bases, returning broken machines to working condition, and extracting every resource you can using tools to take apart old tech.<br>"

/obj/landmark/join/start/salvager
	name = "Salvager"
	icon_state = "player-blue"
	join_tag = /datum/job/salvager


/datum/job/pro
	title = "Prospector"
	flag = PROSPECTOR
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Foreman"
	selection_color = "#a7bbc6"
	wage = WAGE_NONE
	also_known_languages = list(LANGUAGE_CYRILLIC = 30)

	outfit_type = /decl/hierarchy/outfit/job/pro

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
	)


	description = "You are thug hired by the prospectors to serve as muscle. You may be a member of security looking for side work, a criminal who's record is too long to work anywhere else, or simply someone who has no skills besides aiming a gun or swinging a bat<br>\
	<br>\
	You only have a singular purpose to the prospector team, being part ways between meat shield and exterminator. Your job is to keep the salvagers and anyone else with you protected, handling the fighting and being the first to enter dangerous areas. <br>\
	While combat is your primary goal you are still there to salvage valuable technology and make it a profit selling said items to the colony. Be sure to help carry any loot you can and remember, you might be tough but without your team you're nothing. Don't get greedy."

/obj/landmark/join/start/pro
	name = "Prospector"
	icon_state = "player-blue"
	join_tag = /datum/job/pro

