// Bioprinter for organ printing
/obj/machinery/autolathe/organ_fabricator
	name = "Organ Fabricator"
	desc = "Soteria machine for printing organs using biomass."
	icon_state = "bioprinter_med"
	circuit = /obj/item/circuitboard/organ_fabricator
	build_type = ORGAN_GROWER		// Should not be able to use church disks
	unsuitable_materials = list()	// Allows biomatter
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/omg/diy_organs
	storage_capacity = 360
	have_recycling = FALSE
	speed = 6

/obj/machinery/autolathe/organ_fabricator/loaded
	stored_material = list(MATERIAL_BIOMATTER = 360)

/obj/machinery/autolathe/organ_fabricator/attackby(obj/item/I, mob/user)
	// Warn about deconstruction
	if(panel_open)
		var/tool_type = I.get_tool_type(user, list(QUALITY_PRYING), src)
		if(tool_type == QUALITY_PRYING)
			var/choice = alert("If you deconstruct this machine, the biomatter inside will be destroyed. Are you sure you want to continue?", "Deconstruction Warning", "Deconstruct", "Leave it alone")
			if(choice != "Deconstruct")
				return

/obj/machinery/autolathe/organ_fabricator/on_deconstruction(obj/item/I, mob/user)
	// Spill biomass and remove biomatter sheets
	var/biomatter_removed = stored_material[MATERIAL_BIOMATTER]
	stored_material[MATERIAL_BIOMATTER] = 0
	var/biomatter_to_spill = round(biomatter_removed / 100, 1)
	if(biomatter_to_spill)
		var/list/all_dirs = alldirs.Copy()
		var/list/dirs = list()
		for(var/i in 1 to biomatter_to_spill)
			dirs += pick_n_take(all_dirs)
		spill_biomass(loc, dirs)

	..()

/obj/machinery/autolathe/organ_fabricator/eject(material, amount)
	var/material/M = get_material_by_name(material)
	if(M.stack_type == /obj/item/stack/material/biomatter)
		visible_message(SPAN_WARNING("Biomatter cannot be removed from this machine."))
		return
	..()

// TODO: Give this its own UI.
/obj/machinery/autolathe/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/list/data = ui_data(user, ui_key)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "autolathe.tmpl", capitalize(name), 550, 655)

		// template keys starting with _ are not appended to the UI automatically and have to be called manually
		ui.add_template("_materials", "autolathe_materials.tmpl")
		ui.add_template("_reagents", "autolathe_reagents.tmpl")
		ui.add_template("_designs", "autolathe_designs.tmpl")
		ui.add_template("_queue", "autolathe_queue.tmpl")

		ui.set_initial_data(data)
		ui.open()

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
