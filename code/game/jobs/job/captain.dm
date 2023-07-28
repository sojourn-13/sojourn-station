var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/premier
	title = "Premier"
	flag = PREMIER
	department = DEPARTMENT_COMMAND
	head_position = TRUE
	aster_guild_member = TRUE
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart and wisdom"
	difficulty = "Very Hard."
	selection_color = "#ccccff"
	req_admin_notify = 1
	playtimerequired = 2500
	wage = WAGE_COMMAND

	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/captain

	perks = list(PERK_SOMELLIER)

	description = "Премьер-министр является главным посредником самой колонии, выступая в качестве доверенного советника среди своих сотрудников.<br>\
Вам доверен контроль над банковскими аккаунтами колонии, и вы также можете контролировать доступ внутри колонии.<br>\
Ваша основная цель - контролировать решения совета, изменять уровни доступа и выступать в качестве юриста и консультанта при принятии различных решений.<br>\
Вы не являетесь верховным лидером колонии, и ваше слово - всего лишь совет. Единственный человек, которому вы можете отдавать законные приказы - это Стюард.<br>\
У каждого из глав фракций, входящих в совет, есть свои собственные планы, и цели. Их интересы должны быть соблюдены, чтобы избежать проблем.<br>\
Относитесь к командующему составу с уважением и прислушивайтесь к их советам. Старайтесь не управлять их отделами на микроуровне и не вмешиваться в их дела."

	duties = "Работайте с учетом различных интересов членов совета для достижения стабильности колонии.<br>\
	Предлагайте советы и помощь когда к вам обращаются, особенно во время принятия важных решений.<br>\
	Контролируйте банковскую систему и уровни доступа в колонии."


	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15,
		STAT_VIV = 1,
		STAT_ANA = 1
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/premier
	name = "Premier"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/premier

/datum/job/pg
	title = "Steward"
	flag = STEWARD
	department = DEPARTMENT_COMMAND
	head_position = FALSE
	aster_guild_member = TRUE
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"
	difficulty = "Hard."
	selection_color = "#ddddff"
	req_admin_notify = 1
	playtimerequired = 600
	wage = WAGE_COMMAND
	ideal_character_age = 35
	minimum_character_age = 25

	health_modifier = 5
	description = "Стюард - верная правая рука Премьера. Служа личной охраной, следуйте за ним, куда бы он ни пошел.<br>\
	Ваша главная и, возможно, единственная ответственность заключается в обеспечении безопасности Премьера любой ценой - даже вашей собственной жизни, если это необходимо.<br>\
	Однако вы не только телохранитель, но и советник. Осторожно сообщайте ему об ошибках. Убедитесь, что он следует закону и остается с поддержкой.<br>\
	Премьер может поручить вам особые задания по любой причине. Убедитесь, что эти приказы будут выполнены.<br>\
	Не ставьте его в неловкое положение и особенно не вредите его отношениям с лидерами фракций. Возможно, вы не очень много говорите, но оказываете огромное влияние."

	duties = "Действуйте как телохранитель, советник и доверенное лицо премьера<br>\
	Будьте в курсе любых потенциальных угроз безопасности премьера<br>\
	Выполняйте приказы, назначенные премьером, такие как заполнение документов или переназначение должностей.<br>\
	Продемонстрируйте истинную лояльность и не подведите своего начальника."

	outfit_type = /decl/hierarchy/outfit/job/hop

	perks = list(PERK_SOMELLIER)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_VIG = 35,
		STAT_TGH = 30,
		STAT_ROB = 25,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_COG = 25,
		STAT_VIV = 2,
		STAT_ANA = 2
	)

/obj/landmark/join/start/pg
	name = "Steward"
	icon_state = "player-gold"
	join_tag = /datum/job/pg
