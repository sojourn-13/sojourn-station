// For personal player fluff items. Expect to see a lot of `ckey_whitelist = list("meow")`
// Please keep the `path = ` defines in here as well
// And put the icons in `icons/fluff/fluff_icons.dmi` or a file within the `icons/fluff` directory (computers need their own DMI files).
// And always label both the /datum/gear and /obj/item with `// ckey - character name` (or just `// ckey`)
// IT IS UP TO THE PLAYERS TO KEEP THEIR SHIT WORKING, NOT DEVELOPERS THAT CHANGE THINGS. (Other than compile errors, cuz, y'know, you'll have to figure that out.)
// Prefer using /obj/item/fluff_conversion_kit where possible over spawning an item
// Total cost for obtaining your fluff item must be regular cost + 1 (k5 requirement)
// 1. If using conversion kit, this means set cost=1 so it costs 1 for the kit and whatever for the item
// 2. If spawning directly, specify cost = (default cost + 1)
//    You cannot do this progammatically, you have to find the appropriate cost by hand

/obj/item/fluff_conversion_kit
	name = "Conversion Kit"
	icon = 'icons/obj/device.dmi'
	icon_state = "modkit"

	var/list/ckey_whitelist = list()

	// Typed like this to hint at what typepath it should contain
	// as well as used to avoid a recast in examine()
	var/obj/target_type = null

	// Multiple options: Spawning a new item
	var/path_change = null

	// Or modifying the existing items vars
	var/name_change = null
	var/icon_change = null
	var/icon_state_change = null
	var/vars_change = list()

/obj/item/fluff_conversion_kit/examine(user, distance)
	..()
	to_chat(user, SPAN_NOTICE("This is able to convert '[initial(target_type.name)]'."))

/obj/item/fluff_conversion_kit/afterattack(atom/target, mob/user, proximity_flag, params)
	if(!proximity_flag)
		return
	if(!istype(user))
		return
	if(user.incapacitated())
		return
	if(!user.IsAdvancedToolUser())
		return

	if(!target_type)
		CRASH("Fluff conversion kit [name] doesn't specify a target type!")

	if(!istype(target, target_type))
		to_chat(user, "[src] does not support '[target]'.")
		return

	user.visible_message("[user] starts to apply [src] to [target]...", "You start to apply [src] to [target]...")
	if(!do_after(user, 2 SECONDS, target))
		to_chat(user, "You need to stay still to apply [src].")
		return


	var/old_name = target.name
	var/old_type = target.type
	var/obj/final_item = convert(target)
	user.visible_message("[user] uses [src] to transform '[old_name]' into '[final_item]'.", "You apply [src] to transform '[old_name]' into '[final_item]'.")
	// Put down a note that this happened
	final_item.investigate_log("was converted from [old_name] ([old_type]) into a fluff item by [user.ckey] using [name] ([type]).", "fluff")
	if(!(user.ckey in ckey_whitelist))
		// And an extra log if it was used suspiciously
		log_admin("[key_name(user)] used the fluff item modkit '[name]' that is only supposed to be used by ckeys '[jointext(ckey_whitelist, ", ")]'.")
	qdel(src)

/obj/item/fluff_conversion_kit/proc/convert(atom/target)
	if(path_change)
		var/obj/item/new_item = new path_change(target.loc)
		qdel(target)
		return new_item

	if(name_change)
		target.name = name_change

	if(icon_change)
		target.icon = icon_change

	if(icon_state_change)
		target.icon_state = icon_state_change

	if(length(vars_change))
		for(var/key in vars_change)
			target.vars["[key]"] = vars_change[key]

	target.update_icon()
	return target

/datum/gear/fluff
	display_name = "Fluff Item"
	category = /datum/gear/fluff
	sort_category = "Fluff Items"
	cost = 1

/datum/gear/New()
	. = ..()
	// no gear tweaks, they won't be carried through correctly because of modkits
	gear_tweaks = list()

/datum/gear/fluff/spawn_item(location, metadata)
	. = ..()
	var/obj/item/fluff_conversion_kit/kit = .
	if(istype(kit))
		kit.ckey_whitelist = ckey_whitelist


/**********************************/
/*                                */
/*    PLAYER STUFF BEYOND HERE    */
/*                                */
/**********************************/

// Tigercat2000
/datum/gear/fluff/larkens_laptop
	ckey_whitelist = list("tigercat2000")
	display_name = "Larkens Laptop Conversion Kit"
	path = /obj/item/fluff_conversion_kit/larkens_laptop

// Tigercat2000
/obj/item/fluff_conversion_kit/larkens_laptop
	name = "Larkens Laptop Conversion Kit"
	target_type = /obj/item/modular_computer/laptop

	name_change = "Larkens-Branded Laptop"
	icon_change = 'icons/fluff/shadow_laptop.dmi'
	icon_state_change = "shadowlaptop-closed"
	vars_change = list(
		"icon_state_unpowered" = "shadowlaptop",
		"overlay_icon" = 'icons/obj/modular_laptop.dmi'
	)

