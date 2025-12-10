// GLOBAL_DATUM_INIT(news_network, /datum/feed_network, new)
GLOBAL_LIST_EMPTY(allCasters)
var/datum/feed_network/news_network = new /datum/feed_network     //The global news-network, which is coincidentally a global list.

/datum/feed_message
	///Who is the author of the full-size article to the feed channel?
	var/author =""
	///Body of the full-size article to the feed channel.
	var/body =""
	var/message_type ="Story"
	var/datum/feed_channel/parent_channel
	var/is_admin_message = 0
	var/db_id = 0
	///Is there an image tied to the feed message?
	var/icon/img = null
	///At what time was the full-size article sent? Time is in station time.
	var/time_stamp = ""
	///If the message has an image, what is that image's caption?
	var/caption = ""
	var/backup_body = ""
	var/backup_author = ""
	var/icon/backup_img = null
	var/icon/backup_caption = ""
	///Referece to the photo used in picture messages.
	var/photo_file

/datum/feed_channel
	var/channel_name=""
	var/list/datum/feed_message/messages = list()
	var/locked=0
	var/db_id = 0
	var/author=""
	var/backup_author=""
	var/views=0
	var/censored=0
	var/is_admin_channel=0
	var/updated = 0
	var/announcement = ""

/datum/feed_message/proc/clear()
	src.author = ""
	src.body = ""
	src.caption = ""
	src.img = null
	src.time_stamp = ""
	src.backup_body = ""
	src.backup_author = ""
	src.backup_caption = ""
	src.backup_img = null
	parent_channel.update()

/datum/feed_channel/proc/update()
	updated = world.time

/datum/feed_channel/proc/clear()
	src.channel_name = ""
	src.messages = list()
	src.locked = 0
	src.author = ""
	src.backup_author = ""
	src.censored = 0
	src.is_admin_channel = 0
	src.announcement = ""
	update()

/datum/feed_network
	var/list/datum/feed_channel/network_channels = list()
	var/datum/feed_message/wanted_issue

/datum/feed_network/New()
	CreateFeedChannel("Colony Announcements", "SS13", 1, 1, "New Colony Announcement Available")
	// DB loading is deferred to world startup to avoid attempting DB calls during early datum New() time
	// world.connectDB() will attempt to call news_network.LoadFromDatabase() once DB is available.

/datum/feed_network/proc/CreateFeedChannel(var/channel_name, var/author, var/locked, var/adminChannel = 0, var/announcement_message)
	// If a channel with this name already exists in memory, reuse it to avoid duplicates
	for(var/datum/feed_channel/exists in network_channels)
		if(exists.channel_name == channel_name)
			// update properties in case something changed
			exists.author = author
			exists.locked = locked
			exists.is_admin_channel = adminChannel
			if(announcement_message)
				exists.announcement = announcement_message
			else
				exists.announcement = "Breaking news from [channel_name]!"
			// ensure db_id if possible will be set below when persisting/checking DB
			return exists

	var/datum/feed_channel/newChannel = new /datum/feed_channel
	newChannel.channel_name = channel_name
	newChannel.author = author
	newChannel.locked = locked
	newChannel.is_admin_channel = adminChannel
	newChannel.db_id = 0
	if(announcement_message)
		newChannel.announcement = announcement_message
	else
		newChannel.announcement = "Breaking news from [channel_name]!"
	network_channels += newChannel

	// Attempt to persist channel immediately to DB for admin channels or if DB is enabled
	// However, exclude certain channels from database persistence.
	if(!ShouldExcludeFromDatabase(channel_name))
		newChannel.db_id = EnsureChannelInDB(channel_name, author, locked, adminChannel, newChannel.announcement)

	// If we succeeded in getting a DB id for this channel, load its recent messages so the
	// in-memory channel is populated immediately after creation.
	if(newChannel.db_id && config && establish_db_connection())
		var/DBQuery/qm = dbcon.NewQuery("SELECT id, author, body, message_type, DATE_FORMAT(time_stamp, '%Y-%m-%d %H:%i:%s') as ts, is_admin_message FROM news_messages WHERE channel_id = [newChannel.db_id] ORDER BY time_stamp ASC")
		if(qm.Execute())
			while(qm.NextRow())
				var/datum/feed_message/msg = new /datum/feed_message
				msg.db_id = qm.item[1]
				msg.author = qm.item[2]
				msg.body = qm.item[3]
				if(qm.item[4])
					msg.message_type = qm.item[4]
				msg.time_stamp = qm.item[5]
				msg.is_admin_message = qm.item[6]
				// Insert into the new channel (this will call update() on the channel)
				insert_message_in_channel(newChannel, msg)
			qm.Close()
		else
			log_world("Newscaster DB: failed to query messages for new channel '[channel_name]': [qm.ErrorMsg()]")

	// Return the created channel so callers can use it immediately
	return newChannel


/datum/feed_network/proc/SubmitArticle(msg, author, channel_name, obj/item/photo/picture, adminMessage = FALSE, message_type = "", allow_comments = TRUE, update_alert = TRUE)
	var/datum/feed_message/newMsg = new /datum/feed_message
	newMsg.author = author
	newMsg.body = msg
	newMsg.time_stamp = "[stationtime2text()]"
	newMsg.is_admin_message = adminMessage
	// If we later persist this message, record its DB id here
	newMsg.db_id = 0
	if(picture)
		newMsg.img = picture.img
		newMsg.caption = picture.scribble
		newMsg.photo_file = save_photo(picture.img)
	if(message_type)
		newMsg.message_type = message_type

	// If this is an admin message and SQL is available, persist to DB
	// However, do not persist messages from excluded channels.
	if(adminMessage && config)
		if(ShouldExcludeFromDatabase(channel_name))
			// Keep excluded channels in-memory only; do not create DB noise.
			log_world("Newscaster: skipping DB persist for message from excluded channel '[channel_name]'")
		else if(establish_db_connection())
			// Ensure channel exists in DB; attempt to create if missing
			var/sql_channel_name = sanitizeSQL(channel_name)
			var/sql_author = sanitizeSQL(author)
			// Try to find channel id with retry logic for connection failures
			var/DBQuery/check = dbcon.NewQuery("SELECT id FROM news_channels WHERE channel_name = '[sql_channel_name]' LIMIT 1")
			if(!check.Execute())
				// Check if it's a connection error and retry once
				if(findtext(check.ErrorMsg(), "MySQL server has gone away") || findtext(check.ErrorMsg(), "Lost connection"))
					log_world("Newscaster DB: Connection lost, attempting to reconnect...")
					if(establish_db_connection())
						check = dbcon.NewQuery("SELECT id FROM news_channels WHERE channel_name = '[sql_channel_name]' LIMIT 1")
						if(!check.Execute())
							log_world("Newscaster DB: Retry failed for channel check: [check.ErrorMsg()]")
							return // Give up after retry fails
					else
						log_world("Newscaster DB: Failed to reconnect")
						return
				else
					log_world("Newscaster DB: Failed to query channel: [check.ErrorMsg()]")
					return
			var/chan_id_num = null
			while(check.NextRow())
				chan_id_num = check.item[1]
			check.Close()
			if(!chan_id_num)
				// create channel
				var/DBQuery/insert_ch = dbcon.NewQuery("INSERT INTO news_channels (channel_name, author, locked, is_admin_channel, announcement) VALUES ('[sql_channel_name]', '[sql_author]', 1, 1, '')")
				if(insert_ch.Execute())
					var/DBQuery/lastq = dbcon.NewQuery("SELECT LAST_INSERT_ID() as id")
					if(lastq.Execute())
						while(lastq.NextRow())
							chan_id_num = lastq.item[1]
						lastq.Close()
			// Insert the message
			if(chan_id_num)
				var/sql_body = sanitizeSQL(msg)
				var/sql_type = sanitizeSQL(message_type)
				var/DBQuery/ins = dbcon.NewQuery("INSERT INTO news_messages (channel_id, author, body, message_type, time_stamp, is_admin_message) VALUES ([chan_id_num], '[sql_author]', '[sql_body]', '[sql_type]', Now(), 1)")
				if(!ins.Execute())
					log_world("Newscaster DB: failed to insert message: [ins.ErrorMsg()]")
				else
					// capture the inserted id and store on the message
					var/DBQuery/last = dbcon.NewQuery("SELECT LAST_INSERT_ID() as id")
					if(last.Execute())
						while(last.NextRow())
							newMsg.db_id = last.item[1]
						last.Close()
					else
						log_world("Newscaster DB: failed to fetch last_insert_id: [last.ErrorMsg()]")
			else
				log_world("Newscaster DB: failed to ensure channel exists for [channel_name]")
		else
			log_world("Newscaster: DB not available; admin message not persisted")
	for(var/datum/feed_channel/FC in network_channels)
		if(FC.channel_name == channel_name)
			insert_message_in_channel(FC, newMsg) //Adding message to the network's appropriate feed_channel
			break
	for(var/obj/machinery/newscaster/NEWSCASTER in GLOB.allCasters)
		NEWSCASTER.newsAlert(channel_name, update_alert)

/datum/feed_network/proc/submitWanted(criminal, body, scanned_user, obj/item/photo/picture, adminMsg = FALSE, newMessage = FALSE)
	var/datum/feed_message/WANTED = new /datum/feed_message
	WANTED.author = criminal
	WANTED.body = body
	WANTED.backup_author = scanned_user
	if(picture)
		WANTED.img = picture.img
		WANTED.photo_file = save_photo(picture.img)

	news_network.wanted_issue = WANTED

	if(newMessage)
		for(var/obj/machinery/newscaster/N in GLOB.allCasters)
			N.newsAlert()
			N.update_icon()

/datum/feed_network/proc/insert_message_in_channel(datum/feed_channel/FC, datum/feed_message/newMsg)
	FC.messages += newMsg
	newMsg.parent_channel = FC // ??
	FC.update()

/datum/feed_network/proc/save_photo(icon/photo)
	var/photo_file = copytext_char(md5("\icon[photo]"), 1, 6)
	if(!fexists("[GLOB.log_directory]/photos/[photo_file].png"))
		//Clean up repeated frames
		var/icon/clean = new /icon()
		clean.Insert(photo, "", SOUTH, 1, 0)
		fcopy(clean, "[GLOB.log_directory]/photos/[photo_file].png")
	return photo_file

// Load feed channels and recent messages from the SQL database into the in-memory network.
// This is best-effort: failures are logged but won't stop world startup.
/datum/feed_network/proc/LoadFromDatabase()
	// Expected tables (best-effort): news_channels(id, channel_name, author, locked, is_admin_channel, announcement)
	// and news_messages(id, channel_id, author, body, message_type, time_stamp, is_admin_message)
	if(!config)
		log_world("DEBUG: Newscaster DB load skipped - no config")
		return 0

	// Check if SQL is enabled and establish database connection
	if(!config.sql_enabled)
		log_world("DEBUG: Newscaster DB load disabled - SQL not enabled in config")
		return 0

	// Temporary workaround: Disable database loading to prevent crashes
	if(!config.sql_enabled)
		log_world("DEBUG: Newscaster DB load disabled - SQL not enabled")
		return 0

	log_world("DEBUG: Newscaster attempting DB load. SQL enabled status: [config.sql_enabled]")

	// Establish database connection before attempting queries
	if(!establish_db_connection())
		log_world("DEBUG: Newscaster DB load failed - could not establish database connection")
		return 0

	log_world("DEBUG: Newscaster DB connection established successfully")

	// Ensure the required tables exist
	CreateNewsTablesIfNeeded()

	// Load channels
	var/DBQuery/q = dbcon.NewQuery("SELECT id, channel_name, author, locked, is_admin_channel, announcement FROM news_channels ORDER BY id ASC")
	if(!q.Execute())
		// Check if it's a connection error and retry once
		if(findtext(q.ErrorMsg(), "MySQL server has gone away") || findtext(q.ErrorMsg(), "Lost connection"))
			log_world("Newscaster: Connection lost during channel load, attempting to reconnect...")
			if(establish_db_connection())
				q = dbcon.NewQuery("SELECT id, channel_name, author, locked, is_admin_channel, announcement FROM news_channels ORDER BY id ASC")
				if(!q.Execute())
					log_world("Newscaster: Retry failed to query news_channels: [q.ErrorMsg()]")
					return 0
			else
				log_world("Newscaster: Failed to reconnect during channel load")
				return 0
		else
			log_world("Newscaster: failed to query news_channels: [q.ErrorMsg()]")
			return 0

	// channel_by_id will be a list keyed numerically by DB id where possible
	var/list/channel_by_id = list()
	var/num_db_channels = 0
	while(q.NextRow())
		var/chan_id = q.item[1]
		num_db_channels++
		var/chan_name = q.item[2]
		var/db_author = q.item[3]
		var/db_locked = q.item[4]
		var/db_admin = q.item[5]
		var/db_announcement = q.item[6]

		// Try to find an existing in-memory channel first by DB id, then by name
		var/datum/feed_channel/FC = null
		// search by db_id
		for(var/datum/feed_channel/exists in network_channels)
			if(exists.db_id && exists.db_id == chan_id)
				FC = exists
				break
		// if no db_id match, try name match (to handle pre-created defaults)
		if(!FC)
			for(var/datum/feed_channel/exists2 in network_channels)
				if(exists2.channel_name == chan_name)
					FC = exists2
					break

		var/was_existing = FALSE
		if(!FC)
			// Use the centralized CreateFeedChannel so persistence and de-duplication logic
			// (and any side-effects) happen in one place instead of constructing datums here.
			FC = CreateFeedChannel(chan_name, db_author, db_locked, db_admin, db_announcement)
			// CreateFeedChannel will either return an existing channel or a newly-created one
			// that has been added to network_channels.
			if(FC)
				// If the returned channel already had a db_id set, it was an existing entry.
				if(FC.db_id)
					was_existing = TRUE
		else
			was_existing = TRUE

		// If we failed to get or create a channel for this DB record, skip it and log.
		if(!FC)
			log_world("Newscaster: failed to create or find channel for DB id [chan_id] '[chan_name]'; skipping")
			continue

		// Update the channel fields from DB record
		FC.channel_name = chan_name
		FC.author = db_author
		FC.locked = db_locked
		FC.is_admin_channel = db_admin
		FC.announcement = db_announcement
		FC.db_id = chan_id

		// ensure list can hold at least chan_id
		if(channel_by_id.len < chan_id)
			channel_by_id.len = chan_id
		channel_by_id[chan_id] = FC
		// diagnostic log to help debug missing channels
		var/verb = "created"
		if(was_existing)
			verb = "reused"
		log_world("Newscaster: DB channel [chan_id] '[chan_name]' loaded ([verb])")
	q.Close()

	if(num_db_channels == 0)
		log_world("Newscaster: no channels found in DB (news_channels table empty)")

	// Load recent messages — limit to last 200 messages to avoid huge loads
	var/DBQuery/q2 = dbcon.NewQuery("SELECT id, channel_id, author, body, message_type, DATE_FORMAT(time_stamp, '%Y-%m-%d %H:%i:%s') as ts, is_admin_message FROM news_messages WHERE channel_id IS NOT NULL ORDER BY time_stamp DESC LIMIT 200")
	if(!q2.Execute())
		log_world("Newscaster: failed to query news_messages: [q2.ErrorMsg()]")
		return 1

	// Messages were selected newest-first; insert them so channels end up in chronological order
	var/list/msg_buffer = list()
	while(q2.NextRow())
		var/msgrec = list(
			"id" = q2.item[1],
			"channel_id" = q2.item[2],
			"author" = q2.item[3],
			"body" = q2.item[4],
			"message_type" = q2.item[5],
			"time_stamp" = q2.item[6],
			"is_admin_message" = q2.item[7]
		)
		msg_buffer += msgrec
	q2.Close()

	for(var/I = msg_buffer.len; I >= 1; I--)
		var/m = msg_buffer[I]
		var/FC = channel_by_id[m["channel_id"]]
		if(!FC)
			continue
		var/datum/feed_message/newMsg = new /datum/feed_message
		// Normalize DB-loaded fields: some DB rows may have surrounding single quotes
		// due to earlier sanitizeSQL behavior. Strip them if present.
		var/loaded_author = m["author"]
		var/loaded_body = m["body"]
		var/loaded_type = m["message_type"]
		if(loaded_author && dd_hasprefix(loaded_author, "'"))
			loaded_author = copytext(loaded_author, 2, length(loaded_author) - 1)
		if(loaded_body && dd_hasprefix(loaded_body, "'"))
			loaded_body = copytext(loaded_body, 2, length(loaded_body) - 1)
		if(loaded_type && dd_hasprefix(loaded_type, "'"))
			loaded_type = copytext(loaded_type, 2, length(loaded_type) - 1)

		newMsg.author = loaded_author
		newMsg.body = loaded_body
		newMsg.time_stamp = m["time_stamp"]
		newMsg.is_admin_message = m["is_admin_message"]
		// store DB id for later persistence actions
		newMsg.db_id = m["id"]
		if(loaded_type)
			newMsg.message_type = loaded_type

		insert_message_in_channel(FC, newMsg)

	var/channel_count = length(network_channels)
	var/message_count = 0
	for(var/datum/feed_channel/FC in network_channels)
		message_count += length(FC.messages)
	log_world("Newscaster: loaded [channel_count] channels and [message_count] messages from DB")
	return 1


// Ensure the channel exists in DB: return id if found/created, 0 on failure.
/datum/feed_network/proc/EnsureChannelInDB(var/channel_name, var/author, var/locked = 0, var/adminChannel = 0, var/announcement_message = "")
	// Check if this channel should be excluded from database persistence
	if(ShouldExcludeFromDatabase(channel_name))
		log_world("Newscaster: skipping DB persist for excluded channel '[channel_name]'")
		return 0

	if(!config)
		return 0
	if(!establish_db_connection())
		return 0
	var/sql_channel_name = sanitizeSQL(channel_name)
	var/sql_author = sanitizeSQL(author)
	var/DBQuery/chk = dbcon.NewQuery("SELECT id FROM news_channels WHERE channel_name = '[sql_channel_name]' LIMIT 1")
	if(!chk.Execute())
		log_world("Newscaster DB: failed to query channels in EnsureChannelInDB: [chk.ErrorMsg()]")
		return 0
	var/chan_id = 0
	while(chk.NextRow())
		chan_id = chk.item[1]
	chk.Close()
	if(chan_id)
		return chan_id
	// Not found: try to insert
	var/DBQuery/ins = dbcon.NewQuery("INSERT INTO news_channels (channel_name, author, locked, is_admin_channel, announcement) VALUES ('[sql_channel_name]', '[sql_author]', [locked], [adminChannel], '[sanitizeSQL(announcement_message)]')")
	if(!ins.Execute())
		// insertion failed; it may be a transient DB error or a race where another process inserted it.
		log_world("Newscaster DB: failed to insert channel '[channel_name]': [ins.ErrorMsg()]")
		// Try to re-query in case it was inserted by another process concurrently
		var/DBQuery/rechk = dbcon.NewQuery("SELECT id FROM news_channels WHERE channel_name = '[sql_channel_name]' LIMIT 1")
		if(rechk.Execute())
			while(rechk.NextRow())
				chan_id = rechk.item[1]
			rechk.Close()
			return chan_id
		else
			log_world("Newscaster DB: re-query failed after insert failure: [rechk.ErrorMsg()]")
			return 0
	else
		var/DBQuery/last = dbcon.NewQuery("SELECT LAST_INSERT_ID() as id")
		if(last.Execute())
			while(last.NextRow())
				chan_id = last.item[1]
			last.Close()
		return chan_id

// Helper function to determine if a channel should be excluded from database persistence
/datum/feed_network/proc/ShouldExcludeFromDatabase(var/channel_name)
	if(!channel_name)
		return TRUE

	// Convert to lowercase for case-insensitive matching
	var/lower_name = lowertext(channel_name)

	// Exclude channels with "announcements" in the name
	if(findtext(lower_name, "announcements"))
		return TRUE

	// Exclude "nyx daily" specifically
	if(findtext(lower_name, "nyx daily"))
		return TRUE

	// Add other exclusions here as needed
	// Examples:
	// if(findtext(lower_name, "daily"))
	//     return TRUE
	// if(findtext(lower_name, "bulletin"))
	//     return TRUE

	return FALSE

// Create the news tables if they don't exist
/datum/feed_network/proc/CreateNewsTablesIfNeeded()
	if(!dbcon || !dbcon.IsConnected())
		log_world("Newscaster: Cannot create tables - no database connection")
		return FALSE

	// Create news_channels table
	var/channels_sql = {"
		CREATE TABLE IF NOT EXISTS `news_channels` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`channel_name` varchar(255) NOT NULL,
			`author` varchar(255) NOT NULL,
			`locked` tinyint(1) DEFAULT 0,
			`is_admin_channel` tinyint(1) DEFAULT 0,
			`announcement` text,
			`censored` tinyint(1) DEFAULT 0,
			`created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
			PRIMARY KEY (`id`),
			UNIQUE KEY `channel_name` (`channel_name`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8
	"}

	var/DBQuery/create_channels = dbcon.NewQuery(channels_sql)
	if(!create_channels.Execute())
		log_world("Newscaster: Failed to create news_channels table: [create_channels.ErrorMsg()]")
		return FALSE

	// Create news_messages table
	var/messages_sql = {"
		CREATE TABLE IF NOT EXISTS `news_messages` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`channel_id` int(11) NOT NULL,
			`author` varchar(255) NOT NULL,
			`body` text NOT NULL,
			`message_type` varchar(50) DEFAULT 'Story',
			`time_stamp` timestamp DEFAULT CURRENT_TIMESTAMP,
			`is_admin_message` tinyint(1) DEFAULT 0,
			`caption` text,
			PRIMARY KEY (`id`),
			KEY `channel_id` (`channel_id`),
			KEY `time_stamp` (`time_stamp`),
			FOREIGN KEY (`channel_id`) REFERENCES `news_channels`(`id`) ON DELETE CASCADE
		) ENGINE=InnoDB DEFAULT CHARSET=utf8
	"}

	var/DBQuery/create_messages = dbcon.NewQuery(messages_sql)
	if(!create_messages.Execute())
		log_world("Newscaster: Failed to create news_messages table: [create_messages.ErrorMsg()]")
		return FALSE

	log_world("Newscaster: Database tables verified/created successfully")
	return TRUE

/obj/machinery/newscaster
	name = "newscaster"
	desc = "A standard newsfeed handler. All the news you absolutely have no use for, in one place!"
	icon = 'icons/obj/terminals.dmi'
	icon_state = "newscaster_normal"
	light_range = 0
	anchored = TRUE

	var/isbroken = 0  //1 if someone banged it with something heavy
	var/ispowered = 1 //starts powered, changes with power_change()
	var/screen = 0                  //Or maybe I'll make it into a list within a list afterwards... whichever I prefer, go fuck yourselves :3
		// 0 = welcome screen - main menu
		// 1 = view feed channels
		// 2 = create feed channel
		// 3 = create feed story
		// 4 = feed story submited sucessfully
		// 5 = feed channel created successfully
		// 6 = ERROR: Cannot create feed story
		// 7 = ERROR: Cannot create feed channel
		// 8 = print newspaper
		// 9 = viewing channel feeds
		// 10 = censor feed story
		// 11 = censor feed channel
		//Holy shit this is outdated, made this when I was still starting newscasters :3
	var/paper_remaining = 15
	var/securityCaster = 0
		// 0 = Caster cannot be used to issue wanted posters
		// 1 = the opposite
	var/unit_no = 0 //Each newscaster has a unit number
	//var/datum/feed_message/wanted //We're gonna use a feed_message to store data of the wanted person because fields are similar
	//var/wanted_issue = 0          //OBSOLETE
		// 0 = there's no WANTED issued, we don't need a special icon_state
		// 1 = Guess what.
	var/alert_delay = 500
	var/alert = FALSE
	var/scanned_user = "Unknown" //Will contain the name of the person who currently uses the newscaster
	var/msg = "";                //Feed message
	var/datum/news_photo/photo_data = null
	var/channel_name = ""; //the feed channel which will be receiving the feed, or being created
	var/c_locked=0;        //Will our new channel be locked to public submissions?
	var/hitstaken = 0      //Death at 3 hits from an item with force>=15
	var/datum/feed_channel/viewing_channel = null
	light_range = 0
	anchored = 1

/obj/machinery/newscaster/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		// setDir(ndir)
		dir = ndir
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -32 : 32)
		pixel_y = (dir & 3)? (dir ==1 ? -32 : 32) : 0

	paper_remaining = rand(3,15)            ///At most 15 prints and at minium 3. No max as storage as of now

	GLOB.allCasters += src
	unit_no = GLOB.allCasters.len
	update_icon()



/obj/machinery/newscaster/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The number of newsprints left states [src.paper_remaining].</span>")
/obj/machinery/newscaster/directional/north
	pixel_y = 32

/obj/machinery/newscaster/directional/south
	pixel_y = -28

/obj/machinery/newscaster/directional/east
	pixel_x = 28

/obj/machinery/newscaster/directional/west
	pixel_x = -28

/obj/machinery/newscaster/security_unit                   //Security unit
	name = "security newscaster"
	securityCaster = 1

/obj/machinery/newscaster/security_unit/directional/north
	pixel_y = 32

/obj/machinery/newscaster/security_unit/directional/south
	pixel_y = -28

/obj/machinery/newscaster/security_unit/directional/east
	pixel_x = 28

/obj/machinery/newscaster/security_unit/directional/west
	pixel_x = -28

/obj/machinery/newscaster/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		// setDir(ndir)
		dir = ndir
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -32 : 32)
		pixel_y = (dir & 3)? (dir ==1 ? -32 : 32) : 0

	GLOB.allCasters += src
	unit_no = GLOB.allCasters.len
	update_icon()

/obj/machinery/newscaster/Destroy()
	GLOB.allCasters -= src
	viewing_channel = null
	// picture = null
	return ..()

/obj/machinery/newscaster/update_icon()
	if(!ispowered || isbroken)
		icon_state = "newscaster_off"
		if(isbroken) //If the thing is smashed, add crack overlay on top of the unpowered sprite.
			src.cut_overlays()
			src.add_overlay(image(src.icon, "crack3"))
		return

	src.cut_overlays() //reset over-lays

	if(news_network.wanted_issue) //wanted icon state, there can be no over-lays on it as it's a priority message
		icon_state = "newscaster_wanted"
		return

	if(alert) //new message alert overlay
		src.add_overlay("newscaster_alert")

	if(hitstaken > 0) //Cosmetic damage overlay
		src.add_overlay(image(src.icon, "crack[hitstaken]"))

	icon_state = "newscaster_normal"
	return

/obj/machinery/newscaster/power_change()
	if(isbroken) //Broken shit can't be powered.
		return
	..()
	if( !(stat & NOPOWER) )
		src.ispowered = 1
		src.update_icon()
	else
		spawn(rand(0, 15))
			src.ispowered = 0
			src.update_icon()


/obj/machinery/newscaster/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			src.isbroken = 1
			if(prob(50))
				qdel(src)
			else
				src.update_icon() //can't place it above the return and outside the if-else. or we might get runtimes of null.update_icon() if(prob(50)) goes in.
			return
		else
			if(prob(50))
				src.isbroken = 1
			src.update_icon()

/obj/machinery/newscaster/attack_hand(mob/user as mob)            //########### THE MAIN BEEF IS HERE! And in the proc below this...############

	if(!src.ispowered || src.isbroken)
		return

	if(!user.IsAdvancedToolUser())
		return 0

	if(ishuman(user) || issilicon(user))
		var/mob/living/human_or_robot_user = user
		var/dat
		scan_user(human_or_robot_user) //Newscaster scans you

		switch(screen)
			if(0)
				dat += "Welcome to Newscasting Unit #[unit_no].<BR> Interface & News networks Operational."
				dat += "<BR><FONT SIZE=1>Property of Nanotrasen Inc</FONT>"
				if(news_network.wanted_issue)
					dat+= "<HR><A href='?src=[REF(src)];view_wanted=1'>Read Wanted Issue</A>"
				dat+= "<HR><BR><A href='?src=[REF(src)];create_channel=1'>Create Feed Channel</A>"
				dat+= "<BR><A href='?src=[REF(src)];view=1'>View Feed Channels</A>"
				dat+= "<BR><A href='?src=[REF(src)];create_feed_story=1'>Submit new Feed story</A>"
				dat+= "<BR><A href='?src=[REF(src)];menu_paper=1'>Print newspaper</A>"
				dat+= "<BR><A href='?src=[REF(src)];refresh=1'>Re-scan User</A>"
				dat+= "<BR><BR><A href='?src=\ref[human_or_robot_user];mach_close=newscaster_main'>Exit</A>"
				if(src.securityCaster)
					var/wanted_already = FALSE
					if(news_network.wanted_issue)
						wanted_already = TRUE
					dat+="<HR><B>Feed Security functions:</B><BR>"
					dat+="<BR><A href='?src=[REF(src)];menu_wanted=1'>[(wanted_already) ? ("Manage") : ("Publish")] \"Wanted\" Issue</A>"
					dat+="<BR><A href='?src=[REF(src)];menu_censor_story=1'>Censor Feed Stories</A>"
					dat+="<BR><A href='?src=[REF(src)];menu_censor_channel=1'>Mark Feed Channel with [company_name] D-Notice</A>"
				dat+="<BR><HR>The newscaster recognises you as: <FONT COLOR='green'>[src.scanned_user]</FONT>"
			if(1)
				dat+= "Station Feed Channels<HR>"
				if( isemptylist(news_network.network_channels) )
					dat+="<I>No active channels found...</I>"
				else
					for(var/datum/feed_channel/CHANNEL in news_network.network_channels)
						if(CHANNEL.is_admin_channel)
							dat+="<B><FONT style='BACKGROUND-COLOR: LightGreen '><A href='?src=[REF(src)];show_channel=\ref[CHANNEL]'>[CHANNEL.channel_name]</A></FONT></B><BR>"
						else
							dat+="<B><A href='?src=[REF(src)];show_channel=\ref[CHANNEL]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : null]<BR></B>"
				dat+="<BR><HR><A href='?src=[REF(src)];refresh=1'>Refresh</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Back</A>"
			if(2)
				dat+="Creating new Feed Channel..."
				dat+="<HR><B><A href='?src=[REF(src)];set_channel_name=1'>Channel Name</A>:</B> [src.channel_name]<BR>"
				dat+="<B>Channel Author:</B> <FONT COLOR='green'>[src.scanned_user]</FONT><BR>"
				dat+="<B><A href='?src=[REF(src)];set_channel_lock=1'>Will Accept Public Feeds</A>:</B> [(src.c_locked) ? ("NO") : ("YES")]<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];submit_new_channel=1'>Submit</A><BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Cancel</A><BR>"
			if(3)
				dat+="Creating new Feed Message..."
				dat+="<HR><B><A href='?src=[REF(src)];set_channel_receiving=1'>Receiving Channel</A>:</B> [src.channel_name]<BR>" //MARK
				dat+="<B>Message Author:</B> <FONT COLOR='green'>[src.scanned_user]</FONT><BR>"
				dat+="<B><A href='?src=[REF(src)];set_new_message=1'>Message Body</A>:</B> [src.msg] <BR>"
				//dat+="<B><A href='?src=[REF(src)];set_attachment=1'>Attach Photo</A>:</B>  [(src.photo_data ? "Photo Attached" : "No Photo")]</BR>" // CFW - Kills the server and as such is disabled for now
				dat+="<BR><A href='?src=[REF(src)];submit_new_message=1'>Submit</A><BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Cancel</A><BR>"
			if(4)
				dat+="Feed story successfully submitted to [src.channel_name].<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(5)
				dat+="Feed Channel [src.channel_name] created successfully.<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(6)
				dat+="<B><FONT COLOR='maroon'>ERROR: Could not submit Feed story to Network.</B></FONT><HR><BR>"
				if(src.channel_name=="")
					dat+="<FONT COLOR='maroon'>Invalid receiving channel name.</FONT><BR>"
				if(src.scanned_user=="Unknown")
					dat+="<FONT COLOR='maroon'>Channel author unverified.</FONT><BR>"
				if(src.msg == "" || src.msg == "\[REDACTED\]")
					dat+="<FONT COLOR='maroon'>Invalid message body.</FONT><BR>"

				dat+="<BR><A href='?src=[REF(src)];setScreen=[3]'>Return</A><BR>"
			if(7)
				dat+="<B><FONT COLOR='maroon'>ERROR: Could not submit Feed Channel to Network.</B></FONT><HR><BR>"
				var/list/existing_authors = list()
				for(var/datum/feed_channel/FC in news_network.network_channels)
					if(FC.author == "\[REDACTED\]")
						existing_authors += FC.backup_author
					else
						existing_authors += FC.author
				if(src.scanned_user in existing_authors)
					dat+="<FONT COLOR='maroon'>There already exists a Feed channel under your name.</FONT><BR>"
				if(src.channel_name=="" || src.channel_name == "\[REDACTED\]")
					dat+="<FONT COLOR='maroon'>Invalid channel name.</FONT><BR>"
				var/check = 0
				for(var/datum/feed_channel/FC in news_network.network_channels)
					if(FC.channel_name == src.channel_name)
						check = 1
						break
				if(check)
					dat+="<FONT COLOR='maroon'>Channel name already in use.</FONT><BR>"
				if(src.scanned_user=="Unknown")
					dat+="<FONT COLOR='maroon'>Channel author unverified.</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[2]'>Return</A><BR>"
			if(8)
				var/total_num=length(news_network.network_channels)
				var/active_num=total_num
				var/message_num=0
				for(var/datum/feed_channel/FC in news_network.network_channels)
					if(!FC.censored)
						message_num += length(FC.messages)    //Dont forget, datum/feed_channel's var messages is a list of datum/feed_message
					else
						active_num--
				dat+="Network currently serves a total of [total_num] Feed channels, [active_num] of which are active, and a total of [message_num] Feed Stories." //TODO: CONTINUE
				dat+="<BR><BR><B>Liquid Paper remaining:</B> [(src.paper_remaining) *100 ] cm^3"
				dat+="<BR><BR><A href='?src=[REF(src)];print_paper=[0]'>Print Paper</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Cancel</A>"
			if(9)
				dat+="<B>[viewing_channel.channel_name]: </B><FONT SIZE=1>\[created by: <FONT COLOR='maroon'>[viewing_channel.author]</FONT>\]</FONT><HR>"
				if(viewing_channel.censored)
					dat+="<FONT COLOR='red'><B>ATTENTION: </B></FONT>This channel has been deemed as threatening to the welfare of the station, and marked with a [company_name] D-Notice.<BR>"
					dat+="No further feed story additions are allowed while the D-Notice is in effect.</FONT><BR><BR>"
				else
					if( !length(viewing_channel.messages) )
						dat+="<I>No feed messages found in channel...</I><BR>"
					else
						var/i = 0
						for(var/datum/feed_message/MESSAGE in viewing_channel.messages)
							i++
							dat+="-[MESSAGE.body] <BR>"
							if(MESSAGE.img)
								usr << browse_rsc(MESSAGE.img, "tmp_photo[i].png")
								dat+="<img src='tmp_photo[i].png' width = '180'><BR>"
								if(MESSAGE.caption)
									dat+="<FONT SIZE=1><B>[MESSAGE.caption]</B></FONT><BR>"
								dat+="<BR>"
							dat+="<FONT SIZE=1>\[Story by <FONT COLOR='maroon'>[MESSAGE.author] - [MESSAGE.time_stamp]</FONT>\]</FONT><BR>"
				dat+="<BR><HR><A href='?src=[REF(src)];refresh=1'>Refresh</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[1]'>Back</A>"
			if(10)
				dat+="<B>[company_name] Feed Censorship Tool</B><BR>"
				dat+="<FONT SIZE=1>NOTE: Due to the nature of news Feeds, total deletion of a Feed Story is not possible.<BR>"
				dat+="Keep in mind that users attempting to view a censored feed will instead see the \[REDACTED\] tag above it.</FONT>"
				dat+="<HR>Select Feed channel to get Stories from:<BR>"
				if(isemptylist(news_network.network_channels))
					dat+="<I>No feed channels found active...</I><BR>"
				else
					for(var/datum/feed_channel/CHANNEL in news_network.network_channels)
						dat+="<A href='?src=[REF(src)];pick_censor_channel=\ref[CHANNEL]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : null]<BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Cancel</A>"
			if(11)
				dat+="<B>[company_name] D-Notice Handler</B><HR>"
				dat+="<FONT SIZE=1>A D-Notice is to be bestowed upon the channel if the handling Authority deems it as harmful for the station's"
				dat+="morale, integrity or disciplinary behaviour. A D-Notice will render a channel unable to be updated by anyone, without deleting any feed"
				dat+="stories it might contain at the time. You can lift a D-Notice if you have the required access at any time.</FONT><HR>"
				if(isemptylist(news_network.network_channels))
					dat+="<I>No feed channels found active...</I><BR>"
				else
					for(var/datum/feed_channel/CHANNEL in news_network.network_channels)
						dat+="<A href='?src=[REF(src)];pick_d_notice=\ref[CHANNEL]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : null]<BR>"

				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Back</A>"
			if(12)
				dat+="<B>[src.viewing_channel.channel_name]: </B><FONT SIZE=1>\[ created by: <FONT COLOR='maroon'>[src.viewing_channel.author]</FONT> \]</FONT><BR>"
				dat+="<FONT SIZE=2><A href='?src=[REF(src)];censor_channel_author=\ref[src.viewing_channel]'>[(src.viewing_channel.author=="\[REDACTED\]") ? ("Undo Author censorship") : ("Censor channel Author")]</A></FONT><HR>"


				if( isemptylist(src.viewing_channel.messages) )
					dat+="<I>No feed messages found in channel...</I><BR>"
				else
					for(var/datum/feed_message/MESSAGE in src.viewing_channel.messages)
						dat+="-[MESSAGE.body] <BR><FONT SIZE=1>\[[MESSAGE.message_type] by <FONT COLOR='maroon'>[MESSAGE.author]</FONT>\]</FONT><BR>"
						dat+="<FONT SIZE=2><A href='?src=[REF(src)];censor_channel_story_body=\ref[MESSAGE]'>[(MESSAGE.body == "\[REDACTED\]") ? ("Undo story censorship") : ("Censor story")]</A>  -  <A href='?src=[REF(src)];censor_channel_story_author=\ref[MESSAGE]'>[(MESSAGE.author == "\[REDACTED\]") ? ("Undo Author Censorship") : ("Censor message Author")]</A></FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[10]'>Back</A>"
			if(13)
				dat+="<B>[src.viewing_channel.channel_name]: </B><FONT SIZE=1>\[ created by: <FONT COLOR='maroon'>[src.viewing_channel.author]</FONT> \]</FONT><BR>"
				dat+="Channel messages listed below. If you deem them dangerous to the station, you can <A href='?src=[REF(src)];toggle_d_notice=\ref[src.viewing_channel]'>Bestow a D-Notice upon the channel</A>.<HR>"
				if(src.viewing_channel.censored)
					dat+="<FONT COLOR='red'><B>ATTENTION: </B></FONT>This channel has been deemed as threatening to the welfare of the station, and marked with a [company_name] D-Notice.<BR>"
					dat+="No further feed story additions are allowed while the D-Notice is in effect.<BR><BR>"
				else
					if( isemptylist(src.viewing_channel.messages) )
						dat+="<I>No feed messages found in channel...</I><BR>"
					else
						for(var/datum/feed_message/MESSAGE in src.viewing_channel.messages)
							dat+="-[MESSAGE.body] <BR><FONT SIZE=1>\[[MESSAGE.message_type] by <FONT COLOR='maroon'>[MESSAGE.author]</FONT>\]</FONT><BR>"

				dat+="<BR><A href='?src=[REF(src)];setScreen=[11]'>Back</A>"
			if(14)
				dat+="<B>Wanted Issue Handler:</B>"
				var/wanted_already = 0
				var/end_param = 1
				if(news_network.wanted_issue)
					wanted_already = 1
					end_param = 2

				if(wanted_already)
					dat+="<FONT SIZE=2><BR><I>A wanted issue is already in Feed Circulation. You can edit or cancel it below.</FONT></I>"
				dat+="<HR>"
				dat+="<A href='?src=[REF(src)];set_wanted_name=1'>Criminal Name</A>: [src.channel_name] <BR>"
				dat+="<A href='?src=[REF(src)];set_wanted_desc=1'>Description</A>: [src.msg] <BR>"
				dat+="<A href='?src=[REF(src)];set_attachment=1'>Attach Photo</A>: [(src.photo_data ? "Photo Attached" : "No Photo")]</BR>"
				if(wanted_already)
					dat+="<B>Wanted Issue created by:</B><FONT COLOR='green'> [news_network.wanted_issue.backup_author]</FONT><BR>"
				else
					dat+="<B>Wanted Issue will be created under prosecutor:</B><FONT COLOR='green'> [src.scanned_user]</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];submit_wanted=[end_param]'>[(wanted_already) ? ("Edit Issue") : ("Submit")]</A>"
				if(wanted_already)
					dat+="<BR><A href='?src=[REF(src)];cancel_wanted=1'>Take down Issue</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Cancel</A>"
			if(15)
				dat+="<FONT COLOR='green'>Wanted issue for [src.channel_name] is now in Network Circulation.</FONT><BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(16)
				dat+="<B><FONT COLOR='maroon'>ERROR: Wanted Issue rejected by Network.</B></FONT><HR><BR>"
				if(src.channel_name=="" || src.channel_name == "\[REDACTED\]")
					dat+="<FONT COLOR='maroon'>Invalid name for person wanted.</FONT><BR>"
				if(src.scanned_user=="Unknown")
					dat+="<FONT COLOR='maroon'>Issue author unverified.</FONT><BR>"
				if(src.msg == "" || src.msg == "\[REDACTED\]")
					dat+="<FONT COLOR='maroon'>Invalid description.</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(17)
				dat+="<B>Wanted Issue successfully deleted from Circulation</B><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(18)
				dat+="<B><FONT COLOR ='maroon'>-- STATIONWIDE WANTED ISSUE --</B></FONT><BR><FONT SIZE=2>\[Submitted by: <FONT COLOR='green'>[news_network.wanted_issue.backup_author]</FONT>\]</FONT><HR>"
				dat+="<B>Criminal</B>: [news_network.wanted_issue.author]<BR>"
				dat+="<B>Description</B>: [news_network.wanted_issue.body]<BR>"
				dat+="<B>Photo:</B>: "
				if(news_network.wanted_issue.img)
					usr << browse_rsc(news_network.wanted_issue.img, "tmp_photow.png")
					dat+="<BR><img src='tmp_photow.png' width = '180'>"
				else
					dat+="None"
				dat+="<BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Back</A><BR>"
			if(19)
				dat+="<FONT COLOR='green'>Wanted issue for [src.channel_name] successfully edited.</FONT><BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Return</A><BR>"
			if(20)
				dat+="<FONT COLOR='green'>Printing successful. Please receive your newspaper from the bottom of the machine.</FONT><BR><BR>"
				dat+="<A href='?src=[REF(src)];setScreen=[0]'>Return</A>"
			if(21)
				dat+="<FONT COLOR='maroon'>Unable to print newspaper. Insufficient paper. Please notify maintenance personnel to refill machine storage.</FONT><BR><BR>"
				dat+="<A href='?src=[REF(src)];setScreen=[0]'>Return</A>"

		var/datum/browser/popup = new(human_or_robot_user, "newscaster_main", "Newscaster Unit #[unit_no]", 400, 600)
		popup.set_content(dat)
		popup.open()

/obj/machinery/newscaster/Topic(href, href_list)
	if(..())
		return
	if ((usr.contents.Find(src) || ((get_dist(src, usr) <= 1) && istype(src.loc, /turf))) || (issilicon(usr)))
		usr.set_machine(src)
		scan_user(usr)

		if(href_list["set_channel_name"])
			channel_name = sanitizeSafe(input(usr, "Provide a Feed Channel Name", "Network Channel Handler", ""), MAX_LNAME_LEN)
			updateUsrDialog()

		else if(href_list["set_channel_lock"])
			c_locked = !c_locked
			updateUsrDialog()

		else if(href_list["submit_new_channel"])
			var/list/existing_authors = list()
			for(var/datum/feed_channel/FC in news_network.network_channels)
				if(FC.author == "\[REDACTED\]")
					existing_authors += FC.backup_author
				else
					existing_authors += FC.author
			var/check = FALSE
			for(var/datum/feed_channel/FC in news_network.network_channels)
				if(FC.channel_name == channel_name)
					check = TRUE
					break
			if(channel_name == "" || channel_name == "\[REDACTED\]" || scanned_user == "Unknown" || check || (scanned_user in existing_authors) )
				screen=7
			else
				var/choice = alert("Please confirm Feed channel creation","Network Channel Handler","Confirm","Cancel")
				if(choice=="Confirm")
					scan_user(usr)
					news_network.CreateFeedChannel(src.channel_name, src.scanned_user, c_locked)
					screen=5
			updateUsrDialog()

		else if(href_list["set_channel_receiving"])
			//var/list/datum/feed_channel/available_channels = list()
			var/list/available_channels = list()
			for(var/datum/feed_channel/F in news_network.network_channels)
				if( (!F.locked || F.author == scanned_user) && !F.censored)
					available_channels += F.channel_name
			channel_name = input(usr, "Choose receiving Feed Channel", "Network Channel Handler") in sortList(available_channels)
			updateUsrDialog()

		else if(href_list["set_new_message"])
			msg = sanitize(input(usr, "Write your Feed story", "Network Channel Handler", ""))
			updateUsrDialog()

		else if(href_list["set_attachment"])
			AttachPhoto(usr)
			updateUsrDialog()

		else if(href_list["submit_new_message"])
			if(src.msg =="" || src.msg=="\[REDACTED\]" || src.scanned_user == "Unknown" || src.channel_name == "" )
				src.screen=6
			else
				var/image = photo_data ? photo_data.photo : null
				news_network.SubmitArticle(src.msg, src.scanned_user, src.channel_name, image, 0)
				if(photo_data)
					photo_data.photo.forceMove(get_turf(src))
				src.screen=4

			src.updateUsrDialog()

		else if(href_list["create_channel"])
			src.screen=2
			src.updateUsrDialog()

		else if(href_list["create_feed_story"])
			src.screen=3
			src.updateUsrDialog()

		else if(href_list["menu_paper"])
			src.screen=8
			src.updateUsrDialog()
		else if(href_list["print_paper"])
			if(!src.paper_remaining)
				src.screen=21
			else
				src.print_paper()
				src.screen = 20
			src.updateUsrDialog()

		else if(href_list["menu_censor_story"])
			src.screen=10
			src.updateUsrDialog()

		else if(href_list["menu_censor_channel"])
			src.screen=11
			src.updateUsrDialog()

		else if(href_list["menu_wanted"])
			var/already_wanted = 0
			if(news_network.wanted_issue)
				already_wanted = 1

			if(already_wanted)
				src.channel_name = news_network.wanted_issue.author
				src.msg = news_network.wanted_issue.body
			src.screen = 14
			src.updateUsrDialog()

		else if(href_list["set_wanted_name"])
			src.channel_name = sanitizeSafe(input(usr, "Provide the name of the Wanted person", "Network Security Handler", ""), MAX_LNAME_LEN)
			src.updateUsrDialog()

		else if(href_list["set_wanted_desc"])
			src.msg = sanitize(input(usr, "Provide the a description of the Wanted person and any other details you deem important", "Network Security Handler", ""))
			src.updateUsrDialog()

		else if(href_list["submit_wanted"])
			var/input_param = text2num(href_list["submit_wanted"])
			if(msg == "" || channel_name == "" || scanned_user == "Unknown")
				screen = 16
			else
				var/choice = alert("Please confirm Wanted Issue [(input_param==1) ? ("creation.") : ("edit.")]","Network Security Handler","Confirm","Cancel")
				if(choice=="Confirm")
					scan_user(usr)
					if(input_param==1)          //If input_param == 1 we're submitting a new wanted issue. At 2 we're just editing an existing one.
						news_network.submitWanted(channel_name, msg, scanned_user, photo_data, 0 , 1)
						screen = 15
					else
						if(news_network.wanted_issue.is_admin_message)
							alert("The wanted issue has been distributed by a [company_name] higherup. You cannot edit it.","Ok")
							return
						news_network.submitWanted(channel_name, msg, scanned_user, photo_data)
						screen = 19
			updateUsrDialog()

		else if(href_list["cancel_wanted"])
			if(news_network.wanted_issue.is_admin_message)
				alert("The wanted issue has been distributed by a [company_name] higherup. You cannot take it down.","Ok")
				return
			var/choice = alert("Please confirm Wanted Issue removal","Network Security Handler","Confirm","Cancel")
			if(choice=="Confirm")
				news_network.wanted_issue = null
				for(var/obj/machinery/newscaster/NEWSCASTER in GLOB.allCasters)
					NEWSCASTER.update_icon()
				src.screen=17
			src.updateUsrDialog()

		else if(href_list["view_wanted"])
			src.screen=18
			src.updateUsrDialog()
		else if(href_list["censor_channel_author"])
			var/datum/feed_channel/FC = locate(href_list["censor_channel_author"])
			if(FC.is_admin_channel)
				alert("This channel was created by a [company_name] Officer. You cannot censor it.","Ok")
				return
			if(FC.author != "<B>\[REDACTED\]</B>")
				FC.backup_author = FC.author
				FC.author = "<B>\[REDACTED\]</B>"
			else
				FC.author = FC.backup_author
			FC.update()
			// Persist censored author state to DB if channel exists in DB
			if(config && establish_db_connection() && FC.db_id)
				var/sql_censored_author = sanitizeSQL(FC.author)
				var/DBQuery/update = dbcon.NewQuery("UPDATE news_channels SET author='[sql_censored_author]' WHERE id=[FC.db_id]")
				if(!update.Execute())
					log_world("Newscaster DB: failed to update channel author for id [FC.db_id]: [update.ErrorMsg()]")
			src.updateUsrDialog()

		else if(href_list["censor_channel_story_author"])
			var/datum/feed_message/MSG = locate(href_list["censor_channel_story_author"])
			if(MSG.is_admin_message)
				alert("This message was created by a [company_name] Officer. You cannot censor its author.","Ok")
				return
			if(MSG.author != "<B>\[REDACTED\]</B>")
				MSG.backup_author = MSG.author
				MSG.author = "<B>\[REDACTED\]</B>"
			else
				MSG.author = MSG.backup_author
			MSG.parent_channel.update()
			// Persist message author censorship to DB if message has db_id
			if(config && establish_db_connection() && MSG.db_id)
				var/sql_author = sanitizeSQL(MSG.author)
				var/DBQuery/upm = dbcon.NewQuery("UPDATE news_messages SET author='[sql_author]' WHERE id=[MSG.db_id]")
				if(!upm.Execute())
					log_world("Newscaster DB: failed to update message author id [MSG.db_id]: [upm.ErrorMsg()]")
			src.updateUsrDialog()

		else if(href_list["censor_channel_story_body"])
			var/datum/feed_message/MSG = locate(href_list["censor_channel_story_body"])
			if(MSG.is_admin_message)
				alert("This channel was created by a [company_name] Officer. You cannot censor it.","Ok")
				return
			if(MSG.body != "<B>\[REDACTED\]</B>")
				MSG.backup_body = MSG.body
				MSG.backup_caption = MSG.caption
				MSG.backup_img = MSG.img
				MSG.body = "<B>\[REDACTED\]</B>"
				MSG.caption = "<B>\[REDACTED\]</B>"
				MSG.img = null
			else
				MSG.body = MSG.backup_body
				MSG.caption = MSG.caption
				MSG.img = MSG.backup_img

			MSG.parent_channel.update()
			// Persist message censorship to DB if message has db_id
			if(config && establish_db_connection() && MSG.db_id)
				var/sql_body = sanitizeSQL(MSG.body)
				var/sql_caption = sanitizeSQL(MSG.caption)
				var/DBQuery/upb = dbcon.NewQuery("UPDATE news_messages SET body='[sql_body]', caption='[sql_caption]' WHERE id=[MSG.db_id]")
				if(!upb.Execute())
					log_world("Newscaster DB: failed to update message body id [MSG.db_id]: [upb.ErrorMsg()]")
			src.updateUsrDialog()

		else if(href_list["pick_d_notice"])
			var/datum/feed_channel/FC = locate(href_list["pick_d_notice"])
			src.viewing_channel = FC
			src.screen=13
			src.updateUsrDialog()

		else if(href_list["toggle_d_notice"])
			var/datum/feed_channel/FC = locate(href_list["toggle_d_notice"])
			if(FC.is_admin_channel)
				alert("This channel was created by a [company_name] Officer. You cannot place a D-Notice upon it.","Ok")
				return
			FC.censored = !FC.censored
			FC.update()
			// Persist D-Notice (censored flag) to DB if available
			if(config && establish_db_connection() && FC.db_id)
				var/DBQuery/upc = dbcon.NewQuery("UPDATE news_channels SET censored=[(FC.censored) ? (1) : (0)] WHERE id=[FC.db_id]")
				if(!upc.Execute())
					log_world("Newscaster DB: failed to update censored state for channel id [FC.db_id]: [upc.ErrorMsg()]")
			src.updateUsrDialog()

		else if(href_list["view"])
			src.screen=1
			src.updateUsrDialog()

		else if(href_list["setScreen"]) //Brings us to the main menu and resets all fields~
			src.screen = text2num(href_list["setScreen"])
			if (src.screen == 0)
				src.scanned_user = "Unknown";
				msg = "";
				src.c_locked=0;
				channel_name="";
				src.viewing_channel = null
			src.updateUsrDialog()

		else if(href_list["show_channel"])
			var/datum/feed_channel/FC = locate(href_list["show_channel"])
			src.viewing_channel = FC
			src.screen = 9
			src.updateUsrDialog()

		else if(href_list["pick_censor_channel"])
			var/datum/feed_channel/FC = locate(href_list["pick_censor_channel"])
			src.viewing_channel = FC
			src.screen = 12
			src.updateUsrDialog()

		else if(href_list["refresh"])
			src.updateUsrDialog()



/obj/machinery/newscaster/attackby(obj/item/I as obj, mob/user as mob)
	if (src.isbroken)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 100, 1)
		for (var/mob/O in hearers(5, src.loc))
			O.show_message("<EM>[user.name]</EM> further abuses the shattered [src.name].")
	if(istype(I, /obj/item/newspaper) || istype(I, /obj/item/oddity/common/old_newspaper))
		qdel(I)
		ping()
		src.paper_remaining += 1
		to_chat(user, "<span class='info'>This Newscaster has [src.paper_remaining] prints left now.</span>")
		return
	if(istype(I, /obj/item/newspaper_stack))
		ping()
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //No spamming
		src.paper_remaining += 1
		to_chat(user, "<span class='info'>This Newscaster has [src.paper_remaining] prints left now.</span>")
		return
	else
		if(istype(I, /obj/item) )
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			var/obj/item/W = I
			if(W.force <15)
				for (var/mob/O in hearers(5, src.loc))
					O.show_message("[user.name] hits the [src.name] with the [W.name] with no visible effect." )
					playsound(src.loc, 'sound/effects/Glasshit.ogg', 100, 1)
			else
				src.hitstaken++
				if(src.hitstaken==3)
					for (var/mob/O in hearers(5, src.loc))
						O.show_message("[user.name] smashes the [src.name]!" )
					src.isbroken=1
					playsound(src.loc, 'sound/effects/Glassbr3.ogg', 100, 1)
				else
					for (var/mob/O in hearers(5, src.loc))
						O.show_message("[user.name] forcefully slams the [src.name] with the [I.name]!" )
					playsound(src.loc, 'sound/effects/Glasshit.ogg', 100, 1)
		else
			to_chat(user, SPAN_NOTICE("This does nothing."))
	src.update_icon()

/datum/news_photo
	var/is_synth = 0
	var/obj/item/photo/photo = null

/datum/news_photo/New(var/obj/item/photo/p, var/synth)
	is_synth = synth
	photo = p

/obj/machinery/newscaster/proc/AttachPhoto(mob/user as mob)
	if(photo_data)
		if(!photo_data.is_synth)
			photo_data.photo.forceMove(get_turf(src))
			if(!issilicon(user))
				user.put_in_inactive_hand(photo_data.photo)
		qdel(photo_data)

	if(istype(user.get_active_hand(), /obj/item/photo))
		var/obj/item/photo = user.get_active_hand()
		user.drop_item()
		photo.loc = src
		photo_data = new(photo, 0)
	else if(issilicon(user))
		var/mob/living/silicon/tempAI = user
		var/obj/item/photo/selection = tempAI.GetPicture()
		if (!selection)
			return

		photo_data = new(selection, 1)


//########################################################################################################################
//###################################### NEWSPAPER! ######################################################################
//########################################################################################################################

/obj/item/newspaper_stack
	name = "newspaper bundle"
	desc = "A bundle of newspaper ready to hit the ink."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "newspaper_stack"
	w_class = ITEM_SIZE_SMALL //Lets not make it bad to carry

/obj/item/newspaper
	name = "newspaper"
	desc = "An old issue of The Griffon, a widely-circulated galactic newspaper."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "newspaper"
	matter = list(MATERIAL_BIOMATTER = 2)
	w_class = ITEM_SIZE_SMALL	//Let's make it fit in trashbags!
	attack_verb = list("bapped")
	var/screen = 0
	var/pages = 0
	var/curr_page = 0
	var/list/datum/feed_channel/news_content = list()
	var/datum/feed_message/important_message = null
	var/scribble=""
	var/scribble_page = null

/obj/item/newspaper/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		var/dat
		pages = 0
		switch(screen)
			if(0) //Cover
				dat+="<DIV ALIGN='center'><B><FONT SIZE=6>The Griffon</FONT></B></div>"
				dat+="<DIV ALIGN='center'><FONT SIZE=2>[company_name]-standard newspaper, for use on [company_name]© Facilities</FONT></div><HR>"
				if(!length(news_content))
					if(important_message)
						dat+="Contents:<BR><ul><B><FONT COLOR='red'>**</FONT>Important Security Announcement<FONT COLOR='red'>**</FONT></B> <FONT SIZE=2>\[page [src.pages+2]\]</FONT><BR></ul>"
					else
						dat+="<I>Other than the title, the rest of the newspaper is unprinted...</I>"
				else
					dat+="Contents:<BR><ul>"
					for(var/datum/feed_channel/NP in src.news_content)
						src.pages++
					if(src.important_message)
						dat+="<B><FONT COLOR='red'>**</FONT>Important Security Announcement<FONT COLOR='red'>**</FONT></B> <FONT SIZE=2>\[page [src.pages+2]\]</FONT><BR>"
					var/temp_page=0
					for(var/datum/feed_channel/NP in src.news_content)
						temp_page++
						dat+="<B>[NP.channel_name]</B> <FONT SIZE=2>\[page [temp_page+1]\]</FONT><BR>"
					dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:right;'><A href='?src=[REF(src)];next_page=1'>Next Page</A></DIV> <div style='float:left;'><A href='?src=\ref[human_user];mach_close=newspaper_main'>Done reading</A></DIV>"
			if(1) // X channel pages inbetween.
				for(var/datum/feed_channel/NP in news_content)
					pages++ //Let's get it right again.
				var/datum/feed_channel/C = news_content[curr_page]
				dat+="<FONT SIZE=4><B>[C.channel_name]</B></FONT><FONT SIZE=1> \[created by: <FONT COLOR='maroon'>[C.author]</FONT>\]</FONT><BR><BR>"
				if(C.censored)
					dat+="This channel was deemed dangerous to the general welfare of the station and therefore marked with a <B><FONT COLOR='red'>D-Notice</B></FONT>. Its contents were not transferred to the newspaper at the time of printing."
				else
					if(!length(C.messages))
						dat+="No Feed stories stem from this channel..."
					else
						var/i = 0
						for(var/datum/feed_message/MESSAGE in C.messages)
							// if(MESSAGE.creationTime > creationTime)
							// 	if(i == 0)
							// 		dat+="No Feed stories stem from this channel..."
							// 	break
							if(i == 0)
								dat+="<ul>"
							i++
							dat+="-[MESSAGE.body] <BR>"
							if(MESSAGE.img)
								user << browse_rsc(MESSAGE.img, "tmp_photo[i].png")
								dat+="<img src='tmp_photo[i].png' width = '180'><BR>"
							dat+="<FONT SIZE=1>\[[MESSAGE.message_type] by <FONT COLOR='maroon'>[MESSAGE.author]</FONT>\]</FONT><BR><BR>"
						dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<BR><HR><DIV STYLE='float:left;'><A href='?src=[REF(src)];prev_page=1'>Previous Page</A></DIV> <DIV STYLE='float:right;'><A href='?src=[REF(src)];next_page=1'>Next Page</A></DIV>"
			if(2) //Last page
				for(var/datum/feed_channel/NP in src.news_content)
					src.pages++
				if(src.important_message!=null)
					dat+="<DIV STYLE='float:center;'><FONT SIZE=4><B>Wanted Issue:</B></FONT SIZE></DIV><BR><BR>"
					dat+="<B>Criminal name</B>: <FONT COLOR='maroon'>[important_message.author]</FONT><BR>"
					dat+="<B>Description</B>: [important_message.body]<BR>"
					dat+="<B>Photo:</B>: "
					if(important_message.img)
						user << browse_rsc(important_message.img, "tmp_photow.png")
						dat+="<BR><img src='tmp_photow.png' width = '180'>"
					else
						dat+="None"
				else
					dat+="<I>Apart from some uninteresting Classified ads, there's nothing on this page...</I>"
				if(scribble_page==curr_page)
					dat+="<BR><I>There is a small scribble near the end of this page... It reads: \"[src.scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:left;'><A href='?src=[REF(src)];prev_page=1'>Previous Page</A></DIV>"
			else
				dat+="I'm sorry to break your immersion. This shit's bugged. Report this bug to code staff"

		dat+="<BR><HR><div align='center'>[src.curr_page+1]</div>"
		human_user << browse(HTML_SKELETON(dat), "window=newspaper_main;size=300x400")
		onclose(human_user, "newspaper_main")
	else
		to_chat(user, "The paper is full of intelligible symbols!")


obj/item/newspaper/Topic(href, href_list)
	var/mob/living/U = usr
	..()
	if ((src in U.contents) || ( istype(loc, /turf) && in_range(src, U) ))
		U.set_machine(src)
		if(href_list["next_page"])
			if(curr_page==src.pages+1)
				return //Don't need that at all, but anyway.
			if(src.curr_page == src.pages) //We're at the middle, get to the end
				src.screen = 2
			else
				if(curr_page == 0) //We're at the start, get to the middle
					src.screen=1
			src.curr_page++
			playsound(src.loc, "pageturn", 50, 1)

		else if(href_list["prev_page"])
			if(curr_page == 0)
				return
			if(curr_page == 1)
				src.screen = 0

			else
				if(curr_page == src.pages+1) //we're at the end, let's go back to the middle.
					src.screen = 1
			src.curr_page--
			playsound(src.loc, "pageturn", 50, 1)

		if (ismob(loc))
			src.attack_self(loc)


obj/item/newspaper/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pen))
		if(src.scribble_page == src.curr_page)
			to_chat(user, "<FONT COLOR='blue'>There's already a scribble in this page... You wouldn't want to make things too cluttered, would you?</FONT>")
		else
			var/s = sanitize(input(user, "Write something", "Newspaper", ""))
			s = sanitize(s)
			if (!s)
				return
			if (!in_range(src, usr) && src.loc != usr)
				return
			src.scribble_page = src.curr_page
			src.scribble = s
			src.attack_self(user)
		return


////////////////////////////////////helper procs


/obj/machinery/newscaster/proc/scan_user(mob/living/user as mob)
	if(istype(user,/mob/living/carbon/human))                       //User is a human
		var/mob/living/carbon/human/human_user = user
		var/obj/item/card/id/id = human_user.GetIdCard()
		if(istype(id))                                      //Newscaster scans you
			src.scanned_user = GetNameAndAssignmentFromId(id)
		else
			src.scanned_user = "Unknown"
	else
		var/mob/living/silicon/ai_user = user
		src.scanned_user = "[ai_user.name] ([ai_user.job])"


/obj/machinery/newscaster/proc/print_paper()

	var/obj/item/newspaper/NEWSPAPER = new /obj/item/newspaper
	for(var/datum/feed_channel/FC in news_network.network_channels)
		NEWSPAPER.news_content += FC
	if(news_network.wanted_issue)
		NEWSPAPER.important_message = news_network.wanted_issue
	NEWSPAPER.loc = get_turf(src)
	src.paper_remaining--
	return

/obj/machinery/newscaster/proc/remove_alert()
	alert = FALSE
	update_icon()

/obj/machinery/newscaster/proc/newsAlert(channel, update_alert = TRUE)
	var/turf/T = get_turf(src)

	if(channel)
		if(update_alert)
			for(var/mob/O in hearers(world.view-1, T))
				O.show_message("<span class='newscaster'><EM>[src.name]</EM> beeps, \"Breaking news from [channel]!\"</span>",2)
			playsound(loc, 'sound/machines/twobeep.ogg', 75, TRUE)
		alert = TRUE
		update_icon()
		addtimer(CALLBACK(src, PROC_REF(remove_alert)),alert_delay,TIMER_UNIQUE|TIMER_OVERRIDE)

	else if(!channel && update_alert)
		for(var/mob/O in hearers(world.view-1, T))
			O.show_message("<span class='newscaster'><EM>[src.name]</EM> beeps, \"Attention! Wanted issue distributed!\"</span>",2)
		playsound(loc, 'sound/machines/warning-buzzer.ogg', 75, TRUE)
