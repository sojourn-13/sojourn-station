/obj/machinery/craftingstation
	name = "crafting station"
	desc = "Makeshift fabrication station for home-made munitions."
	icon = 'icons/obj/machines/crafting_station.dmi'
	icon_state = "craft"
	circuit = /obj/item/circuitboard/crafting_station
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

	var/storage_capacity = 20 // How many of each resource could be stored. Multiplied by matter bin rating
	var/productivity_bonus = 5 // Sum of micro-laser and manipulator ratings, increases effectiveness of ammo crafting
	var/list/materials_stored = list()
	var/list/materials_compatible = list (MATERIAL_PLASTEEL, MATERIAL_STEEL, MATERIAL_PLASTIC, MATERIAL_WOOD, MATERIAL_CARDBOARD, MATERIAL_PLASMA)

	// A vis_contents hack for materials loading animation.
	var/tmp/obj/effect/flick_light_overlay/image_load

/obj/item/circuitboard/crafting_station
	build_name = "crafting station"
	build_path = /obj/machinery/craftingstation
	board_type = "machine"
	origin_tech = list(TECH_MATERIAL = 2, TECH_ENGINEERING = 1)
	req_components = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/micro_laser = 2
	)

// You (still) can't flick_light overlays in BYOND, and this is a vis_contents hack to provide the same functionality.
// Used for materials loading animation.
/obj/effect/flick_light_overlay
	name = ""
	icon_state = ""
	// Acts like a part of the object it's created for when in vis_contents
	// Inherits everything but the icon_state
	vis_flags = VIS_INHERIT_ICON | VIS_INHERIT_DIR | VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID

/obj/effect/flick_light_overlay/New(atom/movable/loc)
	..()
	// Just VIS_INHERIT_ICON isn't enough: flick_light() needs an actual icon to be set
	icon = loc.icon
	loc.vis_contents += src

/obj/effect/flick_light_overlay/Destroy()
	if(istype(loc, /atom/movable))
		var/atom/movable/A = loc
		A.vis_contents -= src
	return ..()

/obj/machinery/craftingstation/Initialize()
	. = ..()
	image_load = new(src)


/obj/machinery/craftingstation/attackby(obj/item/I, mob/user)
	if(default_part_replacement(I, user))
		return

	if(default_deconstruction(I, user))
		return

	if(istype(I, /obj/item/stack/material))
		eat(user, I)
		return
	. = ..()

/obj/machinery/craftingstation/attack_hand(mob/living/user)
	if(!istype(user) || stat & NOPOWER || !in_range(src, user))
		return

	icon_state = "craft_ready"
	flick("craft_warmup", src)
	ui_interact(user)

/obj/machinery/craftingstation/ui_state(mob/user)
	return GLOB.physical_state

/obj/machinery/craftingstation/ui_close(mob/user)
	. = ..()
	if(!isobserver(user))
		icon_state = "craft"
		flick("craft_done", src)

/obj/machinery/craftingstation/ui_interact(mob/user, datum/tgui/ui)
	if(LAZYLEN(GLOB.all_crafting_station_recipes) == 0)
		populate_all_crafting_station_recipes()

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CraftingStation", name)
		ui.open()

/obj/machinery/craftingstation/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet_batched/materials)
	)

/obj/machinery/craftingstation/ui_static_data(mob/user)
	var/list/data = list()

	var/list/recipes = list()
	for(var/type in GLOB.all_crafting_station_recipes)
		var/datum/recipe_crafting_station/recipe = GLOB.all_crafting_station_recipes[type]
		var/list/recipe_data = recipe.get_ui_data(user, productivity_bonus)

		recipes += list(recipe_data)
	
	data["recipes"] = recipes
	return data

/obj/machinery/craftingstation/ui_data(mob/user)
	var/list/data = list()

	var/list/materials = list()
	for(var/mat in materials_stored)
		var/amt = materials_stored[mat]

		if(amt <= 0)
			continue

		var/material/MAT = get_material_by_name(mat)
		var/list/ME = MAT.ui_data(user)
		ME["count"] = amt

		materials += list(ME)

	data["materials"] = materials

	var/list/craftable_recipes = list()
	for(var/type in GLOB.all_crafting_station_recipes)
		var/datum/recipe_crafting_station/recipe = GLOB.all_crafting_station_recipes[type]

		if(recipe.can_craft(user, productivity_bonus, materials_stored))
			craftable_recipes += list(recipe.type)

	data["craftable_recipes"] = craftable_recipes

	data["perk_no_obfuscation"] = !!user.stats?.getPerk(PERK_NO_OBFUSCATION)

	return data

/obj/machinery/craftingstation/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("craft")
			var/type = text2path(params["type"])
			
			var/datum/recipe_crafting_station/recipe = GLOB.all_crafting_station_recipes[type]
			if(!istype(recipe))
				to_chat(usr, SPAN_DANGER("BUG: [type] is an unrecogized crafting recipe."))
				return

			if(!recipe.can_craft(usr, productivity_bonus, materials_stored))
				to_chat(usr, SPAN_WARNING("You cannot craft [recipe.name] right now."))
				return

			update_use_power(ACTIVE_POWER_USE)
			icon_state = "craft_[pick("cut", "points", "square")]"

			if(do_mob(usr, src, 5 SECONDS))
				if(!recipe.can_craft(usr, productivity_bonus, materials_stored))
					to_chat(usr, SPAN_WARNING("You cannot craft [recipe.name] right now."))
					return

				var/list/costs = recipe.get_cost(usr, productivity_bonus)
				for(var/mat in costs)
					materials_stored[mat] -= costs[mat]
				
				recipe.make_result(usr, src, productivity_bonus)
				. = TRUE

			update_use_power(IDLE_POWER_USE)
			icon_state = "craft_ready"

		if("eject")
			var/mat = params["material"]
			if(mat in materials_stored)
				eject(mat, materials_stored[mat])
				. = TRUE

/obj/machinery/craftingstation/proc/eat(mob/living/carbon/user, obj/item/stack/material/M)
	if(stat || user.stat || !Adjacent(user) || !M.matter)
		return

	var/materials_used = 0
	var/material_type = M.default_type

	if(!(material_type in materials_compatible))
		to_chat(user, SPAN_WARNING("[src] can not hold [material_type]."))
		return

	if(materials_stored[material_type] >= storage_capacity)
		to_chat(user, SPAN_WARNING("The [src] is full of [material_type]."))
		return

	if(materials_stored[material_type] + M.amount > storage_capacity)
		materials_used = storage_capacity - materials_stored[material_type]
	else
		materials_used = M.amount

	materials_stored[material_type] += materials_used

	if(!M.use(materials_used))
		qdel(M)

	to_chat(user, SPAN_NOTICE("You add [materials_used] of [M]\s to \the [src]."))

/obj/machinery/craftingstation/power_change()
	..()
	if(stat & NOPOWER)
		icon_state = "craft_off"
	else
		icon_state = "craft"

/obj/machinery/craftingstation/RefreshParts()
	productivity_bonus = 0
	for(var/obj/item/stock_parts/i in component_parts)
		if(istype(i, /obj/item/stock_parts/matter_bin))
			storage_capacity = 20 * i.rating
		else
			productivity_bonus += i.rating
	update_static_data_for_all_viewers()

/obj/machinery/craftingstation/on_deconstruction()
	for(var/i in materials_stored)
		eject(i, materials_stored[i])

//Autolathes can eject decimal quantities of material as a shard
/obj/machinery/craftingstation/proc/eject(material, amount)
	if(!(material in materials_stored))
		return

	if(!amount)
		return

	var/material/M = get_material_by_name(material)

	if(!M.stack_type)
		return
	amount = min(amount, materials_stored[material])

	var/whole_amount = round(amount)
	var/remainder = amount - whole_amount

	if(whole_amount)
		var/obj/item/stack/material/S = new M.stack_type(drop_location())

		//Accounting for the possibility of too much to fit in one stack
		if(whole_amount <= S.max_amount)
			S.amount = whole_amount
			S.update_strings()
			S.update_icon()
		else
			//There's too much, how many stacks do we need
			var/fullstacks = round(whole_amount / S.max_amount)
			//And how many sheets leftover for this stack
			S.amount = whole_amount % S.max_amount

			if(!S.amount)
				qdel(S)

			for(var/i = 0; i < fullstacks; i++)
				var/obj/item/stack/material/MS = new M.stack_type(drop_location())
				MS.amount = MS.max_amount
				MS.update_strings()
				MS.update_icon()

	//And if there's any remainder, we eject that as a shard
	if(remainder)
		new /obj/item/material/shard(drop_location(), material, _amount = remainder)

	//The stored material gets the amount (whole+remainder) subtracted
	materials_stored[material] -= amount
