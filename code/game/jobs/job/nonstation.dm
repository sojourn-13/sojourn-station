/datum/job/aborigine
	title = "Aborigine"
	latejoin_only = FALSE
	total_positions = 5
	faction = MAP_FACTION
	department = "Aborigines"
	supervisors = "nobody! Enjoy your time off"
	selection_color = "#9b633e"
//	minimal_access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/aborigine

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

	description = "Вы абориген и ваша единственная задача - выжить на планете. Данная профессия не лицензия на гриф, вы не умеете использовать оружие, но если на вас нападают - можете убивать.<br>\
	Вы когда-то были одним из членов колонии, но вас изгнали, оставив вам вашу карту без доступа в качестве метки. Как вам сказали, если вы подойдете в колонию, вас немедленно расстреляют. Будьте осторожны."

/obj/landmark/join/start/aborigine
	name = "Aborigine"
	icon_state = "player-grey"
	join_tag = /datum/job/aborigine
