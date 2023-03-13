/datum/craft_recipe/alchemy
	category = "Alchemy"
	time = 80
	related_stats = list(STAT_COG)
	requiredPerk = PERK_ALCHEMY

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

/datum/craft_recipe/alchemy/oil_lamp
	name = "Oil Burner"
	result = /obj/item/tool/weldingtool/oil_burner
	steps = list(
		list(/obj/item/reagent_containers/glass/bottle/tincture, 1),
		list(/obj/item/stack/rods, 1),
		list(CRAFT_MATERIAL, 1, MATERIAL_SILK)
	)

/datum/craft_recipe/alchemy/oil_flask
	name = "Oil Canister"
	result = /obj/item/weldpack/canister/oil
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL, 3),
		list(/obj/item/reagent_containers/food/snacks/meat, 10), // 10u oil per meat
		list(QUALITY_HEATING, 5, 80)
	)

/datum/craft_recipe/alchemy/flask_alchemy
	name = "Alembic Phial"
	result = /obj/item/reagent_containers/glass/beaker/flask_alchemy
	steps = list(
		list(/obj/item/stack/ore/glass, 3), // One per unit
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

/datum/craft_recipe/alchemy/throwing_flask
	name = "Throwing Flask"
	result = /obj/item/reagent_containers/food/drinks/bottle/alchemy
	steps = list(
		list(/obj/item/stack/ore/glass, 5), // One per unit, offensive bottles, hard to get
		list(QUALITY_HEATING, 5, 60)
	)

// Normal bottles

/datum/craft_recipe/alchemy/bottle
	name = "Bottle"
	result = /obj/item/reagent_containers/glass/bottle
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 23)
	)

/datum/craft_recipe/alchemy/potion_bottle
	name = "Elegant Bottle"
	result = /obj/item/reagent_containers/glass/bottle/potion
	steps = list(
		list(/obj/item/stack/ore/glass, 1),
		list(QUALITY_HEATING, 5, 28)
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
		list(/obj/item/stack/ore/glass, 2),
		list(QUALITY_HEATING, 5, 40)
	)

// Preloaded chem dispenser-tier chemical bottles start here

/datum/craft_recipe/alchemy/acetone
	name = "Acetone Bottle"
	result = /obj/item/reagent_containers/glass/bottle/acetone
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), // Lead acetate
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/aluminum
	name = "Aluminum Bottle"
	result = /obj/item/reagent_containers/glass/bottle/aluminum
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), // Getting it from ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/ammonia
	name = "Ammonia Bottle"
	result = /obj/item/reagent_containers/glass/bottle/ammonia
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), // Getting it from ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/carbon
	name = "Carbon Bottle"
	result = /obj/item/reagent_containers/glass/bottle/carbon
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/meat, 3), // Any meat will do
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/copper
	name = "Copper Bottle"
	result = /obj/item/reagent_containers/glass/bottle/copper
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/cable_coil, 30), // Cables have copper!
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/ethanol
	name = "Ethanol Bottle"
	result = /obj/item/reagent_containers/glass/bottle/ethanol
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 3),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/hclacid
	name = "Hydrochloric Acid Bottle"
	result = /obj/item/reagent_containers/glass/bottle/hclacid
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1),
		list(/obj/item/stack/ore/iron, 1), // Two steps to get sulfuric acid...
		list(/obj/item/stack/ore, 1), // ...And make them react with rock salt
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/hydrazine
	name = "Hydrazine Bottle"
	result = /obj/item/reagent_containers/glass/bottle/hydrazine
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 1), // Hydrogen from biomass
		list(/obj/item/reagent_containers/food/snacks/grown, 1), // Nitrogen from plants (I hate plant code)
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/iron
	name = "Iron Bottle"
	result = /obj/item/reagent_containers/glass/bottle/iron
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore/iron, 1), // Getting it from its proper ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/lithium
	name = "Lithium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/lithium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 3), // As funny as it would be to get it from power cells its better to get it from something everyone can get
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/mercury
	name = "Azoth Bottle" // Alchemists considered Mercury to be this universal solvent, hence the name
	result = /obj/item/reagent_containers/glass/bottle/mercury
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 2), // Getting it from ore
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/phosphorus
	name = "Phosphorus Bottle"
	result = /obj/item/reagent_containers/glass/bottle/phosphorus
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/meat/carp, 1), // Feesh is a good source of phosphorus!
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/potassium
	name = "Potassium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/potassium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 3), // Can't make it exclusive to bananas so this is the next best thing.
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

/datum/craft_recipe/alchemy/sacid // Alphabetically by reagent name
	name = "Sulphuric Acid Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sacid
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), // Sulfur from rocks
		list(/obj/item/reagent_containers/food/snacks/grown, 1), // Hydrogen from biomass
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/silicon
	name = "Silicon Bottle"
	result = /obj/item/reagent_containers/glass/bottle/silicon
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore/glass, 3),
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sodium
	name = "Sodium Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sodium
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 3), // Break rock salt into sodium
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sugar
	name = "Sugar Bottle"
	result = /obj/item/reagent_containers/glass/bottle/sugar
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/reagent_containers/food/snacks/grown, 1), // Extracting sucrose from plants
		list(QUALITY_HEATING, 5, 10)
	)

/datum/craft_recipe/alchemy/sulfur
	name = "Brimstone Bottle" // Old name of Sulfur
	result = /obj/item/reagent_containers/glass/bottle/sulfur
	steps = list(
		list(/obj/item/reagent_containers/glass, 1),
		list(/obj/item/stack/ore, 1), // Leeching the sulfur from rocks
		list(/obj/item/reagent_containers/food/snacks/egg, 1), // Not for luck! Extracting it from rotten eggs!
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

// No water bottle, it's everywhere, and pointless.
