/datum/job/clubmanager
	title = "Bartender"
	flag = CLUBMANAGER
	department = DEPARTMENT_LSS
	department_flag = LSS
	faction = MAP_FACTION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
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

	perks = list(/datum/perk/market_prof, /datum/perk/bartender)

	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "Бармен управляет баром колонии, предлагая колонистам напитки и развлечения.<br>\
	Работая с шеф-поваром и садовником, вы принимаете важные решения. Ведите свой бизнес хорошо -  стремитесь максимизировать прибыль.<br>\
	Хотя чаевые являются хорошим источником дохода, ваша деловая хватка в сфере разлива пьянящих зелий будет определять ваше процветание здесь."

	duties = "Управляя баром - создайте для колонистов комфортные условия для отдыха, перекуса или запоя.br>\
		Ваши руки развязаны - заключайте тайные сделки, продавайте алкоголь по завышенной цене или же гоните фирменный самого<br>\
		Также можете взять на себя ответственность за массовое пищевое отравление или всеобщий голод если шеф отсутствует."

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
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Executive Officer"
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

	perks = list(/datum/perk/market_prof, /datum/perk/bartender, /datum/perk/foodappraise)

	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "Шеф-повар работает на кухне, следя за тем, чтобы колония оставалась сытой и энергичной.<br>\
	Как правило, вы будете тесно сотрудничать с барменом во время приготовления пищи, уборки, сервировки и, возможно, развлечений.<br>\
	Вам платят в основном за выполнение запросов на еду. Успешный шеф-повар проявляет инициативу, запрашивая заказы у клиентов."

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
	supervisors = "the Chief Executive Officer"
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

	perks = list(/datum/perk/market_prof, /datum/perk/greenthumb, /datum/perk/bartender)

	description = "Садовник занимается гидропоникой - использует семена, инструменты и удобрения для выращивания обильных урожаев.<br>\
	Более талантливые садоводы могут заняться скотоводством. В ваших загонах содержится несколько кур и корова. Более экзотические животные могут быть приобретены в качестве импортного груза.<br>\
	Вы являетесь опытным специалистом по уничтожению флоры - используйте лопаты и топоры или ищите более современное оборудование, такое как огнеметы и бензопилы. Устройте резню в среде хлорофила.<br>\
	Помните, что ваши товары имеют свою цену, и более экзотические культуры могут стоить дороже."

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
	supervisors = "the Chief Executive Officer"
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


	perks = list(/datum/perk/market_prof, PERK_ARTIST, /datum/perk/stalker)
	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	description = "артист выступает здесь в качестве универсального исполнителя, развлекающего колонию.<br>\
	Вы можете обнаружить, что ваши коллеги отвлекаются на скучные обязанности или бессмысленные препирательства, поэтому усердно работайте, чтобы привить им настоящую культуру.<br>\
	Генеральный директор платит вам ужасно низкую плату, так что используйте свой ум, чтобы обеспечить себя - возможно, попросите свою аудиторию о пожертвованиях.r>\
	Кроме того, вы не получаете желаний, как другие члены колонии, вместо этого вы проводите свое время за своим рабочим столом, создавая дорогие произведения искусства, которые стоит продать."

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
	supervisors = "the Chief Executive Officer"
	difficulty = "Easy."
	selection_color = "#dddddd"
	alt_titles = list("Custodian","Sanitation Technician")
	access = list(access_janitor, access_maint_tunnels, access_morgue, access_hydroponics, access_bar, access_kitchen)
	wage = WAGE_PROFESSIONAL
	health_modifier = 5
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	perks = list(/datum/perk/market_prof, /datum/perk/job/jingle_jangle, /datum/perk/neat) //Union has revoked their chemistry privileges

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)
	description = "Скромный Уборщик, которому хорошо платят, но редко уважают, тем не менее оказывает ценную услугу.<br>\
	Вы будете передвигаться по колонии, вооружившись своей верной тележкой, полной чистящих средств, избавляясь от мусора и вредителей.<br>\
	В ваши обязанности также входит незначительное техническое обслуживание. Почините светильники, исправьте сломанные торговые автоматы, замените напольную плитку - облегчите бремя гильдии.<br>\
	Несмотря на то, что ваш статус плачевен, ваши знания в области технического обслуживания могут привести вас к некоторому ценному спасению вашего авторитета."

	duties = "Уберайте кровь, грязь, щебень и беспорядок. Не убирайте места преступлений!<br>\
		Проводите мелкий ремонт и техническое обслуживание, когда адепты гильдии заняты.<br>\
		Пополните запасы газет как минимум на 15 печатных изданий.<br>\
		Расставляйте ловушки в норах и делайте все возможное, чтобы справиться с проблемой тараканов и пауков."

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-black"
	join_tag = /datum/job/janitor
