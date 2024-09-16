/*
	important notes
	catalogs are handled in /datum/tgui_module/catalog, check there
	important procs are:
		browse_catalog_entry()
		browse_catalog()
		refresh_catalog_browsing()

	TODO: add access level that will show more info
*/

GLOBAL_LIST_EMPTY(catalogs)
GLOBAL_LIST_EMPTY(all_catalog_entries_by_type)

/hook/startup/proc/createCatalogs()
	// Reagents
	for(var/V in GLOB.chemical_reagents_list)
		var/datum/reagent/D = GLOB.chemical_reagents_list[V]
		if(D.appear_in_default_catalog)
			create_catalog_entry(D, CATALOG_REAGENTS)
			create_catalog_entry(D, CATALOG_ALL)
			if(istype(D, /datum/reagent/drink) || istype(D, /datum/reagent/ethanol))
				if(D.type == /datum/reagent/ethanol)
					create_catalog_entry(D, CATALOG_CHEMISTRY)
				create_catalog_entry(D, CATALOG_DRINKS)
			else
				create_catalog_entry(D, CATALOG_CHEMISTRY)
	// second run to add decompose results
	for(var/V in GLOB.chemical_reagents_list)
		var/datum/reagent/D = GLOB.chemical_reagents_list[V]
		if(D.heating_products && D.heating_point)
			for(var/id in D.heating_products)
				var/datum/catalog_entry/reagent/E = get_catalog_entry(get_reagent_type_by_id(id))
				if(E)
					// D decomposes into E, tell E that its "parent" is D
					E.add_decomposition_from(D)

		if(D.chilling_products && D.chilling_point)
			for(var/id in D.chilling_products)
				var/datum/catalog_entry/reagent/E = get_catalog_entry(get_reagent_type_by_id(id))
				if(E)
					// D decomposes into E, tell E that its "parent" is D
					E.add_decomposition_from(D)

	var/datum/catalog/C = GLOB.catalogs[CATALOG_REAGENTS]
	C.entry_list = sortTim(C.entry_list, GLOBAL_PROC_REF(cmp_catalog_entry_asc))
	C = GLOB.catalogs[CATALOG_CHEMISTRY]
	C.entry_list = sortTim(C.entry_list, GLOBAL_PROC_REF(cmp_catalog_entry_chem))
	C = GLOB.catalogs[CATALOG_DRINKS]
	C.entry_list = sortTim(C.entry_list, GLOBAL_PROC_REF(cmp_catalog_entry_asc))
	C = GLOB.catalogs[CATALOG_ALL]
	C.entry_list = sortTim(C.entry_list, GLOBAL_PROC_REF(cmp_catalog_entry_asc))
	createCookingCatalogs()
	return 1

/proc/create_catalog_entry(var/datum/thing, var/catalog_id)
	if(catalog_id && !GLOB.catalogs[catalog_id])
		GLOB.catalogs[catalog_id] = new /datum/catalog(catalog_id)
	if(!GLOB.all_catalog_entries_by_type[thing.type])
		if(istype(thing, /datum/reagent))
			if(istype(thing, /datum/reagent/drink) || (istype(thing, /datum/reagent/ethanol) && thing.type != /datum/reagent/ethanol))
				GLOB.all_catalog_entries_by_type[thing.type] = new /datum/catalog_entry/drink(thing)
			else
				GLOB.all_catalog_entries_by_type[thing.type] = new /datum/catalog_entry/reagent(thing)
		else if(istype(thing, /atom))
			GLOB.all_catalog_entries_by_type[thing.type] = new /datum/catalog_entry/atom(thing)
		else
			var/list/element = GLOB.catalogs[catalog_id]
			if(!element.len)
				qdel(element)
				GLOB.catalogs.Remove(catalog_id)
				return FALSE
			error("Unsupported type passed to /proc/create_catalog_entry()")
			return FALSE
		if(catalog_id)
			var/datum/catalog/C = GLOB.catalogs[catalog_id]
			C.add_entry(GLOB.all_catalog_entries_by_type[thing.type])
	else if(catalog_id)
		var/datum/catalog/C = GLOB.catalogs[catalog_id]
		if(!C.entry_list.Find(GLOB.all_catalog_entries_by_type[thing.type]))
			C.add_entry(GLOB.all_catalog_entries_by_type[thing.type])
	return TRUE

/proc/get_catalog_entry(var/type)
	if(GLOB.all_catalog_entries_by_type[type])
		return GLOB.all_catalog_entries_by_type[type]

/datum/catalog
	var/id
	var/list/datum/catalog_entry/entry_list = list()

/datum/catalog/New(var/_id)
	. = ..()
	id = _id

// accepts either type or datum
/datum/catalog/proc/get_entry(var/datum/thing)
	for(var/datum/catalog_entry/E in entry_list)
		if(E.thing_type == ispath(thing) ? thing : thing.type)
			return E

/datum/catalog/proc/add_entry(var/datum/catalog_entry/entry)
	entry_list.Add(entry)

/datum/catalog/proc/remove_entry(var/datum/catalog_entry/entry)
	entry_list.Remove(entry)

/datum/catalog/ui_data(mob/user, search_value)
	var/list/data = list()
	var/list/entries_data = list()
	for(var/datum/catalog_entry/E in entry_list)
		if(!search_value || E.search_value(search_value))
			entries_data.Add(list(E.catalog_ui_data(user)))
	data["entries"] = entries_data
	return data

/datum/catalog_entry
	var/thing_type
	var/image_path	//image path in client cache
	var/title
	var/description
	var/thing_nature 	// reagent/weapon/device/etc.

/datum/catalog_entry/New(var/datum/V)
	thing_type = V.type

/datum/catalog_entry/proc/search_value(var/value)
	if(findtext(title, value))
		return TRUE
	if(findtext(thing_nature, value))
		return TRUE

/datum/catalog_entry/ui_data(mob/user)
	var/list/data = list()
	data["id"] = thing_type
	data["thing_nature"] = thing_nature

	return data

// this used to get nano_ui_data for list
// usually this is shorter nano_ui_data
/datum/catalog_entry/proc/catalog_ui_data(mob/user)
	var/list/data = list()
	data["id"] = thing_type
	data["name"] = title
	data["thing_nature"] = thing_nature
	if(image_path)
		data["image"] = image_path
	return data

/datum/catalog_entry/reagent
	var/reagent_type
	var/reagent_state
	var/metabolism_blood
	var/metabolism_stomach
	var/taste
	var/nerve_system_accumulations
	var/heating_decompose
	var/heating_point
	var/chilling_decompose
	var/chilling_point
	var/color
	var/scannable
	var/overdose
	var/addiction_chance
	var/addiction_threshold
	var/list/recipe_data
	var/list/result_of_decomposition_in
	var/list/can_be_used_in

/datum/catalog_entry/reagent/search_value(var/value)
	if(..())
		return TRUE
	if(findtext(reagent_type, value))
		return TRUE

/datum/catalog_entry/reagent/proc/add_decomposition_from(var/datum/reagent/D)
	LAZYINITLIST(result_of_decomposition_in)
	for(var/list/V in result_of_decomposition_in)
		if(V["type"] == D.type)
			return
	result_of_decomposition_in += list(list( "name" = D.name, "type" = D.type ))
	// for(var/V in result_of_decomposition_in)
	// 	if(V == reagent_type)
	// 		return
	// result_of_decomposition_in.Add(reagent_type)

/datum/catalog_entry/reagent/proc/add_can_be_used_in(var/datum/reagent/D)
	LAZYINITLIST(can_be_used_in)
	for(var/list/V in can_be_used_in)
		if(V["type"] == D.type)
			return
	can_be_used_in += list(list( "name" = D.name, "type" = D.type ))
	// if(!can_be_used_in)
	// 	can_be_used_in = list()
	// for(var/V in can_be_used_in)
	// 	if(V == reagent_type)
	// 		return
	// can_be_used_in.Add(reagent_type)

/datum/catalog_entry/reagent/New(datum/reagent/V)
	if(!istype(V))
		error("wrong usage of [src.type]")
		qdel(src)
		return
	..()
	// SPECIFICTS
	title = V.name
	thing_nature = "Reagent"
	reagent_type = V.reagent_type
	reagent_state = V.reagent_state == SOLID ? "Solid" : V.reagent_state == LIQUID ? "Liquid" : "Gas"
	metabolism_blood = V.metabolism
	if(V.ingest_met)
		metabolism_stomach = V.ingest_met
	nerve_system_accumulations = V.nerve_system_accumulations
	if(V.heating_products && V.heating_point)
		var/list/dat = list()
		dat["types"] = list()
		for(var/id in V.heating_products)
			var/datum/reagent/D = GLOB.chemical_reagents_list["[id]"]
			if(D)
				dat["types"] += list(list( "name" = D.name, "type" = D.type ))
		heating_decompose = dat
		heating_point = V.heating_point

	if(V.chilling_products && V.chilling_point)
		var/list/dat = list()
		dat["types"] = list()
		for(var/id in V.chilling_products)
			var/datum/reagent/D = GLOB.chemical_reagents_list["[id]"]
			if(D)
				dat["types"] += list(list( "name" = D.name, "type" = D.type ))
		chilling_decompose = dat
		chilling_point = V.chilling_point

	scannable = V.scannable
	overdose = V.overdose ? V.overdose : null
	var/list/recipes = GLOB.chemical_reactions_list_by_result[V.id]
	if(recipes)
		recipe_data = list()
		for(var/datum/chemical_reaction/R in recipes)
			recipe_data += list(R.nano_ui_data())
	var/list/used_in = GLOB.chemical_reactions_list[V.id]
	if(used_in)
		for(var/datum/chemical_reaction/R in used_in)
			if(R.result)
				var/datum/reagent/D = GLOB.chemical_reagents_list["[R.result]"]
				if(D)
					add_can_be_used_in(D)

	// DESCRIPTION
	description = V.description
	taste = "Has [V.taste_mult > 1 ? "strong" : V.taste_mult < 1 ? "weak" : ""] taste of [V.taste_description]."
	color = "[V.color]"
	if(V.addiction_threshold || V.addiction_chance)
		addiction_chance = V.addiction_threshold ? "high" : V.addiction_chance <= 10 ? "Low" : V.addiction_chance <= 25 ? "Moderate" : "High"
		addiction_threshold = V.addiction_threshold

/datum/catalog_entry/reagent/catalog_ui_data(mob/user)
	var/list/data = ..()
	data["reagent_state"] = reagent_state
	data["reagent_type"] = reagent_type
	return data

/datum/catalog_entry/reagent/ui_data(mob/user)
	var/list/data = ..()

	// SPECIFICTS
	data["name"] = title
	data["reagent_type"] = reagent_type
	data["reagent_state"] = reagent_state
	data["metabolism_blood"] = metabolism_blood
	data["metabolism_stomach"] = metabolism_stomach
	data["nsa"] = nerve_system_accumulations
	data["heating_decompose"] = heating_decompose
	data["heating_point"] = heating_point
	data["chilling_decompose"] = chilling_decompose
	data["chilling_point"] = chilling_point
	data["scannable"] = scannable
	data["overdose"] = overdose
	data["result_of_decomposition_in"] = result_of_decomposition_in
	data["can_be_used_in"] = can_be_used_in


	data["recipe_data"] = recipe_data

	// DESCRIPTION
	data["description"] = description
	data["taste"] = taste
	data["color"] = color
	data["addiction_chance"] = addiction_chance
	data["addiction_threshold"] = addiction_threshold

	return data

/datum/catalog_entry/atom

/datum/catalog_entry/atom/New(var/atom/V)
	if(!istype(V))
		error("wrong usage of [src.type]")
		qdel(src)
		return
	..()
	title = V.name
	description = V.desc
	thing_nature = "Atom"
	image_path = SSassets.transport.get_asset_url(V)


/datum/catalog_entry/atom/ui_data(mob/user)
	var/list/data = ..()

	// SPECIFICTS
	data["name"] = title
	data["entry_image_path"] = image_path

	// DESCRIPTION
	data["description"] = description
	return data


/datum/catalog_entry/drink
	var/temperature
	var/nutrition
	var/taste
	var/strength
	var/list/recipe_data

/datum/catalog_entry/drink/search_value(var/value)
	if(..())
		return TRUE
	if(findtext(strength, value))
		return TRUE

/datum/catalog_entry/drink/New(var/datum/reagent/V)
	if(!istype(V))
		error("wrong usage of [src.type]")
		qdel(src)
		return
	..()
	title = V.name
	description = V.description

	taste = "Has [V.taste_mult > 1 ? "strong" : V.taste_mult < 1 ? "weak" : ""] taste of [V.taste_description]."
	if(istype(V, /datum/reagent/drink))
		var/datum/reagent/drink/D = V
		if(D.adj_temp)
			temperature = D.adj_temp > 0 ? "Warm" : "Cold"
		if(D.nutrition)
			nutrition = D.nutrition > 1 ? "High" : "Low"
		thing_nature = "Drink"

	else if(istype(V, /datum/reagent/ethanol))
		var/datum/reagent/ethanol/E = V
		if(E.adj_temp)
			temperature = E.adj_temp > 0 ? "Warm" : "Cold"
		if(E.nutriment_factor)
			nutrition = E.nutriment_factor > 1 ? "High" : "Low"
		strength = E.strength <= 15 ? "Knocking out" : E.strength <= 50 ? "Strong" : "Light"
		thing_nature = "Alchohol drink"

	var/list/recipes = GLOB.chemical_reactions_list_by_result[V.id]
	if(recipes)
		recipe_data = list()
		for(var/datum/chemical_reaction/R in recipes)
			recipe_data += list(R.nano_ui_data())

/datum/catalog_entry/drink/ui_data(mob/user)
	var/list/data = ..()

	// SPECIFICTS
	data["name"] = title
	data["entry_image_path"] = image_path

	data["temperature"] = temperature
	data["nutrition"] = nutrition
	data["taste"] = taste
	data["strength"] = strength
	data["recipe_data"] = recipe_data


	// DESCRIPTION
	data["description"] = description
	return data
