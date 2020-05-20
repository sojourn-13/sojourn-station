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
		/datum/craft_recipe/weapon/improvised_maul,
		/datum/craft_recipe/weapon/rxd,
		/datum/craft_recipe/weapon/nailed_bat,
		list(name="Milk, 30u", cost=60, reagent="milk"),
		list(name="Slab of meat", cost=50, path=/obj/item/weapon/reagent_containers/food/snacks/meat)
	)


/obj/machinery/autolathe/armorfabricator/loaded
	stored_material = list(
		MATERIAL_STEEL = 60,
		MATERIAL_PLASTIC = 60,
		MATERIAL_GLASS = 60,
		)
*/