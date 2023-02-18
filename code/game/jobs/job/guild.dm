//Cargo
/datum/job/merchant
	title = "Chief Executive Officer"
	flag = MERCHANT
	department = DEPARTMENT_LSS
	head_position = TRUE
	aster_guild_member = TRUE
	department_flag = LSS | COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#b3a68c"
	wage = WAGE_COMMAND	//CEO now gets paid the money moola muh [redacted] -Kaz
	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_merchant, access_mining,
		access_heads, access_mining_station, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_eva, access_external_airlocks, access_hydroponics, access_bar, access_kitchen, access_theatre
	)
	disallow_species = list(FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)

	ideal_character_age = 40
	minimum_character_age = 25
	playtimerequired = 1200
	health_modifier = 5

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_COG = 20,
		STAT_MEC = 15,
		STAT_VIG = 10
	)
	description = "Chief Executive Officer координирует дела местного филиала Lone star Shipping Solutions.<br>\
	Ваша главная цель, прямо скажем, состоит в том, чтобы заработать как можно больше денег. Скупайте и заказывайте товары, а затем продавайте их с прибылью.<br>\
	Ваши грузчики будут выполнять большую часть грубой работы, а ваши шахтеры будут добывать полезные ископаемые. Они способные ребята почти всегда - используйте их с умом.<br>\
	Поставщики, найденные по всей колонии, также управляются вашей организацией. Они приносят вам деньги - убедитесь, что они функциональны и хорошо снабжены.<br>\
	Существует рынок контрабанды и более недобросовестных услуг. Исследование этой области может оказаться прибыльным, но сопряжено с риском.<br>\
	Вы не получаете зарплату, но можете пополнять ее самостоятельно со счета компании. Найдите баланс между собственными потребностями и потребностями компании в целом."

	duties = "Обеспечьте экипаж всем, что им может понадобиться, - для получения солидной прибыли.<br>\
	Скупайте ценные предметы у мусорщиков и получайте прибыль, перепродавая их.<br>\
	Направьте своих шахтеров для сбора материала.<br>\
	Консультируйте совет по направлению колонии к прибыльным перспективам."

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/trade,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	outfit_type = /decl/hierarchy/outfit/job/cargo/merchant

	perks = list(/datum/perk/timeismoney, /datum/perk/market_prof, /datum/perk/bartender, /datum/perk/chem_contraband)

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
	alt_titles = list("Cargo Specialist", "Lonestar Sales Technician", "Lonestar Retail Assistant")
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_DUMB
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

	disallow_species = list(FORM_BSSYNTH)


	access = list(
		access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	perks = list(/datum/perk/market_prof)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)


	description = "Грузчик составляет основу Lone star Shipping Solutions, в равной степени занимаясь уборкой мусора, перетаскиванием штук и продажей.<br>\
	Ваша главная обязанность - поддерживать местный филиал компании в рабочем состоянии и приносить прибыль. Доставляйте товары, принимайте платежи и заказы, а также покупайте товар у мусорщиков.<br>\
	В более спокойные времена проявляйте свою инициативу. Посетите отделы, чтобы спросить, есть ли что-нибудь, что им нужно, и попробуйте продать им необычные товары.<br>\
	Сломанные фары? Сломанные торговые автоматы? Предложите свои услуги за небольшую плату. Вы также можете поискать прибыль в туннелях технического обслуживания.<br>\
	Однако избегайте более глубоких туннелей - эта область опасна и предназначена для обученых специалистов по горному делу."

	duties = "Сотрудники стойки регистрации должны быть готовы обрабатывать платежи и заказы.<br>\
	Своевременно доставляйте товары отделам и частным лицам.<br>\
	Всегда ищите другие формы получения прибыли, но делайте это, сохраняя компанию в хорошем свете."

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
	alt_titles = list("Lonestar Drill Technician", "Junior Lonestar Miner")
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_HAZARD //The miners union is stubborn
	health_modifier = 5

	disallow_species = list(FORM_BSSYNTH, FORM_CHURCHSYNTH)
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

	description = "Шахтер - профессиональный поставщик ресурсов, приобретающий ценные минералы для личных нужд Lonestar или продажи их.<br>\
	Ваша главная обязанность - спуститься в глубокие туннели и выкопать как можно больше руды.<br>\
	В зону, куда можно подняться на лифте, входит аванпост со всеми удобствами для переработки указанной руды и доставки очищенных материалов, готовых к использованию.<br>\
	Все, что вы откопаете, попадет в карго, и с этого момента ответственность за его продажу лежит на других сотрудниках LoneStar.<br>\
	Глубокие туннели гораздо менее опасны, чем фауна обитающая в них, так что бесследная пропажа шахтеров не редкость."

	duties = "Выкапывать руды и минералы для переработки в полезный материал.<br>\
	Найдите в туннелях другие ценности, которые могут быть использованы для получения прибыли."

	access = list(
		access_maint_tunnels, access_mailsorting, access_mining,
		access_mining_station
	)

	perks = list(/datum/perk/market_prof)

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
