#define BORDER_CONTROL_DISABLED 0
#define BORDER_CONTROL_LEARNING 1
#define BORDER_CONTROL_ENFORCED 2

var/list/whitelistedCkeys
var/savefile/borderControlFile = new /savefile("data/bordercontrol.db")
var/whitelistLoaded = 0

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyAllowedToConnect(var/key)

	if(config.borderControl == BORDER_CONTROL_DISABLED)
		return 1
	else if (config.borderControl == BORDER_CONTROL_LEARNING)
		BC_WhitelistKey(key)
		return 1
	else
		return BC_IsKeyWhitelisted(key)

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyWhitelisted(var/key)

	if(!whitelistLoaded)
		BC_LoadWhitelist()

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

	if(!whitelistLoaded)
		BC_LoadWhitelist()

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

	var/choice = input("New State", "Border Control State") as null|anything in list("Disabled", "Learning", "Enforced")

	if(choice == "Disabled")
		config.borderControl = BORDER_CONTROL_DISABLED
		usr << "Border control has been disabled for this round"
	else if (choice == "Disabled")
		config.borderControl = BORDER_CONTROL_LEARNING
		usr << "Border control has learning mode."
		usr << "New connections will be automatically allowed and whitelisted"
	else if (choice == "Enforced")
		config.borderControl = BORDER_CONTROL_ENFORCED
		usr << "Border control has been enabled for this round"

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
