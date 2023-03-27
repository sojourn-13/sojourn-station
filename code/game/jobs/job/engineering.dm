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
	playtimerequired = 1200
	wage = WAGE_COMMAND
	ideal_character_age = 50
	minimum_character_age = 25
	health_modifier = 5

	disallow_species = list(FORM_UNBRANDED, FORM_SOTSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
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

	description = "Мастер Гильдии - глава Гильдии ремесленников, группы квалифицированных инженеров. Эта колония - ваша гордость.<br>\
	Вы должны поддерживать колонию в рабочем состоянии и постоянно улучшать ее настолько, насколько это в ваших силах. Пусть никто не сомневается в эффективности ваших трудов.<br>\
	Для вас, как для лидера, гораздо эффективнее делегировать работу, чем пытаться решать все самостоятельно - оптимизация и распределение труда вот что стоит вам запомнить.<br>\
	Техника по всей колонии - это ваша ответственность. Не позволяйте посторонним вмешиваться или вторгаться в ваши владения - даже командный состав не является исключением.<br>\
	Относитесь к каждому члену Гильдии как к своей семье. Обеспечьте им оплату, питание и защиту. Вы хоть и являетесь частью колонии, но ваши собственные интересы превыше всего."

	duties = "Управляйте адептами Гильдии - устанавливайте задачи и области сосредоточения.<br>\
	Стремитесь защитить права своих Адептов, а также их безопасность и здоровье.<br>\
	Проводите свои собственные ремонтные работы и проекты по мере необходимости - особенно при нехватке персонала. "

	perks = list(PERK_INSPIRATION, PERK_HANDYMAN)

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
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
	alt_titles = list("Guild Trainee","Guild Electrician", "Guild Mechanical Engineer")
	noob_name = "Guild Trainee"
	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	disallow_species = list(FORM_SOTSYNTH, FORM_BSSYNTH, FORM_NASHEF)


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

	description = "Адепт Гильдии является членом одной из величайших инженерных гильдий в галактике, заключившей контракт на содержание этой колонии.<br>\
	Вашим главным приоритетом является обеспечение настройки и технического обслуживания электросети колоний. Обратитесь за советом в решении этой сложной задачи, если вы неподготовлены.<br>\
	Помимо этого, вы должны посвятить время изучению и настройке различных систем. Все может быть улучшено, и могут быть созданы новые конструкции.<br>\
	Эта культура обновления распространяется и на ваш собственный арсенал - модифицируйте и улучшайте свои инструменты с помощью деталей из технического обслуживания или приобретенных у Lonestar или Старателей.<br>\
	Не позволяйте посторонним, даже Командному составу, вмешиваться в обязанности Гильдии. И помните - будьте готовы ответить на экстренные вызовы в любое время."

	duties = "Запустите солнечную батарею и генераторы.<br>\
	Ремонтируйте все и вся, что нуждается в некотором обслуживании.<br>\
	Отвечайте на сигналы бедствия и латайте бреши в стенах.<br>\
	Поддерживайте питание каждой части колонии, насыщайте ее кислородом и сделайте все чтобы с технической точки зрения колония была работоспособна."

	perks = list(PERK_INSPIRATION, PERK_HANDYMAN)

/obj/landmark/join/start/technomancer
	name = "Guild Adept"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
