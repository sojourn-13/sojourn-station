//Database-based whitelist system
//This replaces the old file-based whitelist system

// Global variables for caching
var/list/database_whitelist = null
var/database_whitelist_loaded = 0

/hook/startup/proc/loadDatabaseWhitelist()
	if(config.usewhitelist)
		load_database_whitelist()
	return 1

/proc/load_database_whitelist()
	log_world("DEBUG: Attempting to load database whitelist...")
	log_world("DEBUG: SQL enabled status: [config.sql_enabled]")
	
	if(!config.sql_enabled)
		log_world("DEBUG: SQL is disabled in config. Using file-based system.")
		load_whitelist()
		return
		
	if(!establish_db_connection())
		// Fall back to file-based system if database is not available
		log_world("Database connection failed for whitelist. Using file-based system.")
		log_world("DEBUG: Failed DB connections count: [failed_db_connections]")
		if(dbcon)
			log_world("DEBUG: Database error: [dbcon.ErrorMsg()]")
		else
			log_world("DEBUG: No database connection object exists")
		load_whitelist() // Call the old file-based function
		return

	log_world("DEBUG: Database connection established successfully for whitelist")
	
	// Create whitelist table if it doesn't exist
	create_whitelist_table()

	// Load whitelist from database
	var/DBQuery/query = dbcon.NewQuery("SELECT ckey FROM whitelist WHERE active = 1")
	if(!query.Execute())
		log_world("Failed to load whitelist from database: [query.ErrorMsg()]")
		// Fall back to file-based system
		load_whitelist()
		return

	database_whitelist = list()
	while(query.NextRow())
		var/ckey = query.item[1]
		if(ckey)
			database_whitelist[ckey] = 1

	database_whitelist_loaded = 1
	log_world("Loaded [database_whitelist.len] entries from database whitelist.")

/proc/create_whitelist_table()
	log_world("DEBUG: Attempting to create whitelist table...")
	var/DBQuery/query = dbcon.NewQuery("CREATE TABLE IF NOT EXISTS whitelist (id INT AUTO_INCREMENT PRIMARY KEY, ckey VARCHAR(32) NOT NULL, added_by VARCHAR(32), added_date DATETIME DEFAULT CURRENT_TIMESTAMP, active BOOLEAN DEFAULT TRUE, notes TEXT, UNIQUE KEY unique_ckey (ckey), INDEX idx_ckey_active (ckey, active), INDEX idx_active (active)) ENGINE=InnoDB DEFAULT CHARSET=utf8")

	if(!query.Execute())
		log_world("Failed to create whitelist table: [query.ErrorMsg()]")
	else
		log_world("DEBUG: Whitelist table created/verified successfully")

/proc/check_database_whitelist(mob/M)
	var/ckey_to_check = ckey(M.ckey)

	// If database whitelist is not loaded, try database first
	if(!database_whitelist_loaded)
		if(establish_db_connection())
			var/DBQuery/query = dbcon.NewQuery("SELECT 1 FROM whitelist WHERE ckey = ? AND active = 1")
			query.Execute(list(ckey_to_check))
			if(query.NextRow())
				return 1
		// Fall back to file-based check
		return check_whitelist(M)

	// Use cached database whitelist
	return (ckey_to_check in database_whitelist)

/proc/add_to_database_whitelist(var/target_ckey, var/added_by_ckey = null, var/notes = null)
	if(!establish_db_connection())
		return 0

	target_ckey = ckey(target_ckey)
	if(added_by_ckey)
		added_by_ckey = ckey(added_by_ckey)

	var/DBQuery/query = dbcon.NewQuery("INSERT INTO whitelist (ckey, added_by, notes) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE active = TRUE, added_by = VALUES(added_by), notes = VALUES(notes), added_date = CURRENT_TIMESTAMP")

	if(query.Execute(list(target_ckey, added_by_ckey, notes)))
		// Update cache
		if(database_whitelist_loaded)
			database_whitelist[target_ckey] = 1
		log_admin("Added [target_ckey] to database whitelist" + (added_by_ckey ? " by [added_by_ckey]" : ""))
		return 1
	else
		log_world("Failed to add [target_ckey] to database whitelist: [query.ErrorMsg()]")
		return 0

/proc/remove_from_database_whitelist(var/target_ckey, var/removed_by_ckey = null)
	if(!establish_db_connection())
		return 0

	target_ckey = ckey(target_ckey)
	if(removed_by_ckey)
		removed_by_ckey = ckey(removed_by_ckey)

	var/DBQuery/query = dbcon.NewQuery("UPDATE whitelist SET active = FALSE WHERE ckey = ?")

	if(query.Execute(list(target_ckey)))
		// Update cache
		if(database_whitelist_loaded && (target_ckey in database_whitelist))
			database_whitelist.Remove(target_ckey)
		log_admin("Removed [target_ckey] from database whitelist" + (removed_by_ckey ? " by [removed_by_ckey]" : ""))
		return 1
	else
		log_world("Failed to remove [target_ckey] from database whitelist: [query.ErrorMsg()]")
		return 0

/proc/migrate_file_whitelist_to_database()
	if(!establish_db_connection())
		log_world("Cannot migrate whitelist: Database connection failed")
		return 0

	// Load the old file-based whitelist
	var/list/file_whitelist = file2list("data/whitelist.txt")
	if(!file_whitelist || !file_whitelist.len)
		log_world("No file-based whitelist found to migrate")
		return 1

	var/migrated_count = 0
	var/failed_count = 0

	for(var/entry in file_whitelist)
		var/clean_ckey = ckey(entry)
		if(clean_ckey)
			if(add_to_database_whitelist(clean_ckey, null, "Migrated from file-based whitelist"))
				migrated_count++
			else
				failed_count++

	log_world("Whitelist migration completed: [migrated_count] successful, [failed_count] failed")
	return 1

// Admin verbs for managing database whitelist
ADMIN_VERB_ADD(/client/proc/db_whitelist_add, R_ADMIN, FALSE)
/client/proc/db_whitelist_add()
	set name = "Database Whitelist - Add Player"
	set category = "Admin"

	var/target_ckey = input("Enter ckey to add to whitelist:", "Add to Whitelist") as text|null
	if(!target_ckey)
		return

	var/notes = input("Enter notes (optional):", "Add to Whitelist") as text|null

	if(add_to_database_whitelist(target_ckey, src.ckey, notes))
		to_chat(src, "<span class='notice'>Successfully added [target_ckey] to the database whitelist.</span>")
		log_and_message_admins("[key_name(src)] added [target_ckey] to the database whitelist.")
	else
		to_chat(src, "<span class='warning'>Failed to add [target_ckey] to the database whitelist.</span>")

ADMIN_VERB_ADD(/client/proc/db_whitelist_remove, R_ADMIN, FALSE)
/client/proc/db_whitelist_remove()
	set name = "Database Whitelist - Remove Player"
	set category = "Admin"

	var/target_ckey = input("Enter ckey to remove from whitelist:", "Remove from Whitelist") as text|null
	if(!target_ckey)
		return

	if(remove_from_database_whitelist(target_ckey, src.ckey))
		to_chat(src, "<span class='notice'>Successfully removed [target_ckey] from the database whitelist.</span>")
		log_and_message_admins("[key_name(src)] removed [target_ckey] from the database whitelist.")
	else
		to_chat(src, "<span class='warning'>Failed to remove [target_ckey] from the database whitelist.</span>")

ADMIN_VERB_ADD(/client/proc/db_whitelist_migrate, R_ADMIN, FALSE)
/client/proc/db_whitelist_migrate()
	set name = "Database Whitelist - Migrate from File"
	set category = "Admin"

	var/confirm = alert("This will migrate the file-based whitelist to the database. Continue?", "Migrate Whitelist", "Yes", "No")
	if(confirm != "Yes")
		return

	to_chat(src, "<span class='notice'>Starting whitelist migration...</span>")
	if(migrate_file_whitelist_to_database())
		to_chat(src, "<span class='notice'>Whitelist migration completed successfully.</span>")
		log_and_message_admins("[key_name(src)] migrated the file-based whitelist to database.")
	else
		to_chat(src, "<span class='warning'>Whitelist migration failed.</span>")

ADMIN_VERB_ADD(/client/proc/db_whitelist_list, R_ADMIN, FALSE)
/client/proc/db_whitelist_list()
	set name = "Database Whitelist - View Players"
	set category = "Admin"

	if(!establish_db_connection())
		to_chat(src, "<span class='warning'>Database connection failed.</span>")
		return

	var/DBQuery/query = dbcon.NewQuery("SELECT ckey, added_by, added_date, notes FROM whitelist WHERE active = 1 ORDER BY ckey")
	if(!query.Execute())
		to_chat(src, "<span class='warning'>Failed to query whitelist: [query.ErrorMsg()]</span>")
		return

	var/list/output = list()
	output += "<html><head><title>Database Whitelist</title></head><body>"
	output += "<h2>Database Whitelist</h2>"
	output += "<table border='1' cellpadding='3' cellspacing='0'>"
	output += "<tr><th>CKey</th><th>Added By</th><th>Added Date</th><th>Notes</th></tr>"

	while(query.NextRow())
		var/ckey = query.item[1]
		var/added_by = query.item[2] ? query.item[2] : "Unknown"
		var/added_date = query.item[3] ? query.item[3] : "Unknown"
		var/notes = query.item[4] ? query.item[4] : ""

		output += "<tr><td>[ckey]</td><td>[added_by]</td><td>[added_date]</td><td>[notes]</td></tr>"

	output += "</table>"
	output += "<p>Total entries: [query.RowCount()]</p>"
	output += "</body></html>"

	var/datum/browser/popup = new(src, "db_whitelist", "Database Whitelist", 800, 600)
	popup.set_content(jointext(output, ""))
	popup.open()
