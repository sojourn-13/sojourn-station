// Parts for the custom roomba

// Circuit
/obj/item/weapon/circuitboard/roomba
	name = "roomba circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	item_state = "electronic"
	board_type = "other"

/obj/item/weapon/circuitboard/roomba/control
	build_name = "roomba central control module"
	desc = "A control board for a roomba."
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 3)

// Armor Plating

// Knife
/obj/item/weapon/tool/knife/roomba_knife
	name = "roomba knife"
	desc = "A knife with tape on it, for attaching on a roomba."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "knife_roomba"
	tool_qualities = list()
