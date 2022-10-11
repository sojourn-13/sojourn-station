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
	initial_balance = 800
	wage = WAGE_NONE //Get a job ya lazy bum
	//alt_titles = list("Visitor", "Refugee","Guild Novice","Soteria Intern","Lonestar Intern")

	outfit_type = /decl/hierarchy/outfit/job/assistant

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "Вы идеальный кандидат для новоприбывших. Вы не имеете официальной занятости в колонии, или находитесь в отпуске.<br>\
Откуда вы пришли? Почему вы тут? Это вам решать.<br>\
<br>\
Возможно вы новоприбывший, что заплатил за транзит. Что вы ищите, или от чего спасаетесь бегством?<br>\
Возможно вы молодой подмастерье, или интерн? Какую же новую и захватывающую карьеру вы преследуете?<br>\
Возможно вы друг, родственник, вторая половинка, или любовник уже существующего колониста. Как вы сможете поддержать их?<br>\
Возможно вы бывший заключенный, готовые присоединится к колонии после тюрьмы. Каково было ваше преступление?<br>\
Возможно вы беженец, заблудившийся на диких территориях и спасенный колонией. Почему вы были там?<br>\
Возможно вы известный колонист, взявший себе отпуск и наслаждаясь жизнью на поверхности без нужды работать?<br>\
<br>\
Ваша история - то что вы сами напишете. Но что имеет значение - что вы тут. Найдите себе цель.<br>\
Чтобы наладить связи, стремитесь помочь всем, кому сможете. Или, по крайней мере, тем, кто готовы заплатить.<br>\
Найдите способ заработать деньги, оставаться на плаву, и выжить."

/obj/landmark/join/start/assistant
	name = "Colonist"
	icon_state = "player-grey"
	join_tag = /datum/job/assistant
