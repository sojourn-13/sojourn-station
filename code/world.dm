//This file is just for the necessary /world definition
//Try looking in game/world.dm

/**
 * # World
 *
 * Two possibilities exist: either we are alone in the Universe or we are not. Both are equally terrifying. ~ Arthur C. Clarke
 *
 * The byond world object stores some basic byond level config, and has a few hub specific procs for managing hub visiblity
 *
 * The world /New() is the root of where a round itself begins
 */

/world
	visibility = 0
	mob = /mob/new_player
	turf = /turf/space
	area = /area/space
	view = "15x15"
	hub = "Exadv1.spacestation13"
	cache_lifespan = 0	//stops player uploaded stuff from being kept in the rsc past the current session

////////////////////////////////////////////////////////////////////////////////////////////////

// This function enable_debugger() enables local or remote (requires opening a port on router) debugging if the computer running this has set env EXTOOLS_DLL.
// Only runs if env var EXTOOLS_DLL is set otherwise it won't load the dll file.
// Used with the Visual Studio Code debugger and DreamMaker Language Client extension from https://github.com/SpaceManiac/SpacemanDMM/wiki/Setting-up-Debugging

////////////////////////////////////////////////////////////////////////////////////////////////

/hook/startup/proc/loadAd()
	world.load_ad()
	return 1

/world/proc/load_ad()
	server_ad = file2text("config/advert.txt")

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

/world/proc/change_fps(new_value = 30)
	if(new_value <= 0)
		CRASH("change_fps() called with [new_value] new_value.")
	if(fps == new_value)
		return //No change required.

	fps = new_value

