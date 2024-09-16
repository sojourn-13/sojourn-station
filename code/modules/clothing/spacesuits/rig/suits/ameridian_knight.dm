// The Ameridian Knight rig suit, handmade by Soteria roboticists and Soteria's answer to the Church's Crusader Armor
/obj/item/rig/ameridian_knight
	name = "Ameridian Knight suit control module"
	suit_type = "ameridian knight"
	desc = "An armored, knight-like suit designed by Soteria's best roboticists and powered by an ameridian core."
	icon_state = "ameridian_knight_rig"
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 70, bio = 100, rad = 100)
	slowdown = 0 // Lot of stuff used in its construction that justify not having any slowdown while active
	offline_slowdown = 5 // Very heavy and the suit isn't helping while offline
	offline_vision_restriction = 2
	emp_protection = 100 // Osmium plating + Ion Jaunter mean it is pretty much immune to EMPs
	removable_cell = FALSE // Cannot remove the cell
	chest_type = /obj/item/clothing/suit/space/rig/ameridian_knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/ameridian_knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/ameridian_knight
	glove_type = /obj/item/clothing/gloves/rig/ameridian_knight
	cell_type =  /obj/item/cell/large/ameridian/loaded // With how it is made, it start ready to be used
	air_type =   /obj/item/tank/oxygen
	suitable_cell = /obj/item/cell/large
	initial_modules = list(//obj/item/rig_module/storage/expanded,
							/obj/item/rig_module/mounted,
							/obj/item/rig_module/held/shield,
							/obj/item/rig_module/vision/nvg,
							/obj/item/rig_module/maneuvering_jets)
	max_upgrades = 0 //no
	req_access = null
	req_one_access = null

/obj/item/clothing/suit/space/rig/ameridian_knight
	name = "suit"
	retract_while_active = FALSE

/obj/item/clothing/head/helmet/space/rig/ameridian_knight
	name = "helmet"
	camera_networks = list(NETWORK_RESEARCH)
	retract_while_active = TRUE
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/shoes/magboots/rig/ameridian_knight
	name = "greaves"
	retract_while_active = FALSE
	item_flags = COVER_PREVENT_MANIPULATION|NOSLIP

/obj/item/clothing/gloves/rig/ameridian_knight
	name = "gauntlets"
	retract_while_active = FALSE

// Osmium plating + Ion Jaunter mean it is pretty much immune to EMPs
/obj/item/rig/ameridian_knight/emp_act(severity_class)
	return
