/obj/machinery/autolathe/mechfab
	name = "exosuit fabricator"
	desc = "A machine used for construction of robots and mechas."
	icon_state = "mechfab"
	circuit = /obj/item/circuitboard/mechfab

	build_type = MECHFAB
	storage_capacity = 240
	speed = 3
	unsuitable_materials = list()	// Can use biomatter too for some seals and rigs.
	have_disk = FALSE
	have_reagents = FALSE
	have_recycling = FALSE
	max_efficiency = 0.2
	code_dex = "MECHFAB"

	special_actions = list(
		list("action" = "sync", "name" = "Sync with R&D console", "icon" = "sync")
	)

	var/datum/research/files

/obj/machinery/autolathe/mechfab/proc/check_user(mob/user)
	if(user.stats?.getPerk(PERK_SI_SCI) || user.stat_check(STAT_MEC, 30)) //Needs same skill as it takes to maintain a mech
		return TRUE
	to_chat(user, SPAN_NOTICE("You don't know how to make the [src] work, you lack the training or mechanical skill."))
	return FALSE

/obj/machinery/autolathe/mechfab/Initialize()
	. = ..()
	files = new /datum/research(src)

/obj/machinery/autolathe/mechfab/design_list()
	var/list/design_files = list()

	for(var/d in files.known_designs)
		var/datum/design/design = d
		if((design.build_type & build_type) && design.file)
			design_files |= design.file

	return design_files

/obj/machinery/autolathe/mechfab/ui_interact()
	if(!categories)
		update_categories()
	. = ..()

/obj/machinery/autolathe/mechfab/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	if(action == "special_action" && params["action"] == "sync")
		sync(usr)
		. = TRUE


/obj/machinery/autolathe/mechfab/proc/sync(mob/user)
	var/sync = FALSE

	for(var/obj/machinery/computer/rdconsole/RDC in get_area_all_atoms(get_area(src)))
		if(!RDC.sync)
			continue
		files.download_from(RDC.files)
		to_chat(user, SPAN_NOTICE("Sync with [RDC] complete."))
		sync = TRUE

	if(!sync)
		to_chat(user, SPAN_WARNING("Error: no research console with enabled sync was found."))

	update_categories()

/obj/machinery/autolathe/mechfab/proc/update_categories()
	categories = files.design_categories_mechfab
	if(!show_category && length(categories))
		show_category = categories[1]



// A version with some materials already loaded, to be used on map spawn
/obj/machinery/autolathe/mechfab/loaded
	stored_material = list(
		MATERIAL_STEEL = 30,
		MATERIAL_PLASTIC = 30,
		MATERIAL_GLASS = 30,
		)
