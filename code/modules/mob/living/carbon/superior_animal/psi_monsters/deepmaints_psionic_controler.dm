GLOBAL_LIST_INIT(deepmaints_data_bool, list(
	"allow_leaving"					= FALSE,
	"allow_respawning"				= TRUE,
	"holy_water_delay"				= TRUE,
	"holy_water_despawning"			= TRUE,
	"chaos_lowering"				= TRUE,
	"king_teleporting"				= TRUE))

GLOBAL_VAR_INIT(deepmaints_panel, new /datum/deepmaints_panel)

/datum/deepmaints_panel

/datum/deepmaints_panel/New()

/datum/deepmaints_panel/proc/main_interact()
	var/data = "<center><font size='3'><b>DEEPMAINTS PANEL</b></font></center>"
	data += "<table><tr><td><a href='?src=\ref[src];refresh=1'>\[REFRESH\]</a>"

	data += "<br>Allow All Deepmaints Mobs To Leave To Colony: [GLOB.deepmaints_data_bool["allow_leaving"] ? "Enabled" : "Disabled"]] \
	<a href='?src=\ref[src];allow_leaving=1'>\[SET\]</a>"

	data += "<br>Allow Deepmaints Mob Respawning: [GLOB.deepmaints_data_bool["allow_respawning"] ? "Enabled" : "Disabled"] \
	<a href='?src=\ref[src];allow_respawning=1'>\[TOGGLE\]</a>"

	data += "<br>Allow Holy Tiles Delaying Respawning: [GLOB.deepmaints_data_bool["holy_water_delay"] ? "Enabled" : "Disabled"] \
	<a href='?src=\ref[src];holy_water_delay=1'>\[TOGGLE\]</a>"

	data += "<br>Allow Holy Tiles Prevent Deepmaints Mob Respawning: [GLOB.deepmaints_data_bool["holy_water_despawning"] ? "Enabled" : "Disabled"] \
	<a href='?src=\ref[src];holy_water_despawning=1'>\[TOGGLE\]</a>"

	data += "<br>Allow Deepmaints Lowering Chaos Level: [GLOB.deepmaints_data_bool["chaos_lowering"] ? "Enabled" : "Disabled"] \
	<a href='?src=\ref[src];chaos_lowering=1'>\[TOGGLE\]</a>"

	data += "<br>Allow Dreaming King Teleportation: [GLOB.deepmaints_data_bool["king_teleporting"] ? "Enabled" : "Disabled"] \
	<a href='?src=\ref[src];king_teleporting=1'>\[TOGGLE\]</a>"

	data += "</td></tr></table>"
	usr << browse(data, "window=hive_main;size=600x600")


/datum/deepmaints_panel/Topic(href,href_list)
	if(!check_rights(R_FUN))
		return

	if(href_list["allow_leaving"])
		GLOB.deepmaints_data_bool["allow_leaving"] = !GLOB.deepmaints_data_bool["allow_leaving"]

	if(href_list["allow_respawning"])
		GLOB.deepmaints_data_bool["allow_respawning"] = !GLOB.deepmaints_data_bool["allow_respawning"]

	if(href_list["holy_water_delay"])
		GLOB.deepmaints_data_bool["holy_water_delay"] = !GLOB.deepmaints_data_bool["holy_water_delay"]

	if(href_list["holy_water_despawning"])
		GLOB.deepmaints_data_bool["holy_water_despawning"] = !GLOB.deepmaints_data_bool["holy_water_despawning"]

	if(href_list["chaos_lowering"])
		GLOB.deepmaints_data_bool["chaos_lowering"] = !GLOB.deepmaints_data_bool["chaos_lowering"]

	if(href_list["king_teleporting"])
		GLOB.deepmaints_data_bool["king_teleporting"] = !GLOB.deepmaints_data_bool["king_teleporting"]

	main_interact()
