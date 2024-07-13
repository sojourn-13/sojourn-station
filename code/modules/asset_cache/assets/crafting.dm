/datum/asset/spritesheet_batched/tool_upgrades
	name = "tool_upgrades"

/datum/asset/spritesheet_batched/tool_upgrades/create_spritesheets()
	for(var/type in subtypesof(/obj/item/tool_upgrade))
		var/obj/item/tool_upgrade/T = type
		var/class_name = sanitize_css_class_name("[type]")
		insert_icon(class_name, uni_icon(initial(T.icon), initial(T.icon_state)))

/datum/asset/spritesheet_batched/ores
	name = "ores"

/datum/asset/spritesheet_batched/ores/create_spritesheets()
	for(var/type in subtypesof(/obj/item/stack/ore))
		var/obj/item/stack/ore/O = type
		var/class_name = sanitize_css_class_name("[type]")
		var/datum/universal_icon/I = uni_icon(initial(O.icon), initial(O.icon_state))
		I.scale(64, 64)
		insert_icon(class_name, I)

/datum/asset/spritesheet_batched/materials
	name = "materials"

/datum/asset/spritesheet_batched/materials/create_spritesheets()
	for(var/type in subtypesof(/obj/item/stack/material) - typesof(/obj/item/stack/material/cyborg))
		var/obj/item/stack/material/M = type
		var/class_name = sanitize_css_class_name("[type]")
		var/datum/universal_icon/I = uni_icon(initial(M.icon), initial(M.icon_state))
		I.scale(32, 32)
		insert_icon(class_name, I)

/datum/asset/spritesheet/crafting
	name = "crafting"
	duplicates_allowed = TRUE

/datum/asset/spritesheet/crafting/create_spritesheets()
	for(var/name in SScraft.categories)
		for(var/datum/craft_recipe/CR in SScraft.categories[name])
			if(CR.result)
				var/sprite_name = sanitize_css_class_name("[CR.result]")
				var/icon/I = getFlatTypeIcon(CR.result)
				Insert(sprite_name, I)

			for(var/datum/craft_step/CS in CR.steps)
				if(CS.reqed_type)
					var/sprite_name = sanitize_css_class_name("[CS.reqed_type]")
					var/icon/I = getFlatTypeIcon(CS.reqed_type)
					Insert(sprite_name, I)
