/datum/job/smc
	title = "Militia Commander"
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
	also_known_languages = list(LANGUAGE_CYRILLIC = 60, LANGUAGE_SERBIAN = 60)
	ideal_character_age = 40
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/security/smc

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector, access_medical, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 30,
		STAT_VIG = 40,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "Вы - коммандир ЧВК Черный Щит. Вы командуете своими бойцами и следите за безопасностью на колонии.<br>\
	Ваша компания была нанята, чтобы защищать экипаж от любых проблем. Помните, вы не служба безопасности.<br>\
	Ваша цель - обеспечить максимальную безопасность всех проживающих в колонии и устранить любые угрозы безопасности<br>\
	Вы и ваша компания фактически является спецназом, который в свободное время помогает dutiesть офицерам."

	duties = "Координируйте бойцов на поле боя и следите за безопасностью на судне.<br>\
		dutiesйте с Уорент-офицером в свободное от работы время. Кооперируйтесь с ним, чтобы добиться успеха.<br>\
		Планируйте атаки на укоренившиеся угрозы, убедитесь, что каждый оперативник знает свои роли и выполняет их точно. <br>\
		Наблюдайте за действиями оперативников под вашим командованием и наказывайте тех, кто не подчиняется или некомпетентен. <br>\
		Служите совету и всегда советуйтесь с ним, когда собираетесь сделать какое-либо решение."

/obj/landmark/join/start/smc
	name = "Militia Commander"
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
	also_known_languages = list(LANGUAGE_CYRILLIC = 60, LANGUAGE_SERBIAN = 60)
	ideal_character_age = 40
	minimum_character_age = 30

	outfit_type = /decl/hierarchy/outfit/job/security/swo

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_research_equipment, access_prospector, access_tcomsat, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 40,
		STAT_VIG = 30,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "Вы - Уорент-офицер, вы служите закону и ваша задача сделать так, чтобы колонисты этот закон соблюдали.<br>\
	Вы как и ЧВК Черный Щит были наняты, чтобы защищать колонию от любых угроз.<br>\
	Но в отличие от Черного Щита, вы впервую очередь следите за исполнением закона на колонии.<br>\
	Коммандер Черного Щита - ваш главный союзник. Кооперируйтесь с ним, чтобы устранять особо опасных преступников."

	duties = "Координируйте офицеров безопасности, помогайте им с поимкой преступников.<br>\
		dutiesйте вместе с коммандиром Черного щита, чтобы добиться максимального успеха.<br>\
		Следите за порядком на судне и убедитесь, что все ваши офицеры знают свое дело."

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
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)
	minimum_character_age = 25

	outfit_type = /decl/hierarchy/outfit/job/security/gunserg

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "Специалист по снабжению является вторым командиром маршалов и управляющим оружейной и оружейной мастерской.<br>\
	Ваша роль - в основном сидение в арсенале - с обязанностями, которые редко выводят вас за пределы колонии или даже арсенала.<br>\
	Вас часто будут призывать продавать оружие и вооружение колонистам, поддерживать запас оборудования и отслеживать, наличие оружия у экипажа.<br>\
	Вас также часто просят наблюдать или обслуживать заключенных. Регулярно проверяйте всех, кто содержится в бриге - побеги недопустимы.<br>\
	В более спокойные времена вы служите инструктором по оружию на месте. Возьмите на себя инициативу, чтобы предложить различные учебные тренировки, особенно для младших оперативников.<br>\
	Помните, вы не имеете право продавать оружие членам экипажа, у которых нет на него полученного разрешения у Премьера."


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
	supervisors = "the Militia Commander"
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)
	minimum_character_age = 25

	outfit_type = /decl/hierarchy/outfit/job/security/serg

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_research_equipment, access_prospector, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "The Sergeant is the second-in-command of the Blackshield and the defacto commanding officer if the militia commander isn't around or injured. <br>\
	Your role is mainly keeping order among the militia troopers and corpsman and ensuring they do not act like a pack of thugs.<br>\
	You will often be maintaining discipline and order within the ranks and fulfilling orders from the militia commander.<br>\
	You will also the secondary squad leader during conflicts, often times leading troopers independent of the militia commander, but usually under his explicit orders.<br>\
	In quieter times, you serve as a form of military police and drill instructor. Take the initiative to offer a variety of training drills, especially to junior operatives and report behavior that should have a member of security removed from their post.<br>\
	Remember that any Militia Commander duties may be delegated to you if they wish, and will automatically be given if they are not present."

	duties = "Manage good ethics among security, including the militia and marshals with a record of everything responsibly and recorded.<br>\
	Give training and instruction to troopers. Run drills and ensure they are prepared for firing lines, kill zones, and breach tactics.<br>\
	Follow the orders of the Militia Commander and in his absence keep security in line."

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
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 50, LANGUAGE_SERBIAN = 50)

	outfit_type = /decl/hierarchy/outfit/job/security/inspector

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_prospector, access_brig, access_kitchen
	)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 25,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/audio,
							 /datum/computer_file/program/camera_monitor)

	description = "Вы - настоящий детектив на колонии. Расследуйте преступления, выкуривайте ваши легкие, и страдайте от клинической депрессии. <br>\
	Не смотря на то, что вы детектив, вы выше по званию, чем офицеры. Но это не дает вам права выполнять их работу. <br>\
	Вы также не имеете права раздавать им приказы, а ваш начальник имеет право уволить вас за конфликты с ними..<br>\
	Ваша основаная задача - это расследование преступлений, но никак не поимка преступников. Помните об этом."

	duties = "Допрашивать подозреваемых. Записывать все детали дела.<br>\
		Сохранять каждую улику и прикладывать её к делу.<br>\
		dutiesть сообща с офицерами, помогая им расследовать преступления."

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
	supervisors = "the Militia Commander"
	difficulty = "Hard."
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 5)

	outfit_type = /decl/hierarchy/outfit/job/security/medspec

	access = list(
		access_security, access_sec_doors, access_medspec, access_morgue, access_maint_tunnels,
		access_medical_equip, access_eva, access_brig, access_external_airlocks, access_surgery
	)

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_TGH = 10,
		STAT_VIG = 15,
		STAT_ROB = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "Вы высоко натренированный мед-специалист. Вы являетесь частью Черного Щита и служите Коммандеру.<br>\
	В первую очередь - вы полевой медик. Ваша основная задача лечить бойцов на поле боя, но вы так же можете и держать оружие в руках.<br>\
	Ваша вторая задача - это лечить заключенных в бриге. Если они попытаются сбежать и получат ранения - вы должны будете их вылечить.<br>\
	Помните, что вы в первую очередь полевой медик, а во вторую боец."

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
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Militia Commander"
	difficulty = "Hard."
	//alt_titles = list("Blackshield Junior Trooper")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/security/troop

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

	description = "Труперы формируют всю мощь Черного Щита на фронту. Вы невероятно опытный солдат, с отличными навыками ведения боя.<br>\
	Вы являетесь солдатом Черного Щита и основная ваша задача - выполнять приказы вышестоящего офицера. Вы не имеете никакого отношения к Маршалам.<br>\
	В свободное время от работы, вы можете патрулировать колонию и изредка оказывать помощь Маршалам, если те попросят.<br>\
	Внимательно следите за центральными воротами и за периметром вокруг колонии."

	duties = "Патрулируйте колонию и следите за безопасностью колонии.<br>\
		Уничтожайте любых пиратов, монстров, пауков и прочих опасных существ, которые могут проникнуть на колонию<br>\
		Исполняйте приказы командования и следуйте закону, вы не выше его."

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
	//alt_titles = list("Marshal Junior Operative")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/security/ihoper

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting,access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_prospector, access_kitchen
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 20,
	)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "Маршал Офицер следит за порядком на колонии и представляет из себя обычного офицера службы безопасности.<br>\
	Вы должны решать любые проблемы, стычки и драки экипажа колонии. Используйте свои знания закона, чтобы решать любые конфликты.<br>\
	Вы обязаны держать свое оружие в кобуре в мирное время и выполнять любые приказы выше стоящих офицеров, в том числе офицеров Черного Щита.<br>\
	Если вам надоело патрулировать колонию - вы можете сесть в блокпост на центральных воротах и контролировать любых выходящих. Но не забывайте во время реагировать на вызовы."

/obj/landmark/join/start/officer
	name = "Marshal Officer"
	icon_state = "player-blue"
	join_tag = /datum/job/officer

