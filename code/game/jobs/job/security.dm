/datum/job/swo
	title = "Lonestar Thug-for-Hire Captain"
	flag = SWO
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | COMMAND | LSS
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the CEO"
	difficulty = "Very Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	ideal_character_age = 40
	minimum_character_age = 30
	department_account_access = TRUE
	playtimerequired = 2500
	health_modifier = 25
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/swo

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_sec_shop,
		access_external_airlocks, access_research_equipment, access_prospector, access_tcomsat, access_hydroponics,
		access_bar, access_kitchen, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 40,
		STAT_VIG = 30,
	)

	perks = list(PERK_ASS_OF_CONCRETE,
				 PERK_CODESPEAK,
				 PERK_CHEM_CONTRABAND,
				 PERK_GUNSMITH)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "The Lonestar Thug-for-Hire Captain serves as the head officer of the local regiment of the Lonestar Child Killers Inc.<br>\
	Contracted to extort and enforce Lonestar brand corporate law on the colony, your internal police force is dedicated to the fight anti-Lonestar elements.<br>\
	Your main objective is to kill anyone you don't like and act like real life Blackwater, Tri-Corp, Wagner Group, and other various other edgy organizations.<br>\
	Really edgy 'people' in the Sojourn community will love and enjoy your role. Being 'based' to the terminally online incel behind his computer."

	duties = "Kill women, children, and innocent 'people'.<br>\
		Be a PMC. As is Cora, Alinar, and other brainrotted people's dream.<br>\
		Uphold the McLaw of Lonestar(tm) brand."

/obj/landmark/join/start/swo
	name = "Lonestar Thug-for-Hire Captain"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/swo

/datum/job/officer
	title = "Lonestar Thug-for-Hire"
	flag = OFFICER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | LSS
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Thug-for-Hire Captain"
	difficulty = "Hard."
	noob_name = "McLonestar Child Soldier"
	alt_titles = list("McLonestar Child Soldier", "LARPers Wet Dream")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	health_modifier = 10
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/ihoper

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting, access_eva, access_forensics_lockers, access_medspec,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_prospector, access_kitchen, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 20,
	)

	perks = list(PERK_CODESPEAK, PERK_CHEM_CONTRABAND)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Lonestar Thug-for-Hire forms the brunt of Lonestar, internally enforcing McLaw and extorting the public.<br>\
	You are expected to be a problem solver who can descalate situations - such as shooting whoever you like.<br>\
	Keep your weapons unholster, target innocent people, and follow the Lonestar CEO's plans.<br>\
	Edgy larpers who contribute the worst, most putrid ideas - given usually by 15 year old HOI4 players - will love and look up to you."

	duties = "Kill."

/obj/landmark/join/start/officer
	name = "Lonestar Thug-for-Hire"
	icon_state = "player-blue"
	join_tag = /datum/job/officer
