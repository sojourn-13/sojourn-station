/datum/job/chaplain
	title = "Prime"
	flag = CHAPLAIN
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH | COMMAND
	faction = MAP_FACTION
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	difficulty = "Medium."
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)
	ideal_character_age = 40
	minimum_character_age = 30

	access = list(
		access_nt_preacher, access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_hydroponics, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors
	)

	wage = WAGE_PROFESSIONAL //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/chaplain

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_BIO = 15,
		STAT_COG = 10,
		STAT_VIG = 15,
		STAT_TGH = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "Вы ялвяетесь главой местого отделения церкви Абсолюта.<br>\
	Вы представляете интересы церкви и ее учеников на колонии. Ваши ученики обозначенны крестообразным имплантатом на их груди.<br>\
	Ваша самая насущная обязанность как духовного лидера - проповедь перед стадом, внушай веру и силу и обращай тех, кто ищет спасения.<br>\
	Хотя вы и не являетесь квалифицированным психологом, вы можете оказывать поддержку всем - как в светлое, так и в темное время<br>\
	На практике вы можете использовать свою веру, чтобы возродить тех, кто не может быть спасен медицинской наукой, и провести похороны по-настоящему потерянных."

	duties = "Представлять интересы учеников церкви на колонии. Защищать их от преследований и говорить за них. <br>\
		Обращайте массы, проповедуйте верующим и проводите групповые ритуалы. <br>\
		Спасайте и клонируйте мертвых. Проводите похороны для тех, кого невозможно спасти."

	setup_restricted = TRUE

/obj/landmark/join/start/chaplain
	name = "Prime"
	icon_state = "player-black"
	join_tag = /datum/job/chaplain

/datum/job/acolyte
	title = "Vector"
	flag = ACOLYTE
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = MAP_FACTION
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Prime"
	difficulty = "Easy to Medium."
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics, access_nt_disciple)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/acolyte

	stat_modifiers = list(
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	description = "Вы самый настоящий аколит, вы прислуживайте главе церкви и служите своей вере.<br>\
	Ваша основная задача - служить церкви и защищать её интересы. Вы выполняете все приказы своего начальника."

	duties = "dutiesйте над биореактором и прислуживайте церкви.<br>\
		Вы обязаны следить за чистотой церкви и своевременно убирать её.<br>\
		Вы так же обязаны выполнять все приказы своего начальника и проповедовать веру всем колонистам.."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Vector"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte
