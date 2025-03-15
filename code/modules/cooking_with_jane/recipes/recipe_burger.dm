
/datum/cooking_with_jane/recipe/burger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/monkeyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty)
	)

//Apparently this is a burger
/datum/cooking_with_jane/recipe/muffinegg
	cooking_container = OVEN
	product_type = /obj/item/reagent_containers/snacks/muffinegg
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/friedegg, qmod=0.5),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.5)
	)

/datum/cooking_with_jane/recipe/slime
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellyburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT, "honey", 5),
		list(CWJ_ADD_REAGENT, "vodka", 5),
		list(CWJ_ADD_REAGENT, "sugar", 5),
	)

/datum/cooking_with_jane/recipe/slimejelly
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellyburger/slime

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT, "slimejelly", 5),
	)

/datum/cooking_with_jane/recipe/jellyburger_cherry
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/jellyburger/cherry

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT, "cherryjelly", 5),
	)

/datum/cooking_with_jane/recipe/bigbiteburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/bigbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty)
	)

/datum/cooking_with_jane/recipe/superbiteburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/superbiteburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 3, add_price = 9),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 3, add_price = 12),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 3, add_price = 6),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meatsteak),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/porkchops),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty)
	)

/datum/cooking_with_jane/recipe/cheeseburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cheeseburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/cheesewedge, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty)
	)

/datum/cooking_with_jane/recipe/fishburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/fishburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/fishfingers)
	)

/datum/cooking_with_jane/recipe/baconburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/baconburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bacon, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/patty)
	)

/datum/cooking_with_jane/recipe/chickenburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/chickenburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/chickensteak)
	)

/datum/cooking_with_jane/recipe/tofuburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/tofuburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/tofu)
	)

/datum/cooking_with_jane/recipe/clownburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/clownburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/clothing/mask/costume/job/clown)
	)

/datum/cooking_with_jane/recipe/mimeburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/mimeburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/clothing/head/beret)
	)

/datum/cooking_with_jane/recipe/roburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/roburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_REAGENT_OPTIONAL, "silicon", 1),
		list(CWJ_ADD_ITEM, /obj/item/robot_parts/head)
	)

/datum/cooking_with_jane/recipe/xenoburger
	cooking_container = CUTTING_BOARD

	replace_reagents = TRUE

	product_type = /obj/item/reagent_containers/snacks/xenoburger
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/xenomeat)
	)

/datum/cooking_with_jane/recipe/brainburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/brainburger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/organ/internal/vital/brain)
	)

/datum/cooking_with_jane/recipe/humanburger
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/human/burger

	replace_reagents = TRUE

	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/bun, qmod=0.5),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "cabbage", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		list(CWJ_ADD_PRODUCE_OPTIONAL, "tomato", reagent_skip=TRUE, qmod=0.2, add_price = 2),
		CWJ_BEGIN_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_REAGENT_OPTIONAL, "ketchup", 1, add_price = 4),
		list(CWJ_ADD_REAGENT_OPTIONAL, "bbqsauce", 1, add_price = 5),
		list(CWJ_ADD_REAGENT_OPTIONAL, "honey", 1, add_price = 2),
		CWJ_END_EXCLUSIVE_OPTIONS,
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/human)
	)
