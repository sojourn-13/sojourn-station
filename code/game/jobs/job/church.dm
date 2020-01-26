/datum/job/chaplain
	title = "Prime"
	flag = CHAPLAIN
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Nadezhda Council"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)
	ideal_character_age = 40
	minimum_character_age = 30

	access = list(
		access_morgue, access_chapel_office, access_crematorium, access_hydroponics, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors
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

	description = "You are the head of a local branch of the Church of the Absolute. You represent the church's interests on the colony, as well as the interests of the disciples among the crew, who can be identified by the cruciform implant upon their breast.<br>\
	<br>\
	Your duties aboard the colony may not seem so important compared to others, but they have greater significance in the galaxy as a whole. As well as a more immediate significance to the morale of the crew, especially the followers of the Absolute.<br>\
	<br>\
	Sometimes the church will deploy Crusader protocol if the threat of a hivemind appears. When the threat becomes severe enough, you will any member of the church may have their protocol activate. Crusaders are members of the church who are tasked with defending the colony only from the hivemind and are given temporary boosts to do so. <br>\
	<br>\
	First and foremost, you are a man of the cloth and as such you must tend to the spiritual needs of the crew. Those looking to convert should come to you for the rites and the cruciform.<br>\
	When the mood is dour, when all hope is lost, it falls to you to be a spiritual leader. Preach to the flock, inspire faith and strength in their hearts. The rituals in your book can also offer more tangible assistance in labour and combat.<br>\
	Even when times are bright, do your best to keep it that way. Tour the colony, offering support to those in need. A prayer in the right ear, a helping hand, or a shoulder to cry on can do wonders.<br>\
	<br>\
	<br>\
	For those who cannot be brought back by medical, the next best thing you can offer is a dignified funeral. The chapel area contains coffins and machinery to commit the dead to the earth."

	duties = "Represent the interests of church disciples on the colony. Protect them from persecution and speak for them.<br>\
		Hold mass, give sermons, preach to the faithful, and lead group ritual sessions.<br>\
		Recover and clone the faithful dead.<br>\
		Hold funerals for the dead."

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
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics)
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

	description = "You serve the church and the Prime as a disciple of the Faith.<br>\
	<br>\
	The sacred duties of operating the bioreactor and managing biomass for the church's machines.<br>\
	<br>\
	Though more may be required of you, should your Prime so chose."

	duties = "Operate the bioreactor and manage biomass for the churches machines.<br>\
		Maintain the Church area, keeping the facilities functional and in good order.<br>\
		Offer assistance to the faithful and non-faithful alike."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Vector"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte
