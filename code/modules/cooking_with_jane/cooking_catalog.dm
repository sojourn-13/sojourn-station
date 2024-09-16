/datum/computer_file/program/cook_catalog
	filename = "cook_catalog"
	filedesc = "VIKA"
	extended_desc = "Lonestar (and Soteria) Presents: Victoria's Incredible Kitchen Assistant - an AI-generated electronic catalog for cooking."
	program_icon_state = "generic"
	program_key_state = "generic_key"
	program_menu_icon = "cookie-bite"
	size = 2
	available_on_ntnet = 1
	tguimodule_path = /datum/tgui_module/catalog/cooking/ntos
	usage_flags = PROGRAM_ALL

//===================================================================================
/proc/createCookingCatalogs()
	for(var/datum/cooking_with_jane/recipe/our_recipe in GLOB.cwj_recipe_list)
		if(our_recipe.appear_in_default_catalog)
			create_cooking_catalog_entry(our_recipe)

	//Do a sort
	var/datum/catalog/C = GLOB.catalogs[CATALOG_COOKING]
	C.entry_list = sortTim(C.entry_list, GLOBAL_PROC_REF(cmp_catalog_entry_cook))

//Because I want it to be EXTREMELY ORGANIZED.
/proc/cmp_catalog_entry_cook(datum/catalog_entry/cooking/a, datum/catalog_entry/cooking/b)
	//name - name
	if(a.title != b.title)
		return cmp_catalog_entry_asc(a, b)

	//if product name is same, sort by product count
	else if(a.recipe.product_name && b.recipe.product_name && a.recipe.product_name == b.recipe.product_name && a.recipe.product_count != b.recipe.product_count)
		return cmp_numeric_asc(b.recipe.product_count, a.recipe.product_count)

	//product name - product name
	else if(a.recipe.product_name && b.recipe.product_name && a.recipe.product_name != b.recipe.product_name)
		return sorttext(b.recipe.product_name, a.recipe.product_name)

	//if reagent name is same, sort by reagent_amount
	else if(a.recipe.reagent_name && b.recipe.reagent_name && a.recipe.reagent_name == b.recipe.reagent_name && a.recipe.reagent_amount != b.recipe.reagent_amount)
		return cmp_numeric_asc(b.recipe.reagent_amount, a.recipe.reagent_amount)

	//reagent name - reagent name
	else if(a.recipe.reagent_name && b.recipe.reagent_name && a.recipe.reagent_name != b.recipe.reagent_name)
		return sorttext(b.recipe.reagent_name, a.recipe.reagent_name)

	//product name - reagent name
	else if(a.recipe.product_name && b.recipe.reagent_name && a.recipe.product_name != b.recipe.reagent_name)
		return sorttext(b.recipe.reagent_name, a.recipe.product_name)

	//reagent name - product name
	else if(a.recipe.reagent_name && b.recipe.product_name && a.recipe.reagent_name != b.recipe.product_name)
		return sorttext(b.recipe.product_name, a.recipe.reagent_name)

	return cmp_catalog_entry_asc(a, b)

/proc/create_cooking_catalog_entry(var/datum/cooking_with_jane/recipe/our_recipe)
	var/catalog_id = CATALOG_COOKING
	if(!GLOB.catalogs[catalog_id])
		GLOB.catalogs[catalog_id] = new /datum/catalog(catalog_id)

	if(!GLOB.all_catalog_entries_by_type[our_recipe.type])
		GLOB.all_catalog_entries_by_type[our_recipe.type] = new /datum/catalog_entry/cooking(our_recipe)
	else
		CRASH("/proc/create_cooking_catalog_entry() - Duplicate type passed- [our_recipe.type]")

	var/datum/catalog/C = GLOB.catalogs[catalog_id]
	C.add_entry(GLOB.all_catalog_entries_by_type[our_recipe.type])

/datum/catalog_entry/cooking
	var/datum/cooking_with_jane/recipe/recipe

/datum/catalog_entry/cooking/New(var/datum/cooking_with_jane/recipe/our_recipe)
	thing_type = our_recipe.type
	title = our_recipe.name
	recipe = our_recipe

/datum/catalog_entry/cooking/catalog_ui_data(mob/user)
	var/list/data = ..()
	data["name"] = recipe.name
	data["id"] = recipe.type
	var/datum/asset/spritesheet/cooking_icons/sprites = get_asset_datum(/datum/asset/spritesheet/cooking_icons)	
	data["icon"] = sprites.icon_class_name(recipe.icon_image_file)
	data["product_is_reagent"] = 0
	if(recipe.product_name)
		data["product_name"] = recipe.product_name
		data["product_count"] = recipe.product_count
		if(recipe.reagent_name)
			data["byproduct_name"] = recipe.reagent_name
			data["byproduct_count"] = recipe.reagent_amount
		else
			data["byproduct_name"] = "None"
			data["byproduct_count"] = 0
	else if(recipe.reagent_name)
		data["product_name"] = recipe.reagent_name
		data["product_count"] = recipe.reagent_amount
		data["byproduct_name"] = "None"
		data["byproduct_count"] = 0
		data["product_is_reagent"] = 1
	else
		data["product_name"] = "ERROR"
		data["product_count"] = 0
		data["byproduct_name"] = "None"
		data["byproduct_count"] = 0
	return data


/datum/catalog_entry/cooking/ui_data(mob/user)
	var/list/data = ..()
	data["name"] = recipe.name
	data["id"] = recipe.type

	var/icon = recipe.icon_image_file
	var/datum/asset/spritesheet/cooking_icons/sprites = get_asset_datum(/datum/asset/spritesheet/cooking_icons)	
	icon = sprites.icon_class_name(icon)
	#ifdef CWJ_DEBUG
	log_debug("Retrieved [icon] for [recipe.icon_image_file]")
	#endif

	data["icon"] = icon
	data["product_is_reagent"] = 0
	if(recipe.product_name)
		data["product_name"] = recipe.product_name
		data["product_count"] = recipe.product_count
		if(recipe.reagent_name)
			data["byproduct_name"] = recipe.reagent_name
			data["byproduct_count"] = recipe.reagent_amount
		else
			data["byproduct_name"] = "None"
			data["byproduct_count"] = 0
	else if(recipe.reagent_name)
		data["product_name"] = recipe.reagent_name
		data["product_count"] = recipe.reagent_amount
		data["byproduct_name"] = "None"
		data["byproduct_count"] = 0
		data["product_is_reagent"] = 1
	else
		data["product_name"] = "ERROR"
		data["product_count"] = 0
		data["byproduct_name"] = "None"
		data["byproduct_count"] = 0

	data["description"] = recipe.description
	data["recipe_guide"] = recipe.recipe_guide

	switch(recipe.cooking_container)
		if(PLATE)
			data["create_in"] = "Made with a debug-only serving plate."
		if(CUTTING_BOARD)
			data["create_in"] = "Made on a cutting board."
		if(PAN)
			data["create_in"] = "Made with a pan or skillet."
		if(POT)
			data["create_in"] = "Made in a cooking pot."
		if(BOWL)
			data["create_in"] = "Made in a prep bowl."
		if(DF_BASKET)
			data["create_in"] = "Made in a deep frying basket."
		if(DF_BASKET)
			data["create_in"] = "Made in an air frying basket."
		if(OVEN)
			data["create_in"] = "Made with an oven dish."
		if(GRILL)
			data["create_in"] = "Made on a grill."
		else
			data["create_in"] = "Made with a ~//SEGMENTATION FAULT//~ 00110001"

	return data

//===========================================================
/datum/asset/spritesheet/cooking_icons
	name = "cooking_icons"
	resize = 4
	duplicates_allowed = TRUE // there are some duplicates

/datum/asset/spritesheet/cooking_icons/create_spritesheets()
	for(var/datum/cooking_with_jane/recipe/our_recipe in GLOB.cwj_recipe_list)
		var/icon/I = null
		var/sprite_name = null
		if(our_recipe.product_type)
			sprite_name = sanitize_css_class_name("[our_recipe.product_type]")
			I = getFlatTypeIcon(our_recipe.product_type)
		else if(our_recipe.reagent_id)
			var/obj/item/reagent_containers/food/snacks/dollop/test_dollop = new(null, our_recipe.reagent_id, 1)

			sprite_name = sanitize_css_class_name("[test_dollop.type][test_dollop.color]")
			I = getFlatIcon(test_dollop)
			//I.Blend(test_dollop.color) --might not be needed
		if(I)
			Insert(sprite_name, I)
			our_recipe.icon_image_file = sprite_name
			#ifdef CWJ_DEBUG
			log_debug("Created cooking icon under file name [filename]")
			#endif


