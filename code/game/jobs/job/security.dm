/datum/job/smc
	title = "Blackshield Commander"
	flag = SMC
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
	playtimerequired = 2500
	health_modifier = 25
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/smc

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector, access_medical, access_kitchen, access_medical_suits
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 40,
		STAT_VIG = 40,
	)

	perks = list(/datum/perk/ass_of_concrete,
				 /datum/perk/job/blackshield_conditioning,
				 /datum/perk/job/bolt_reflect,
				 /datum/perk/chem_contraband)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "Командир Черного щита служит командиром местного полка.<br>\
	Заключив контракт на защиту и служение колонии, ваша фракция служит добровольной первой (и, увы, последней) линией обороны.<br>\
	Ваша цель - обеспечить максимальную безопасность всех, кто живет в колонии, и устранить любые угрозы.<br>\
	Прапорщик (Warrant officer) - ваш союзник, и вы должны тесно сотрудничать с ними, они отвечают за соблюдение закона."

	duties = "Координируйте действия оперативников на местах, назначая их для реагирования на угрозы и сигналы бедствия по мере необходимости.<br>\
		Работайте с Прапорщиком, чтобы выделить средства для снабжения ваших команд любыми боеприпасами или оборудованием, в которых они нуждаются.<br>\
		Планируйте атаки на укоренившиеся угрозы, убедитесь, что каждый оперативник знает свои роли и точно их выполняет.<br>\
		Контролируйте работу сотрудников, находящихся под вашим командованием, и наказывайте тех, кто проявляет неподчинение или некомпетентность.<br>\
		Информируйте совет об угрозах безопасности колонии и советуйте им делать выбор, который сведет к минимуму подверженность угрозам."

/obj/landmark/join/start/smc
	name = "Blackshield Commander"
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

	perks = list(/datum/perk/ass_of_concrete,
				 /datum/perk/codespeak,
				 /datum/perk/chem_contraband,
				 /datum/perk/gunsmith)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "Прапорщик служит старшим офицером местного полка маршалов.<br>\
	Contracted to protect and serve the colony, your internal police force is dedicated to the fight against criminal elements.<br>\
	Your main objective is to keep everyone safe by maintaining order, and upholding laws of all manner within the colony.<br>\
	The Blackshield Commander is your ally and you should work closely with them - they provide the muscle and guns to defend the colony."

	duties = "Coordinate officers around the colony, assigning them to tasks and distress calls as needed.<br>\
		Сотрудничайте с командиром 'Черного щита', чтобы выделить средства для снабжения ваших команд любой броней, припасами, оружием, амуницией или инструментами, в которых они нуждаются.<br>\
		Поддерживайте мир вокруг колонии и следите за тем, чтобы каждый офицер знал свои роли и точно их выполнял.<br>\
		Контролируйте работу офицеров, находящихся под вашим командованием, и наказывайте тех, кто проявляет неподчинение или некомпетентность.<br>\
		Информировать совет об угрозах безопасности колонии и рекомендовать им выбор, который поддержит общественное доверие."

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

	perks = list(/datum/perk/market_prof,
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


/datum/job/serg
	title = "Sergeant"
	flag = SERG
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
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

	outfit_type = /decl/hierarchy/outfit/job/security/serg

	access = list(
		access_security, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	perks = list(/datum/perk/job/bolt_reflect, /datum/perk/job/blackshield_conditioning, /datum/perk/chem_contraband)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "Сержант является заместителем командира 'Черного щита' и фактическим командиром, если командира 'Черного щита' нет поблизости или он ранен. <br>\
	Ваша роль в основном заключается в поддержании порядка среди солдат 'Черного щита' и санитара и обеспечении того, чтобы они не вели себя как свора головорезов.<br>\
	Вы часто будете поддерживать дисциплину и порядок в рядах и выполнять приказы командира 'Черного щита'.<br>\
	Вы также будете второстепенным командиром отделения во время конфликтов, часто возглавляя солдат независимо от командира 'Чёрного Щита', но обычно подчиняясь его четким приказам.<br>\
	В более спокойные времена вы служите в качестве военной полиции и инструктора по строевой подготовке. Проявите инициативу и предложите различные учебные упражнения, особенно для младших оперативников, сообщайте о поведении, за которое сотрудник службы безопасности должен быть отстранен от занимаемой должности..<br>\
	Помните, что любые обязанности командира 'Чёрного Щита' могут быть делегированы вам, если он пожелает, и будут автоматически переданы, если он не будет присутствовать."

	duties = "Поддерживайте надлежащую этику среди сотрудников службы безопасности, включая Чёрный Щит и маршалов, ведя учет всего ответственно и записанно.<br>\
	Проводите подготовку и инструктаж солдат. Проведите учения и убедитесь, что они подготовлены к огневым рубежам, зонам поражения и тактике прорыва.<br>\
	Выполняйте приказы командира 'Черного щита' и в его отсутствие следите за безопасностью."

/obj/landmark/join/start/serg
	name = "Sergeant"
	icon_state = "player-blue"
	join_tag = /datum/job/serg


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

	perks = list(/datum/perk/ear_of_quicksilver,
				 /datum/perk/codespeak,
				 /datum/perk/chem_contraband)

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


/datum/job/medspec
	title = "Corpsman"
	flag = MEDSPEC
	department = DEPARTMENT_SECURITY
	department_flag = SECURITY
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Blackshield Commander"
	difficulty = "Hard."
	noob_name = "Corpsman Cadet"
	alt_titles = list("Corpsman Cadet", "Combat Medic")
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/medspec

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

	perks = list(/datum/perk/medicalexpertise, /datum/perk/job/blackshield_conditioning)
				// /datum/perk/chemist -Thanos Voice: "I'm sorry little one..."

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "Санитар - это высококвалифицированный медицинский специалист в Черном щите - смесь бойца и врача.<br>\
	Ваша первая обязанность - это обязанность полевого медика. Служите на задней линии в любых боевых ситуациях, оказывая помощь раненым и эвакуируя критических.<br>\
	Ваша вторая обязанность - обращаться с любыми заключенными и подозреваемыми, находящимися под стражей. Раны от побега и попыток самоубийства проверят ваши хирургические навыки.<br>\
	Ваша третья обязанность, когда вы сталкиваетесь со странными преступлениями, состоит в том, чтобы выступать в качестве научного аналитика - сканировать следы и проводить вскрытия.<br>\
	Помните, что, хотя вы можете быть вооружены, бой лучше оставить вашим коллегам. Сосредоточьтесь на задачах, которые можете выполнить только вы."

	duties = "Сведите к минимуму потери в боевых ситуациях и обработайте все связанные с этим раны.<br>\
	Лечите заключенных и подозреваемых и тщательно следите за их здоровьем.<br>\
	Работайте с Рейнджером над раскрытием преступлений, собирая судебные улики и проводя вскрытия.<br>\
	<b>Несмотря на то, что вы имеете достаточную медицинскую подготовку, вы не являетесь заменой врача для Сотерии. Вы являетесь более личным боевым медиком под юрисдикцией Чёрного Щита и маршалов.</b>"

/obj/landmark/join/start/medspec
	name = "Corpsman"
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
	supervisors = "the Blackshield Commander"
	difficulty = "Hard."
	noob_name = "Blackshield Cadet"
	alt_titles = list("Blackshield Cadet")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	health_modifier = 10
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_NASHEF)

	outfit_type = /decl/hierarchy/outfit/job/security/troop

	perks = list(/datum/perk/job/bolt_reflect, /datum/perk/job/blackshield_conditioning, /datum/perk/chem_contraband)

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

	description = "Солдат формирует основу Черного щита, линию фронта против пиратов, террористов и ксеносов.<br>\
	Ты самый близкий к профессиональному солдату человек, который есть в колонии. Используйте свои таланты, чтобы положить конец угрозам и конфликтным ситуациям.<br>\
	Тактика и командная работа имеют жизненно важное значение. Вам платят за то, чтобы вы выполняли приказы, а не за то, чтобы вы думали. Помните, что вы сосредоточены на внешних угрозах - остальное предоставьте маршалам.<br>\
	Когда нет постоянных приказов, ваша постоянная задача - патрулировать и быть начеку в поисках угроз или проблем. Помогите маршалам, если вас прямо попросят. <br>\
	Следите за главными воротами и периметром. У вас есть доступ в большинство мест, чтобы помочь с вашими обязанностями - не злоупотребляйте этим."

	duties = "Патрулируйте колонию, обеспечивайте безопасность и ищите неприятности.<br>\
		Справляйтесь с внешними угрозами для колонии, такими как пираты, враждебные ксеносы и все, что угрожает колонистам.<br>\
		Уничтожайте монстров, гигантских паразитов и враждебные машины.<br>\
		Выполняйте приказы по цепочке командования.<br>\
		Подчиняйтесь закону. Вы не выше этого."


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
	difficulty = "Hard."
	noob_name = "Junior Marshal Officer"
	alt_titles = list("Junior Marshal Officer", "Marshal Civil Servant")
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

	perks = list(/datum/perk/codespeak, /datum/perk/chem_contraband)

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
