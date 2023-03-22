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
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	department_account_access = TRUE
	health_modifier = 15

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/foreman
	playtimerequired = 1200
	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_medical_suits //for locating scav team dead bodies
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 10,
		STAT_BIO = 10
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "The foreman leads the prospectors, a group of independent scavengers seeking fortune from ruins and scrap.<br>\
	Your goal is to lead your team into hostile locations and take everything of value that isn't nailed down - and the nails too!<br>\
	As potentially the youngest head of staff and the one expected to be in the most danger at all times you should be independent and cunning.<br>\
	Your work is perhaps the most dangerous within the entire colony, so good combat and survival skills are essential."

	duties = "Assemble your team of prospectors and salvagers by equipping them with whatever you can find in your prep area and elsewhere.<br>\
		Lead your team through dangerous areas and ensure they recover everything of value.<br>\
		Keep everyone alive and ensure nobody is left behind.<br>\
		Fill in any missing role on your team be it as muscle, medical, or technical support."

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
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie Salvager"
	alt_titles = list("Sawbones", "Rookie Salvager")
	alt_perks = list("Sawbones"=list(PERK_MEDICAL_EXPERT, PERK_STALKER), "Junk Technician"=list(PERK_JUNKBORN, PERK_ROBOTICS_EXPERT))
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round-start.
	wage = WAGE_NONE

	disallow_species = list(FORM_BSSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/salv

	health_modifier = 5

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_MEC = 20,
		STAT_COG = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10
	)
	perks = list(PERK_JUNKBORN, PERK_STALKER)

	description = "The Salvager is an informally trained specialist for the prospectors who functions as both an engineer and a doctor.<br>\
	Your primary role is that of a field medic. Treat and stabilize the wounded on the combat backlines, and evacuate the critically injured.<br>\
	Your secondary task is providing technical support to the team by breaching walls, building FOBs, repairing broken equipment, and extracting valuables from junk piles.<br>\
	Remember that you are here to gain riches from the abandoned wilds. Don't waste time and resources mindlessly hunting creatures."

	duties = "Extract resources for your employer. Use equipment to access new areas and gain a foothold in the wilderness.<br>\
	Perform medical services on injured colleagues, from patching wounds to full field surgery.<br>\
	Leave security duties to the hired muscle unless faced with no other option."

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
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie Prospector"
	alt_titles = list("Rookie Prospector", "Hired Muscle")
	selection_color = "#a7bbc6"
	initial_balance = 500	//Should be enough to get by with basic meds, tools, and food round start.
	wage = WAGE_NONE

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/pro
	health_modifier = 10

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
		STAT_COG = 10
	)

	perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "The Prospector serves as hired muscle to the Foreman, positioned somewhere between meat shield and exterminator.<br>\
	Your job is to keep the Salvagers and anyone else with you protected, handling the fighting and being the first to enter dangerous areas. <br>\
	While combat is your primary goal, you are still there to salvage valuable technology and make a profit selling said items to the colony."

	duties = "Guard your peers from hostile creatures and other dangers that cross your path.<br>\
	Use whatever measures necessary to ensure survival, but try not to soil the standing of your team.<br>\
	Help with the more general salvaging and heavy lifting."

/obj/landmark/join/start/pro
	name = "Prospector"
	icon_state = "player-blue"
	join_tag = /datum/job/pro

