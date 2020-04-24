var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/premier
	title = "Premier"
	flag = PREMIER
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart and wisdom"
	difficulty = "Very Hard."
	selection_color = "#ccccff"
	req_admin_notify = 1
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The colony account is his, and he's free to draw as much salary as he likes

	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 20)

	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/captain

	description = "Вы главный управляющий колонией, на ваши плечи выпадает очень тяжелая duties.<br>\
	Вы имеете полное управление на колонии, вы можете изменять доступ другого экипажа, вы можете управлять банковскими счетами.<br>\
	Ваша главная задача следить за работой колонии и сделать все, чтобы она функционировала.<br>\
	Следуйте закону, помогайте экипажу советами, следите за работой и выполняйте приказы Совета.<br>\
	Но помните, что с большой властью приходит огромная ответственность. Если вы будете показывать себя с плохой стороны, экипажу может это не понравится.<br>\
	Относитесь к главам других компаний с уважением и прислушивайтесь к Совету."

	duties = "Ваша duties заключается в том, чтобы следовать интересам Совета.<br>\
	Помните, что интересы Совета находятся на первом месте, а вы - его единственное доверенное лицо.<br>\
	Управляйте колонией с гордо поднятной головой!"

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
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
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"
	difficulty = "Hard."
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	ideal_character_age = 35
	minimum_character_age = 25

	description = "Вы правая рука Премьер-Министра. Вы целиком и полностью ему лояльны и фактически - являетесь его личной охраной.<br>\
	Ваша задача любой ценой защитить Премьера. Вы не должны бояться умереть за него, ведь это одна из ваших задач. <br>\
	В любом случае, Вы так же являетесь и его советником. Осторожно сообщите ему об ошибках. Убедитесь, что он следует закону и все ещё получает поддержку народа.<br>\
	Вы так же выполняете любой его приказ, не смотря на его сложность или абсурдность.<br>\
	Не позорьте его и не портите его отношения с другими фракциями. Чаще следите за своими словами."

	duties = "Вы в праве отыгрывать как настоящего охранника Премьер-Министра, так и его советника.<br>\
	Выполняй задания данные тебе министром, такие как заполнение документов или переназначение должностей.<br>\
	Продемонстрируй истинную преданность и не подведи своего начальника."

	outfit_type = /decl/hierarchy/outfit/job/hop

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
		STAT_COG = 25
	)

/obj/landmark/join/start/pg
	name = "Steward"
	icon_state = "player-gold"
	join_tag = /datum/job/pg
