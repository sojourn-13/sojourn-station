var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/premier
	title = "Premier"
	flag = PREMIER
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart and wisdom"
	selection_color = "#ccccff"
	req_admin_notify = 1
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The colony account is his, and he's free to draw as much salary as he likes

	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 20)

	ideal_character_age = 50 // Old geezer captains ftw
	minimum_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/captain

	description = "You are the prime mediator of the colony itself and act as a trusted advisor<br>\
You are trusted with control of the stations primary accounts and are able to control access within the colony.<br>\
Your primary objective is to oversee council decision, change access levels, and act as both lawyer and consultant in various decisions.<br>\

You are not the supreme leader of the colony and your word is only an advisement. The only person who you can give legal orders to is your personal guard.<br>\
The heads of the factions which make up the council each have their own agendas. Their interests must be served too. If you make them unhappy, issues will arise.<br>\
Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs, and they should serve you well.<br>\

You are a free agent, able to go where you will, and loyal to no particular faction other than the colony itself."

	loyalties = "Your first loyalty is to the colony. It is the purpose of your job and you are to fulfill your duties to the best of your ability. Failures of your ability can hurt the colony as a whole. <br>\

Your second loyalty is to your command officers. The heads of each faction. Listen to their counsel, ensure their interests are served, and keep them happy"

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/premier
	name = "Premier"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/premier



/datum/job/pg
	title = "Steward"
	flag = STEWARD
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = MAP_FACTION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the premier"
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	ideal_character_age = 35
	minimum_character_age = 30

	description = "You are the premier's right hand. His personal guard. Where he goes, you follow. You make sure he remains safe, follow his orders, and if needed put yourself in the line of fire for him.<br>\
If he makes mistakes, discreetly inform him. Help to ensure he follows the law and smooth relations with the crew, especially other command staff. Keep the premier safe, by endangering yourself in his stead if necessary.<br>\
<br>\
Do not embarass him or harm relations with faction leaders.<br>\
<br>\
But who are you?<br>\
Perhaps you are the premier's lifelong friend, or a trusted associate to whom he gave a position of power.<br>\
Perhaps you're a consummate professional who comes highly recommended.<br>\
A retired mercenary or naval officer?<br>\

Whatever your origin, you are fiercely loyal to the premier."

	duties = "Act as the premier's sidekick, bodyguard, and secretary in a crisis or mutiny situation. You may also be asked to do paperwork or reassign someones badge in his stead, but only by the premier's orders."

	loyalties = "Your first and only loyalty is to the premier and the colony itself. Unless the premier is breaking the law or corrupt, you're to remain loyal to the death."

	outfit_type = /decl/hierarchy/outfit/job/hop


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_VIG = 35,
		STAT_TGH = 30,
		STAT_ROB = 25,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_COG = 25
	)

/obj/landmark/join/start/pg
	name = "Steward"
	icon_state = "player-gold"
	join_tag = /datum/job/pg
