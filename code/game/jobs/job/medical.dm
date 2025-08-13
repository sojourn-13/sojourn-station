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
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_medical_suits,
		access_robotics, access_xenobiology, access_heads_vault
	)

	ideal_character_age = 40
	minimum_character_age = 30
	playtimerequired = 1200

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_SI_SCI, PERK_CHEMIST)

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
	Dispatch your Lifeline Technicians to distress calls and corpse recoveries as needed.<br>\
	Use department funds to purchase medical supplies and equipment as needed.<br>\
	Advise the council on medical issues that concern the crew.<br>\
	Advise the crew on ethical issues.<br>\
	In times of crisis lock down the medbay to protect those within from outside threats."

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
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Biolab Overseer"
	difficulty = "Boring to Overwhelming."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	minimum_character_age = 25
	alt_titles = list("Soteria Nurse"=/decl/hierarchy/outfit/job/medical/doctor/medNurse, "Soteria Emergency Physician"=/decl/hierarchy/outfit/job/medical/doctor/medERPhys, "Soteria Surgeon"=/decl/hierarchy/outfit/job/medical/doctor/medSurgeon, "Soteria Chemist")
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	department_account_access = TRUE
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment, access_medical_suits, access_xenobiology, access_eva
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_CHEMIST)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Doctor is a professional medic and surgeon dedicated to healing the sick and injured at all costs.<br>\
	A broad range of medical procedures fall under your purview - diagnostics, general treatment, surgery and virology.<br>\
	You are not expected to be an expert in all: specializing in an area is fine. Divide tasks amongst colleagues with CBO guidance.<br>\
	Due to the nature of your work you may find yourself confined to the department for the shift majority. Don't abandon patients."

	duties = "Heal the sick and injured, whatever their complaint.<br>\
		Diagnose illnesses, offer general services, perform surgery, or even study viruses."

/obj/landmark/join/start/doctor
	name = "Soteria Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor

/datum/job/medstudent
	title = "Soteria Medical Resident"
	flag = DOCTORJR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Biolab Overseer"
	difficulty = "Boring to Overwhelming."
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	minimum_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor/medStudent
	alt_titles = list("Soteria Medical Student"=/decl/hierarchy/outfit/job/medical/doctor/medNurse, "Soteria Medical Intern")
	department_account_access = FALSE
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment, access_medical_suits, access_xenobiology, access_eva
	)

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_COG = 10
	)

	perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_CHEMIST)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Doctor is a professional medic and surgeon dedicated to healing the sick and injured, at all costs.<br>\
	A broad range of medical procedures fall under your purview - diagnostics, general treatment, surgery, and virology.<br>\
	You are not expected to be an expert in all: specializing in an area is fine. Divide tasks amongst colleagues with CBO guidance.<br>\
	Remember that chemistry has a dedicated specialist. Avoid this department unless it is notably short-staffed.<br>\
	Due to the nature of your work, you may find yourself confined to the department for the shift majority. Don't abandon patients and learn to be just like a real Doctor."

	duties = "Heal the sick and injured, whatever their complaint.<br>\
		Diagnose illnesses, offer general services, perform surgery or even study viruses.<br>\
		Fill in at chemistry if a Chemist is unavailable.<br>\
		Learn how to be a real doctor."

/obj/landmark/join/start/medstudent
	name = "Soteria Student"
	icon_state = "player-green-lower"
	join_tag = /datum/job/medstudent

/datum/job/recovery_team
	title = "Soteria Lifeline Technician"
	flag = RECOVERYTEAM
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Biolab Overseer"
	difficulty = "Ungratifying."
	selection_color = "#a8b69a"
	alt_titles = list("Soteria Biolab Enforcer", "Emergency Recovery Specialist")
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/medical/recovery_team
	disallow_species = list(FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	health_modifier = 5
	perks = list(PERK_MEDICAL_EXPERT, PERK_CHEMIST)

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_orderly, access_medical_suits,
		access_psychiatrist, access_genetics, access_robotics, access_xenobiology, access_tox, access_xenoarch, access_eva
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_ROB = 20,
		STAT_VIG = 10,
		STAT_BIO = 20
	)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "Members of the recovery team are no men and women of pure science nor medicine, they are strictly in charge of enforcing the Chief Biolab Overseer's orders and sometimes the Chief Research overseer's orders.<br>\
	Your primary role is that of an armed thug for medical. You make sure that medical remains safe by ensuring people don't trespass or steal items and remove those who shouldn't be there, by force if necessary.<br>\
	Your secondary responsibility is that of a soteria enforcer. Actions that require in house enforcement such as aiding doctors and security with violent patients in medical, securing the virology lab during an outbreak and aiding in the destruction of escaped slimes or kudzu from science.<br>\
	Your third duty is to aid medical doctors and act as a paramedic in fixing patients and collecting patients, this can include retrieving chemicals, doing basic triage, and going out to recover injured patients.<br>\
	You are fully licensed to enforce the will of the overseer and to protect the soteria, its staff and your patients with your personal weapons and armor.<br>\
	It's worth noting that you function heavily as a nurse when not acting as muscle and treatment of patients should be priority, in particular when assisting doctors."

	duties = "Act as a guard for medical ensuring unneeded colonists leave and nothing is stolen.<br>\
		Aid medical doctors in any way you can.<br>\
		Act as a nurse for minor injuries, treat patients that a doctor needn't bother with.<br>\
		Ensure that any outbreaks are contained such as slimes, infected monkeys or kudzu."

/obj/landmark/join/start/chemist //This says chemist so I didn't have to edit the map shit when I changed this. Fix later. || Update: Whoever did this, you never fucking fixed it. I hate you. - Rebel0
	name = "Soteria Recovery Team"
	icon_state = "player-green"
	join_tag = /datum/job/recovery_team

/obj/landmark/join/start/paramedic // Same thing as above tbh. || I still hate you. -Rebel0
	name = "Soteria Recovery Team"
	icon_state = "player-green"
	join_tag = /datum/job/recovery_team


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
	alt_titles = list("Soteria Psychologist", "Soteria Empath")
	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist
	department_account_access = TRUE
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_chemistry, access_virology,
		access_genetics, access_external_airlocks, access_research_equipment, access_medical_suits, access_xenobiology, access_eva, access_psychiatrist
	)
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	playtimerequired = 600 //10 hours
	ideal_character_age = 30
	minimum_character_age = 25

	perks = list(PERK_MEDICAL_EXPERT, PERK_PSI_PSYCHOLOGIST, PERK_CHEMIST)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 20,
		STAT_VIG = 5
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "The Psychiatrist is a mental specialist that works to help colonists through their various issues and concerns.<br>\
	In some ways you are a professional conversationalist. Despite knowing advanced therapy techniques, sometimes a mere chat can work wonders.<br>\
	More eventful days may involve you having particularly unstable colonists sectioned or interviewing criminals in coordination with Security.<br>\
	Remember that patient confidentiality is highly important in your profession. Keep sensitive information between you and the patient.<br>\
	Soteria psychs are also one of the most psionically adept members of the colony with an innate understanding of how the mind works.<br>\
	If you become a psion you have a greater variety of beneficial powers which you can use to aid the colony."

	duties = "Speak with anyone who desires help, no matter their rank or relation.<br>\
		Prescribe medicine and offer therapy courses for those who need it.<br>\
		Determine if individuals are fit for work or not. Help those who are proven unfit.<br>\
		Use your psionic gifts to assist the colony."

/obj/landmark/join/start/psychiatrist
	name = "Soteria Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist
