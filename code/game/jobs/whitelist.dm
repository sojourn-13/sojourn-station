#define WHITELISTFILE "data/whitelist.txt"

var/list/whitelist = list()

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	// First try database whitelist
	if(config.sql_enabled)
		return check_database_whitelist(M)

	// Fall back to file-based whitelist
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)


/proc/is_alien_whitelisted(mob/M, var/species)
	// always return true because we don't have xenos and related whitelist
	return 1

#undef WHITELISTFILE
