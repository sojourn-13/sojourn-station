/obj/machinery/autolathe/organ_fabricator
	name = "Organ Fabricator"
	desc = "Soteria machine for printing organs using biomass."
	description_info = "Quick Guide to Organs:\n\n\
						Print an organ scaffold\n\
						Print an input, process, and output teratoma\n\
						Use a laser scalpel to remove the organoid from each teratoma\n\
						(Optional) Use a laser scalpel on an organoid to modify its behavior\n\
						Attach all three organoids to the scaffold\n\
						Insert the newly crafted organ into self or another person\n\
						OR\n\
						Store it in the organ fridge for later use"
	icon_state = "bioprinter_med"
	circuit = /obj/item/circuitboard/organ_fabricator
	build_type = ORGAN_GROWER			// Should not be able to use church disks
	unsuitable_materials = list()		// Allows biomatter
	storage_capacity = 360
	have_disk = TRUE
	have_reagents = TRUE
	have_recycling = FALSE
	speed = 6

	selectively_recycled_types = list(
		/obj/item/organ,
		/obj/item/modification/organ
	)

	special_actions = list(
		list("action" = "rip", "name" = "Rip OMG! designs", "icon" = "document")
	)

	var/datum/research/files
	var/list/ripped_categories = list()		// For sanitizing categories

/obj/machinery/autolathe/organ_fabricator/loaded
	stored_material = list(MATERIAL_BIOMATTER = 360)

/obj/machinery/autolathe/organ_fabricator/Initialize()
	. = ..()
	files = new /datum/research(src)

/obj/machinery/autolathe/organ_fabricator/proc/rip_disk()
	if(!disk)
		return
	if(!istype(disk, /obj/item/computer_hardware/hard_drive/portable/design/omg))
		return

	for(var/design_file in disk.find_files_by_type(/datum/computer_file/binary/design))
		var/datum/computer_file/binary/design/DF = design_file
		var/datum/design/D = DF.design
		if(D && D.build_type == build_type)
			files.AddDesign2Known(D)
			ripped_categories |= D.category

	audible_message(SPAN_NOTICE("The contents of \the [disk] have been saved to \the [src]'s drive."))

/obj/machinery/autolathe/organ_fabricator/insert_disk(mob/living/user, obj/item/computer_hardware/hard_drive/portable/inserted_disk)
	. = ..()
	for(var/design_file in disk.find_files_by_type(/datum/computer_file/binary/design))
		var/datum/computer_file/binary/design/DF = design_file
		var/datum/design/D = DF.design
		categories |= D.category

/obj/machinery/autolathe/organ_fabricator/eject_disk(mob/living/user)
	. = ..()
	// Sanitize categories
	categories = files.design_categories_organfab
	categories |= ripped_categories

	SSnano.update_uis(src)

/obj/machinery/autolathe/organ_fabricator/design_list()
	var/list/design_files = list()

	if(disk)
		design_files |= disk.find_files_by_type(/datum/computer_file/binary/design)

	for(var/d in files.known_designs)
		var/datum/design/design = d
		if((design.build_type & build_type) && design.file)
			design_files |= design.file

	return design_files

/obj/machinery/autolathe/organ_fabricator/nano_ui_interact()
	if(!categories?.len)
		categories = files.design_categories_organfab
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
