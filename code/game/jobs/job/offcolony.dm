/datum/job/off_colony_hunt_master
	title = "Lodge Hunt Master"
	total_positions = 1
	spawn_positions = 1
	flag = HUNTMASTER
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	supervisors = "the lodge matriarch"
	difficulty = "Hard."
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/hunt_master
	health_modifier = 15

	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST, PERK_GREENTHUMB)
	access = list(access_huntmaster, access_hunter)

	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_TGH = 20,
		STAT_ROB = 15,
		STAT_VIG = 15,
		STAT_MEC = 5,
		STAT_COG = 0
	)
	playtimerequired = 600
	description = "Вы не являетесь частью колонии – по крайней мере пока.<br>\
	Вместо этого вы решили присоединится к местной фракции охотников.<br>\
	Время покажет на какой срок. Ваша задача как главы общины – вести свои охотников и сделать все возможное для их благополучия.<br>\
	Ваше снаряжение не сравнится с колониальным, но охотничья закалка хорошо подготовила вас к тому, чтобы выживать за счет даров природы."

	duties = "Не допустите гибели ваших охотников от рук и лап местной фауны.<br>\
		Убедитесь, что ваши охотники хорошо снаряжены и способны работать в команде.<br>\
		Поддерживайте хорошие отношения с колонией. Особенно со старателями."
/obj/landmark/join/start/hunt_master
	name = "Lodge Hunt Master"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_hunt_master

/datum/job/off_colony_hunter
	title = "Lodge Hunter"
	total_positions = 4
	spawn_positions = 4
	flag = LODGEHUNTER
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	difficulty = "Hard."
	supervisors = "the hunt master"
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/hunter
	health_modifier = 10

	perks = list(PERK_BUTCHER)
	access = list(access_hunter)

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_TGH = 20,
		STAT_ROB = 10,
		STAT_VIG = 10,
		STAT_MEC = 5,
		STAT_COG = 0
	)

	description = "Вы не являетесь частью колонии – по крайней мере пока. Вместо этого вы решили присоединится к местной фракции охотников.<br>\
	Время покажет на какой срок. Будучи членом охотничьей общины, в ваши обязанности входит как заниматься животноводством, так и охотиться на крупную дичь.<br>\
	Зачастую снаряжение для экспедиций придется создавать своими руками. Настоящие охотники всегда работают сообща под предводительством своего лидера или матриарха.<br>\
	Долгожители общины хорошо знакомы с Кодексом охотничьей чести."

	duties = "Заботьтесь о благополучии вверенных вам животных, и да воздастся вам.<br>\
		Работайте рука об руку с другими охотниками.<br>\
		Сделайте все возможное для благополучия вашей общины."

/obj/landmark/join/start/lodge_hunter
	name = "Lodge Hunter"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_hunter

/datum/job/off_colony_herbalist
	title = "Lodge Herbalist"
	total_positions = 2
	spawn_positions = 2
	flag = LODGEHERBALIST
	faction = MAP_FACTION
	department = DEPARTMENT_LODGE
	department_flag = LODGE
	difficulty = "Hard."
	supervisors = "the hunt master"
	selection_color = "#9b633e"
	account_allowed = 0
	create_record = 1
	wage = WAGE_NONE
	outfit_type = /decl/hierarchy/outfit/job/off_colony/herbalist
	health_modifier = 5

	perks = list(PERK_BUTCHER, PERK_MASTER_HERBALIST, PERK_GREENTHUMB)
	access = list(access_hunter)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_MEC = 10,
		STAT_COG = 10
	)

	description = "You are not part of the colony, at least currently, having decided to take a shift with the local Lodge Hunters either temporarily or permanently. As a Lodge Herbalist \
	your primary work is both as gardener and field medic for the lodge. Expeditions should be prepared for using whatever you can craft and make with your fellow hunters. Good Lodge members \
	work as a team under the direction of the Hunt Master or if present the Lodge Matriarch. While hunters are more combat focused, your purpose as an herbalist is to attend to the medical needs of your lodge, \
	but additional skills as a crafter, gardener and chemist are quite handy!"

	duties = "Выращивайте полезные растения, чтобы затем использовать из для изготовления лекарств.<br>\
		Станьте врачевателем для своей общины, который не позволит смерти забрать ваших товарищей.<br>\
		Сделайте все возможное для благополучия вашей общины."


/obj/landmark/join/start/lodge_herbalist
	name = "Lodge Herbalist"
	icon_state = "player-black"
	join_tag = /datum/job/off_colony_herbalist

/datum/job/outsider
	title = "Outsider"
	total_positions = 10
	spawn_positions = 10
	flag = OUTSIDER
	faction = MAP_FACTION
	department = DEPARTMENT_INDEPENDENT
	department_flag = INDEPENDENT
	supervisors = "nobody! You're an outsider"
	selection_color = "#191919"
	account_allowed = 0
	create_record = 0
	wage = WAGE_NONE
//	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/outsider
	difficulty = "Impossible!"
	has_id = FALSE

	stat_modifiers = list(
		STAT_BIO = 5,
		STAT_TGH = 6,
		STAT_ROB = 6,
		STAT_VIG = 4,
		STAT_MEC = 8,
		STAT_COG = 2
	)

	description = "You're an outsider, disconnected from the lodge and the colony as a whole. Whether you're an exile, stranded pirate, hermit, or just the right man in the wrong place you're \
	entirely alone out here. What friends you can make and rely on should be cherished, for there are other looters and outsiders there who might be less than friendly short of giving out lead \
	and ionized laser shots. You better stake your claim, fortify a safe spot, then venture out for supplies and whatever loot you can use, sell or stockpile. Remember, you are not protected by \
	colony law, few people will care or even raise an eyebrow if you're shot to death for whatever you're carrying."

	duties = "Определитесь, что вам ближе – обустраивать нору или быть кочевником.<br>\
		Заводите себе друзей и избегайте создавать врагов. Никакой существующий закон вас не защитит.<br>\
		Постарайтесь не умереть в одиночестве."

/obj/landmark/join/start/outsider
	name = "Outsider"
	icon_state = "player-black"
	join_tag = /datum/job/outsider
