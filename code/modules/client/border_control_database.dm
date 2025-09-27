//Enhanced border control with database whitelist integration
//This extends the border control system to use the database whitelist

/proc/BC_IsKeyWhitelistedDB(var/key)
	key = ckey(key)

	// First check database whitelist if SQL is enabled
	if(config.sql_enabled && establish_db_connection())
		var/DBQuery/query = dbcon.NewQuery("SELECT 1 FROM whitelist WHERE ckey = ? AND active = 1")
		if(query.Execute(list(key)) && query.NextRow())
			return 1

	// Fall back to file-based border control whitelist
	return BC_IsKeyWhitelisted(key)

/proc/BC_WhitelistKeyDB(var/key, var/added_by = null, var/notes = null)
	key = ckey(key)

	// Try to add to database whitelist first
	if(config.sql_enabled && establish_db_connection())
		if(add_to_database_whitelist(key, added_by, notes))
			return 1

	// Fall back to file-based system
	return BC_WhitelistKey(key)

/proc/BC_RemoveKeyDB(var/key, var/removed_by = null)
	key = ckey(key)

	// Try to remove from database whitelist first
	if(config.sql_enabled && establish_db_connection())
		if(remove_from_database_whitelist(key, removed_by))
			return 1

	// Fall back to file-based system - do it directly since BC_RemoveKey is a client proc
	if(!whitelistLoaded)
		BC_LoadWhitelist()

	if(!LAZYISIN(whitelistedCkeys, key))
		return 1
	else
		if(whitelistedCkeys)
			whitelistedCkeys.Remove(key)
		BC_SaveWhitelist()
		return 1// Enhanced admin verbs for border control with database integration
/*ADMIN_VERB_ADD(/client/proc/BC_WhitelistKeyVerbDB, R_ADMIN, FALSE)
/client/proc/BC_WhitelistKeyVerbDB()
	set name = "Border Control - Whitelist Key (Database)"
	set category = "Admin"

	var/key = input("CKey to Whitelist", "Whitelist Key") as null|text
	if(!key)
		return

	var/notes = input("Enter notes (optional):", "Whitelist Key") as text|null

	var/confirm = alert("Add [key] to the border control whitelist (database)?", , "Yes", "No")
	if(confirm == "Yes")
		if(BC_WhitelistKeyDB(key, src.ckey, notes))
			to_chat(src, "<span class='notice'>Successfully added [key] to the whitelist.</span>")
			log_and_message_admins("[key_name(src)] added [key] to the border whitelist (database).")
		else
			to_chat(src, "<span class='warning'>Failed to add [key] to the whitelist.</span>")

ADMIN_VERB_ADD(/client/proc/BC_RemoveKeyVerbDB, R_ADMIN, FALSE)
/client/proc/BC_RemoveKeyVerbDB()
	set name = "Border Control - Remove Key (Database)"
	set category = "Admin"

	var/keyToRemove = input("CKey to Remove", "Remove Key") as null|text
	if(!keyToRemove)
		return

	var/confirm = alert("Remove [keyToRemove] from the border control whitelist (database)?", , "Yes", "No")
	if(confirm == "Yes")
		if(BC_RemoveKeyDB(keyToRemove, src.ckey))
			to_chat(src, "<span class='notice'>Successfully removed [keyToRemove] from the whitelist.</span>")
			log_and_message_admins("[key_name(src)] removed [keyToRemove] from the border whitelist (database).")
		else
			to_chat(src, "<span class='warning'>Failed to remove [keyToRemove] from the whitelist.</span>")

// Migration verb for border control
ADMIN_VERB_ADD(/client/proc/BC_MigrateToDatabase, R_ADMIN, FALSE)
/client/proc/BC_MigrateToDatabase()
	set name = "Database Whitelist - Migrate to Database"
	set category = "Admin"

	var/confirm = alert("This will migrate border control whitelist to the database. Continue?", "Migrate Border Control", "Yes", "No")
	if(confirm != "Yes")
		return

	if(!establish_db_connection())
		to_chat(src, "<span class='warning'>Database connection failed.</span>")
		return

	// Load border control whitelist
	if(!whitelistLoaded)
		BC_LoadWhitelist()

	if(!whitelistedCkeys || !whitelistedCkeys.len)
		to_chat(src, "<span class='warning'>No border control whitelist entries found to migrate.</span>")
		return

	var/migrated_count = 0
	var/failed_count = 0

	for(var/ckey_entry in whitelistedCkeys)
		if(add_to_database_whitelist(ckey_entry, src.ckey, "Migrated from border control file"))
			migrated_count++
		else
			failed_count++

	to_chat(src, "<span class='notice'>Border control migration completed: [migrated_count] successful, [failed_count] failed.</span>")
	log_and_message_admins("[key_name(src)] migrated border control whitelist to database: [migrated_count] successful, [failed_count] failed.")
*/
