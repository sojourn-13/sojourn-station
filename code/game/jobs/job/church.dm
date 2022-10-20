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
	ideal_character_age = 40
	minimum_character_age = 30
	playtimerequired = 1200
	also_known_languages = list(LANGUAGE_LATIN = 100)
	security_clearance = CLEARANCE_CLERGY
	health_modifier = 10
	access = list(
		access_nt_preacher, access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors
	)
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_NASHEF)


	wage = WAGE_COMMAND //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/chaplain

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_BIO = 15,
		STAT_COG = 10,
		STAT_VIG = 15,
		STAT_TGH = 10,
	)

	perks = list(/datum/perk/neat, /datum/perk/greenthumb, /datum/perk/channeling
		//, /datum/perk/chemist -Thanos Voice: "A small price to pay for salvation."
	)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "Прайм является главой местного отделения Церкви Абсолюта. <br>\
	Вы представляете интересы церкви и ее последователей в колонии - выявить их можно по крестообразному имплантату на их груди.<br>\
	Ваша самая насущная обязанность - как духовного лидера. Проповедуйте пастве, вселяйте веру и силу и обращайте тех, кто ищет спасения.<br>\
	Хотя вы не являетесь квалифицированным психологом, вы можете оказывать поддержку и направлять всех - как в светлые, так и в темные времена.<br>\
	Дополнительная обязанность может потребовать проведения похорон по-настоящему потерянных или проведения поминок и групповых молитв.<br>\
	Протокол Crusader также может быть введен в действие под вашим командованием, когда вы сталкиваетесь с угрозой Разума Улья. Используйте этот импульс от протокола и свою ритуальную книгу, чтобы победить зло."

	duties = "Представлять интересы учеников церкви в колонии. Защищайте их от преследований и говорите за них.<br>\
	Проводите мессы, произносите проповеди, проповедуйте верующим и проводите групповые ритуальные сеансы.<br>\
	Устраивайте похороны для тех, кого невозможно спасти."


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
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_nt_disciple)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/acolyte
	also_known_languages = list(LANGUAGE_LATIN = 100)
	security_clearance = CLEARANCE_COMMON
	alt_titles = list("Divisor","Factorial","Monomial","Lemniscate","Tessellate")
	health_modifier = 5
	stat_modifiers = list(
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)
	disallow_species = list(FORM_FBP, FORM_UNBRANDED, FORM_SOTSYNTH, FORM_AGSYNTH, FORM_BSSYNTH, FORM_NASHEF)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	perks = list(/datum/perk/neat, /datum/perk/greenthumb, /datum/perk/channeling)

	description = "Вектор служит Прайму и, в более широком смысле, церкви как последователь Веры.<br>\
	Священные обязанности по эксплуатации биореактора и управлению биомассой для церковных машин являются вашим главным приоритетом.<br>\
	Вы также должны работать над тем, чтобы представить Веру в позитивном свете всем колонистам. Должность Вектора может возложить на вас дополнительные обязанности во время смены."

	duties = "Обслуживайте биореактор и управляйте биомассой для церковных машин.<br>\
	Обслуживайте территории, принадлежащие церкви, поддерживая помещения в рабочем состоянии и в надлежащем порядке.<br>\
	Предлагайте помощь как верующим, так и неверующим."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Vector"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte
