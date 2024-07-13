/datum/asset/simple/directories/nanoui
	dirs = list(
		"nano/js/",
		"nano/css/",
		"nano/images/",
		"nano/images/status_icons/",
		"nano/images/modular_computers/",
	)

/datum/asset/simple/nanoui_templates
	keep_local_name = TRUE
	var/list/template_dirs = list(
		"nano/templates/"
	)

/datum/asset/simple/nanoui_templates/register()
	// Combine all templates into a single bundle.
	var/list/template_data = list()
	for(var/path in template_dirs)
		var/list/filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename) - 4) == ".tmpl") // Ignore directories.
				template_data[filename] = file2text(path + filename)
	var/template_bundle = "function nanouiTemplateBundle(){return [json_encode(template_data)];}"
	var/fname = "data/nano_templates_bundle.js"
	fdel(fname)
	text2file(template_bundle, fname)
	assets["nano_templates_bundle.js"] = fcopy_rsc(fname)
	fdel(fname)
	. = ..()

/datum/asset/group/nanoui
	children = list(
		/datum/asset/simple/directories/nanoui,
		/datum/asset/simple/nanoui_templates
	)
