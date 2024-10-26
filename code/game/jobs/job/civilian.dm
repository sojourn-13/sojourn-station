/datum/job/clubmanager
	title = "Bartender"
	flag = CLUBMANAGER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	alt_titles = list("Barkeep","Barista","Mixologist")
	selection_color = "#dddddd"
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_LABOUR_DUMB // Makes his own money via tips and selling drinks
	health_modifier = -10
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/bartender)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "Бармен управляет баром колонии, предлагая колонистам напитки и развлечения.<br>\
	Работая с шеф-поваром и садовником, вы принимаете важные решения. Ведите свой бизнес хорошо -  стремитесь максимизировать прибыль.<br>\
	Хотя чаевые являются хорошим источником дохода, ваша деловая хватка в сфере разлива пьянящих зелий будет определять ваше процветание здесь."

	duties = "Run the bar - provide a safe haven for food, drinks and entertainment.<br>\
		Seek extra sources of income for the venue - perhaps run deals or trade secrets.<br>\
		Potentially take over cooking duties if a Chef is not present."

/obj/landmark/join/start/clubmanager
	name = "Bartender"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Chef"
	flag = CLUBWORKER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	alt_titles = list("Culinary Artist","Cook", "Line Chef")
	selection_color = "#dddddd"
	health_modifier = -10
	access = list(access_hydroponics, access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_LABOUR_DUMB //They should get paid by making food.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 10, // They need it to butcher animals without hurting themselves.
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/bartender, /datum/perk/foodappraise)

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "The Chef works in the kitchen, ensuring that the colony remains well-fed and energetic.<br>\
	You will typically work closely with a Bartender while cooking, cleaning, serving and perhaps entertaining.<br>\
	You are paid mainly through fulfilling requests for food. The successful Chef takes initiative by asking for customer orders."

	duties = "Pобеспечьте достаточное количество еды, чтобы накормить колонию. Стремитесь к разнообразию интересных и вкусных блюд.<br>\
		Убедитесь, что ваши клиенты хорошо накормлены и им понравилась еда.<br>\
		Потенциально возьмите на себя ответственность за то что колонисты спились в отсутствие Бармена."


/obj/landmark/join/start/clubworker
	name = "Chef"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/hydro
	title = "Gardener"
	flag = BOTANIST
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Hydroponicist")
	health_modifier = -10
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	access = list(access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_LABOUR_DUMB //The gardener can make money selling his fruits to the church or to the chef and bartender.

	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	perks = list(PERK_MARKET_PROF, /datum/perk/greenthumb, /datum/perk/bartender)

	description = "The Gardener toils in hydroponics - utilising seeds, tools and fertilisers to grow bountiful crops.<br>\
	More talented gardeners may dip into ranching. Your paddocks contain a few chickens and a cow. More exotic animals can be acquired as cargo imports.<br>\
	You are the go-to expert for flora destruction - use shovels and hatchets, or seek more advanced equipment like flamethrowers and chainsaws.<br>\
	Remember that your goods come with a cost and more exotic crops can command a higher price."

	duties = "Выращивайте пищу. Обеспечьте хороший запас сырых овощей и основных злаков - риса и пшеницы.<br>\
		Разводите животных для получения яиц, мяса и эмоциональной разгрузки (другие расы не являются животными).<br>\
		Поддерживайте растения в горшках вокруг колонии.<br>\
		Управляйте агрессивной флорой вокруг колонии и контролируйте грибковые заражения."

/obj/landmark/join/start/hydro
	name = "Gardener"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/artist
	title = "Artist"
	flag = ARTIST
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	access = list(access_theatre)
	outfit_type = /decl/hierarchy/outfit/job/cargo/artist
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	alt_titles = list("Artist","Clown","Entertainer","Mime")
	stat_modifiers = list(
		STAT_TGH = 20, //basically a punching bag, he can't robust anyone or shoot guns anyway
		STAT_MEC = 10  //They often deal with tool mods guns and other things that need these
	)

	//You need insperation to do your job.
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_CHURCHSYNTH, FORM_NASHEF)


	perks = list(PERK_MARKET_PROF, PERK_ARTIST, /datum/perk/stalker)
	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	description = "The Artist serves as a versatile performance artist here to entertain the colony.<br>\
	You may find your colleagues distracted by boring duties or senseless bickering, so work hard to bring them some real culture.<br>\
	The SOM pays you a terrible retaining fee, so use your wits to sustain yourself - perhaps ask your audience for donations.<br>\
	In addition you do not gain desires like other members of the colony, instead you spend your insight at your workbench to create expensive works of art worth selling."

	duties = "Обеспечьте (Безопасное для семейного просмотра) развлечение для экипажа с помощью ваших разнообразных талантов.<br>\
		Создавайте и продавайте ценные произведения искусства в своей мастерской художника.<br>\
		Постарайтесь быть успешным, а не голодающим художником. Продавец костюмов и оборудование в вашей тесной студии могут оказаться полезными."

/obj/landmark/join/start/artist
	name = "Artist"
	icon_state = "player-grey"
	join_tag = /datum/job/artist

/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Surface Operations Manager"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Custodian","Sanitation Technician")
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	perks = list(PERK_MARKET_PROF, /datum/perk/job/jingle_jangle, /datum/perk/neat) //Union has revoked their chemistry privileges

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
		STAT_VIG = 20,
		STAT_TGH = 20,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)
	description = "Скромный Уборщик, которому хорошо платят, но редко уважают, тем не менее оказывает ценную услугу.<br>\
	Вы будете передвигаться по колонии, вооружившись своей верной тележкой, полной чистящих средств, избавляясь от мусора и вредителей.<br>\
	В ваши обязанности также входит незначительное техническое обслуживание. Почините светильники, исправьте сломанные торговые автоматы, замените напольную плитку - облегчите бремя гильдии.<br>\
	Несмотря на то, что ваш статус плачевен, ваши знания в области технического обслуживания могут привести вас к некоторому ценному спасению вашего авторитета."

	duties = "Clean blood, dirt, rubble and messes. Don't clean up crime scenes!<br>\
		Conduct minor repairs and maintenance when guild adepts aren't available.<br>\
		Restock Newscasters to at least 15 prints.<br>\
		Deploy traps on burrows and do your best to handle the ongoing roach and spider problem."

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor
