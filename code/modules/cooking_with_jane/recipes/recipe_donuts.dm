/datum/cooking_with_jane/recipe/medialuna //This is 100% a donut but with extra layers
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/medialuna
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "sodiumchloride", 1, base=1, add_price = 1),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "cream", 1, base=1, add_price = 1),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1)
	)

/datum/cooking_with_jane/recipe/donut
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/donut
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "glaze", 5, base=1, add_price = 2),
		list(CWJ_USE_OVEN, J_LO, 10 SECONDS)
	)

/datum/cooking_with_jane/recipe/jellydonut
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/donut/jelly
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "berryjuice", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "glaze", 5, base=1, add_price = 2),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/slime_jellydonut
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/donut/slimejelly
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cornoil", 1),
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "glaze", 5, base=1, add_price = 2),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/cinnamonroll
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/cinnamonroll
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "cinnamonpowder", 5),
		list(CWJ_ADD_REAGENT, "sugar", 10),
		list(CWJ_ADD_REAGENT, "milk", 5),
		list(CWJ_ADD_REAGENT, "egg", 3),
		list(CWJ_USE_ITEM_OPTIONAL, /obj/item/material/kitchen/rollingpin, add_price = 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "glaze", 5, base=1, add_price = 2),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/chaosdonut
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/donut/chaos
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_ADD_REAGENT, "frostoil", 5),
		list(CWJ_USE_ITEM_OPTIONAL, /obj/item/material/kitchen/rollingpin, add_price = 3),
		list(CWJ_ADD_REAGENT, "capsaicin", 5),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "glaze", 5, base=1, add_price = 2),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)

/datum/cooking_with_jane/recipe/poppypretzel
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/poppypretzel
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/doughslice, qmod=0.5),
		list(CWJ_USE_ITEM_OPTIONAL, /obj/item/material/kitchen/rollingpin, add_price = 3),
		list(CWJ_ADD_REAGENT, "sodiumchloride", 3, base=1),
		list(CWJ_ADD_ITEM_OPTIONAL, /obj/item/reagent_containers/snacks/butterslice, qmod=0.5, add_price = 5),
		list(CWJ_ADD_PRODUCE, "poppy", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, base=3, add_price = 6),
		list(CWJ_USE_OVEN, J_LO, 20 SECONDS)
	)
