// The Hydrogen Knight rig suit, handmade by Soteria roboticists and Soteria's answer to the Church's Crusader Armor
/obj/item/rig/hydrogen_knight
	name = "Hydrogen Knight suit control module"
	suit_type = "hydrogen knight"
	desc = "An armored, knight-like suit designed by Soteria's best roboticists and powered by hydrogen."
	icon_state = "hydrogen_knight_rig"
	armor_list = list(melee = 30, bullet = 30, energy = 35, bomb = 10, bio = 100, rad = 100)
	slowdown = 0 // Lot of stuff used in its construction that justify not having any slowdown while active
	offline_slowdown = 5 // Very heavy and the suit isn't helping while offline
	offline_vision_restriction = 2
	emp_protection = 100 // Osmium plating + Ion Jaunter mean it is pretty much immune to EMPs

	chest_type = /obj/item/clothing/suit/space/rig/hydrogen_knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	glove_type = /obj/item/clothing/gloves/rig/hydrogen_knight
	cell_type =  /obj/item/cell/large/hydrogen/loaded // With how it is made, it start ready to be used
	air_type =   /obj/item/tank/oxygen
	suitable_cell = /obj/item/cell/large
	initial_modules = list(/obj/item/rig_module/storage/expanded)
	extra_allowed = list(
		/obj/item/hydrogen_fuel_cell
	)

	req_access = list()
	req_one_access = list()

// This shit is hardcoded to use the parent proc of toggle_helmet, so we need to override it here.
/obj/item/rig/hydrogen_knight/Initialize()
	..()
	if(helm_type)
		verbs -= /obj/item/rig/proc/toggle_helmet
		verbs |= /obj/item/rig/hydrogen_knight/toggle_helmet

/obj/item/rig/hydrogen_knight/toggle_helmet()
	set name = "Toggle Helmet"
	set desc = "Deploys or retracts your helmet."
	set category = "Hardsuit"
	set src = usr.contents

	if(!istype(wearer) || !wearer.back == src)
		to_chat(usr, SPAN_WARNING("The hardsuit is not being worn."))
		return

	if(!active)
		to_chat(usr, SPAN_WARNING("The helmet require the rig to be active."))
		return

	if(!check_suit_access(usr))
		return

	toggle_piece("helmet",wearer)

/obj/item/clothing/suit/space/rig/hydrogen_knight
	name = "suit"
	armor_list = list(melee = 80, bullet = 80, energy = 80, bomb = 70, bio = 100, rad = 100)
	retract_while_active = FALSE

/obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	name = "helmet"
	armor_list = list(melee = 80, bullet = 80, energy = 80, bomb = 70, bio = 100, rad = 100)
	retract_while_active = TRUE
	flash_protection = FLASH_PROTECTION_MAJOR

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
