//Hivemind is rogue AI that uses unknown nanotech to follow some strange objective
//In fact, it's just hostile structures, wireweeds spreading event with some mobs
//Requires hard teamwork at late stages, but easily can be handled at the beginning

//All code stored in modules/hivemind


/datum/storyevent/hivemind
	id = "hivemind"
	name = "Hivemind Invasion"


	event_type = /datum/event/hivemind
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR*0.90)
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE, TAG_NEGATIVE, TAG_SCARY)
//============================================

/datum/event/hivemind
	announceWhen	= 300


/datum/event/hivemind/announce()
	level_eight_announcement() //new announcment so the crew doesn't have to fuck around trying to figure out if its a blob, hivemind, or a literal fungus


/datum/event/hivemind/start()
	var/turf/start_location
	var/active_players = 0
	var/mob/living/carbon/human/fighter
	for(fighter in GLOB.player_list)
		if(!fighter.mind)
			log_and_message_admins("[fighter.name] Is in the player_list without having a mind.")
			return
		if(fighter.mind.assigned_role in list(JOBS_ANTI_HIVEMIND))
			active_players++

	for(var/i=1 to 100)
		var/area/A = random_ship_area(filter_players = TRUE, filter_maintenance = TRUE, filter_critical = TRUE)
		start_location = A.random_space()
		if(!start_location && i == 100)
			log_and_message_admins("Hivemind failed to find a viable turf.")
			kill()
			return
		if(start_location)
			break

	log_and_message_admins("Active Hivemind combative players number is [active_players].")
	if(GLOB.hive_data_bool["pop_lock"])
		if(active_players < 7)
			log_and_message_admins("Hivemind failed to spawn as their was less then 7 active players exspected to combat the hivemind.")
			kill()
			return

	message_admins("Hivemind spawned at \the [jumplink(start_location)]")
	new /obj/machinery/hivemind_machine/node(start_location)
