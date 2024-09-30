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
	difficulty = "Very Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	ideal_character_age = 40
	minimum_character_age = 30
	department_account_access = TRUE
	playtimerequired = 1200
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

	description = "Прапорщик служит старшим офицером местного полка маршалов.<br>\
	Contracted to protect and serve the colony, your internal police force is dedicated to the fight against criminal elements.<br>\
	Your main objective is to keep everyone safe by maintaining order, and upholding laws of all manner within the colony.<br>\
	The Blackshield Commander is your ally and you should work closely with them - they provide the muscle and guns to defend the colony."

	duties = "Coordinate officers around the colony, assigning them to tasks and distress calls as needed.<br>\
		Work with the Blackshield Commander to allocate funds to supply your teams with whatever armor, supplies, weapons, munitions or tools they need.<br>\
		Keep the peace around the colony and ensure each officer knows their roles and carries them out precisely.<br>\
		Oversee performance of the officers under your command and punish any that are insubordinate or incompetent.<br>\
		Advise the council on threats to colony security and advise them towards choices that will uphold the public trust."

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
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	department_account_access = TRUE
	wage = WAGE_LABOUR_HAZARD
	minimum_character_age = 25
	playtimerequired = 600
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

	description = "Специалист по снабжению является правой рукой прапорщика и фактическим контролером оружейной палаты и оружейного магазина. <br>\
	Ваша роль - это в основном кабинетная работа, и обязанности редко выводят вас за пределы колонии или даже арсенала.<br>\
	Вас часто будут призывать продавать оружие и оружейный склад колонистам, поддерживая запасы оборудования и отслеживая, у кого что есть.<br>\
	Вас также часто будут просить присматривать за заключенными или обрабатывать их. Проводите регулярные осмотры всех, кто заперт на гауптвахте - побеги недопустимы.<br>\
	В более спокойные времена вы выступаете в качестве инструктора по оружию на месте. Проявите инициативу и предложите разнообразные учебные упражнения, особенно для младших сотрудников.<br>\
	Помните, что любые обязанности прапорщика могут быть делегированы вам, если они пожелают, и иногда на вас будут ложиться внутренние задачи."

	duties = "Управляйте хорошим балансом запасов оружия и ответственно относитесь к бумажному следу и справедливой цене.<br>\
	Следите за заключенными на гауптвахте, чтобы обеспечить их здоровье и безопасность.<br>\
	Выполняйте учебные упражнения и другие упражнения, чтобы привести маршалов в соответствие со стандартами."


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
	difficulty = "Hard."
	noob_name = "Junior Ranger"
	alt_titles = list("Junior Ranger","Detective","Forensics Specialist")
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
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

	description = "Рейнджер - детектив колонии и полевой агент, берущийся за дела и подозреваемых, которые не всегда являются тем, чем кажутся.<br>\
	Ваша задача - допрашивать подозреваемых, собирать свидетельские показания, собирать улики и делать выводы о характере и виновнике преступления.<br>\
	Вы занимаете более высокое положение, чем офицеры и оперативники, и можете определить, обоснованы ли обвинения, и можете освободить отдельных лиц за отсутствием доказательств. <br>\
	Однако вы не можете отдавать приказы, кроме тех, которые касаются обвинений и арестов. Маршалы по-прежнему выше вас по званию - передайте все конфликты им.<br>\
	Когда нет нерешенных дел, ищите их. Общайтесь с гражданскими лицами, взаимодействуйте и беседуйте, вынюхивайте зацепки о потенциальной преступной деятельности."

	duties = "Опрашивайте подозреваемых и свидетелей после совершенных преступлений. Записывайте важные детали их заявлений и ищите несоответствия.<br>\
		Соберите доказательства и верните их обратно для обработки.<br>\
		Отправьте офицеров, чтобы они доставили подозреваемых на допрос.<br>\
		Взаимодействуйте с гражданскими лицами и будьте начеку в поисках преступной деятельности."

/obj/landmark/join/start/inspector
	name = "Ranger"
	icon_state = "player-blue"
	join_tag = /datum/job/inspector


/datum/job/officer
	title = "Marshal Officer"
	flag = OFFICER
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Warrant Officer"
	difficulty = "Hard."
	noob_name = "Marshal Assistant"
	alt_titles = list("Marshal Civil Servant","Marshal Patrolman","Marshal Enforcer")
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

	description = "Офицер-маршал составляет основную массу маршалов, обеспечивая внутреннее соблюдение закона и поддерживая мир.<br>\
	Ожидается, что вы будете решателем проблем, который сможет деэскалировать ситуации, достигать мирных соглашений и поддерживать общественное доверие.<br>\
	Держите свое оружие в кобуре, если ситуация не требует иного - проявите здравый смысл и следуйте приказам Чёрного Щита.<br>\
	Когда нет постоянных приказов, ваша постоянная задача - патрулировать колонию и быть начеку в поисках угроз или проблем.<br>\
	Регистрируйтесь в отделениях и наблюдайте за главными воротами. У вас есть доступ в большинство мест, чтобы помочь с вашими обязанностями - не злоупотребляйте этим."

	duties = "Патрулируйте колонию, обеспечивайте безопасность и ищите неприятности.<br>\
		Разбирайтесь с внутренними угрозами колонии, такими как преступники, саботажники и все, что угрожает колонистам.<br>\
		Убедитесь, что люди соблюдают закон и СОП для поддержания порядка.<br>\
		Выполняйте приказы по цепочке командования.<br>\
		Подчиняйтесь закону. Вы не выше этого."

/obj/landmark/join/start/officer
	name = "Marshal Officer"
	icon_state = "player-blue"
	join_tag = /datum/job/officer

/datum/job/officerjr
	title = "Marshal Junior Officer"
	flag = OFFICERJR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Warrant Officer"
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

	description = "The Marshal Officer forms the brunt of the Marshals, internally enforcing law and keeping the peace.<br>\
	You are expected to be a problem solver who can descalate situations, reach peaceful agreements, and maintain public trust.<br>\
	Keep your weapons holstered unless the situation demands otherwise - exercise good judgment and follow Blackshield orders.<br>\
	When there are no standing orders, your ongoing task is to patrol the colony and be on the lookout for threats or problems. <br>\
	Check in at departments and watch the main gate. You have access to most places to help with your duties  - do not abuse this."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it."

/obj/landmark/join/start/officer
	name = "Marshal Officer"
	icon_state = "player-blue"
	join_tag = /datum/job/officer

/datum/job/officerjr
	title = "Marshal Junior Officer"
	flag = OFFICERJR
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Warrant Officer"
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

	description = "The Marshal Officer forms the brunt of the Marshals, internally enforcing law and keeping the peace.<br>\
	You are learning to become a Marshal and are expected to be a learn how to problem solve and handle descalate situations, reach peaceful agreements, and maintain public trust.<br>\
	Keep your weapons holstered unless the situation demands otherwise - exercise good judgment and follow orders from full Marshals.<br>\
	When there are no standing orders, your ongoing task is to better learn the laws and Marshal SOP, patrol the colony, be on the lookout for threats or problems. <br>\
	Check in at departments and watch the main gate. You have access to most places to help with your duties  - do not abuse this."

	duties = "Patrol the colony, provide a security presence, and look for trouble.<br>\
		Deal with internal threats to the colony such as criminals, saboteurs, and anything that endangers colonists.<br>\
		Ensure that people follow the law and SoP to maintain order.<br>\
		Follow orders from the chain of command.<br>\
		Obey the law. You are not above it.<br>\
		Learn how to be a real Marshal Officer"

/obj/landmark/join/start/officerjr
	name = "Junior Marshal Officer"
	icon_state = "player-blue-lower"
	join_tag = /datum/job/officerjr
