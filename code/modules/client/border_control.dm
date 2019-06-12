#define BORDER_CONTROL_DISABLED 0
#define BORDER_CONTROL_LEARNING 1
#define BORDER_CONTROL_ENFORCED 2

var/list/whitelistedCkeys
var/savefile/borderControlFile = new /savefile("data/bordercontrol.db")
var/whitelistLoaded = 0

//////////////////////////////////////////////////////////////////////////////////
proc/BC_IsKeyAllowedToConnect(var/key)
	key = ckey(key)

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
proc/BC_IsKeyWhitelisted(var/key)
	key = ckey(key)

	if(!whitelistLoaded)
		BC_LoadWhitelist()

	if(LAZYISIN(key,whitelistedCkeys))
		return 1
	else
		return 0

//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/verb/BC_WhitelistKeyVerb, R_ADMIN, FALSE)
/client/verb/BC_WhitelistKeyVerb(key as text)

	set name = "Border Control - Whitelist Key"
	set category = "Admin"

	if(key)
		var/confirm = alert("Add [key] to the border control whitelist?", , "Yes", "No")
		if(confirm == "Yes")
			log_and_message_admins("[key_name(usr)] added [key] to the border whitelist.")
			BC_WhitelistKey(key)


//////////////////////////////////////////////////////////////////////////////////
proc/BC_WhitelistKey(var/key)
	key = ckey(key)

	if(!whitelistLoaded)
		BC_LoadWhitelist()

	if(key)
		if(!LAZYISIN(whitelistedCkeys,key))
			LAZYINITLIST(whitelistedCkeys)

			ADD_SORTED(whitelistedCkeys, key, /proc/cmp_text_asc)
			BC_SaveWhitelist()

		return


//////////////////////////////////////////////////////////////////////////////////
ADMIN_VERB_ADD(/client/verb/BC_RemoveKeyVerb, R_ADMIN, FALSE)
/client/verb/BC_RemoveKeyVerb(key as anything in whitelistedCkeys)

	set name = "Border Control - Remove Key"
	set category = "Admin"

	if(key)
		var/confirm = alert("Remove [key] from the border control whitelist?", , "Yes", "No")
		if(confirm == "Yes")
			log_and_message_admins("[key_name(usr)] removed [key] from the border whitelist.")
			BC_RemoveKey(key)

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
ADMIN_VERB_ADD(/client/verb/BC_ToggleState, R_ADMIN, FALSE)
/client/verb/BC_ToggleState(var/mode as anything in list("Disabled", "Learning", "Enforced"))

	set name = "Border Control - Toggle Mode"
	set category = "Admin"

	switch(mode)
		if("Disabled")
			if(config.borderControl != BORDER_CONTROL_DISABLED)
				config.borderControl = BORDER_CONTROL_DISABLED
				log_and_message_admins("[key_name(usr)] has disabled border control.")
		if("Learning")
			if(config.borderControl != BORDER_CONTROL_LEARNING)
				config.borderControl = BORDER_CONTROL_LEARNING
				log_and_message_admins("[key_name(usr)] has set border control to learn new keys on connection!")
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
