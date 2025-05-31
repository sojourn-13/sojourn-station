GLOBAL_DATUM_INIT(maps_data, /datum/maps_data, new)

/proc/isStationLevel(var/level)
	return level in GLOB.maps_data.station_levels

/proc/isNotStationLevel(var/level)
	return !isStationLevel(level)

/proc/isOnStationLevel(var/atom/A)
	var/turf/T = get_turf(A)
	return T && isStationLevel(T.z)

/proc/isPlayerLevel(var/level)
	return level in GLOB.maps_data.player_levels

/proc/isOnPlayerLevel(var/atom/A)
	var/turf/T = get_turf(A)
	return T && isPlayerLevel(T.z)

/proc/isContactLevel(var/level)
	return level in GLOB.maps_data.player_levels

/proc/isOnContactLevel(var/atom/A)
	var/turf/T = get_turf(A)
	return T && isContactLevel(T.z)

//Checks for sealed Z-levels.
/proc/isSealedLevel(level)
	return level in GLOB.maps_data.sealed_levels

/proc/isOnSealedLevel(atom/A)
	var/turf/T = get_turf(A)
	return T && isSealedLevel(T.z)

/proc/isAdminLevel(var/level)
	return level in GLOB.maps_data.admin_levels

/proc/isNotAdminLevel(var/level)
	return !isAdminLevel(level)

/proc/isOnAdminLevel(var/atom/A)
	var/turf/T = get_turf(A)
	return T && isAdminLevel(T.z)

/proc/get_level_name(var/level)
	return (GLOB.maps_data.names.len >= level && GLOB.maps_data.names[level]) || level

/proc/max_default_z_level()
	return GLOB.maps_data.all_levels.len

/proc/is_on_same_plane_or_station(var/z1, var/z2)
	if(z1 == z2)
		return TRUE
	if(isStationLevel(z1) && isStationLevel(z2))
		return TRUE
	return FALSE

/proc/is_allowed_digsites(var/level)
	return level in GLOB.maps_data.allowed_digsites

ADMIN_VERB_ADD(/client/proc/test_MD, R_DEBUG, null)
/client/proc/test_MD()
	set name = "Check level data"
	set category = "Debug"

	var/turf/T = get_turf(mob)

	to_chat(mob, "<b>We are at [T.z] level.</b>")

	to_chat(mob, "level name is [get_level_name(T.z)]")

	to_chat(mob, "isStationLevel: [isStationLevel(mob.z)]")
	to_chat(mob, "isNotStationLevel: [isNotStationLevel(mob.z)]")
	to_chat(mob, "isOnStationLevel: [isOnStationLevel(mob)]")

	to_chat(mob, "isPlayerLevel: [isPlayerLevel(mob.z)]")
	to_chat(mob, "isOnPlayerLevel: [isOnPlayerLevel(mob)]")

	to_chat(mob, "isAdminLevel: [isAdminLevel(mob.z)]")
	to_chat(mob, "isNotAdminLevel: [isNotAdminLevel(mob.z)]")
	to_chat(mob, "isOnAdminLevel: [isOnAdminLevel(mob)]")

	to_chat(mob, "isAcessableLevel: [GLOB.maps_data.accessable_levels[num2text(mob.z)]]")

	to_chat(mob, "allowed_digsites: [is_allowed_digsites(mob.z)]")

	if(GLOB.maps_data.asteroid_levels[num2text(T.z)])
		to_chat(mob, "Asteroid will be generated here")
	else
		to_chat(mob, "This isn't asteroid level")

/datum/maps_data
	var/list/all_levels        = new
	var/list/station_levels    = new // Z-levels the station exists on
	var/list/admin_levels      = new // Z-levels for admin functionality (Centcom, shuttle transit, etc)
	var/list/player_levels     = new // Z-levels a character can typically reach
	var/list/contact_levels    = new // Z-levels that can be contacted from the station, for eg announcements
	var/list/sealed_levels	   = new // Z-levels that don't allow random transit at edge
	var/list/asteroid_levels    = new
	var/list/accessable_levels = new
	var/list/empty_levels = null     // Empty Z-levels that may be used for various things
	var/list/names = new
	var/list/allowed_digsites = list()
	var/security_state = /decl/security_state/default // The default security state system to use.

	var/list/loadout_blacklist	//list of types of loadout items that will not be pickable

	var/default_spawn = "Cryogenic Storage"

	var/allowed_jobs = list(/datum/job/premier, /datum/job/rd, /datum/job/pg, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/swo, /datum/job/smc, /datum/job/foreman,
						/datum/job/supsec, /datum/job/inspector, /datum/job/officer, /datum/job/officerjr,
						/datum/job/serg, /datum/job/medspec, /datum/job/trooper, /datum/job/cadet,
						/datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist, /datum/job/medstudent,
						/datum/job/technomancer, /datum/job/apprentice,
						/datum/job/cargo_tech, /datum/job/mining, /datum/job/merchant,
						/datum/job/salvager, /datum/job/pro, /datum/job/fence,
						/datum/job/clubworker, /datum/job/clubmanager, /datum/job/artist,
						/datum/job/chaplain, /datum/job/acolyte, /datum/job/janitor, /datum/job/hydro,
						/datum/job/scientist, /datum/job/roboticist, /datum/job/scistudent, /datum/job/robostudent,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/assistant, /datum/job/foreigner,
						/datum/job/outsider
						)
//						/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter, /datum/job/off_colony_herbalist // Disabled on request by MsRandylicious


	var/overmap_z
	var/overmap_size = 50
	var/overmap_event_areas = 40

	var/emergency_shuttle_docked_message = "Emergency evacuation is now in effect. You have %ETA% to choose to evacuate or stay and help contain the problem."
	var/emergency_shuttle_leaving_dock = "Emergency evacuation is now complete. Remaining colonists have %ETD% before additional support arrives."
	var/emergency_shuttle_called_message = "The emergency evacuation procedures are now in effect. You have %ETA% to prepare."
	var/emergency_shuttle_recall_message = "Emergency evacuation sequence aborted. Return to normal operating conditions."

	var/shuttle_docked_message = "Shift end complete, remaining employees who remained have %ETD% before the following shifts employees arrive."
	var/shuttle_leaving_dock = "Shift end is now in effect, employees now have %ETA% to leave or remain on duty for another shift."
	var/shuttle_called_message = "The shift end will happen in %ETA%. Any unfinished work should be completed before final call."
	var/shuttle_recall_message = "Shift end aborted, return to normal operating conditions."

	var/list/usable_email_tlds = list("nad_col.org","nadezhda.scg","nadezhda.net")
	var/path = "nadezhda"

	var/access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_hos, access_change_ids),
		ACCESS_REGION_MEDBAY = list(access_cmo, access_change_ids),
		ACCESS_REGION_RESEARCH = list(access_rd, access_change_ids),
		ACCESS_REGION_ENGINEERING = list(access_ce, access_change_ids),
		ACCESS_REGION_COMMAND = list(access_change_ids),
		ACCESS_REGION_GENERAL = list(access_change_ids),
		ACCESS_REGION_SUPPLY = list(access_change_ids),
		ACCESS_REGION_CHURCH = list(access_nt_preacher, access_change_ids),
		ACCESS_REGION_PROSPECTOR = list(access_foreman, access_change_ids)
	)

/datum/maps_data/proc/character_save_path(var/slot)
	return "/[path]/character[slot]"

/datum/maps_data/proc/character_load_path(var/savefile/S, var/slot)
	var/original_cd = S.cd
	S.cd = "/"
	. = private_use_legacy_saves(S, slot) ? "/character[slot]" : "/[path]/character[slot]"
	S.cd = original_cd // Attempting to make this call as side-effect free as possible

/datum/maps_data/proc/private_use_legacy_saves(var/savefile/S, var/slot)
	if(!S.dir.Find(path)) // If we cannot find the map path folder, load the legacy save
		return TRUE
	S.cd = "/[path]" // Finally, if we cannot find the character slot in the map path folder, load the legacy save
	return !S.dir.Find("character[slot]")


/datum/maps_data/proc/registrate(var/obj/map_data/MD)
	var/level = MD.z_level
	if(level in all_levels)
		WARNING("[level] is already in all_levels list!")
		qdel(MD)
		return

	MD.loc = null
	if(all_levels.len < level)
		all_levels.len = level
		names.len = level
	all_levels[level] = MD
	names[level] = MD.name

	if(MD.is_station_level)
		station_levels += level

	if(MD.is_admin_level)
		admin_levels += level

	if(MD.is_player_level)
		player_levels += level

	if(MD.is_contact_level)
		contact_levels += level

	if(MD.generate_asteroid)
		asteroid_levels += level

	if(MD.is_accessable_level)
		accessable_levels[num2text(level)] = MD.is_accessable_level

	if(MD.is_sealed)
		sealed_levels += level

	if(MD.digsites)
		allowed_digsites += level

/datum/maps_data/proc/get_empty_zlevel()
	if(empty_levels == null)
		world.incrementMaxZ()
		empty_levels = list(world.maxz)

		add_z_level(world.maxz, world.maxz, 1)

	return pick(empty_levels)

/datum/level_data
	var/level = -1
	var/original_level = -1
	var/height = -1

/proc/add_z_level(var/level, var/original, var/height)
	var/datum/level_data/ldata = new
	ldata.level = level
	ldata.original_level = original
	ldata.height = height

	if(level > z_levels.len)
		z_levels.len = level
		z_levels[level] = ldata
	else
		if(z_levels[level] == null)
			z_levels[level] = ldata


/obj/map_data
	name = "Map data"

	icon = 'icons/misc/landmarks.dmi'
	icon_state = "config-green"
	alpha = 255 //This one too important
	invisibility = 101
	layer = POINT_LAYER

	var/is_admin_level   = FALSE // Defines which Z-levels which are for admin functionality, for example including such areas as Central Command and the Syndicate Shuttle
	var/is_station_level = FALSE // Defines Z-levels on which the station exists
	var/is_player_level  = FALSE // Defines Z-levels a character can typically reach
	var/is_contact_level = FALSE // Defines Z-levels which, for example, a Code Red announcement may affect
	var/is_accessable_level = TRUE // Prob modifier for random access (space travelling)
	var/generate_asteroid= FALSE
	var/is_sealed = FALSE //No transit at map edge
	var/tmp/z_level
	var/height = -1	///< The number of Z-Levels in the map.
	var/digsites = null /// determines if digsites spawn if they do which types. (GARDEN,ANIMAL,HOUSE,TECHNICAL,TEMPLE,WAR,ANY)


// If the height is more than 1, we mark all contained levels as connected.
/obj/map_data/New(var/atom/nloc)
	..()
	z_level = nloc.z

	if(height <= 0)
		CRASH("Map data height not set. ([name], [z_level])")

	var/original_name = name
	var/original_level = z_level

	for(var/shift in 1 to height)
		var/z_level_r = original_level + shift - 1
		z_level = z_level_r
		name = "[original_name] stage [shift]"
		GLOB.maps_data.registrate(src)

		add_z_level(z_level_r, original_level, height)
