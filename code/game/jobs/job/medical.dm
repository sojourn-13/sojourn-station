/datum/job/cmo
	title = "Chief Biolab Overseer"
	flag = CBO
	head_position = 1
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Stressful."
	selection_color = "#94a87f"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_medical_suits
	)

	ideal_character_age = 40
	minimum_character_age = 30

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(/datum/perk/medicalexpertise, /datum/perk/advanced_medical, /datum/perk/si_sci)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/reports)

	description = "The Chief Biolab Overseer is the head of the medical branch of the Soteria Institute, preserving and improving lives.<br>\
	Your main responsibility is to keep everyone alive, as is the objective of your department. Prioritize health over most other concerns. <br>\
	A variety of medical staff work under your command. Although these roles are clear-cut compared to the research branch, direct them appropriately.<br>\
	Of course, remember that you are a doctor yourself - feel free to help with less specialized activities to ease the burden.<br>\
	The Medical wing also falls under the ownership of Soteria. You may use their resources - and they may use yours - as needed."

	duties = "Direct the doctors under your command towards the bettering of all mankind.<br>\
	Dispatch your paramedics to distress calls, and corpse recoveries as needed.<br>\
	Use department funds to purchase medical supplies and equipment as needed.<br>\
	Advise the council on medical issues that concern the crew.<br>\
	Advise the crew on ethical issues.<br>\
	In times of crisis, lock down the medbay to protect those within, from outside threats."

/obj/landmark/join/start/cmo
	name = "Chief Biolab Overseer"
	icon_state = "player-green-officer"
	join_tag = /datum/job/cmo

/datum/job/doctor
	title = "Soteria Doctor"
	flag = DOCTOR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Biolab Overseer"
	difficulty = "Boring to Overwhelming."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	minimum_character_age = 25

	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment, access_medical_suits
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(/datum/perk/medicalexpertise, /datum/perk/advanced_medical)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Doctor is a professional medic and surgeon dedicated to healing the sick and injured, at all costs.<br>\
	A broad range of medical procedures fall under your purview - diagnostics, general treatment, surgery, and virology.<br>\
	You are not expected to be an expert in all: specializing in an area is fine. Divide tasks amongst colleagues, with CBO guidance.<br>\
	Remember that chemistry has a dedicated specialist. Avoid this department unless it is notably short-staffed.<br>\
	Due to the nature of your work, you may find yourself confined to the department for the shift majority. Don't abandon patients."

	duties = "Heal the sick and injured, whatever their complaint.<br>\
		Diagnose illnesses, offer general services, perform surgery, or even study viruses.<br>\
		Fill in at chemistry if a Chemist is unavailable."

/obj/landmark/join/start/doctor
	name = "Soteria Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor

/datum/job/orderly
	title = "Soteria Orderly"
	flag = ORDERLY
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Biolab Overseer"
	difficulty = "Ungratifying."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/medical/orderly

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_orderly, access_medical_suits,
		access_psychiatrist, access_genetics, access_robotics, access_xenobiology, access_tox, access_xenoarch
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_ROB = 20,
		STAT_VIG = 10,
		STAT_BIO = 15
	)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "The Orderly is not a man of science nor medicine, they are strictly in charge of enforcing the chief biolabs orders and sometimes the chief research overseer's orders.<br>\
	Your primary role is that of a thug for medical. You make sure that medical remains safe by ensuring people don't trespass or steal items and remove those who shouldn't be there, by force if necessary.<br>\
	Your secondary responsibility is that of an soteria enforcer. Actions that require in house enforcement such as aiding doctors and security with violent patients in medical, securing the virology lab during an outbreak, and aiding in the destruction of escape slimes or kudzu from science.<br>\
	Your third duty is to aid medical doctors and paramedics in fixing patients, this can include retrieving chemicals, doing basic triage, and accompanying paramedics to aid them in getting injured patients.<br>\
	You are fully licensed to sell any and all chemicals to all colonists. If someone isn't an employee of Soteria Institute, charge them for their chemicals.<br>\
	It's worth noting that you function heavily as a nurse when not acting as muscle and treatment of patients should be priority, in particular when assisting doctors."

	duties = "Act as a guard for medical, ensuring unneeded colonist leave and nothing is stolen.<br>\
		Aid medical doctors and paramedics in any way you can.<br>\
		Act as a nurse for minor injuries, treating patients that a doctor needn't bother with.<br>\
		Ensure that any outbreaks are contained, such as slimes, infected monkeys, or kudzu."

/obj/landmark/join/start/chemist //This says chemist so I didn't have to edit the map shit when I changed this. Fix later.
	name = "Soteria Orderly"
	icon_state = "player-green"
	join_tag = /datum/job/orderly

/datum/job/psychiatrist
	title = "Soteria Psychiatrist"
	flag = PSYCHIATRIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	wage = WAGE_PROFESSIONAL
	supervisors = "the Soteria Biolab Overseer"
	difficulty = "Soul Crushing."
	selection_color = "#a8b69a"

	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_chemistry, access_medical_suits
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 15,
		STAT_VIG = 5
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Psychiatrist is a mental specialist that works to help colonists through their various issues and concerns.<br>\
	In some ways you are a professional conversationalist. Despite knowing advanced therapy techniques, sometimes a mere chat can work wonders.<br>\
	More eventful days may involve you having particularly unstable colonists sectioned, or interviewing criminals in coordination with Security.<br>\
	Remember that patient confidentiality is highly important in your profession. Keep sensitive information between you and the patient."

	duties = "Speak with anyone who desires help, no matter their rank or relation.<br>\
		Prescribe medicine and offer therapy courses for those who need it.<br>\
		Determine if individuals are fit for work or not. Help those who are proven unfit."

/obj/landmark/join/start/psychiatrist
	name = "Soteria Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist


/datum/job/paramedic
	title = "Soteria Paramedic"
	flag = PARAMEDIC
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Soteria Biolab Overseer"
	difficulty = "Underappreciated."
	selection_color = "#a8b69a"
	wage = WAGE_LABOUR_HAZARD

	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_paramedic,
		access_eva, access_maint_tunnels, access_external_airlocks, access_chemistry, access_medical_suits
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	perks = list(/datum/perk/medicalexpertise)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "The Paramedic provides medical assistance on the field, while other doctors are busy in their department.<br>\
	You are trained but lack seniority. Follow the guidance of other doctors - and transport patients back for specialist treatments.<br>\
	Remember that you must often respond to emergencies. Pack your gear carefully and bring a breaching tool - be ready to run at short notice.<br>\
	Your other duties include transporting patients between rooms, running errands, and generally saving time for other doctors.<br>\
	Corpse recovery may also fall within your duties. If the body is in a dangerous location, enlist the help of the Blackshield."

	duties = "Respond to distress calls and extract wounded people from dangerous situations.<br>\
	Watch the crew monitor for signs of injuries or deaths and respond accordingly.<br>\
	Tour around departments checking up on the health of the crew. Administer first aid on scene as required.<br>\
	During quieter times, retrieve the corpses of the dead.<br>\
	Run errands for the medbay staff, act as their hands outside of the medbay."

/obj/landmark/join/start/paramedic
	name = "Soteria Paramedic"
	icon_state = "player-green"
	join_tag = /datum/job/paramedic

