
/datum/cooking_with_jane/recipe/burger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/cheeseburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/cheeseburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/fishburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/fishburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/fishfingers)
	)

/datum/cooking_with_jane/recipe/baconburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/baconburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/chickenburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/chickenburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tonkatsu)
	)

/datum/cooking_with_jane/recipe/tofuburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/tofuburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu)
	)

/datum/cooking_with_jane/recipe/roburger
	cooking_container = CUTTING_BOARD

	replace_reagents = TRUE
	
	product_type = /obj/item/reagent_containers/food/snacks/roburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "silicon", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/robot_parts/head)
	)

/datum/cooking_with_jane/recipe/xenoburger
	cooking_container = CUTTING_BOARD

	replace_reagents = TRUE
	
	product_type = /obj/item/reagent_containers/food/snacks/xenoburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "silicon", 1, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat)
	)