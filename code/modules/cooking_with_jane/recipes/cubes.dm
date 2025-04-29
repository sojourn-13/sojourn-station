/datum/cooking_with_jane/recipe/cube_kampfer
	name="roach cube (Kampfer)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat, qmod=0.2),
		list(CWJ_ADD_REAGENT, "egg", 3, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 15, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_fuhrer
	name="roach cube (fuhrer)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/fuhrer
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer, qmod=0.2),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/fuhrer, qmod=0.2),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_ADD_REAGENT, "fuhrerole", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 25, remain_percent=0),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_jager
	name="roach cube (Jager)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/jager
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/jager, qmod=0.2),
		list(CWJ_ADD_REAGENT, "blattedin", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_kraftwerk
	name="roach cube (Kraftwerk)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/kraftwerk
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/kraftwerk, qmod=0.2),
		list(CWJ_ADD_REAGENT, "gewaltine", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_elektromagnetisch
	name="roach cube (Elektromagnetisch)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/elektromagnetisch
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/elektromagnetisch, qmod=0.2),
		list(CWJ_ADD_REAGENT, "iron", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_glowing
	name="roach cube (Gluhend)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/glowing
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/glowing, qmod=0.2),
		list(CWJ_ADD_REAGENT, MATERIAL_URANIUM, 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_roachling
	name="roach cube (Roachling)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/roachling
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat, qmod=0.2),
		list(CWJ_ADD_REAGENT, "seligitillin", 1, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_seuche
	name="roach cube (Seuche)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/seuche
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/seuche, qmod=0.2),
		list(CWJ_ADD_REAGENT, "diplopterum", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_panzer
	name="roach cube (Panzer)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/panzer
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/panzer, qmod=0.2),
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat/panzer, qmod=0.2),
		list(CWJ_ADD_REAGENT, "starkellin", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

/datum/cooking_with_jane/recipe/cube_grestrahlte
	name="roach cube (Grestrahlte)"
	cooking_container = CUTTING_BOARD
	product_type = /obj/item/reagent_containers/snacks/cube/roach/grestrahlte
	step_builder = list(
		list(CWJ_ADD_ITEM, /obj/item/reagent_containers/snacks/meat/roachmeat, qmod=0.2),
		list(CWJ_ADD_REAGENT, "toxin", 5, remain_percent=0),
		list(CWJ_ADD_REAGENT, "protein", 10, remain_percent=0),
		list(CWJ_ADD_PRODUCE, "potato", reagent_skip=TRUE),
		list(CWJ_USE_TOOL, QUALITY_HAMMERING, 1, max=10, qmod=0.3),
		list(CWJ_USE_TOOL, QUALITY_CUTTING, 1, max=10, qmod=0.3)
	)

