/datum/job/smc
	title = "Militia Commander"
	flag = SMC
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Council"
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 60, LANGUAGE_SERBIAN = 60)
	ideal_character_age = 40
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/security/smc

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 30,
		STAT_VIG = 40,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "You are the commander of the local regiment of the blackshield militia, contracted to protect and serve the Nadezhda colony. The Blackshield serves as the first line of defense and a volunteer military for the colony.<br>\
	<br>\
	Your goal is to keep everyone living on the colony as safe as possible and to eliminate any threats to safety.<br>\
	The Warrant Officer is your ally and you should work closely with them, they handle the upholding of the law."

	duties = "Coordinate operatives in the field, assigning them to threats and distress calls as needed.<br>\
		Work with the Warrant Officer to allocate funds to supply your teams with whatever armor, supplies, weapons, munitions, or tools they need.<br>\
		Plan assaults on entrenched threats, ensure each operative knows their roles and carries them out precisely.<br>\
		Oversee performance of the operatives under your command and punish any that are insubordinate or incompetent.<br>\
		Advise the council on threats to colony security and advise them towards choices that will minimise exposure to threats."

	loyalties = "As commander, your first loyalty is to the safety of the troops under your command. They are colonist risking their lives, not cannon fodder. Do not allow them to be sent on suicide missions. Any killings of your men should be repaid in blood.<br>\
		<br>\
		You're secondary loyalty is to the Blackguard and Nadezhda council, you are to listen to them and carry out all orders and procedures required by your station."

/obj/landmark/join/start/smc
	name = "Militia Commander"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/smc


/datum/job/swo
	title = "Warrant Officer"
	flag = SWO
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Council"
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 60, LANGUAGE_SERBIAN = 60)
	ideal_character_age = 40
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/security/swo

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 40,
		STAT_VIG = 30,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "You are the head officer of the local regiment of the Marshals, contracted to protect and serve the Nadezhda colony. The Marshals serves as the internal police force to the colony and protect against criminal elements.<br>\
	<br>\
	Your goal is to keep everyone safe by maintining order and upholding the law within the colony.<br>\
	The Militia Commander is your ally and you should work closely with them, they provide the muscle and guns to defend the colony."

	duties = "Coordinate officers around the colony, assigning them to tasks and distress calls as needed.<br>\
		Work with the Militia Commander to allocate funds to supply your teams with whatever armor, supplies, weapons, munitions, or tools they need.<br>\
		Keep the peace around the station and ensure each officer knows their roles and carries them out precisely.<br>\
		Oversee performance of the officers under your command and punish any that are insubordinate or incompetent.<br>\
		Advise the council on threats to colony security and advise them towards choices that will uphold the public trust."

	loyalties = "		As commander, your first loyalty is to the safety of the troops under your command. They are colonist risking their lives, not cannon fodder. Do not allow them to be sent on suicide missions. Any killings of your men should be repaid in blood.<br>\
		<br>\
		You're secondary loyalty is to the Blackguard and Nadezhda council, you are to listen to them and carry out all orders and procedures required by your station."

/obj/landmark/join/start/swo
	name = "Warrant Officer"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/swo


/datum/job/supsec
	title = "Supply Specialist"
	flag = SUPSEC
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Warrant Officer"
	selection_color = "#a7bbc6"
	department_account_access = TRUE
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/security/gunserg

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the second-in-command of the Marshal division of security and the defacto controller of the armory and armory shop.. <br>\
	Within the marhals you largely hold a desk job, your duties will rarely take you outside of the colony or even the armoyr itself and you are expected to interact with civilians. You will often be called to sell weaponry and armory to colonists and are probably the hardest working member of security as a whole.<br>\
	<br>\
	You have several core duties:<br>\
		1. As second in command, any of the warrant officer's duties may be delegated to you, if they decide to do so. This means that at any time, you may be expected to handle funding, paperwork, disciplinary matters, planning engagements, or even carrying out executions. If there's no warrant officer or commander, these duties fall naturally to you. If there is a either on site though, you shouldn't make these kind of decisions without consulting them.<br>\
		<br>\
		2. You serve as the security quartermaster. And as such, it is your job to maintain the armory and stocks of other equipment. You should keep track of its contents and who has what. Make sure weapons and equipment are returned at the end of a shift, and procure new armaments from cargo or from scavengers as necessary to keep supplies up and respond to new threats.<br>\
		<br>\
		3. You will often be asked to watch prisoners or process them for an officer and if there are any prisoners being kept in the Marshal brig you should check up on them. This is mainly so if a riot happens you can suppress it to keep the armory secure.<br>\
		<br>\
		4. In times of peace, prepare for war. To this end, you are also the onsite weapons instructor. If the colony is in a lull and there are no outstanding threats, you should take the initiative to order training drills. Allow junior operatives to train and learn with less conventional weapons and tactics, give lessons on aiming, trigger discipline, hand to hand combat. Conduct drills on threat response, squad tactics, and EVA manoeuvres.<br>\ "

	loyalties = "You're a police man through and through. As such, your first loyalty is to the Warrant Officer and thusly to the chain of command"

/obj/landmark/join/start/supsec
	name = "Supply Specialist"
	icon_state = "player-blue"
	join_tag = /datum/job/supsec


/datum/job/inspector
	title = "Ranger"
	flag = INSPECTOR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Warrant Officer"
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 50, LANGUAGE_SERBIAN = 50)

	outfit_type = /decl/hierarchy/outfit/job/security/inspector

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_prospector
	)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/audio,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the colony's detective and field agent, here to take care of the cases that aren't always what they seem and suspects that aren't always caught red handed or ready to confess.<br>\
	The ranger's job is to interrogate suspects, gather witness statements,  harvest evidence and reach a conclusion about the nature and culprit of a crime.<br>\
	<br>\
	You are a higher ranking position than officers and operatives and can determine if charges are valid and may release individuals for lack of evidence. Though you cannot give orders outside those pertaining to charges and arrests. The warrant officer still outranks you though and you should bring all conflicts to them if possible.<br>\
	<br>\
	When there are no outstanding cases, your job is to go look for them. Mingle with civilians, interact and converse, sniff out leads about potential criminal activity. In addition to being the only member of security who can freely come and go from the colony a well placed informant is worth any cost."

	duties = "Interview suspects and witnesses after a crime. Record important details of their statements, and look for inconsistencies.<br>\
		Gather evidence and bring it back for processing<br>\
		Send out officers to bring suspects in for questioning<br>\
		Interact with civilians and be on the lookout for criminal activity"

	loyalties = "As a detective, your loyalty is firstly to the truth. Seek to uncover the true events of any crime.<br>\
		<br>\
		Secondly, you are loyal to marshals and to the public trust. Follow the chain of command"

/obj/landmark/join/start/inspector
	name = "Ranger"
	icon_state = "player-blue"
	join_tag = /datum/job/inspector


/datum/job/medspec
	title = "Corpsmen"
	flag = MEDSPEC
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Militia Commander"
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 5)

	outfit_type = /decl/hierarchy/outfit/job/security/medspec

	access = list(
		access_security, access_moebius, access_sec_doors, access_medspec, access_morgue, access_maint_tunnels, access_medical_equip, access_prospector
	)

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_ROB = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "You are a highly trained specialist within Blackshield Militia. You were probably a freshly graduated medical student or paramedic when you joined and you thusly have a combination of medical and military training. You are not quite as knowledgeable as a civilian career doctor, not quite as much of a fighter as a dedicated militia operative, but strike a balance inbetween. Balance is the nature of your existence.<br>\
	<br>\
	Within the Blackshield, you have three roles to undertake. All of your roles can be delegated to others when needed - Soteria Medical for roles 1 and 2, the Marshal Rangers for role 3. But you are often the best positioned to carry out these tasks, especially when time is short.<br>\
	<br>\
	1. Field Medic. <br>\
	You may be expected to serve on the backlines in a combat situation, treating and stabilising the wounded, making the call as to whether they can return to combat or leave by medivac. You may need to perform emergency trauma surgery in undesireable conditions. <br>\
	You are allowed to be armed, but remember that saving lives, not taking them, is your first duty. Don't be afraid to send patients to soteria medical for proper specialist care.<br>\
	<br>\
	2. Prison Doctor.<br>\
	During quiet times, when inmates are serving in the brig, you will often be required to treat prisoners, criminal suspects, and the condemned. Suicide attempts are common in prison, and you will often be treating a patient against their will, who is attempting to escape. When serving in this role, stay on guard, work closely with the marshals, and keep control of the situation.<br>\
	<br>\
	3. Forensic Specialist.<br>\
	Solving crimes often requires scientific analysis, and expert rulings from a trusted source within security. You will often be expected to analyze blood, chemicals, fingerprints, conduct autopsies, and submit your findings to help track down elusive culprits. In this task, you will work closely with the rangers, if necessary, as he often has the talents to perform these tasks. But his time is better spent questioning and interrogating people."

/obj/landmark/join/start/medspec
	name = "Corpsmen"
	icon_state = "player-blue"
	join_tag = /datum/job/medspec


/datum/job/trooper
	title = "Blackshield Trooper"
	flag = TROOPER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Militia Commander"
	//alt_titles = list("Blackshield Junior Trooper")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/security/troop

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting,access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_prospector
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 20,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the boots on the ground, the rifle in the window, the long arm of the colonies defense. You are the hand of Blackshield and the frontline against pirates, terrorists, and xenos.<br>\
	<br>\
	You are the closet thing to a professional soldier or hardened mercenary the colony has. You are required to employ your talents in order to bring an end to threats and conflict situations. As a consummate professional, you're often expected to put your pride aside and work with others. Tactics and teamwork are vital.<br>\
	<br>\
	You are paid to act, not to think. When in doubt follow orders and leave the hard choices to someone else. Trust in your chain of command. Remember that you are focused entirely on external threats and should let the marshals handle internal security issues unless they ask for help or lack officers.<br>\
	<br>\
	When there are no standing orders, your ongoing task is to patrol the colony and be on the lookout for threats. Check in at departments, watch the main gate, assist the marshals, and do your best to prevent trouble before it spirals out of control. Wipe out threats and other dangerous creatures wherever you encounter them.<br>\
	<br>\
	You have wide access to the colony in order to carry out your duties and reach threats quickly. Do not abuse this. It does not mean you can walk into anywhere you like, many areas are full of sensitive machinery and entering unnanounced can be harmful to your health. Do not steal from departments either. If it's not in the security wing, it doesn't belong to you. Stealing from anywhere is a good way to get demoted and arrested."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with external threats to the colony such as pirates, hostile xenos, and anything that endangers colonists.<br>\
		Exterminate monsters, giant vermin and hostile machines.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it."

	loyalties = "As a career militia man, your first loyalty is to the chain of command, which ends with the Militia Commander. Their orders are supreme over all unless it breaks the law or standard operating procedure.<br>\
		<br>\
		Your second loyalty is to your fellow blackshield brothers in arms. As long as the commander takes care of you, you should follow orders. But if you start being sent on suicide missions and treated as expendable fodder, that should change.<br>\
		<br>\
		Your third loyalty is to uphold the public trust. You are still a person under all that armour. If you're being ordered to do something questionable, it may be time to start thinking for yourself."

/obj/landmark/join/start/trooper
	name = "Blackshield Trooper"
	icon_state = "player-blue"
	join_tag = /datum/job/trooper


/datum/job/officer
	title = "Marshal Officer"
	flag = OFFICER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Warrant Officer"
	//alt_titles = list("Marshal Junior Operative")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/security/ihoper

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting,access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_prospector
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 20,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the colonies police force first and foremost. You enforce the law, keep the peace, and uphold the public trust.<br>\
	<br>\
	As a member of the marshals you are trained and expected to be a problem solver who can descalate a situation and come to a peaceful resolution. You are first and foremost a problem solver and should strive to come to keep your weapons holstered.<br>\
	<br>\
	You are paid to keep order in the colony and should strive to use your best judgement in all scenarios. While your primary goal is to keep the peace you are also expected to aid in handling threats to the colony, in such cases you should follow the directives of the Blackshield.<br>\
	<br>\
	When there are no standing orders, your ongoing task is to patrol the colony and be on the lookout for threats or problems. Check in at departments, watch the main gate, assist the blackshield, and do your best to prevent trouble before it spirals out of control. Always mediate trouble before it escalates and strive for peace.<br>\
	<br>\
	You have wide access to the colony in order to carry out your duties and reach threats quickly. Do not abuse this. It does not mean you can walk into anywhere you like, many areas are full of sensitive machinery and entering unnanounced can be harmful to your health. Do not steal from departments either. If it's not in the security wing, it doesn't belong to you. Stealing from anywhere is a good way to get demoted and arrested."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it."

	loyalties = "As a career police man, your first loyalty is to the law. Orders from the Warrant Officer and Nadezhda Council should always be obeyed.<br>\
		<br>\
		Your second loyalty is to your fellow officers. As long as the warrant officer takes care of you and follows the law, you should follow orders. But if you start being asked to do anything illegal or corrupt, that should change.<br>\
		<br>\
		Your third loyalty is to uphold the public trust. You are still a person under all that armour. If you're being ordered to do something questionable, it may be time to start thinking for yourself."


/obj/landmark/join/start/officer
	name = "Marshal Officer"
	icon_state = "player-blue"
	join_tag = /datum/job/officer

