#define CATALOG_BROWSE_STAGE_LIST "list"
#define CATALOG_BROWSE_STAGE_ENTRY "entry"
#define CATALOG_BROWSE_STAGE_NONE null

/datum/tgui_module/catalog
	tgui_id = "Catalog"

	// Controls what catalog will be loaded
	var/catalog_key = null

	// Controls generic front page
	var/front_page_use_generic = TRUE
	var/front_page_name = ""
	var/front_page_desc = ""
	var/front_page_icon = ""

	var/catalog_search = ""
	// This whole thing is a state machine
	var/catalog_browse_stage = CATALOG_BROWSE_STAGE_NONE
	var/datum/catalog/catalog
	var/datum/catalog_entry/selected_entry
	var/list/datum/catalog_entry/entry_history = list()

// Overrides
/datum/tgui_module/catalog/New(new_host)
	. = ..()

	if(!catalog_key)
		log_debug("TGUI Catalog [name] did not specify a catalog to browse!")
		return

	if(!(catalog_key in GLOB.catalogs))
		log_debug("TGUI Catalog [name] specified an invalid catalog `[catalog_key]`.")
		return

	catalog = GLOB.catalogs[catalog_key]

/datum/tgui_module/catalog/Destroy()
	catalog = null
	selected_entry = null
	. = ..()

// Helper Functions
/datum/tgui_module/catalog/proc/set_selected_entry(mob/user, datum/catalog_entry/entry_to_browse)
	if(!entry_to_browse)
		return FALSE

	if(selected_entry && selected_entry != entry_to_browse)
		entry_history.Add(selected_entry)

	selected_entry = entry_to_browse
	catalog_browse_stage = CATALOG_BROWSE_STAGE_ENTRY
	return TRUE

// UI
/datum/asset/simple/catalog
	assets = list(
		"The_B.png" = 'nano/images/The_B.png',
		"moebus_logo.png" = 'nano/images/moebus_logo.png',
	)

/datum/tgui_module/catalog/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/simple/catalog)

/datum/tgui_module/catalog/ui_data(mob/user)
	var/list/data = ..()

	// Used to make pretty front pages and "localize" the UI to match the theme of the given catalog
	data["front_page_use_generic"] = front_page_use_generic
	data["front_page_name"] = front_page_name
	data["front_page_desc"] = front_page_desc
	data["front_page_icon"] = front_page_icon ? SSassets.transport.get_asset_url(front_page_icon) : null
	data["catalog_key"] = catalog_key

	data["catalog_browse_stage"] = catalog_browse_stage
	data["catalog_search"] = catalog_search
	data["selected_entry"] = null
	if(LAZYLEN(entry_history))
		var/datum/catalog_entry/entry = entry_history[LAZYLEN(entry_history)]
		data["last_entry"] = entry.title
	else
		data["last_entry"] = null

	switch(catalog_browse_stage)
		if(CATALOG_BROWSE_STAGE_ENTRY)
			data["selected_entry"] = selected_entry.ui_data(user)
		if(CATALOG_BROWSE_STAGE_LIST)
			data += catalog.ui_data(user, catalog_search)

	return data

/datum/tgui_module/catalog/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		// No transition back to NONE

		// Valid transitions:
		//  - NONE -> LIST
		//  - ENTRY -> LIST (erases history, "home button")
		if("state_machine_enter_list")
			if(catalog_browse_stage == CATALOG_BROWSE_STAGE_LIST)
				log_debug("TGUI Catalog invalid state transition `[catalog_browse_stage]` -> CATALOG_BROWSE_STAGE_LIST")
				return TRUE

			selected_entry = null
			entry_history.Cut()
			// Note: `catalog` ref is always active, does not need to ever change
			catalog_browse_stage = CATALOG_BROWSE_STAGE_LIST
			. = TRUE

		// Valid transitions:
		//  - LIST -> ENTRY
		//  - ENTRY -> ENTRY (history chaining)
		if("state_machine_enter_entry")
			// Valid transitions:
			//  - LIST -> ENTRY
			//  - ENTRY -> ENTRY (history chaining)
			if(catalog_browse_stage == CATALOG_BROWSE_STAGE_NONE)
				log_debug("TGUI Catalog invalid state transition `[catalog_browse_stage]` -> CATALOG_BROWSE_STAGE_ENTRY")
				return TRUE
 
			var/entry_id = text2path(params["entry"])
			var/datum/catalog_entry/E = GLOB.all_catalog_entries_by_type[entry_id]
			if(!istype(E))
				to_chat(usr, SPAN_WARNING("Unable to load entry '[entry_id]', corrupt data."))
				log_debug("TGUI Catalog attempted to load bad entry [entry_id]")
				return TRUE

			set_selected_entry(usr, E)
			. = TRUE

		// Valid transitions:
		//  - ENTRY -> ENTRY (reverse through entry_history)
		//  - ENTRY -> LIST (when history is empty)
		if("state_machine_pop_entry")
			if(LAZYLEN(entry_history))
				selected_entry = entry_history[LAZYLEN(entry_history)]
				entry_history.Remove(selected_entry)
				// Won't create infinite history because set_selected_entry checks if we're navigating to something we're already on
				set_selected_entry(usr, selected_entry)
			else 
				selected_entry = null
				catalog_browse_stage = CATALOG_BROWSE_STAGE_LIST

			. = TRUE

		// Non-state-machine-things
		if("set_catalog_search")
			catalog_search = params["search"]
			. = TRUE

/*********************/
/* Subtypes          */
/*********************/

// Cooking Catalog
/datum/tgui_module/catalog/cooking
	name = "Lonestar (and Soteria) Presents: Victoria's Incredible Kitchen Assistant"
	catalog_key = CATALOG_COOKING

	front_page_name = "Victoria's Incredible Kitchen Assistant"
	front_page_desc = "Welcome~"
	front_page_icon = "The_B.png"

/datum/tgui_module/catalog/cooking/ntos
	ntos = TRUE

/datum/tgui_module/catalog/cooking/silicon
/datum/tgui_module/catalog/cooking/silicon/ui_state(mob/user)
	return GLOB.self_state

/datum/tgui_module/catalog/cooking/ui_assets(mob/user)
	. = ..()
	. += get_asset_datum(/datum/asset/spritesheet/cooking_icons)

// Drinks Catalog
/datum/tgui_module/catalog/drinks
	name = "Drinks Catalog"
	catalog_key = CATALOG_DRINKS
	
	front_page_name = "Neon Cocktails!"
	front_page_desc = "Electronic handbook containing all information about cocktail craft."

/datum/tgui_module/catalog/drinks/ntos
	ntos = TRUE

/datum/tgui_module/catalog/drinks/silicon
/datum/tgui_module/catalog/drinks/silicon/ui_state(mob/user)
	return GLOB.self_state

// Reagents Catalog
/datum/tgui_module/catalog/chemistry
	name = "Soteria Reagent Catalogue"
	catalog_key = CATALOG_CHEMISTRY
	
	front_page_name = "Soteria Reagent Catalog"
	front_page_desc = "Welcome to the Soteria Internal Reagent Database"
	front_page_icon = "moebus_logo.png"

/datum/tgui_module/catalog/chemistry/ntos
	ntos = TRUE

/datum/tgui_module/catalog/chemistry/silicon
/datum/tgui_module/catalog/chemistry/silicon/ui_state(mob/user)
	return GLOB.self_state

// Centcom Catalog
/datum/tgui_module/catalog/all
	name = "Centcom chemCatalog"
	catalog_key = CATALOG_ALL
	
	front_page_name = "CentCom Reagent Catalogue"
	front_page_desc = "Electronic catalog containing all chemical reactions and reagents"

/datum/tgui_module/catalog/all/ntos
	ntos = TRUE

/datum/tgui_module/catalog/all/silicon
/datum/tgui_module/catalog/all/silicon/ui_state(mob/user)
	return GLOB.self_state
