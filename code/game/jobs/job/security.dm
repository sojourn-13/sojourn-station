/datum/job/swo
	title = "Captain"
	flag = SWO
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Governor and the Iskhod Council"
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
		access_bar, access_kitchen, access_medical_suits, access_heads_vault
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

	description = "The Captain serves as the head officer of the Iskhod Rangers.<br>\
	Contracted to protect and serve the colony, your internal police force is dedicated to the fight against criminal elements.<br>\
	Your main objective is to keep everyone safe by maintaining order, and upholding laws of all manner within the colony.<br>\
	You provide the muscle and guns to defend the colony."

	duties = "Coordinate Rangers around the colony, assigning them to tasks and distress calls as needed.<br>\
		Work with the Lieutenant to allocate funds to supply your teams with whatever armor, supplies, weapons, munitions or tools they need.<br>\
		Keep the peace around the colony and ensure each Ranger knows their roles and carries them out precisely.<br>\
		Oversee performance of the Rangers under your command and punish any that are insubordinate or incompetent.<br>\
		Advise the council on threats to colony security and advise them towards choices that will uphold the public trust."

/obj/landmark/join/start/swo
	name = "Captain"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/swo


/datum/job/supsec
	title = "Lieutenant"
	flag = SUPSEC
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain"
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	department_account_access = TRUE
	wage = WAGE_LABOUR_HAZARD
	minimum_character_age = 25
	playtimerequired = 1200
	health_modifier = 20
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/gunserg

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector,
		access_hydroponics, access_bar, access_kitchen, access_medical_suits, access_sec_shop, access_forensics_lockers
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	perks = list(PERK_MARKET_PROF,
				 /datum/perk/codespeak,
				 /datum/perk/chem_contraband,
				 /datum/perk/gunsmith)

	description = "The Lieutenant is the right hand of the Captain and the defacto controller of the armory and armory shop. <br>\
	Your role is mainly a desk job - with duties rarely taking you outside of the colony or even the armory.<br>\
	You will often be called to sell weaponry and armory to colonists, maintaining the stock of the equipment and tracking who has what.<br>\
	You will also be often asked to watch or process prisoners. Perform regular checkups on anyone locked in the brig - breakouts are intolerable.<br>\
	In quieter times, you serve as the on-site weapons instructor. Take the initiative to offer a variety of training drills, especially to junior operatives.<br>\
	Remember that any Captain duties may be delegated to you if they wish and internal tasks will fall to you at times."

	duties = "Manage a good balance of armory stock, and dispense responsibly with a paper trail and fair price.<br>\
	Monitor prisoners in the brig to ensure their health and safety.<br>\
	Perform training drills and other exercises to bring the Rangers up to standard."

/obj/landmark/join/start/supsec
	name = "Lieutenant"
	icon_state = "player-blue"
	join_tag = /datum/job/supsec

/datum/job/inspector
	title = "Detective"
	flag = INSPECTOR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain"
	difficulty = "Hard."
	noob_name = "Junior Ranger"
	alt_titles = list("Forensics Specialist")
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	playtimerequired = 1200
	health_modifier = 5
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/inspector

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_prospector, access_brig, access_hydroponics, access_bar, access_kitchen,
		access_medical_suits
	)

	perks = list(PERK_EAR_OF_QUICKSILVER,
				 PERK_CODESPEAK,
				 PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/audio,
							 /datum/computer_file/program/camera_monitor)

	description = "The Detective is the colony investigator and field agent, taking on cases and suspects that aren't always what they seem.<br>\
	Your job is to interrogate suspects, gather witness statements,  harvest evidence and reach a conclusion about the nature and culprit of a crime.<br>\
	You are a higher ranking position than regular Rangers and can determine if charges are valid and may release individuals for lack of evidence. <br>\
	However, you cannot give orders outside those pertaining to charges and arrests. The Captain still outranks you - bring all conflicts to them.<br>\
	When there are no outstanding cases, look for them. Mingle with civilians, interact and converse, sniff out leads about potential criminal activity."

	duties = "Interview suspects and witnesses after a crime. Record important details of their statements, and look for inconsistencies.<br>\
		Gather evidence and bring it back for processing.<br>\
		Send out Rangers to bring suspects in for questioning.<br>\
		Interact with civilians and be on the lookout for criminal activity."

/obj/landmark/join/start/inspector
	name = "Detective"
	icon_state = "player-blue"
	join_tag = /datum/job/inspector


/datum/job/officer
	title = "Ranger"
	flag = OFFICER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Captain"
	difficulty = "Hard."
	noob_name = "Marshal Assistant"
	alt_titles = list("Ranger Patrolman","Ranger Enforcer")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	health_modifier = 10
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)
	playtimerequired = 240

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

	description = "The Ranger forms the brunt of the Iskhod Rangers, internally enforcing law and keeping the peace.<br>\
	You are expected to be a problem solver who can descalate situations, reach peaceful agreements, and maintain public trust.<br>\
	Keep your weapons holstered unless the situation demands otherwise - exercise good judgment and follow Captain orders.<br>\
	When there are no standing orders, your ongoing task is to patrol the colony and be on the lookout for threats or problems. <br>\
	Check in at departments and watch the main gate. You have access to most places to help with your duties  - do not abuse this."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it."

/obj/landmark/join/start/officer
	name = "Ranger"
	icon_state = "player-blue"
	join_tag = /datum/job/officer

/datum/job/officerjr
	title = "Junior Ranger"
	flag = OFFICERJR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain"
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_INTERN
	health_modifier = 10
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/ihoper/jr

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

	description = "The Ranger forms the brunt of the Iskhod Rangers, internally enforcing law and keeping the peace.<br>\
	You are learning to become a Ranger and are expected to be a learn how to problem solve and handle descalate situations, reach peaceful agreements, and maintain public trust.<br>\
	Keep your weapons holstered unless the situation demands otherwise - exercise good judgment and follow orders from full Rangers.<br>\
	When there are no standing orders, your ongoing task is to better learn the laws and Ranger SOP, patrol the colony, be on the lookout for threats or problems. <br>\
	Check in at departments and watch the main gate. You have access to most places to help with your duties  - do not abuse this."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it.<br>\
		Learn how to be a real Ranger"

/obj/landmark/join/start/officerjr
	name = "Junior Ranger"
	icon_state = "player-blue-lower"
	join_tag = /datum/job/officerjr

/datum/job/medspec
	title = "Corpsman"
	flag = MEDSPEC
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain"
	difficulty = "Hard."
	alt_titles = list("Combat Medic", "Field Medic")
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	disallow_species = list(FORM_AGSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours

	outfit_type = /decl/hierarchy/outfit/job/blackshield/medspec // Reusing existing outfit for now or should update to Ranger variant if exists

	access = list(
		access_security, access_sec_doors, access_medspec, access_morgue, access_maint_tunnels,
		access_medical_equip, access_eva, access_brig, access_external_airlocks, access_surgery, access_medical, access_medical_suits
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_ROB = 10,
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_BLACKSHIELD_CONDITIONING)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "The Corpsman is a highly trained medical specialist within the Iskhod Rangers - a mixture of combatant and doctor.<br>\
	Your first duty is that of a field medic. Serve on the back line of any combat situations, treating the wounded and evacuating the critical patients.<br>\
	Your second duty is to treat any prisoners and suspects in custody. Wounds from escape and suicide attempts will test your surgical skills.<br>\
	Your third duty, when faced with strange crimes, is to serve as a scientific analyst - scanning traces and conducting autopsies.<br>\
	Remember that although you are armed, the combat is better left to your colleagues. Focus on the tasks only you can do."

	duties = "Minimize casualties in combat situations and treat all related wounds.<br>\
	Treat any prisoners and suspects and thoroughly monitor their health.<br>\
	Work with the Detective to solve crimes through collecting forensic evidence and conducting autopsies.<br>\
	<b>While you are sufficiently medically trained, you are not a replacement doctor for Medical. You are the personal combat medic under Ranger jurisdiction.</b>"

/obj/landmark/join/start/medspec
	name = "Corpsman"
	icon_state = "player-blue"
	join_tag = /datum/job/medspec
