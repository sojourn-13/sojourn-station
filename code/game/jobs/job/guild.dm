//Cargo
/datum/job/merchant
	title = "Chief Executive Officer"
	flag = MERCHANT
	department = DEPARTMENT_LSS
	head_position = 1
	department_flag = LSS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#b3a68c"
	wage = WAGE_NONE	//Guild merchant draws a salary from the guild account
	also_known_languages = list(LANGUAGE_CYRILLIC = 80, LANGUAGE_SERBIAN = 100, LANGUAGE_JIVE = 80)
	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_merchant, access_mining,
		access_heads, access_mining_station, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_eva, access_external_airlocks
	)
	ideal_character_age = 40
	minimum_character_age = 30

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_COG = 20,
		STAT_MEC = 15,
		STAT_VIG = 10
	)
	description = "Генеральный директор координирует дела местного отделения Lonestar Shipping Solutions.<br>\
Ваша главная задача - заработать как можно больше денег. Покупайте и приобретайте товары и продавайте их с целью получения прибыли.<br>\
Ваши карготехи выполнят большую часть тяжелой работы, а ваши шахтеры добудут минералы. И уж поверьте, применение они им найдут.<br>\
Автоматы с товарами, которые можно найти по всей колонии, также управляются вашей организацией. Они приносят вам деньги - убедитесь, что они правильно функционируют и хорошо укомплектованы.<br>\
Существует рынок контрабанды и более недобросовестных услуг. Работа в этой области может оказаться выгодным, но сопряжён с риском решением.<br>\
Вы не получаете зарплату, но можете пополнить счет со счета компании. Найдите баланс между своми потребностями и потребностянми всего вашего отдела."

	duties = "Обеспечьте экипаж всем, что им может понадобиться - для здоровой прибыли.<br>\
Покупайте ценные вещи у мусорщиков и получайте прибыль, перепродавая их.<br>\
Разверните свой горный персонал для сбора материалов.<br>\
."

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	outfit_type = /decl/hierarchy/outfit/job/cargo/merchant

	perks = list(/datum/perk/timeismoney)

/obj/landmark/join/start/merchant
	name = "Chief Executive Officer"
	icon_state = "player-beige-officer"
	join_tag = /datum/job/merchant

/datum/job/cargo_tech
	title = "Cargo Technician"
	flag = CARGOTECH
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief Executive Officer"
	difficulty = "Easy."
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_DUMB
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)


	description = "Грузовой техник является основой Lonestar Shipping Solutions, это сборщик, грузчик и продавец в одном человеке..<br>\
Ваша главная обязанность - поддерживать работу и прибыльность местного отделения компании. Доставлять товары, принимать платежи и заказы, а также покупать у мусорщиков вещи которые принесут вам прибыль.<br>\
В более спокойные времена используйте свою инициативу. Посетите отделы, чтобы узнать, есть ли что-нибудь, что им нужно, и попытайтесь продать им необычные предметы.<br>\
Сломаннык лампочки? Сломанные раздатчики? Предложите свои услуги за небольшую плату. Вы также можете найти прибыль в техах..<br>\
Однако избегайте более глубоких техов - эта область опасна и предназначена для подготовки горных специалистов."

	duties = "Находитесь в лобби своего отдела и будьте готовы обслужить клиентов.<br>\
	Своевременно доставляйте товары в отделы и частным лицам..<br>\
	Всегда ищите другие формы прибыли, но делайте это, сохраняя компанию с хорошей репутацией."

/obj/landmark/join/start/cargo_tech
	name = "Cargo Technician"
	icon_state = "player-beige"
	join_tag = /datum/job/cargo_tech

/datum/job/mining
	title = "Lonestar Miner"
	flag = MINER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief Executive Officer"
	difficulty = "Easy."
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_HAZARD //The miners union is stubborn
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)

	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

	description = "Шахтер является профессиональным поставщиком ресурсов, добывая ценные минералы для Lonestar Shipping Solutions.<br>\
Ваша главная обязанность - спуститься в глубокие туннели и выкопать как можно больше руды..<br>\
Используя лифт вы можете попасть на свой аванпост, там вы найдете все для обработки ресурсов которые вы добудете.<br>\
Все, что вы раскопаете, пойдет в грузовой отдел, и с тех пор ответственность за его продажу несут другие в Lonestar..<br>\
Глубокие туннели гораздо менее опасны, чем окрестности вокруг колонии."

	duties = "Копайте руды и минералы для переработки в полезные материалы.<br>\
	Найдите другие ценности в туннелях, которые могут быть превращены в прибыль."

	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)


	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_MEC = 15
	)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

/obj/landmark/join/start/mining
	name = "Lonestar Miner"
	icon_state = "player-beige"
	join_tag = /datum/job/mining
