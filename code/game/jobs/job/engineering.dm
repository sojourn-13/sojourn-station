/datum/job/chief_engineer
	title = "Guild Master"
	flag = GUILDMASTER
	head_position = 1
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#c7b97b"
	req_admin_notify = 1
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 25)
	wage = WAGE_COMMAND
	ideal_character_age = 50
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/engineering/exultant

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors, access_network,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload
	)

	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control,
							 /datum/computer_file/program/reports)

	description = "Мастер гильдии является главой гильдии ремесленников, группы опытных инженеров. Эта колония твоя гордость.<br>Вы должны поддерживать колонию в рабочем состоянии и постоянно улучшать ее, насколько это возможно. Пусть никто не ставит под сомнение эффективность ваших трудов <br>\
	Как руководитель, вам гораздо эффективнее делегировать работу, чем пытаться решить все самостоятельно - распределите труд.<br>\
	Техника всей станции ​​- ваша ответственность. Не позволяйте посторонним вмешиваться или вторгаться в ваш домен - даже сотрудники командования не являются исключеем.<br>\
	Относитесь к каждому члену гильдии как к своей семье. Держите их при деньгах, накормленными и в безопасности."

	duties = "Управляй адептами гильдии - ставь задачи и распредели их по разным отделам.<br>\
	Стремитесь защищать права ваших адептов, а также их безопасность и здоровье.<br>\
	Проводите собственные ремонтные работы и проекты по мере необходимости - особенно при маленьком онлайне "

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/chief_engineer
	name = "Guild Master"
	icon_state = "player-orange-officer"
	join_tag = /datum/job/chief_engineer


/datum/job/technomancer
	title = "Guild Adept"
	flag = ADEPT
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Guild Master"
	difficulty = "Medium."
	selection_color = "#d5c88f"
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 5)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "Адепт Гильдии является членом одной из величайших инженерных гильдий в галактике, с которой заключен контракт на содержание этой колонии..<br>\
Ваш главный приоритет - обеспечение и обслуживания двигателя суперматерии. Обратитесь к руководству по этой сложной машине, если не обучены.<br>\
Помимо этого, вы должны посвятить время изучению и настройке различных систем. Все может быть улучшено, и новые конструкции могут быть построены.<br>\
Эта культура обновления распространяется на ваш собственный арсенал - модифицируйте и обновляйте свои инструменты с частями с техов или приобретенных у Lonestar или исследователей.<br>\
Не позволяйте посторонним, даже командному штабу, вмешиваться в обязанности гильдии. И помните - будьте готовы отвечать на экстренные запросы в любое время."

	duties = "Запустить суперматерию.<br>\
	Чените всех и все кто выглядит поврежденым.<br>\
	Отвечайте на запросы о брешах в стене.<br>\
    Держите все части колонии в тепле, с воздухом, и с энергией."

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/technomancer
	name = "Guild Adept"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
