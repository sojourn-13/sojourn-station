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
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_maint_tunnels, access_research_equipment
	)
	ideal_character_age = 40
	minimum_character_age = 25

	stat_modifiers = list(
		STAT_MEC = 25,
		STAT_COG = 50,
		STAT_BIO = 25,
	)

	perks = list(/datum/perk/surgical_master, /datum/perk/robotics_expert, /datum/perk/si_sci, /datum/perk/chemist)

	// TODO: enable after baymed
	software_on_spawn = list(/datum/computer_file/program/comm,
							///datum/computer_file/program/aidiag,
							/datum/computer_file/program/signaller,
							/datum/computer_file/program/camera_monitor,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/reports)

	description = "Главный научный руководитель - руководитель исследовательского отделения Института 'Сотерия', руководящий научной деятельностью.<br>\
	Ученые под вашим командованием работают над различным рядом проектов. Направляйте их к наилучшим интересам организации.<br>\
	Контролируя бюджет, вы также можете приобретать научные артефакты и все остальное, представляющее ценность для исследований, даже финансируя миссии вне колонии.<br>\
	Даже используйте свое положение, чтобы запросить поддержку у других фракций, если потребуется. Большинство колонистов не понимают вашей работы, но понимают ее ценность.<br>\
	Конечно, помните, что вы сами ученый - не стесняйтесь заходить в лабораторию и заниматься РнД или ксено-исследованиями.<br>\
	Медицинское крыло также находится в собственности Сотерии. Вы можете использовать их ресурсы - а они могут использовать ваши - по мере необходимости."

	duties = "Направляйте ученых под вашим командованием на благо всего человечества.<br>\
	Обеспечьте здоровый запас исследовательского оборудования и экипировки за счет управления фондом департамента.<br>\
	Подумайте об организации миссий вне колонии и экспедиций для приобретения артефактов и других ценных предметов."

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
	noob_name = "Soteria Research Student"
	alt_titles = list("Soteria Research Student","Soteria Xenobiologist", "Soteria Xenoarcheologist", "Soteria Xenobotanist", "Soteria Research Fabricator", "Soteria Geneticist")
	outfit_type = /decl/hierarchy/outfit/job/science/scientist
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	software_on_spawn = list(/datum/computer_file/program/signaller, /datum/computer_file/program/chem_catalog)

	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics, access_medical_suits
	)

	perks = list(/datum/perk/si_sci, /datum/perk/chemist) //We do hydro?

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 35,
		STAT_BIO = 10,
	)

	description = "Ученый - исследователь, представляющий Институт Сотерии, стоящий на передовой человеческого прогресса.<br>\
	Вы можете участвовать в различных исследовательских проектах в четырех различных областях - РнД, Ксенофлора, ксенобиология и ксеноархеология.<br>\
	Производство высокотехнологичных устройств является основным источником дохода для Сотерии, но артефакты и инопланетная жизнь могут так же показать большой потенциал.<br>\
	Помните, что для проектов в области робототехники существуют отдельные специалисты. Вы можете тесно сотрудничать в области общих исследований и разработок, но избегайте брать на себя робототехнику."

	duties = "Продвигайте дело познания с помощью различных исследовательских проектов.<br>\
	Производите новые устройства и оружие по мере продвижения вверх по исследованиям РнД<br>\
	Манипулируйте ДНК растений и исследуйте инопланетную жизнь и устройства.<br>\
	Создавайте необычные вещи, исследуйте, учитесь и отправляйтесь в научное путешествие."

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
	noob_name = "Soteria Roboticist Trainee"
	alt_titles = list("Soteria Roboticist Trainee", "Soteria Cyberneticist", "Soteria Mechanist", "Soteria Biomechanical Engineer")
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	department_account_access = TRUE
	disallow_species = list(FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


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

	perks = list(/datum/perk/surgical_master, /datum/perk/robotics_expert, /datum/perk/si_sci)

	description = "Робототехник - это специализированный ученый с напряженной рабочей нагрузкой, который находится на передовой услуг Сотерии.<br>\
	Вы должны поддерживать и модернизировать армию синтетиков, которые поддерживают колонию в рабочем состоянии, а также время от времени создавать новые.<br>\
	Кроме того, вас могут попросить изготовить протезы конечностей и усовершенствования. Медицинский персонал может выполнить установку, если вам не хватает хирургических навыков.<br>\
	Хотя это требуется не часто, вы также можете создавать массивные и мощные механизированные транспортные средства. Они имеют мощное горнорудное, спасательное и военное применение.<br>\
	Помните, что в конечном счете вы управляете коммерческой кибернетической клиникой - платите за свои ценные услуги, чтобы зарабатывать на жизнь."

	duties = "Ремонтируйте, обслуживайте и улучшайте роботов внутри колонии.<br>\
	Поддерживайте и внедряйте новую бионику в членов экипажа.<br>\
	Рекламируйте бионику для продажи и управляйте коммерческой клиникой кибернетики.<br>\
	Создавайте огромных мехов для специального использования в отделах."

/obj/landmark/join/start/roboticist
	name = "Soteria Roboticist"
	icon_state = "player-purple"
	join_tag = /datum/job/roboticist
