// The Hydrogen Knight rig suit, handmade by Soteria roboticists and Soteria's answer to the Church's Crusader Armor
/obj/item/rig/hydrogen_knight
	name = "Hydrogen Knight suit control module"
	suit_type = "hydrogen knight"
	desc = "An armored, knight-like suit designed by Soteria's best roboticists and powered by hydrogen."
	icon_state = "hydrogen_knight_rig"
	armor_list = list(melee = 50, bullet = 50, energy = 50, bomb = 70, bio = 100, rad = 100)
	slowdown = 0 // Lot of stuff used in its construction that justify not having any slowdown while active
	offline_slowdown = 5 // Very heavy and the suit isn't helping while offline
	offline_vision_restriction = 2
	emp_protection = 100 // Osmium plating + Ion Jaunter mean it is pretty much immune to EMPs
	removable_cell = TRUE // Cannot remove the cell
	chest_type = /obj/item/clothing/suit/space/rig/hydrogen_knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	glove_type = /obj/item/clothing/gloves/rig/hydrogen_knight
	cell_type =  /obj/item/cell/large/hydrogen/loaded // With how it is made, it start ready to be used
	air_type =   /obj/item/tank/oxygen
	suitable_cell = /obj/item/cell/large
	initial_modules = list(//obj/item/rig_module/storage/expanded,
							/obj/item/rig_module/mounted,
							/obj/item/rig_module/held/shield,
							/obj/item/rig_module/vision/nvg,
							/obj/item/rig_module/maneuvering_jets)

	extra_allowed = list(
		/obj/item/hydrogen_fuel_cell
	)
	max_upgrades = 0 //no
	req_access = null
	req_one_access = null

/obj/item/clothing/suit/space/rig/hydrogen_knight
	name = "suit"
	retract_while_active = FALSE

/obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	name = "helmet"
	camera_networks = list(NETWORK_RESEARCH)
	retract_while_active = TRUE
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	name = "greaves"
	retract_while_active = FALSE
	item_flags = COVER_PREVENT_MANIPULATION|NOSLIP

/obj/item/clothing/gloves/rig/hydrogen_knight
	name = "gauntlets"
	retract_while_active = FALSE

// Osmium plating + Ion Jaunter mean it is pretty much immune to EMPs
/obj/item/rig/hydrogen_knight/emp_act(severity_class)
	return
