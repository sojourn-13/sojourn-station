/obj/machinery/autolathe/organ_fabricator
	name = "Organ Fabricator"
	desc = "Soteria machine for printing organs using biomass."
	icon_state = "bioprinter_med"
	circuit = /obj/item/circuitboard/organ_fabricator
	build_type = ORGAN_GROWER			// Should not be able to use church disks
	unsuitable_materials = list()		// Allows biomatter
	storage_capacity = 360
	have_disk = TRUE
	have_reagents = TRUE
	have_recycling = FALSE
	speed = 6

	special_actions = list(
		//list("action" = "sync", "name" = "Sync with R&D console", "icon" = "refresh"),		// Not until sci has their part of organ gaming
		list("action" = "rip", "name" = "Rip OMG! designs", "icon" = "document")
	)

	var/datum/research/files
	var/list/initial_designs = list(
		/datum/design/organ/heart,
		/datum/design/organ/lungs,
		/datum/design/organ/kidney_left,
		/datum/design/organ/kidney_right,
		/datum/design/organ/liver,
		/datum/design/organ/eyes,
		/datum/design/organ/nerves,
		/datum/design/organ/muscle,
		/datum/design/organ/blood_vessel,
		/datum/design/organ/organ_mod/capillaries,
		/datum/design/organ/organ_mod/durable_membrane,
		/datum/design/organ/organ_mod/stem_cells,
		/datum/design/organ/organ_mod/overclock,
		/datum/design/organ/organ_mod/underclock,
		/datum/design/organ/organ_mod/expander,
		/datum/design/organ/organ_mod/silencer,
		/datum/design/organ/scaffold,
		/datum/design/organ/aberrant_organ/teratoma/input/reagents,
		/datum/design/organ/aberrant_organ/teratoma/input/damage,
		/datum/design/organ/aberrant_organ/teratoma/input/power_source,
		/datum/design/organ/aberrant_organ/teratoma/process,
		/datum/design/organ/aberrant_organ/teratoma/output/reagents_blood,
		/datum/design/organ/aberrant_organ/teratoma/output/reagents_ingest,
		/datum/design/organ/aberrant_organ/teratoma/output/chemical_effects,
		/datum/design/organ/aberrant_organ/teratoma/output/stat_boost
	)

/obj/machinery/autolathe/organ_fabricator/loaded
	stored_material = list(MATERIAL_BIOMATTER = 360)

/obj/machinery/autolathe/organ_fabricator/Initialize()
	. = ..()
	files = new /datum/research(src)

	if(!categories)
		categories = list()
	
	if(initial_designs?.len)
		for(var/design in initial_designs)
			var/datum/design/new_design = new design

			// Needed for ui data
			new_design.AssembleDesignInfo()
			new_design.ui_data["icon"] = sanitizeFileName("[new_design.build_path].png")
			var/datum/computer_file/binary/design/design_file = new
			design_file.design = new_design
			design_file.on_design_set()
			new_design.file = design_file

			files.known_designs |= new_design
			categories |= new_design.category

/obj/machinery/autolathe/organ_fabricator/proc/rip_disk()
	if(!disk)
		return
	if(!istype(disk, /obj/item/computer_hardware/hard_drive/portable/design/omg))
		return

	for(var/design_file in disk.find_files_by_type(/datum/computer_file/binary/design))
		var/datum/computer_file/binary/design/DF = design_file
		var/datum/design/D = DF.design
		D.AssembleDesignInfo()
		D.ui_data["icon"] = sanitizeFileName("[D.build_path].png")
		if(D && D.build_type == build_type)
			files.known_designs |= D
			categories |= D.category

/obj/machinery/autolathe/organ_fabricator/insert_disk(mob/living/user, obj/item/computer_hardware/hard_drive/portable/inserted_disk)
	. = ..()
	show_category = null

/obj/machinery/autolathe/organ_fabricator/eject_disk(mob/living/user)
	. = ..()
	SSnano.update_uis(src)

/obj/machinery/autolathe/organ_fabricator/design_list()
	var/list/design_files = list()

	if(!show_category)
		design_files |= disk.find_files_by_type(/datum/computer_file/binary/design)
	else
		for(var/d in files.known_designs)
			var/datum/design/design = d
			if((design.build_type & build_type) && design.file)
				design_files |= design.file

	return design_files

/obj/machinery/autolathe/nano_ui_interact()
	if(!disk && !show_category && length(categories))
		show_category = categories[1]
	..()

/obj/machinery/autolathe/organ_fabricator/Topic(href, href_list)
	if(..())
		return TRUE

	if(href_list["action"] == "rip")
		rip_disk()
		return TRUE

/obj/machinery/autolathe/organ_fabricator/attackby(obj/item/I, mob/user)
	// Warn about deconstruction
	if(panel_open)
		var/tool_type = I.get_tool_type(user, list(QUALITY_PRYING), src)
		if(tool_type == QUALITY_PRYING)
			var/starting_loc = user.loc		// Save location so user can't magically deconstruct it from a distance
			var/choice = alert("If you deconstruct this machine, the biomatter inside will be destroyed. Are you sure you want to continue?", "Deconstruction Warning", "Deconstruct", "Leave it alone")
			if(choice != "Deconstruct" || starting_loc != user.loc)
				return
	
	..()

/obj/machinery/autolathe/organ_fabricator/on_deconstruction(obj/item/I, mob/user)
	// Remove biomatter sheets and spill biomass
	var/biomatter_removed = stored_material[MATERIAL_BIOMATTER]
	stored_material[MATERIAL_BIOMATTER] = 0
	var/biomatter_to_spill = round(biomatter_removed / 100, 1)
	if(biomatter_to_spill)
		var/list/all_dirs = alldirs.Copy()
		var/list/dirs = list()
		for(var/i in 1 to biomatter_to_spill)
			dirs += pick_n_take(all_dirs)
		spill_biomass(loc, dirs)
		visible_message(SPAN_DANGER("Solidified biomass spills out of \the [src]!"))

	..()

/obj/machinery/autolathe/organ_fabricator/eject(material, amount)
	var/material/M = get_material_by_name(material)
	if(M.stack_type == /obj/item/stack/material/biomatter)
		visible_message(SPAN_WARNING("Biomatter cannot be removed from this machine."))
		return
	..()

/obj/item/circuitboard/organ_fabricator
	name = "circuit board (organ fabricator)"
	build_path = /obj/machinery/autolathe/organ_fabricator
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_DATA = 2)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/console_screen = 1
	)
