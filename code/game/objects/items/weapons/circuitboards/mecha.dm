/obj/item/circuitboard/mecha
	name = "exosuit circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	item_state = "electronic"
	board_type = "other"
	price_tag = 300

/obj/item/circuitboard/mecha/main
	build_name = "central control"
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 3)

/obj/item/circuitboard/mecha/peripherals
	build_name = "peripherals control"
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 3)

/obj/item/circuitboard/mecha/targeting
	build_name = "weapon control and targeting"
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 4)
