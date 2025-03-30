//Like normal burgers but for roach meat/type

/datum/cooking_with_jane/recipe/kampferburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/kampferburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat)
	)

/datum/cooking_with_jane/recipe/panzerburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/panzerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/panzer)
	)

/datum/cooking_with_jane/recipe/jagerburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jagerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/jager)
	)

/datum/cooking_with_jane/recipe/seucheburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/seucheburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/seuche)
	)

/datum/cooking_with_jane/recipe/fuhrerburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/fuhrerburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.2)
	)

/datum/cooking_with_jane/recipe/kaiserburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/kaiserburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/kaiser),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2,),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/kaiser),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.2)
	)

/datum/cooking_with_jane/recipe/bigroachburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/bigroachburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/jager, qmod=0.2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		list(CWJ_USE_TOOL_OPTIONAL, QUALITY_WELDING, 1, add_price = 1),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/seuche, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/egg, qmod=0.2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/panzer)
	)

