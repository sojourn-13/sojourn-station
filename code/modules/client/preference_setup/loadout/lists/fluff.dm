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

	// ckeys are always lowercase
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
	category = /datum/gear/fluff
	sort_category = "Fluff Items"
	cost = 1

/datum/gear/fluff/New()
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
	icon_change = 'icons/fluff/fluff_items.dmi'
	icon_state_change = "shadowlaptop-closed"
	vars_change = list(
		"icon_state_unpowered" = "shadowlaptop",
		"overlay_icon" = 'icons/obj/modular_laptop.dmi'
	)

// TheEternalFlame
/datum/gear/fluff/tef_frayed_duster
	ckey_whitelist = list("theeternalflame")
	display_name = "Frayed Military Duster Conversion Kit"
	path = /obj/item/fluff_conversion_kit/tef_frayed_duster

// TheEternalFlame
/obj/item/fluff_conversion_kit/tef_frayed_duster
	name = "Frayed Military Duster Conversion Kit"
	target_type = /obj/item/clothing/suit/storage/toggle/leather

	name_change = "Frayed Military Duster"
	icon_change = 'icons/fluff/fluff_items.dmi'
	icon_state_change = "ghostechoe"
	vars_change = list(
		"desc" = "A military duster that's seen more combat than it probably should have, riddled with holes, tears and a healthy amount of dried blood. It likely should have been thrown away a long time ago, instead recently a peace symbol was drawn over it's back. The state of the duster and the symbol on it's back left it at odds with itself.",
		"icon_override" = 'icons/fluff/clothing_mob.dmi',
		"item_state" = "ghostechoe"
	)

// SLRaptor
/datum/gear/fluff/slr_patterned_serape
	ckey_whitelist = list("slraptor")
	display_name = "Patterned Serape Conversion Kit"
	path = /obj/item/fluff_conversion_kit/slr_patterned_serape

// SLRaptor
/obj/item/fluff_conversion_kit/slr_patterned_serape
	name = "Patterned Serape Conversion Kit"
	target_type = /obj/item/clothing/suit/storage/vest/scav
	name_change = "Worn Serape"
	icon_change = 'icons/fluff/fluff_items.dmi'
	icon_state_change = "serape"
	vars_change = list(
		"desc" = "A red and white serape. This shawl is well faded and well worn from years of heavy outdoor use, the pattern and colors are splotched with new patches hastily sewn with discolored thread",
		"icon_override" = 'icons/fluff/clothing_mob.dmi',
		"item_state" = "serape"
	)

// guidesa/SSGT_BR
/datum/gear/fluff/guidesa_sheath
	ckey_whitelist = list("ssgtbr")
	display_name = "Runed Sheath Conversion Kit"
	path = /obj/item/fluff_conversion_kit/guidesa_sheath

// guidesa/SSGT_BR
/obj/item/fluff_conversion_kit/guidesa_sheath
	name = "Runed Sheath Conversion Kit"
	target_type = /obj/item/storage/sheath/non_church/general

	name_change = "Runed Sheath"
	icon_change = 'icons/fluff/fluff_items.dmi'
	vars_change = list(
		"desc" = "An old adorned sheath meant to hold a variety of weapons and swords. It looks elegant.",
		"icon_override" = 'icons/fluff/clothing_mob.dmi',
		"base_icon_state" = "runed_sheath",
		"base_item_state" = "runed_sheath"
	)

// Chef_Doggo
/datum/gear/fluff/chef_doggo_telescopic_baton
	ckey_whitelist = list("chefdoggo")
	display_name = "Gold Leaf Telescopic Baton Kit"
	path = /obj/item/fluff_conversion_kit/chef_doggo_telescopic_baton

// Chef_Doggo
/obj/item/fluff_conversion_kit/chef_doggo_telescopic_baton
	name = "Patterned Serape Conversion Kit"
	target_type = /obj/item/melee/telebaton
	name_change = "Gilded Telebaton"
	icon_change = 'icons/fluff/fluff_items.dmi'
	icon_state_change = "rat_telebaton"
	vars_change = list(
		"desc" = "A relatively standard telebaton with gold leafing on the tip and on parts of the metal creating a striped look, the handle is dyed a golden yellow.",
		"icon_override" = 'icons/fluff/fluff_items.dmi',
		"item_state" = "rat_telebaton_0",
		"baton_base" = "rat_telebaton"
	)

// drfarson
/datum/gear/fluff/drfarson_katana_saya
	ckey_whitelist = list("drfarson")
	display_name = "Embroidered Occult Saya"
	path = /obj/item/clothing/accessory/holster/saber/occult

// drfarson
/obj/item/clothing/accessory/holster/saber/occult
	name = "embroidered occult saya"
	desc = "A sleek hardened ebony material covers the entire saya in multifaceted shapes, the runes on it seem to shift and change as you look at them, probing your mind."
	icon_state = "rapiersci_holster"
	overlay_state = "rapiersci"
	slot = "utility"
	can_hold = list(/obj/item/tool/sword/saber/deconstuctive_rapier, /obj/item/tool/sword/katana/nano, /obj/item/tool/hydrogen_sword, /obj/item/tool/knife/ritual/blade)
	price_tag = 15000
	sound_in = 'sound/effects/sheathin.ogg'
	sound_out = 'sound/effects/sheathout.ogg'

// drfarson
/datum/gear/fluff/drfarson_medal
	ckey_whitelist = list("drfarson")
	display_name = "High Council Medal of Honor"
	path = /obj/item/clothing/accessory/medal/gold/honor


// floofster
/datum/gear/fluff/floof_cloak
	ckey_whitelist = list("floofster")
	display_name = "Outsider's Cloak"
	path = /obj/item/clothing/accessory/cape/outsider
	cost = 0
