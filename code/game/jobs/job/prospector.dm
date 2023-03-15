/datum/job/foreman
	title = "Foreman"
	flag = FOREMAN
	head_position = 1
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Hard."
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	department_account_access = TRUE
	health_modifier = 15

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	outfit_type = /decl/hierarchy/outfit/job/foreman
	playtimerequired = 1200
	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_medical_suits //for locating scav team dead bodies
	)

	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30,
		STAT_MEC = 10,
		STAT_BIO = 10
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "Бригадир командует старателями, группой независимых сборщиков, ищущих удачу в руинах и мусоре. <br>\
    Ваша задача - вести вашу команду в опасные местности и забрать всё ценное, что не прибито гвоздями - и гвозди тоже!<br>\
    Как потенциально самый молодой глава состава,  от вас ожидается быть в опасности почти всегда - вы должны быть независимы и хитры.<br>\
    Ваша работа возможно самая опасная во всей колонии, поэтому хорошие навыки выживания и боя необходимы."

	duties = "Соберите свою команду старателей и сборщиков, снаряжая их всем тем, что вы сможете найти у себя в отделе, или где либо ещё.<br>\
        Ведите свою команду через опасные местности и обеспечьте гарантию того, что всё ценное будет собрано..<br>\
        Держите всех в живых, и не смейте оставлять кого-либо позади.<br>\
        Заполните пробелы в вашей команде, будь это боевая, медицинская, или техническая поддержка."

/obj/landmark/join/start/foreman
	name = "Foreman"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/foreman

/datum/job/salvager
	title = "Salvager"
	flag = SALVAGER
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie Salvager"
	alt_titles = list("Sawbones", "Rookie Salvager")
	alt_perks = list("Sawbones"=list(PERK_MEDICAL_EXPERT, PERK_STALKER), "Junk Technician"=list(PERK_JUNKBORN, PERK_ROBOTICS_EXPERT))
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR

	disallow_species = list(FORM_BSSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/salv

	health_modifier = 5

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_MEC = 20,
		STAT_COG = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_ROB = 10
	)
	perks = list(PERK_JUNKBORN, PERK_STALKER)

	description = "Спасатель это неформальный обученный специалист, работающий как инженер и доктор.<br>\
    Ваша основная роль - полевой медик. Лечите и стабилизируйте раненных в тылу боя, и эвакуируйте критически раненных.<br>\
    Ваша вторая задача это обеспечение технической поддержки вашей команды - уничтожение стен, постройка ФОБов, починка оборудования, сбор полезных вещей из куч мусора.<br>\
    Помните, что вы тут ради сбора полезного с заброшенных территорий. Не тратьте по пусту время и ресурсы, безрассудно охотясь на существ."

	duties = "Сбор ресурсов для своего нанимателя. Используйте экипировку для получения доступа в новые зоны и закрепите свое присутствие на диких территориях.<br>\
    Оказывайте медицинскую помощь вашим напарникам, от обработки ран до полноценной полевой хирургии.<br>\
    Оставьте защиту группы нанятым вышибалам, кроме ситуаций с отсутствием такого выбора."

/obj/landmark/join/start/salvager
	name = "Salvager"
	icon_state = "player-blue"
	join_tag = /datum/job/salvager

/datum/job/pro
	title = "Prospector"
	flag = PROSPECTOR
	department = DEPARTMENT_PROSPECTOR
	department_flag = PROSPECTORS
	faction = MAP_FACTION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Foreman"
	difficulty = "Medium."
	noob_name = "Rookie Prospector"
	alt_titles = list("Rookie Prospector", "Hired Muscle")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_DUMB

	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)
	outfit_type = /decl/hierarchy/outfit/job/pro
	health_modifier = 10

	access = list(
		access_prospector, access_external_airlocks, access_eva, access_maint_tunnels
	)

	stat_modifiers = list(
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_ROB = 20,
		STAT_COG = 10
	)

	perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING)

	description = "Старатель служит как вышибала у Бригадира/Начальника Цеха, находясь в иерархии где-то между живым щитом и чистильщиком от тараканов.<br>\
    Ваша работа держать Спасателей и всех рядом с вами под защитой, сражаясь и идя первым в опасные места. <br>\
    Хоть бой является вашей основной задачей, вы так же занимаетесь сбором ценных технологий и продажей, продавая всё собранное Колонии."

	duties = "Защищать своих напарников от враждебных существ и других опасностей на своем пути.<br>\
    Используйте всё, что обеспечит ваше выживание, но не запятнайте репутацию вашей команды.<br>\
    Помогайте с основным сбором вещей и работой с тяжелыми объектами."

/obj/landmark/join/start/pro
	name = "Prospector"
	icon_state = "player-blue"
	join_tag = /datum/job/pro

