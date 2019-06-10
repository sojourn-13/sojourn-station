var/list/whitelistedCkeys
var/savefile/borderControlFile = new /savefile("data/bordercontrol.db")
var/whitelistLoaded = 0


//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyWhitelisted(var/key)


	if(!whitelistLoaded)
		whitelistLoaded = 1
		BC_LoadWhitelist()
	if(!config.borderControl)
		BC_WhitelistKey(key)
		return 1
	else
		if(LAZYISIN(key,whitelistedCkeys))
			return 1
		else
			return 0

//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/proc/BC_WhitelistKeyVerb, R_ADMIN, FALSE)
/client/proc/BC_WhitelistKeyVerb()


	set name = "Border Control - Whitelist Key"
	set category = "Admin"

	var/key = input("CKey to Whitelist", "Whitelist Key") as null|text
	BC_WhitelistKey(key)


//////////////////////////////////////////////////////////////////////////////////
proc/BC_WhitelistKey(var/key)

	if(key)
		if(!LAZYISIN(key,whitelistedCkeys))
			LAZYINITLIST(whitelistedCkeys)

			ADD_SORTED(whitelistedCkeys, key, /proc/cmp_text_asc)
			BC_SaveWhitelist()

		return


//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/proc/BC_RemoveKeyVerb, R_ADMIN, FALSE)
/client/proc/BC_RemoveKeyVerb()

	set name = "Border Control - Remove Key"
	set category = "Admin"

	var/keyToRemove = input("CKey to Remove", "Remove Key") as null|anything in whitelistedCkeys

	if(keyToRemove)
		BC_RemoveKey(keyToRemove)

	return


//////////////////////////////////////////////////////////////////////////////////
/client/proc/BC_RemoveKey(var/key)

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

	set name = "Border Control - Toggle State"
	set category = "Admin"



	config.borderControl = !config.borderControl


	if(config.borderControl)
		usr << "Border control has been enabled for this round"
	else
		usr << "Border control has been disabled for this round"
		usr << "New connections will be automatically whitelisted"

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


//////////////////////////////////////////////////////////////////////////////////
proc/BC_SaveWhitelist()
	if(!whitelistedCkeys)
		return 0

	if(!borderControlFile)
		return 0

	borderControlFile["WhitelistedCkeys"] << whitelistedCkeys
