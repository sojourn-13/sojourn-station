ADMIN_VERB_ADD(/client/proc/start_profiler, R_ADMIN, FALSE)

/client/proc/start_profiler()
	set category = "Server"
	set name = "Profiler Start"

	message_admins("[key_name_admin(src)] started the profiler.")
	world.Profile(PROFILE_START)

ADMIN_VERB_ADD(/client/proc/restart_profiler, R_ADMIN, FALSE)

/client/proc/restart_profiler()
	set category = "Server"
	set name = "Profiler Restart"

	message_admins("[key_name_admin(src)] restarted the profiler.")
	world.Profile(PROFILE_RESTART)

ADMIN_VERB_ADD(/client/proc/stop_profiler, R_ADMIN, FALSE)

/client/proc/stop_profiler()
	set category = "Server"
	set name = "Profiler Stop"

	message_admins("[key_name_admin(src)] stopped the profiler.")
	world.Profile(PROFILE_STOP)

ADMIN_VERB_ADD(/client/proc/profiler_data, R_ADMIN, FALSE)

/client/proc/profiler_data()
	set category = "Server"
	set name = "Profiler Info"
	var/mode = input("Mode", "Total or Average", null) as null|anything in list("Total", "Average")
	var/flags = 0
	if(!mode) return
	if(mode == "Average")
		flags |= PROFILE_AVERAGE

	message_admins("[key_name_admin(src)] requested profile data.")
	var/list/result = world.Profile(flags)

	var/lenpro = result.len
	var/link = "<html><table>"
	for(var/i = 1, i <= lenpro, i+=6)
		link += "<tr>"
		for(var/j = 0, j < 6, j++)
			link += "<td>[result[i + j]]</td>"
		link += "</tr>"
	link += "</table></html>"

	src << browse(link, "window=serverprofile")