/datum/craft_recipe/alchemy
	category = "Alchemy"
	time = 100
	related_stats = list(STAT_COG)
	requiredPerk = PERK_ALCHEMY

/datum/craft_recipe/alchemy/oil_lamp
	name = "Oil Burner"
	result = /obj/item/tool/weldingtool/oil_burner
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle/tincture, 1),
		list(/obj/item/stack/rods, 1),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILK)
	)

/datum/craft_recipe/alchemy/oil_flask
	name = "canister of Oil"
	result = /obj/item/weldpack/canister/oil
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL, 3),
		list(/obj/item/reagent_containers/food/snacks/meat/pork, 12), //Getting oil form fatty meats is the idea
		list(QUALITY_HEATING, 5, 80)
	)

/datum/craft_recipe/alchemy/bottle
	name = "Bottle"
	result = /obj/item/reagent_containers/glass/bottle
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 23)
	)

/datum/craft_recipe/alchemy/flask_alchemy
	name = "Alchemy Flask"
	result = /obj/item/reagent_containers/glass/beaker/flask_alchemy
	steps = list(
		list(/obj/item/stack/ore/glass, 6),
		list(QUALITY_HEATING, 5, 60)
	)

/datum/craft_recipe/alchemy/alchemy
	name = "Alembic"
	result = /obj/structure/alchemy
	steps = list(
		list(/obj/item/stack/ore/glass, 2),
		list(/obj/item/reagent_containers/glass/beaker/flask_alchemy, 1),
		list(QUALITY_HEATING, 5, 80)
	)

/datum/craft_recipe/alchemy/potion_bottle
	name = "Elegant Bottle"
	result = /obj/item/reagent_containers/glass/bottle/potion
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 28)
	)

/datum/craft_recipe/alchemy/pointy_bottle
	name = "Tincture Bottle"
	result = /obj/item/reagent_containers/glass/bottle/tincture
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 28)
	)

/datum/craft_recipe/alchemy/pointy_bottle_alt
	name = "Tincture Bottle (Welding)"
	result = /obj/item/reagent_containers/glass/bottle/tincture
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_WELDING, 5, 28)
	)

/datum/craft_recipe/alchemy/beaker
	name = "Beaker"
	result = /obj/item/reagent_containers/glass/beaker
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 30)
	)

/datum/craft_recipe/alchemy/beaker_large
	name = "Large Beaker"
	result = /obj/item/reagent_containers/glass/beaker/large
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 40)
	)

/datum/craft_recipe/alchemy/sulfur
	name = "Sulfur Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sulfur
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), //Leaching the sulfur form rocks
		list(/obj/item/reagent_containers/food/snacks/egg , 1), //For good luck?
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/tungsten
	name = "Tungsten Bottle"
	result = /obj/item/reagent_containers/glass/bottle/tungsten
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore/coal, 1),
		list(/obj/item/stack/ore, 1),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/radium
	name = "Radium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/radium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore/uranium, 1),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sacid
	name = "Sulphuric Acid Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sacid
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), //Leaching the sulfur form rocks
		list(/obj/item/reagent_containers/food/snacks/egg , 1), //For good luck?
		list(/obj/item/reagent_containers/food/snacks/meat/xenomeat , 1), //Used for base, has pacid in
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sacid
	name = "Sulphuric Acid Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sacid
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sodium
	name = "Sodium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sodium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/meat, 3), //Not much but hey its something
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/potassium
	name = "Potassium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/potassium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 3),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/phosphorus
	name = "Potassium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/phosphorus
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 3),
		list(/obj/item/reagent_containers/food/snacks/meat, 3),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/hclacid
	name = "Hydrochloric Acid Bottle"
	result = /obj/item/reagent_containers/glass/bottle/hclacid
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 4),
		list(/obj/item/reagent_containers/food/snacks/meat, 2),
		list(/obj/item/reagent_containers/food/snacks/meat/xenomeat , 1), //Used for base, has pacid in
		list(/obj/item/reagent_containers/food/snacks/egg , 1), //For good luck?
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/hydrazine
	name = "Hydrazine Bottle"
	result = /obj/item/reagent_containers/glass/bottle/hydrazine
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 4),
		list(/obj/item/reagent_containers/food/snacks/meat, 2),
		list(/obj/item/reagent_containers/food/snacks/meat/xenomeat , 1), //Used for base, has pacid in
		list(/obj/item/reagent_containers/food/snacks/egg , 1), //For good luck?
		list(QUALITY_HEATING, 5, 10)
	)


/datum/craft_recipe/alchemy/mercury
	name = "Mercury Bottle"
	result = /obj/item/reagent_containers/glass/bottle/mercury
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), //getting it form ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/acetone
	name = "Acetone Bottle"
	result = /obj/item/reagent_containers/glass/bottle/acetone
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/meat/pork, 2),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/aluminum
	name = "Aluminum Bottle"
	result = /obj/item/reagent_containers/glass/bottle/aluminum
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), //getting it form ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/ammonia
	name = "Ammonia Bottle"
	result = /obj/item/reagent_containers/glass/bottle/ammonia
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), //getting it form ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/carbon
	name = "Carbon Bottle"
	result = /obj/item/reagent_containers/glass/bottle/carbon
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/meat/pork, 3),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/copper
	name = "Copper Bottle"
	result = /obj/item/reagent_containers/glass/bottle/copper
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), //getting it form ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/ethanol
	name = "Ethanol Bottle"
	result = /obj/item/reagent_containers/glass/bottle/ethanol
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 8),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/iron
	name = "Iron Bottle"
	result = /obj/item/reagent_containers/glass/bottle/iron
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), //getting it form ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/lithium
	name = "Lithium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/lithium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 3), //as funny as it would be to get it form power cells its better to get it form something everyone can get
		list(QUALITY_HEATING, 5, 10)
	)
