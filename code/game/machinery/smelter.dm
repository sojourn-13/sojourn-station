/obj/machinery/smelter
	name = "smelter"
	icon = 'icons/obj/machines/sorter.dmi'
	icon_state = "smelter"
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 10
	active_power_usage = 2000

	circuit = /obj/item/circuitboard/smelter

	// base smelting speed - based on levels of manipulators
	var/speed = 10

	// based on levels of matter bins
	var/storage_capacity = 120

	var/list/stored_material = list()

	var/input_side = SOUTH
	var/output_side = null //by default it will be reversed input_side
	var/refuse_output_side = EAST

	var/progress = 0

	var/obj/current_item

	var/forbidden_materials = list(MATERIAL_CARDBOARD,MATERIAL_WOOD,MATERIAL_BIOMATTER)

	// base multiplier for scrap smelting, increased by better microlasers
	var/scrap_multiplier = 0.5 //50% refunds

/obj/machinery/smelter/cargo_t2_parts
	input_side = WEST
	output_side = NORTH
	refuse_output_side = EAST

/obj/machinery/smelter/cargo_t2_parts/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stock_parts/manipulator/nano(null)
	component_parts += new /obj/item/stock_parts/scanning_module/adv(null)
	component_parts += new /obj/item/stock_parts/micro_laser/high(null)
	component_parts += new /obj/item/stock_parts/matter_bin/adv(null)
	component_parts += new /obj/item/stock_parts/matter_bin/adv(null)
	RefreshParts()
	update_icon()

/obj/machinery/smelter/Initialize()
	. = ..()
	if(!output_side)
		output_side = reverse_direction(input_side)


/obj/machinery/smelter/Destroy()
	if(current_item)
		current_item.forceMove(get_turf(src))
	eject_all_material()
	return ..()


/obj/machinery/smelter/update_icon()
	..()
	if(progress)
		icon_state = "smelter-process"
	else
		icon_state = "smelter"


/obj/machinery/smelter/Process()
	if(stat & BROKEN || stat & NOPOWER)
		progress = 0
		use_power(0)
		update_icon()
		return

	if(current_item)
		use_power(2)
		progress += speed
		progress += item_speed_bonus(current_item)
		if(progress >= 100)
			smelt()
			grab()
			use_power(1)
		update_icon()
	else
		grab()


/obj/machinery/smelter/proc/grab()
	for(var/obj/O in get_step(src, input_side))
		if(O.anchored)
			continue
		O.forceMove(src)
		//Smelting scrap cubes is a bit op
		/*if(istype(O, /obj/structure/scrap_cube))
			current_item = O
			return*/
		var/list/materials = result_materials(O)
		if(!materials?.len || !are_valid_materials(materials))
			eject(O, refuse_output_side)
			return
		current_item = O
		return
	for(var/mob/M in get_step(src, input_side))
		if(M.anchored) //If this somehow is a thing then bam you dont move same as above
			continue
		eject(M, refuse_output_side)

//Smelting scrap cubes is a bit op
/obj/machinery/smelter/proc/smelt()
/*	if(istype(current_item, /obj/structure/scrap_cube))
		smelt_scrap(current_item)
	else*/
	smelt_item(current_item)
	current_item = null
	progress = 0
	eject_overflow()


/obj/machinery/smelter/proc/smelt_item(obj/smelting)
	var/list/materials = result_materials(smelting)

	if(materials)
		if(!are_valid_materials(materials))
			eject(smelting, refuse_output_side)
			return

		for(var/material in materials)
			if(!(material in stored_material))
				stored_material[material] = 0

			if(istype(smelting, /obj/item/stack))
				var/obj/item/stack/stacked_item = smelting
				stored_material[material] += (materials[material] * stacked_item.amount)
			else
				stored_material[material] += (materials[material] *= scrap_multiplier)

	for(var/obj/O in smelting.contents)
		smelt_item(O)

	qdel(smelting)

/obj/machinery/smelter/proc/smelt_scrap(obj/smelting)
	var/list/materials = result_materials(smelting)

	if(materials)
		if(!are_valid_materials(materials))
			eject(smelting, refuse_output_side)
			return

		for(var/material in materials)
			if(!(material in stored_material))
				stored_material[material] = 0

			stored_material[material] += materials[material]

	for(var/obj/O in smelting.contents)
		smelt_scrap(O)

	qdel(smelting)

/obj/machinery/smelter/proc/are_valid_materials(list/materials)
	for(var/material in forbidden_materials)
		if(material in materials)
			return FALSE
	return TRUE


/obj/machinery/smelter/proc/result_materials(obj/O)
	if(istype(O, /obj/item/stack/ore))
		var/obj/item/stack/ore/ore = O
		var/ore/data = ore_data[ore.material]
		if(data.smelts_to)
			return list(data.smelts_to = 1)
		if(data.compresses_to)
			return list(data.compresses_to = 1)
	return O.get_matter()

// Some items are significantly easier to smelt
/obj/machinery/smelter/proc/item_speed_bonus(obj/smelting)
	if(istype(smelting, /obj/item/stack))
		return 30

	if(istype(smelting, /obj/item/stack/ore))
		return 20

	if(istype(smelting, /obj/item/material/shard))
		return 20

	// Just one material - makes smelting easier
	if(length(result_materials(smelting)) == 1)
		return 10

	return 0

/obj/machinery/smelter/proc/eject(obj/O, output_dir)
	var/turf/T = get_step(src, output_dir)
	if(T.density)
		return
	O.loc = T

/obj/machinery/smelter/proc/eject_material_stack(material)
	var/obj/item/stack/material/stack_type = material_stack_type(material)

	// Sanity check: avoid an infinite loop in eject_all_material when trying to drop an invalid material
	if(!stack_type)
		stored_material[material] = 0
		CRASH("Attempted to drop an invalid material: [material]")

	var/ejected_amount = min(initial(stack_type.max_amount), round(stored_material[material]), storage_capacity)
	var/obj/item/stack/material/S = new stack_type(src, ejected_amount)
	eject(S, output_side)
	S.reset_plane_and_layer()
	stored_material[material] -= ejected_amount


/obj/machinery/smelter/proc/eject_all_material(material = null)
	if(!material)
		for(var/mat in stored_material)
			eject_all_material(mat)
	while(stored_material[material] >= 1)
		eject_material_stack(material)


/obj/machinery/smelter/proc/eject_overflow()
	for(var/material in stored_material)
		while(stored_material[material] > storage_capacity)
			eject_material_stack(material)


/obj/machinery/smelter/RefreshParts()
	..()

	var/speed_rating = 0
	var/speed_parts_count = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		speed_rating += M.rating
		++speed_parts_count

	for(var/obj/item/stock_parts/scanning_module/S in component_parts)
		speed_rating += S.rating
		++speed_parts_count

	speed = initial(speed)*(speed_rating/speed_parts_count)

	var/ml_rating = 0
	//var/ml_count = 0
	for(var/obj/item/stock_parts/micro_laser/ML in component_parts)
		ml_rating += ML.rating
		//++ml_count

	scrap_multiplier = initial(scrap_multiplier)+(((ml_rating)-1)*0.1) // /ml_count
	if(scrap_multiplier > 1)
		scrap_multiplier = 1

	var/mb_rating = 0
	var/mb_count = 0
	for(var/obj/item/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
		++mb_count
	storage_capacity = round(initial(storage_capacity)*(mb_rating/mb_count))


/obj/machinery/smelter/attackby(var/obj/item/I, var/mob/user)
	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()


/obj/machinery/smelter/attack_hand(mob/user as mob)
	return ui_interact(user)

/obj/machinery/smelter/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Smelter", name)
		ui.open()

/obj/machinery/smelter/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet_batched/ores),
		get_asset_datum(/datum/asset/spritesheet_batched/materials)
	)

/obj/machinery/smelter/ui_data(mob/user)
	var/list/data = list()
	if(current_item)
		var/list/item_materials_data = list()

		var/list/item_materials = result_materials(current_item)
		if(are_valid_materials(item_materials))
			for(var/mtype in item_materials)
				var/material/M = get_material_by_name(mtype)
				var/mat_ui_data = M.ui_data(user)
				mat_ui_data["count"] = item_materials[mtype]

				if(istype(current_item, /obj/item/stack))
					var/obj/item/stack/S = current_item
					mat_ui_data["count"] *= S.amount
				else
					mat_ui_data["count"] *= scrap_multiplier

				item_materials_data += list(mat_ui_data)

		var/list/item_data = list(
			"name" = current_item.name,
			"materials" = item_materials_data,
			"icon_is_image" = TRUE,
		)

		if(istype(current_item, /obj/item/stack/ore))
			var/class_name = sanitize_css_class_name("[current_item.type]")
			var/datum/asset/spritesheet_batched/ores/sprite = get_asset_datum(/datum/asset/spritesheet_batched/ores)
			item_data["icon"] = sprite.icon_class_name(class_name)
			item_data["icon_is_image"] = FALSE
		else if(istype(current_item, /obj/item/stack/material))
			var/class_name = sanitize_css_class_name("[current_item.type]")
			var/datum/asset/spritesheet_batched/materials/sprite = get_asset_datum(/datum/asset/spritesheet_batched/materials)
			item_data["icon"] = sprite.icon_class_name(class_name)
			item_data["icon_is_image"] = FALSE
		else
			item_data["icon"] = icon2base64tgui(current_item.type)

		data["current_item"] = item_data
	else
		data["current_item"] = null
	data["progress"] = progress
	data["capacity"] = storage_capacity
	data["input_side"] = capitalize(dir2text(input_side))
	data["output_side"] = capitalize(dir2text(output_side))
	data["refuse_side"] = capitalize(dir2text(refuse_output_side))

	var/list/materials = list()

	for(var/mtype in stored_material)
		if(stored_material[mtype] < 1)
			continue

		var/material/M = get_material_by_name(mtype)
		var/mat_ui_data = M.ui_data(user)
		mat_ui_data["count"] = stored_material[mtype]

		materials += list(mat_ui_data)

	data["materials"] = materials

	return data

/obj/machinery/smelter/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("eject")
			var/material = params["name"]

			if(material in stored_material)
				eject_all_material(material)
			else
				eject_all_material()
			. = TRUE

		if("setside_input")
			input_side = text2dir(params["side"])
			. = TRUE

		if("setside_output")
			output_side = text2dir(params["side"])
			. = TRUE

		if("setside_refuse")
			refuse_output_side = text2dir(params["side"])
			. = TRUE

