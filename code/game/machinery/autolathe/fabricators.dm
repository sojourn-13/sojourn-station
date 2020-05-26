/*
/obj/machinery/autolathe/armorfabricator
	name = "armor fabricator"
	desc = "It produces items using metal and glass."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "autolathe"
	circuit = /obj/item/weapon/circuitboard/armorfabricator
	build_type = AUTOLATHE
	have_disk = FALSE
	have_reagents = FALSE
	have_materials = TRUE
	have_recycling = FALSE
	have_design_selector = TRUE

	default_disk = /obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield


	var/list/recipes = list(
		/obj/item/weapon/tool/knife,
		/obj/item/weapon/crossbowframe,
		/obj/item/weapon/melee/nailstick
	)


/obj/machinery/autolathe/armorfabricator/loaded
	stored_material = list(
		MATERIAL_STEEL = 60,
		MATERIAL_PLASTIC = 60,
		MATERIAL_GLASS = 60,
		)
*/