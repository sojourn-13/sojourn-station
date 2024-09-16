/datum/computer_file/program/crew_manifest
	filename = "crewmanifest"
	filedesc = "Crew Manifest"
	extended_desc = "This program allows access to the manifest of active crew."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "users"
	size = 4
	requires_ntnet = 1
	available_on_ntnet = 1
	tguimodule_path = /datum/tgui_module/manifest/ntos
	usage_flags = PROGRAM_ALL

/datum/tgui_module/manifest/ntos
	ntos = TRUE

// Manifest by default is ALWAYS_STATE
/datum/tgui_module/manifest/ntos/ui_state()
	return GLOB.default_state
