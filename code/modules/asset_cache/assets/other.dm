/datum/asset/simple/namespaced/common
	assets = list("padlock.png" = 'icons/ui_icons/common/padlock.png')
	parents = list("common.css" = 'html/browser/common.css')

/* === ERIS STUFF === */
/datum/asset/spritesheet_batched/design_icons
	name = "design_icons"
	// we have a bunch of fucking designs that don't have icons and other bullshit that we just need to ignore
	ignore_associated_icon_state_errors = TRUE

	var/design_data_loaded = FALSE

/datum/asset/spritesheet_batched/design_icons/create_spritesheets()
	for(var/datum/design/design as anything in SSresearch.all_designs)
		var/key = sanitize_css_class_name("[design.build_path]")

		var/atom/item = design.build_path
		if(!ispath(item, /atom))
			continue

		var/icon_file = initial(item.icon)
		if(!icon_file)
			continue

		var/icon_state = initial(item.icon_state)

		insert_icon(key, uni_icon(icon_file, icon_state))

// Set up design nano data after all else is done
/datum/asset/spritesheet_batched/design_icons/queued_generation()
	. = ..()
	set_design_nano_data()

/datum/asset/spritesheet_batched/design_icons/ensure_ready()
	. = ..()
	set_design_nano_data()

/datum/asset/spritesheet_batched/design_icons/proc/set_design_nano_data()
	if(!design_data_loaded)
		for(var/datum/design/design as anything in SSresearch.all_designs)
			design.nano_ui_data["icon"] = icon_class_name(sanitize_css_class_name("[design.build_path]"))
		design_data_loaded = TRUE

/datum/asset/spritesheet_batched/chem_master
	name = "chem_master"

/datum/asset/spritesheet_batched/chem_master/create_spritesheets()
	for(var/i = 1 to MAX_PILL_SPRITE)
		insert_icon("pill[i]", uni_icon('icons/obj/chemical.dmi', "pill" + num2text(i)))
	for(var/sprite in BOTTLE_SPRITES)
		insert_icon(sprite, uni_icon('icons/obj/chemical.dmi', sprite))
	for(var/sprite in SYRETTE_SPRITES)
		insert_icon(sprite, uni_icon('icons/obj/syringe.dmi', sprite))
	for(var/sprite in PILL_BOTTLE_MODELS)
		insert_icon(sprite, uni_icon('icons/obj/chemical.dmi', sprite))
	insert_icon("supeyrette", uni_icon('icons/obj/syringe.dmi', "supeyrette"))

/datum/asset/simple/codicon
	assets = list(
		"codicon.css" = 'html/codicon/codicon.css',
		"codicon.ttf" = 'html/codicon/codicon.ttf'
	)

/datum/asset/simple/directories/images_news
	dirs = list("news_articles/images/")

/datum/asset/simple/directories
	keep_local_name = TRUE
	var/list/dirs = list()

/datum/asset/simple/directories/register()
	// Crawl the directories to find files.
	for (var/path in dirs)
		var/list/filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename)) != "/") // Ignore directories.
				if(fexists(path + filename))
					assets[filename] = file(path + filename)
	..()

/datum/asset/simple/images_map
	keep_local_name = TRUE

/datum/asset/simple/images_map/register()
	var/list/mapnames = list()
	for(var/z in GLOB.maps_data.station_levels)
		mapnames += map_image_file_name(z)

	var/list/filenames = flist(MAP_IMAGE_PATH)
	for(var/filename in filenames)
		if(copytext(filename, length(filename)) != "/") // Ignore directories.
			var/file_path = MAP_IMAGE_PATH + filename
			if((filename in mapnames) && fexists(file_path))
				assets[filename] = fcopy_rsc(file_path)
	..()
