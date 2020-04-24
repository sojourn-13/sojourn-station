/datum/job/assistant
	title = "Colonist"
	flag = ASSISTANT
	department = DEPARTMENT_CIVILIAN
	department_flag = CIVILIAN
	faction = MAP_FACTION
	total_positions = -1
	spawn_positions = -1
	supervisors = "anyone who pays you"
	difficulty = "Very Easy."
	selection_color = "#dddddd"
	initial_balance	= 800
	wage = WAGE_NONE //Get a job ya lazy bum
	//alt_titles = list("Visitor", "Refugee","Guild Novice","Soteria Intern","Lonestar Intern")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5)

	access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "Идеальная роль для новичков. Вы не имеете официальной работы на колонии. У вас нет никаких задач, но вы и не получаете зарплату.<br>\
Откуда вы? Почему вы здесь? Ответьте себе на эти вопросы и придумайте интересную историю.<br>\
<br>\
Возможно, вы просто оплатили билет на колонию. Что вы тут ищите или от чего вы убегаете?<br>\
Возможно, вы молодой ученик или стажер. Какую карьеру вы хотите построить?<br>\
Возможно вы друг одного из рабочих и пришли ему помочь по работе? <br>\
<br>\
Вы вправе отыгрывать своего персонажа как вам пожелается. Вы сами пишите свою историю.<br>\
Попытайтесь получить работу на колонии, найдите себе новых друзей... Или просто получайте удовольствие от безделия!"

/obj/landmark/join/start/assistant
	name = "Colonist"
	icon_state = "player-grey"
	join_tag = /datum/job/assistant
