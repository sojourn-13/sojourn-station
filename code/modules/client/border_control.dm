#define BORDER_CONTROL_DISABLED 0
#define BORDER_CONTROL_LEARNING 1
#define BORDER_CONTROL_ENFORCED 2

var/list/whitelistedCkeys
var/savefile/borderControlFile = new /savefile("data/bordercontrol.db")
var/whitelistLoaded = 0

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyAllowedToConnect(var/key)
	key = ckey(key)
	if(BC_IsDiscordLinked(key) == 0)
		return 0
	if(config.borderControl == BORDER_CONTROL_DISABLED)
		return 1
	else if (config.borderControl == BORDER_CONTROL_LEARNING)
		if(!BC_IsKeyWhitelisted(key))
			log_and_message_admins("[key] has joined and was added to the border whitelist.")
		BC_WhitelistKey(key)
		return 1
	else
		return BC_IsKeyWhitelisted(key)

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsDiscordLinked(var/key)
	key = ckey(key)
	if(!config.sql_enabled || !establish_db_connection())
		return 0
	if (config.require_discord_linking == 0)
		return 1
	if(!dbcon || !dbcon.IsConnected())
		return 0

	var/DBQuery/query = dbcon.NewQuery("SELECT discord_id FROM players WHERE ckey = '[key]' AND discord_id IS NOT NULL AND discord_id != ''")
	if(!query.Execute())
		return 0

	if(query.NextRow())
		return 1
	return 0

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyWhitelisted(var/key)
	key = ckey(key)

	// If SQL is enabled, always check the database directly so border control
	// reflects the latest whitelist state on every connection attempt.
	if(config.sql_enabled && dbcon && dbcon.IsConnected())
		var/DBQuery/q = dbcon.NewQuery("SELECT 1 FROM whitelist WHERE ckey = '[key]' AND active = 1 LIMIT 1")
		if(!q)
			log_and_message_admins("[key] whitelist check: failed to prepare DB query (null query object).")
			// fall back to file-based check
		else if(!q.Execute())
			log_and_message_admins("[key] whitelist check: DB query execution failed: [dbcon.ErrorMsg()]")
			// fall back to file-based check
		else
			if(q.NextRow())
				return 1
			// No match in DB; explicit not whitelisted
			return 0

	// Fall back to file-backed whitelist
	if(!whitelistLoaded)
		BC_LoadWhitelist()

	return LAZYISIN(whitelistedCkeys, key)

//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/proc/BC_WhitelistKeyVerb, R_ADMIN, FALSE)
/client/proc/BC_WhitelistKeyVerb()

	set name = "Border Control - Whitelist Key"
	set category = "Admin"

	var/key = input("CKey to Whitelist", "Whitelist Key") as null|text

	if(key)
		var/confirm = alert("Add [key] to the border control whitelist?", , "Yes", "No")
		if(confirm == "Yes")
			log_and_message_admins("[key_name(usr)] added [key] to the border whitelist.")
			BC_WhitelistKey(key, src.ckey)


//////////////////////////////////////////////////////////////////////////////////
proc/BC_WhitelistKey(var/key, var/added_by = "server")
	key = ckey(key)

	if(!whitelistLoaded)
		BC_LoadWhitelist()

	if(key)
		// If SQL is enabled & connected, try to insert/update the whitelist row there first
		if(config.sql_enabled && dbcon && dbcon.IsConnected())
			var/DBQuery/ins = dbcon.NewQuery("INSERT INTO whitelist (ckey, active, added_by, added_at) VALUES ('[key]', 1, '[sql_sanitize_text(added_by)]', NOW()) ON DUPLICATE KEY UPDATE active = 1, added_by = '[sql_sanitize_text(added_by)]', added_at = NOW()")
			if(!ins)
				log_and_message_admins("Failed to prepare DB insert for whitelisting [key]. Falling back to file-backed whitelist.")
			else if(!ins.Execute())
				log_and_message_admins("DB whitelisting for [key] failed: [dbcon.ErrorMsg()]. Falling back to file-backed whitelist.")
			else
				log_and_message_admins("[added_by] added [key] to SQL whitelist.")
				// Also keep the file-backed list in sync for tools that rely on it
				if(!whitelistLoaded)
					BC_LoadWhitelist()
				if(!LAZYISIN(whitelistedCkeys,key))
					LAZYINITLIST(whitelistedCkeys)
					ADD_SORTED(whitelistedCkeys, key, GLOBAL_PROC_REF(cmp_text_asc))
					if(!BC_SaveWhitelist())
						log_and_message_admins("Warning: failed to save file-backed whitelist after SQL add for [key].")
				return 1

		// Fallback: operate on the file-backed whitelist
		if(!whitelistLoaded)
			BC_LoadWhitelist()

		if(key)
			if(!LAZYISIN(whitelistedCkeys,key))
				LAZYINITLIST(whitelistedCkeys)
				ADD_SORTED(whitelistedCkeys, key, GLOBAL_PROC_REF(cmp_text_asc))
				if(!BC_SaveWhitelist())
					log_and_message_admins("Warning: failed to save file-backed whitelist for [key].")
				return 1
			else // Already in
				return 0

//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/proc/BC_RemoveKeyVerb, R_ADMIN, FALSE)
/client/proc/BC_RemoveKeyVerb()

	set name = "Border Control - Remove Key"
	set category = "Admin"

	var/keyToRemove = input("CKey to Remove", "Remove Key") as null|anything in whitelistedCkeys

	if(keyToRemove)
		var/confirm = alert("Remove [keyToRemove] from the border control whitelist?", , "Yes", "No")
		if(confirm == "Yes")
			log_and_message_admins("[key_name(usr)] removed [keyToRemove] from the border whitelist.")
			BC_RemoveKey(keyToRemove)

	return


//////////////////////////////////////////////////////////////////////////////////
/client/proc/BC_RemoveKey(var/key)
	key = ckey(key)

	if(!LAZYISIN(whitelistedCkeys, key))
		return 1
	else
		if(whitelistedCkeys)
			whitelistedCkeys.Remove(key)
		BC_SaveWhitelist()
		return 1




//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/proc/BC_ToggleState, R_ADMIN, FALSE)
/client/proc/BC_ToggleState()

	set name = "Border Control - Toggle Mode"
	set category = "Admin"

	var/choice = input("New State", "Border Control State") as null|anything in list("Disabled", "Learning", "Enforced")

	switch(choice)
		if("Disabled")
			if(config.borderControl != BORDER_CONTROL_DISABLED)
				config.borderControl = BORDER_CONTROL_DISABLED
				log_and_message_admins("[key_name(usr)] has disabled border control.")
		if("Learning")
			if(config.borderControl != BORDER_CONTROL_LEARNING)
				config.borderControl = BORDER_CONTROL_LEARNING
				log_and_message_admins("[key_name(usr)] has set border control to learn new keys on connection!")
			var/confirm = alert("Learn currently connected keys?", , "Yes", "No")
			if(confirm == "Yes")
				for(var/client/C in clients)
					if (BC_WhitelistKey(C.key))
						log_and_message_admins("[key_name(usr)] added [C.key] to the border whitelist by adding all current clients.")

		if("Enforced")
			if(config.borderControl != BORDER_CONTROL_ENFORCED)
				config.borderControl = BORDER_CONTROL_ENFORCED
				log_and_message_admins("[key_name(usr)] has enforced border controls. New keys can no longer join.")

	// Else do nothing

	return


//////////////////////////////////////////////////////////////////////////////////

/hook/startup/proc/loadBorderControlWhitelistHook()
	BC_LoadWhitelist()
	return 1

//////////////////////////////////////////////////////////////////////////////////
/proc/BC_LoadWhitelist()

	LAZYCLEARLIST(whitelistedCkeys)

	LAZYINITLIST(whitelistedCkeys)

	if(!borderControlFile)
		return 0

	borderControlFile["WhitelistedCkeys"] >> whitelistedCkeys

	whitelistLoaded = 1


//////////////////////////////////////////////////////////////////////////////////
proc/BC_SaveWhitelist()
	if(!whitelistedCkeys)
		return 0

	if(!borderControlFile)
		return 0

	borderControlFile["WhitelistedCkeys"] << whitelistedCkeys
	return 1
