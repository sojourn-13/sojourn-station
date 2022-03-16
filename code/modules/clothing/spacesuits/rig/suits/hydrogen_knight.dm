// The Hydrogen Knight rig suit, handmade by Soteria roboticists and Soteria's answer to the Church's Crusader Armor
/obj/item/rig/hydrogen_knight
	name = "Hydrogen Knight suit control module"
	suit_type = "Hydrogen Knight"
	desc = "An armored, knight-like suit designed by Soteria's best roboticists and powered by hydrogen."
	icon_state = "eva_rig"
	armor_list = list(melee = 10, bullet = 10, energy = 15, bomb = 10, bio = 100, rad = 100) // Same stats as the Crusader Shield, except the bio and rad protection, for obvious reasons
	slowdown = 0 // Lot of stuff used in its construction that justify not having any slowdown
	offline_slowdown = 1
	offline_vision_restriction = 1

	chest_type = /obj/item/clothing/suit/space/rig/hydrogen_knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	glove_type = /obj/item/clothing/gloves/rig/hydrogen_knight
	cell_type =  /obj/item/cell/large/hydrogen/loaded // With how it is made, it start ready to be used
	air_type =   /obj/item/tank/oxygen
	suitable_cell = /obj/item/cell/large/hydrogen // Can only use the hydrogen adapter as a power source
	extra_allowed = list(
		/obj/item/hydrogen_fuel_cell
	)

	req_access = list()
	req_one_access = list()

/obj/item/clothing/suit/space/rig/hydrogen_knight
	name = "hydrogen knight suit"
	armor_list = list(melee = 65, bullet = 65, energy = 65, bomb = 70, bio = 100, rad = 100) // Same stats as the crusader armor

/obj/item/clothing/head/helmet/space/rig/hydrogen_knight
	name = "hydrogen knight helm"
	armor_list = list(melee = 65, bullet = 65, energy = 65, bomb = 70, bio = 100, rad = 100) // Same stats as the crusader helmet

/obj/item/clothing/shoes/magboots/rig/hydrogen_knight
	name = "hydrogen knight boots"

/obj/item/clothing/gloves/rig/hydrogen_knight
	name = "hydrogen knight gauntlets"



