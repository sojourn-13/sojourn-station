/mob/living
	var/datum/tgui_module/craft/TGCM

//this one is called when you need just a regular CM, without strick tab opened
/mob/living/verb/craft_menu()
	set name = "Craft Menu"
	set category = "IC"
	src.open_craft_menu()

//this is called when you use any proc and not verb, like atack_self and want to give tab name to be opened
/mob/living/proc/open_craft_menu(category = null)
	if(!TGCM)
		TGCM = new(src)
	TGCM.ui_interact(src)

/datum/tgui_module/craft
	name = "Craft menu"
	tgui_id = "CraftMenu"

/datum/tgui_module/craft/ui_assets(mob/user)
	if(user?.client?.get_preference_value(/datum/client_preference/tgui_toaster) == GLOB.PREF_YES)
		return list()

	return list(
		get_asset_datum(/datum/asset/spritesheet/crafting),
		get_asset_datum(/datum/asset/spritesheet_batched/materials),
	)

/datum/tgui_module/craft/ui_data(mob/user)
	var/list/data = list()

	data["is_admin"] = check_rights(show_msg = FALSE, C = user)

	return data

/datum/tgui_module/craft/ui_static_data(mob/user)
	var/list/data = list()

	var/list/crafting_recipes = list()

	for(var/category in SScraft.categories)
		if(isnull(crafting_recipes[category]))
			crafting_recipes[category] = list()

		var/list/recipes = SScraft.categories[category]

		for(var/datum/craft_recipe/CX in recipes)
			if(CX.requiredPerk && !user.stats.getPerk(CX.requiredPerk))	// Goes through all the different subtypes of recipes, and checks to see if they require a perk.
				continue							// If it requires a perk and the user doesn't possess that perk, it removes the category from being displayed.
			
			crafting_recipes[category] += list(CX.ui_data(user))

	data["crafting_recipes"] = crafting_recipes

	return data

/datum/tgui_module/craft/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("build")
			var/datum/craft_recipe/CR = locate(params["ref"])
			var/amount = params["amount"]
			if(amount && (CR.flags & CRAFT_BATCH))
				if(amount == "input")
					amount = input("How many \"[CR.name]\" do you want to craft?", "Craft batch") as null|num
				else
					amount = text2num(amount)
				amount = CLAMP(amount, 0, 50)
				if(!amount)
					return
				CR.build_batch(usr, amount)
			else
				CR.try_build(usr)
		if("view_vars")
			if(check_rights())
				usr.client.debug_variables(locate(params["ref"]))
