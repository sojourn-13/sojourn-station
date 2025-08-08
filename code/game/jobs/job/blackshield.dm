/datum/job/smc
	title = "Blackshield Commander"
	flag = SMC
	head_position = 1
	department = DEPARTMENT_BLACKSHIELD
	department_flag = BLACKSHIELD | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Council"
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

	outfit_type = /decl/hierarchy/outfit/job/blackshield/smc

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector, access_medical, access_kitchen, access_medical_suits, access_heads_vault
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 40,
		STAT_VIG = 40,
	)

	perks = list(PERK_ASS_OF_CONCRETE,
				 PERK_BLACKSHIELD_CONDITIONING,
				 PERK_BOLT_REFLECT,
				 PERK_CHEM_CONTRABAND)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "The Blackshield Commander serves as the commander of the local regiment of the Blackshield.<br>\
	Contracted to protect and serve the colony your faction serves as the voluntary first (and hopefully last) line of defense.<br>\
	Your goal is to keep everyone living on the colony as safe as possible and to eliminate any threats to safety.<br>\
	The Warrant Officer is your ally and you should work closely with them, they handle the upholding of the law."

	duties = "Coordinate operatives in the field, assigning them to threats and distress calls as needed.<br>\
		Work with the Warrant Officer to allocate funds to supply your teams with whatever munitions or equipment they need.<br>\
		Plan assaults on entrenched threats, ensure each operative knows their roles and carries them out precisely.<br>\
		Oversee performance of the operatives under your command and punish any that are insubordinate or incompetent.<br>\
		Advise the council on threats to colony security and advise them towards choices that will minimise exposure to threats."

/obj/landmark/join/start/smc
	name = "Blackshield Commander"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/smc


/datum/job/serg
	title = "Sergeant"
	flag = SERG
	department = DEPARTMENT_BLACKSHIELD
	department_flag = BLACKSHIELD
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Blackshield Commander"
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	department_account_access = TRUE
	wage = WAGE_LABOUR_HAZARD
	minimum_character_age = 25
	playtimerequired = 1200
	health_modifier = 20
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/blackshield/serg

	access = list(
		access_security, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector, access_kitchen,
		access_medical_equip, access_surgery, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	perks = list(PERK_BLACKSHIELD_CONDITIONING, PERK_BOLT_REFLECT, PERK_CHEM_CONTRABAND)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Sergeant is the second-in-command of the Blackshield and the de-facto commanding officer if the Blackshield Commander isn't around or incapacitated. <br>\
	Your role is mainly keeping order among the Blackshield troopers and corpsmen and ensuring they do not act like a pack of thugs.<br>\
	You will often be maintaining discipline and order within the ranks and fulfilling orders from the Blackshield commander.<br>\
	You will also be the secondary squad leader during conflicts, often times leading troopers independent of the Blackshield commander, but usually under his explicit orders.<br>\
	In quieter times, you serve as a form of military police and drill instructor. Take the initiative to offer a variety of training drills, especially to junior operatives and report behavior that should have a member of security removed from their post.<br>\
	Remember that any Blackshield Commander duties may be delegated to you if they wish, and will automatically be given if they are not present."

	duties = "Manage good ethics among security, including the blackshield and marshals, with a record of everything responsibly and on the records.<br>\
	Train and instruct your troopers; Run drills and ensure they are prepared for firing lines, kill zones and breach tactics.<br>\
	Follow the orders of the Blackshield Commander and in their absence keep security in line."

/obj/landmark/join/start/serg
	name = "Sergeant"
	icon_state = "player-blue"
	join_tag = /datum/job/serg


/datum/job/medspec
	title = "Corpsman"
	flag = MEDSPEC
	department = DEPARTMENT_BLACKSHIELD
	department_flag = BLACKSHIELD
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Blackshield Commander"
	difficulty = "Hard."
	alt_titles = list("Combat Medic", "Field Medic")
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	disallow_species = list(FORM_AGSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours

	outfit_type = /decl/hierarchy/outfit/job/blackshield/medspec

	access = list(
		access_security, access_sec_doors, access_medspec, access_morgue, access_maint_tunnels,
		access_medical_equip, access_eva, access_brig, access_external_airlocks, access_surgery, access_medical_suits
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_ROB = 10,
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_BLACKSHIELD_CONDITIONING)
				// /datum/perk/chemist -Thanos Voice: "I'm sorry little one..."

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "The Corpsman is a highly trained medical specialist within the Blackshield - a mixture of combatant and doctor.<br>\
	Your first duty is that of a field medic. Serve on the back line of any combat situations, treating the wounded and evacuating the critical patients.<br>\
	Your second duty is to treat any prisoners and suspects in custody. Wounds from escape and suicide attempts will test your surgical skills.<br>\
	Your third duty, when faced with strange crimes, is to serve as a scientific analyst - scanning traces and conducting autopsies.<br>\
	Remember that although you are armed, the combat is better left to your colleagues. Focus on the tasks only you can do."

	duties = "Minimize casualties in combat situations and treat all related wounds.<br>\
	Treat any prisoners and suspects and thoroughly monitor their health.<br>\
	Work with the Ranger to solve crimes through collecting forensic evidence and conducting autopsies.<br>\
	<b>While you are sufficiently medically trained, you are not a replacement doctor for Soteria Medical. You are the personal combat medic under Blackshield and Marshal jurisdiction.</b>"

/obj/landmark/join/start/medspec
	name = "Corpsman"
	icon_state = "player-blue"
	join_tag = /datum/job/medspec


/datum/job/trooper
	title = "Blackshield Trooper"
	flag = TROOPER
	department = DEPARTMENT_BLACKSHIELD
	department_flag = BLACKSHIELD
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Blackshield Commander"
	difficulty = "Hard."
//	noob_name = "Blackshield Cadet"
//	alt_titles = list("Blackshield Cadet")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	health_modifier = 10
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours


	outfit_type = /decl/hierarchy/outfit/job/blackshield/troop

	perks = list(PERK_BLACKSHIELD_CONDITIONING, PERK_BOLT_REFLECT, PERK_CHEM_CONTRABAND)

	access = list(
		access_security, access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 20,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Trooper forms the base of the Blackshield. The front line against pirates, terrorists and xenos.<br>\
	You are the closest thing to a professional soldier the colony has. Employ your talents to bring an end to threats and conflict situations.<br>\
	Tactics and teamwork are vital. You are paid to follow orders, not to think. Remember your focus on external threats - leave internal issues to Marshals.<br>\
	When there are no standing orders, your perpetual task is to patrol and be on the lookout for threats or problems. Render aid to Marshals when asked. <br>\
	Watch the main gate and perimeter. You have access to most places to help with your duties - do not abuse this."

	duties = "Patrol the colony, provide a security presence and look out for trouble.<br>\
		Deal with external threats to the colony such as pirates, hostile xenos and anything that endangers colonists.<br>\
		Exterminate monsters, giant vermin and hostile machines.<br>\
		Follow orders from your chain of command.<br>\
		Obey the law. You are not above it."

/obj/landmark/join/start/trooper
	name = "Blackshield Trooper"
	icon_state = "player-blue"
	join_tag = /datum/job/trooper


/datum/job/cadet
	title = "Blackshield Cadet"
	flag = BSCADET
	department = DEPARTMENT_BLACKSHIELD
	department_flag = BLACKSHIELD
	faction = MAP_FACTION
	total_positions = 3 //2
	spawn_positions = 3 //2
	supervisors = "the Blackshield Commander"
	difficulty = "Easy."
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_INTERN
	health_modifier = 10
	disallow_species = list(FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/blackshield/troop/cadet

	perks = list(PERK_BLACKSHIELD_CONDITIONING, PERK_CHEM_CONTRABAND)

	access = list(
		access_security, access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 20,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Trooper forms the base of the Blackshield, the front line against pirates, terrorists, and xenos.<br>\
	You are learning to become a Trooper and help protect the colony. Employ your talents to bring an end to threats and conflict situations.<br>\
	Tactics and teamwork are vital, make sure to learn some. You are paid to follow and learn orders, not to question. Remember your focus is on external threats - leave internal issues to Marshals.<br>\
	When there are no standing orders, your perpetual task is to learn the contraband laws and Blackshield SOP, to patrol and be on the lookout for threats or problems. Render aid to Marshals when asked <br>\
	Watch the main gate and perimeter. You have access to most places to help with your duties - do not abuse this."

	duties = "Patrol the colony, provide a security presence and look out for trouble.<br>\
		Deal with external threats to the colony such as pirates, hostile xenos and anything that endangers colonists.<br>\
		Exterminate monsters, giant vermin and hostile machines.<br>\
		Follow orders from your chain of command.<br>\
		Obey the law. You are not above it.<br>\
		Learn everything you need to know to be a proper Trooper"

/obj/landmark/join/start/cadet
	name = "Blackshield Cadet"
	icon_state = "player-blue-lower"
	join_tag = /datum/job/cadet
