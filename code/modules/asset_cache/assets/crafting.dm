
/datum/asset/simple/materials/register()
	for(var/type in subtypesof(/obj/item/stack/material) - typesof(/obj/item/stack/material/cyborg))
		var/filename = sanitizeFileName("[type].png")
		var/icon/I = getFlatTypeIcon(type)
		assets[filename] = I
	..()

/datum/asset/simple/ores/register()
	for(var/type in subtypesof(/obj/item/stack/ore))
		var/filename = sanitizeFileName("[type].png")
		var/icon/I = getFlatTypeIcon(type)
		assets[filename] = I
	..()

/datum/asset/simple/craft/register()
	var/list/craftStep = list()
	for(var/name in SScraft.categories)
		for(var/datum/craft_recipe/CR in SScraft.categories[name])
			if(CR.result)
				var/filename = sanitizeFileName("[CR.result].png")
				var/icon/I = getFlatTypeIcon(CR.result)
				assets[filename] = I

			for(var/datum/craft_step/CS in CR.steps)
				craftStep.Add(CS)
				if(CS.reqed_type)
					var/filename = sanitizeFileName("[CS.reqed_type].png")
					var/icon/I = getFlatTypeIcon(CS.reqed_type)
					assets[filename] = I
	..()

	// this is fucked but crafting has a circular dept unfortunantly. could unfuck with tgui port
	for(var/datum/craft_step/CS as anything in craftStep)
		if (!CS.reqed_material && !CS.reqed_type)
			continue
		CS.iconfile = SSassets.transport.get_asset_url(CS.reqed_material ? sanitizeFileName("[material_stack_type(CS.reqed_material)].png") : null, assets[sanitizeFileName("[CS.reqed_type].png")])
		CS.make_desc() // redo it

/datum/asset/simple/tool_upgrades/register()
	for(var/type in subtypesof(/obj/item/tool_upgrade))
		var/filename = sanitizeFileName("[type].png")
		var/icon/I = getFlatTypeIcon(type)
		assets[filename] = I
	..()
