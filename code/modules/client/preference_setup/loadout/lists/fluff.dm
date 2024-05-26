// For personal player fluff items. Expect to see a lot of `ckey_whitelist = list("meow")`
// Please keep the `path = ` defines in here as well
// And put the icons in `icons/fluff/fluff_icons.dmi` or a file within the `icons/fluff` directory (computers need their own DMI files).
// And always label both the /datum/gear and /obj/item with `// ckey - character name` (or just `// ckey`)
// IT IS UP TO THE PLAYERS TO KEEP THEIR SHIT WORKING, NOT DEVELOPERS THAT CHANGE THINGS. (Other than compile errors, cuz, y'know, you'll have to figure that out.)

// Tigercat2000
/datum/gear/utility/advancedlaptop/larkens
	ckey_whitelist = list("tigercat2000")
	display_name = "Larkens-Branded Laptop"
	path = /obj/item/modular_computer/laptop/preset/custom_loadout/advanced/larkens

// Tigercat2000
/obj/item/modular_computer/laptop/preset/custom_loadout/advanced/larkens
	// Cost handled by parent type
	name = "Larkens-Branded Laptop"
	desc = "A laptop with custom LEDs modified to be cyan and purple, with a custom cyan backplate."
	icon = 'icons/fluff/shadow_laptop.dmi'
	icon_state = "shadowlaptop"
	// Uses default overlays
	overlay_icon = 'icons/obj/modular_laptop.dmi'
