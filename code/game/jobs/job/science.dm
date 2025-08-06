/datum/job/rd
	title = "Chief Research Overseer"
	flag = CRO
	head_position = 1
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#b39aaf"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/science/rd
	playtimerequired = 1200
	access = list(
		access_rd, access_heads, access_tox, access_genetics, access_morgue,
		access_tox_storage, access_teleporter, access_sec_doors,
		access_moebius, access_medical_equip, access_chemistry, access_virology, access_surgery, access_psychiatrist,
		access_robotics, access_xenobiology, access_ai_upload, access_tech_storage, access_eva, access_external_airlocks, access_medical_suits,
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_maint_tunnels, access_research_equipment, access_heads_vault
	)
	ideal_character_age = 40
	minimum_character_age = 25

	stat_modifiers = list(
		STAT_MEC = 25,
		STAT_COG = 50,
		STAT_BIO = 25,
	)

	perks = list(PERK_SURGICAL_MASTER, PERK_ROBOTICS_EXPERT, PERK_SI_SCI, PERK_CHEMIST)

	// TODO: enable after baymed
	software_on_spawn = list(/datum/computer_file/program/comm,
							///datum/computer_file/program/aidiag,
							/datum/computer_file/program/signaller,
							/datum/computer_file/program/camera_monitor,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/reports)

	description = "The Chief Research Overseer is the head of the research branch of the Soteria Institute, directing science activities.<br>\
	The scientists under your command are working on a range of projects. Direct them towards the best interests of the organization.<br>\
	With oversight over the funds, you may also purchase scientific artifacts and anything else of research value - even funding away missions.<br>\
	Even use your position to request support from other factions if required. Most colonists do not understand your work, but know its value.<br>\
	Of course, remember that you are a scientist yourself - feel free to get into the lab and work on R&D or xeno-related research.<br>\
	The Medical wing also falls under the ownership of Soteria. You may use their resources - and they may use yours - as needed."

	duties = "Direct the scientists under your command towards the bettering of all mankind.<br>\
	Ensure a healthy stock of research equipment through management of department funds.<br>\
	Consider organizing away missions and expeditions to acquire artifacts and other valuable items."

/obj/landmark/join/start/rd
	name = "Chief Research Overseer"
	icon_state = "player-purple-officer"
	join_tag = /datum/job/rd


/datum/job/scientist
	title = "Soteria Scientist"
	flag = SCIENTIST
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = MAP_FACTION
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Research Overseer"
	difficulty = "Medium."
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
//	noob_name = "Soteria Research Student"
	alt_titles = list("Soteria Xenobiologist", "Soteria Xenoarcheologist", "Soteria Xenobotanist", "Soteria Research Fabricator", "Soteria Geneticist")
	outfit_type = /decl/hierarchy/outfit/job/science/scientist
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours

	software_on_spawn = list(/datum/computer_file/program/signaller, /datum/computer_file/program/chem_catalog)

	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics, access_medical_suits
	)

	perks = list(PERK_SI_SCI, PERK_CHEMIST) //We do hydro?

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 35,
		STAT_BIO = 10,
	)

	description = "The Scientist is a researcher representing the Soteria Institute, standing at the frontier of human advancement.<br>\
	You may engage in a variety of research projects in four distinct fields - R&D, Xenoflora, Xenobiology, and Xenoarchaeology.<br>\
	The manufacture of high tech devices is the primary source of income for Soteria, but artifacts and alien life may offer great potential.<br>\
	Remember that dedicated specialists exist for robotics projects. You may work closely for general R&D, but avoid taking over robotics."

	duties = "Advance the cause of knowledge with various research projects.<br>\
	Manufacture new devices and weapons as you advance up the R&D tree.<br>\
	Manipulate plant DNA, and investigate alien life and devices.<br>\
	Create unusual things, explore, learn, and have a scientific adventure."

/obj/landmark/join/start/scientist
	name = "Soteria Scientist"
	icon_state = "player-purple"
	join_tag = /datum/job/scientist

/datum/job/scistudent
	title = "Soteria Science Intern"
	flag = SCIENTISTJR
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief Research Overseer"
	difficulty = "Medium."
	alt_titles = list("Soteria Xenobiology Intern", "Soteria Xenoarcheology Intern", "Soteria Xenobotany Intern", "Soteria Genetics Intern")
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/science/scientist

	software_on_spawn = list(/datum/computer_file/program/signaller, /datum/computer_file/program/chem_catalog)

	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics, access_medical_suits
	)

	perks = list(PERK_SI_SCI, PERK_CHEMIST) //We do hydro?

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 35,
		STAT_BIO = 10,
	)

	description = "The Scientist is a researcher representing the Soteria Institute, standing at the frontier of human advancement.<br>\
	You may engage in a variety of research projects in four distinct fields - R&D, Xenoflora, Xenobiology, and Xenoarchaeology.<br>\
	The manufacture of high tech devices is the primary source of income for Soteria, but artifacts and alien life may offer great potential.<br>\
	Remember that dedicated specialists exist for robotics projects. You may work closely for general R&D, but avoid taking over robotics."

	duties = "Advance the cause of knowledge with various research projects.<br>\
	Manufacture new devices and weapons as you advance up the R&D tree.<br>\
	Manipulate plant DNA, and investigate alien life and devices.<br>\
	Create unusual things, explore, learn, and have a scientific adventure."

/obj/landmark/join/start/scistudent
	name = "Soteria Science Intern"
	icon_state = "player-purple"
	join_tag = /datum/job/scistudent


/datum/job/roboticist
	title = "Soteria Roboticist"
	flag = ROBOTICIST
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Research Overseer"
	difficulty = "Medium."
//	noob_name = "Soteria Roboticist Student"
	alt_titles = list("Soteria Cyberneticist", "Soteria Mechanist", "Soteria Biomechanical Engineer")
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	department_account_access = TRUE
	disallow_species = list(FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	playtimerequired = 240 //4 hours


	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	access = list(
		access_robotics, access_tox, access_tox_storage, access_morgue, access_moebius, access_research_equipment, access_medical_suits
	) //As a job that handles so many corpses, it makes sense for them to have morgue access.

	software_on_spawn = list(/datum/computer_file/program/chem_catalog)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 25,
		STAT_BIO = 25,
	)

	perks = list(PERK_SURGICAL_MASTER, PERK_ROBOTICS_EXPERT, PERK_SI_SCI)

	description = "The Roboticist is a specialized scientist with a busy workload - at the forefront of Soteria's service offerings.<br>\
	You must maintain and upgrade the fleet of synthetics that keep the ship running, as well as constructing new ones on occasion.<br>\
	In addition, you may be asked to manufacture prosthetic limbs and enhancements. Medical can perform the installation if you lack surgical skills.<br>\
	Though not requested often you can also construct massive and powerful mechanized vehicles. These have powerful mining, rescue, and military applications.<br>\
	Remember that you are ultimately running a commercial cybernetic clinic - charge for your valuable services to earn a living."

	duties = "Repair, maintain and upgrade robots within the colony.<br>\
	Maintain and implant new bionics in crewmembers.<br>\
	Advertise bionics for sale and run a commercial cybernetic clinic.<br>\
	Construct large mechas for specialized use in departments."

/obj/landmark/join/start/roboticist
	name = "Soteria Roboticist"
	icon_state = "player-purple"
	join_tag = /datum/job/roboticist

/datum/job/robostudent
	title = "Soteria Robotics Intern"
	flag = ROBOTICISTJR
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Research Overseer"
	difficulty = "Medium."
//	noob_name = "Soteria Roboticist Student"
	alt_titles = list("Robotics Lab Assistant", "Soteria Cybernetics Intern", "Soteria Mechanics Intern", "Soteria Biomechanics Intern")
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	disallow_species = list(FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	access = list(
		access_robotics, access_tox, access_tox_storage, access_morgue, access_moebius, access_research_equipment, access_medical_suits
	) //As a job that handles so many corpses, it makes sense for them to have morgue access.

	software_on_spawn = list(/datum/computer_file/program/chem_catalog)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 25,
		STAT_BIO = 25,
	)

	perks = list(PERK_SURGICAL_MASTER, PERK_ROBOTICS_EXPERT, PERK_SI_SCI)

	description = "The Roboticist is a specialized scientist with a busy workload - at the forefront of Soteria's service offerings.<br>\
	You must maintain and upgrade the fleet of synthetics that keep the ship running, as well as constructing new ones on occasion.<br>\
	In addition, you may be asked to manufacture prosthetic limbs and enhancements. Medical can perform the installation if you lack surgical skills.<br>\
	Though not requested often you can also construct massive and powerful mechanized vehicles. These have powerful mining, rescue, and military applications.<br>\
	Remember that you are ultimately running a commercial cybernetic clinic - charge for your valuable services to earn a living."

	duties = "Repair, maintain and upgrade robots within the colony.<br>\
	Maintain and implant new bionics in crewmembers.<br>\
	Advertise bionics for sale and run a commercial cybernetic clinic.<br>\
	Construct large mechas for specialized use in departments."

/obj/landmark/join/start/robostudent
	name = "Soteria Robotics Intern"
	icon_state = "player-purple"
	join_tag = /datum/job/robostudent
