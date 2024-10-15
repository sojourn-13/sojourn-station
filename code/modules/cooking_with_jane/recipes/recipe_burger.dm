
/datum/cooking_with_jane/recipe/burger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/bigbiteburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/bigbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty)
	)

/datum/cooking_with_jane/recipe/superbiteburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/superbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 3),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meatsteak),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/porkchops),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
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
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/cheesewedge, qmod=0.2),
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
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
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
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bacon, qmod=0.2),
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
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/chickensteak)
	)

/datum/cooking_with_jane/recipe/tofuburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/tofuburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/tofu)
	)

/datum/cooking_with_jane/recipe/roburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/food/snacks/roburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "silicon", 1),
		list(CWJ_ADD_ITEM, /obj/item/robot_parts/head)
	)

/datum/cooking_with_jane/recipe/xenoburger
	cooking_container = CUTTING_BOARD

	replace_reagents = TRUE
	
	product_type = /obj/item/reagent_containers/food/snacks/xenoburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/food/snacks/meat/xenomeat)
	)