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

	description = "The Prime serves as the head of the local branch of the Church of the Absolute. <br>\
	You represent the interest of the church and its disciples within the colony - identified by the cruciform implant upon their breast.<br>\
	Your most pressing duty is as a spiritual leader. Preach to the flock, inspire faith and strength, and convert those seeking salvation.<br>\
	While you are no trained psychologist, you can provide support and guidance to all - in both bright and dark times.<br>\
	More practically, you can use your cloner to revive those who cannot be saved by medical science, and hold funerals for the truly lost.<br>\
	The Crusader protocol may also be enacted under your command when facing a Hivemind threat. Use this boost, and your ritual book, to defeat evil."

	duties = "Represent the interests of church disciples on the colony. Protect them from persecution and speak for them.<br>\
		Hold mass, give sermons, preach to the faithful, and lead group ritual sessions.<br>\
		Recover and clone the faithful dead. Hold funerals for those who cannot be saved."

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

	description = "The Vector serves the Prime, and more generally the church, as a disciple of the Faith.<br>\
	The sacred duties of operating the bioreactor and managing biomass for the church machines are your main priority.<br>\
	You should also work to present the Faith in a positive light to all colonists. The Vector may issue you with further duties."

	duties = "Operate the bioreactor and manage biomass for the church machines.<br>\
		Maintain areas owned by the church, keeping the facilities functional and in good order.<br>\
		Offer assistance to the faithful and non-faithful alike."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Vector"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte
