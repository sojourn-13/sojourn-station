
/*
	The initialization of the game happens roughly like this:

	1. All global variables are initialized (including the global_init and tgstation's master controller instances including subsystems).
	2. The map is initialized, and map objects are created.
	3. world/New() runs.
	4. tgstation's MC runs initialization for various subsystems (refer to its own defines for the load order).

*/
var/global/datum/global_init/init = new ()

/*
	Pre-map initialization stuff should go here.
*/

/datum/global_init/New()
	generate_gameid()
	makeDatumRefLists()
	load_configuration()

	initialize_chemical_reagents()
	initialize_chemical_reactions()
	initialize_mutation_recipes()
	initialize_integrated_circuits_list()

	qdel(src) //we're done

/datum/global_init/Destroy()
	return 1

var/game_id = null
/proc/generate_gameid()
	if(game_id != null)
		return
	game_id = ""

	var/list/c = list("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	var/l = c.len

	var/t = world.timeofday
	for(var/_ = 1 to 4)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)
	game_id = "-[game_id]"
	t = round(world.realtime / (10 * 60 * 60 * 24))
	for(var/_ = 1 to 3)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)


/world
	visibility = 0
	mob = /mob/new_player
	turf = /turf/space
	area = /area/space
	view = "15x15"
	cache_lifespan = 0	//stops player uploaded stuff from being kept in the rsc past the current session


////////////////////////////////////////////////////////////////////////////////////////////////

#define RECOMMENDED_VERSION 512
// This function enable_debugger() enables local or remote (requires opening a port on router) debugging if the computer running this has set env EXTOOLS_DLL.
// Only runs if env var EXTOOLS_DLL is set otherwise it won't load the dll file.
// Used with the Visual Studio Code debugger and DreamMaker Language Client extension from https://github.com/SpaceManiac/SpacemanDMM/wiki/Setting-up-Debugging

/world/New()
	//logs
	start_time = world.realtime
	var/date_string = time2text(start_time, "YYYY/MM-Month/DD-Day")
	var/time_string = time2text(start_time, "YYYY/MM-Month/DD-Day/DDD-DD-hhmmss")
	href_logfile_filename = "data/logs/[date_string] hrefs.htm"
	href_logfile = file(href_logfile_filename)
	diary_filename = "data/logs/[time_string].log"
	diary = file(diary_filename)
	diary << "[log_end]\n[log_end]\nStarting up. (ID: [game_id]) [time2text(start_time, "hh:mm.ss")][log_end]\n---------------------[log_end]"
	changelog_hash = md5('html/changelog.html')					//used for telling if the changelog has changed recently

	world_qdel_log = file("data/logs/[date_string] qdel.log")	// GC Shutdown log

	if(byond_version < RECOMMENDED_VERSION)
		log_world("Your server's byond version does not meet the recommended requirements for this server. Please update BYOND")

	config.post_load()

	if(config && config.server_name != null && config.server_suffix && world.port > 0)
		// dumb and hardcoded but I don't care~
		config.server_name += " #[(world.port % 1000) / 100]"

	callHook("startup")
	//Emergency Fix
	load_mods()
	//end-emergency fix

	generate_body_modification_lists()

	src.update_status()

	. = ..()

#ifdef UNIT_TEST
	log_unit_test("Unit Tests Enabled.  This will destroy the world when testing is complete.")
	load_unit_test_changes()
#endif

	// Set up roundstart seed list.
	plant_controller = new()

	// This is kinda important. Set up details of what the hell things are made of.
	populate_material_list()

	Master.Initialize(10, FALSE)

	call_restart_webhook()

#ifdef UNIT_TEST
	initialize_unit_tests()
#endif



	spawn(2000)		//so we aren't adding to the round-start lag
		if(config.ToRban)
			ToRban_autoupdate()

#undef RECOMMENDED_VERSION

	return

////////////////////////////////////////////////////////////////////////////////////////////////

var/world_topic_spam_protect_ip = "0.0.0.0"
var/world_topic_spam_protect_time = world.timeofday

/world/Topic(T, addr, master, key)
	var/list/topic_handlers = WorldTopicHandlers()

	var/list/input = params2list(T)
	var/datum/world_topic/handler
	for(var/I in topic_handlers)
		if(I in input)
			handler = topic_handlers[I]
			break

	if(!handler || initial(handler.log))
		diary << "TOPIC: \"[T]\", from:[addr], master:[master], key:[key][log_end]"

	if(!handler)
		return

	handler = new handler()
	return handler.TryRun(input)


/world/Reboot(var/reason)
	/*spawn(0)
		world << sound(pick('sound/AI/newroundsexy.ogg','sound/misc/apcdestroyed.ogg','sound/misc/bangindonk.ogg')) // random end sounds!! - LastyBatsy
		*/

	for(var/client/C in clients)
		if(config.server)	//if you set a server location in config.txt, it sends you there instead of trying to reconnect to the same world address. -- NeoFite
			C << link("byond://[config.server]")

	..(reason)

/hook/startup/proc/loadMode()
	world.load_storyteller()
	return 1

/world/proc/load_storyteller()
	var/list/Lines = file2list("data/mode.txt")
	if(Lines.len)
		if(Lines[1])
			master_storyteller = Lines[1]
			log_misc("Saved storyteller is '[master_storyteller]'")

/world/proc/save_storyteller(var/the_mode)
	var/F = file("data/mode.txt")
	fdel(F)
	F << the_mode

/hook/startup/proc/loadAd()
	world.load_ad()
	return 1

/world/proc/load_ad()
	server_ad = file2text("config/advert.txt")

/hook/startup/proc/loadMOTD()
	world.load_motd()
	return 1

/world/proc/load_motd()
	join_motd = file2text("config/motd.txt")


/proc/load_configuration()
	config = new /datum/configuration()
	config.load("config/config.txt")
	config.load("config/game_options.txt", "game_options")
	config.loadsql("config/dbconfig.txt")

/hook/startup/proc/loadMods()
	world.load_mods()
	world.load_mentors() // no need to write another hook.
	return 1

/world/proc/load_mods()
	if(config.admin_legacy_system)
		var/text = file2text("config/moderators.txt")
		if (!text)
			error("Failed to load config/mods.txt")
		else
			var/list/lines = splittext(text, "\n")
			for(var/line in lines)
				if (!line)
					continue

				if (copytext(line, 1, 2) == ";")
					continue

				var/title = "Moderator"
				var/rights = admin_ranks[title]

				var/ckey = copytext(line, 1, length(line)+1)
				var/datum/admins/D = new /datum/admins(title, rights, ckey)
				D.associate(directory[ckey])

/world/proc/load_mentors()
	if(config.admin_legacy_system)
		var/text = file2text("config/mentors.txt")
		if (!text)
			error("Failed to load config/mentors.txt")
		else
			var/list/lines = splittext(text, "\n")
			for(var/line in lines)
				if (!line)
					continue
				if (copytext(line, 1, 2) == ";")
					continue

				var/title = "Mentor"
				var/rights = admin_ranks[title]

				var/ckey = copytext(line, 1, length(line)+1)
				var/datum/admins/D = new /datum/admins(title, rights, ckey)
				D.associate(directory[ckey])

/world/proc/update_status()
	var/s = ""

	if (config && config.server_name)
		s += "<b>[config.server_name]</b> &#8212; "

	s += "<b>[station_name()]</b>";
	s += "\]<br>"
	if(server_ad)
		s += "<small>"
		s += server_ad
		s += "</small></br>"

	var/list/features = list()

	if(SSticker)
		if(master_storyteller)
			features += master_storyteller
	else
		features += "<b>STARTING</b>"


	var/n = 0
	for (var/mob/M in GLOB.player_list)
		if (M.client)
			n++

	if (n != 1)
		features += "~[n] players"
	else
		features += "~[n] player"


	if (config && config.hostedby)
		features += "hosted by <b>[config.hostedby]</b>"

	if (features)
		s += "\[[jointext(features, ", ")]"

	/* does this help? I do not know */
	if (src.status != s)
		src.status = s

#define FAILED_DB_CONNECTION_CUTOFF 5
var/failed_db_connections = 0
var/failed_old_db_connections = 0

/hook/startup/proc/connectDB()
	if(!setup_database_connection())
		log_world("Your server failed to establish a connection with the feedback database.")
	else
		log_world("Feedback database connection established.")
	return 1

proc/setup_database_connection()

	if(failed_db_connections > FAILED_DB_CONNECTION_CUTOFF)	//If it failed to establish a connection more than 5 times in a row, don't bother attempting to conenct anymore.
		return 0

	if(!dbcon)
		dbcon = new()

	var/user = sqllogin
	var/pass = sqlpass
	var/db = sqldb
	var/address = sqladdress
	var/port = sqlport

	dbcon.Connect("dbi:mysql:[db]:[address]:[port]", "[user]", "[pass]")
	. = dbcon.IsConnected()
	if ( . )
		failed_db_connections = 0	//If this connection succeeded, reset the failed connections counter.
	else
		failed_db_connections++		//If it failed, increase the failed connections counter.
		log_world(dbcon.ErrorMsg())

	return .

//This proc ensures that the connection to the feedback database (global variable dbcon) is established
proc/establish_db_connection()
	if(failed_db_connections > FAILED_DB_CONNECTION_CUTOFF)
		return 0

	if(!dbcon || !dbcon.IsConnected())
		return setup_database_connection()
	else
		return 1

/world/proc/incrementMaxZ()
	maxz++
	SSmobs.MaxZChanged()

/world/proc/change_fps(new_value = 30)
	if(new_value <= 0)
		CRASH("change_fps() called with [new_value] new_value.")
	if(fps == new_value)
		return //No change required.

	fps = new_value