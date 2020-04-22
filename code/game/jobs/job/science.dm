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
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/science/rd

	access = list(
		access_rd, access_heads, access_tox, access_genetics, access_morgue,
		access_tox_storage, access_teleporter, access_sec_doors,
		access_moebius, access_medical_equip, access_chemistry, access_virology, access_cmo, access_surgery, access_psychiatrist,
		access_robotics, access_xenobiology, access_ai_upload, access_tech_storage, access_eva, access_external_airlocks,
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_maint_tunnels, access_research_equipment

	)
	ideal_character_age = 40
	minimum_character_age = 30

	stat_modifiers = list(
		STAT_MEC = 25,
		STAT_COG = 40,
		STAT_BIO = 25,
	)

	// TODO: enable after baymed
	software_on_spawn = list(/datum/computer_file/program/comm,
							///datum/computer_file/program/aidiag,
							/datum/computer_file/program/signaller,
							/datum/computer_file/program/camera_monitor,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/reports)

	description = "Главный научный надзиратель является руководителем научно-исследовательского отделения Института Сотерия, руководящего научной деятельностью.<br>\
	Ученые под вашим командованием работают над целым рядом проектов. Исследуйте то, чего требуют запросы.<br>\
Осуществляя надзор за отделами, вы также можете приобретать научные артефакты и все остальное, имеющее научную ценность, - даже финансируя миссии вне стен колонии.<br>\
	Используйте вашу позицию, чтобы запросить поддержку у других фракций, если это необходимо. Большинство колонистов не понимают вашу работу, но знают ее ценность.<br>\
	Конечно, помните, что вы сами ученый - не стесняйтесь заходить в лабораторию и заниматься исследованиями и разработками.<br>\
	Медицинский отдел также попадает в собственность Сотерии. Вы можете использовать их ресурсы - и они могут использовать ваши - по мере необходимости."

	duties = "Направьте ученых под вашим командованием на благо всего человечества.<br>\
	Обеспечьте здоровый запас исследовательского оборудования через управление фондами отдела.<br>\
	Рассмотрите возможность организации выездных миссий и экспедиций для приобретения артефактов и других ценных предметов.."

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
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)

	//alt_titles = list("Moebius Xenobiologist")
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

	software_on_spawn = list(/datum/computer_file/program/signaller, /datum/computer_file/program/chem_catalog)

	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics
	)

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 30,
		STAT_BIO = 20,
	)

	описание = "Ученый - исследователь, представляющий Институт Сотерии, стоящий на границе прогресса человечества.<br>\
	Вы можете участвовать в различных исследовательских проектах в четырех различных областях - исследования и разработки, ксенофлора, ксенобиология и ксеноархеология.<br>\
	Производство высокотехнологичных устройств является основным источником дохода для Soteria, но артефакты и инопланетная жизнь могут предложить большой потенциал.<br> \Помните, что для робототехники существуют специальные специалисты. Вы можете работать в тесном сотрудничестве для общих исследований и разработок, но но тратьте свое время на робототехнику, ведь кто если не вы будет проводить исследования?."

	работа = "Продвигать дело знаний с различными исследовательскими проектами.<br>\
	Создавайте новые устройства и оружие по мере продвижения по дереву исследований и разработок..<br>\
	Управлять ДНК растений и исследуйте инопланетную жизнь и устройства.<br>\
	Создавайте необычные вещи, исследуйте, учитесь и совершайте научные прорывы."

/obj/landmark/join/start/scientist
	name = "Soteria Scientist"
	icon_state = "player-purple"
	join_tag = /datum/job/scientist


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
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)

	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	access = list(
		access_robotics, access_tox, access_tox_storage, access_morgue, access_moebius, access_research_equipment
	) //As a job that handles so many corpses, it makes sense for them to have morgue access.

	software_on_spawn = list(/datum/computer_file/program/chem_catalog)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 20,
		STAT_BIO = 25,
	)

	description = "Роботист - специализированный ученый с большой рабочей нагрузкой - в авангарде сервисных предложений Soteria.<br>\
	Вы должны поддерживать и модернизировать парк синтетических материалов, которые обеспечивают работу корабля, а также создавать новые при необходимости.<br>\
Кроме того, вас могут попросить изготовить протезы конечностей и улучшения. Медицинский персонал может выполнить установку, если вам не хватает хирургических навыков.<br>\
	Хотя это не часто требуется, вы также можете создавать массивные и мощные механизированные транспортные средства. Они имеют мощное горное, спасательное и военное применение.<br>\
	Помните, что в конечном итоге вы управляете коммерческой кибернетической клиникой - Пусть вам плятят за ваши ценные услуги, чтобы зарабатывать на жизнь."

	duties = "Ремонт, обслуживание и модернизация роботов в колонии.<br>\
	Поддерживать и внедрять новые бионики в членов экипажа.<br>\
	Рекламируйте бионику на продажу и управляйте коммерческой кибернетической клиникой.<br>\
	Построить большие механизмы для специализированного использования в отделах."

/obj/landmark/join/start/roboticist
	name = "Soteria Roboticist"
	icon_state = "player-purple"
	join_tag = /datum/job/roboticist
