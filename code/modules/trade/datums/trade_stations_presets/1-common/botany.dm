/datum/trade_station/botany
	name_pool = list(
		"SI TV \'Arbor\'" = "SI Trade Vessel \'Arbor\': Connection with the SI botanical research network established."
	)
	icon_states = list("moe_capital", "ship")
	uid = "botany"
	tree_x = 0.54
	tree_y = 0.8
	start_discovered = FALSE
	spawn_always = TRUE
	markup = WHOLESALE_GOODS
	offer_limit = 10
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 3000
	recommendation_threshold = 0
	stations_recommended = list()
	recommendations_needed = 1
	inventory = list(
		"Biochemistry/Special" = list(
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/potency = custom_good_name("plant gene disk: potency (50)"),
			/obj/item/pc_part/drive/disk/plantgene/special/immutable = custom_good_name("plant gene disk: immutable"),
			/obj/item/pc_part/drive/disk/plantgene/special/mutable = custom_good_name("plant gene disk: mutable"),
			/obj/item/pc_part/drive/disk/plantgene/special/highly_mutable = custom_good_name("plant gene disk: highly mutable"),
			/obj/item/pc_part/drive/disk/plantgene/special/chem_sprayer = custom_good_name("plant gene disk: chemical sprayer"),
			/obj/item/pc_part/drive/disk/plantgene/special/no_chem_sprayer = custom_good_name("plant gene disk: non-spraying"),
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/cleaner = custom_good_name("plant gene disk: cleaner-producing"),
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/eznutrient = custom_good_name("plant gene disk: E-Z-nutrient-producing"),
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/left4zed = custom_good_name("plant gene disk: Left 4 Zed-producing"),
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/robustharvest = custom_good_name("plant gene disk: Robust Harvest-producing"),
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/mutagen = custom_good_name("plant gene disk: mutagen-producing")
		),
		"Atmosphere/Environment" = list(
			/obj/item/pc_part/drive/disk/plantgene/atmos/low_kpa_tolerance = custom_good_name("plant gene disk: low pressure tolerance (40 kPa)"),
			/obj/item/pc_part/drive/disk/plantgene/atmos/high_kpa_tolerance = custom_good_name("plant gene disk: high pressure tolerance (160 kPa)"),
			/obj/item/pc_part/drive/disk/plantgene/atmos/heat_tolerance  = custom_good_name("plant gene disk: heat tolerance (70 K)"),
			/obj/item/pc_part/drive/disk/plantgene/environment/ideal_heat = custom_good_name("plant gene disk: ideal heat (273 K)"),
			/obj/item/pc_part/drive/disk/plantgene/environment/light_tolerance = custom_good_name("plant gene disk: light tolerance (10)"),
			/obj/item/pc_part/drive/disk/plantgene/environment/ideal_light = custom_good_name("plant gene disk: ideal light (10)")
		),
		"Hardiness" = list(
			/obj/item/pc_part/drive/disk/plantgene/hardiness/toxins_tolerance = custom_good_name("plant gene disk: toxin tolerance (7)"),
			/obj/item/pc_part/drive/disk/plantgene/hardiness/pest_tolerance = custom_good_name("plant gene disk: pest tolerance (7)"),
			/obj/item/pc_part/drive/disk/plantgene/hardiness/weed_tolerance = custom_good_name("plant gene disk: weed tolerance (7)")
		),
		"Vigour/Structure" = list(
			/obj/item/pc_part/drive/disk/plantgene/vigour/yield = custom_good_name("plant gene disk: yield (5)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/production = custom_good_name("plant gene disk: production (5)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/maturation = custom_good_name("plant gene disk: maturation (5)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/not_spreading = custom_good_name("plant gene disk: non-spreading"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/spreading = custom_good_name("plant gene disk: spreading (1)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/vine_spreading = custom_good_name("plant gene disk: spreading (2)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/wall_hugger = custom_good_name("plant gene disk: wall growth"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/non_wall_hugger = custom_good_name("plant gene disk: no wall growth"),
			/obj/item/pc_part/drive/disk/plantgene/structure/repeat_harvest = custom_good_name("plant gene disk: repeatable harvest"),
			/obj/item/pc_part/drive/disk/plantgene/structure/single_harvest = custom_good_name("plant gene disk: single harvest"),
			/obj/item/pc_part/drive/disk/plantgene/structure/companion = custom_good_name("plant gene disk: companion plant"),
			/obj/item/pc_part/drive/disk/plantgene/structure/loner = custom_good_name("plant gene disk: loner plant")
		),
		"Output" = list(
			/obj/item/pc_part/drive/disk/plantgene/output/power_producer = custom_good_name("plant gene disk: battery"),
			/obj/item/pc_part/drive/disk/plantgene/output/not_power_producer = custom_good_name("plant gene disk: non-battery"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_off = custom_good_name("plant gene disk: bioluminescence (off)"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_dimmer = custom_good_name("plant gene disk: bioluminescence (1)"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_dim = custom_good_name("plant gene disk: bioluminescence (2)"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_normal = custom_good_name("plant gene disk: bioluminescence (3)"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_bright = custom_good_name("plant gene disk: bioluminescence (4)"),
			/obj/item/pc_part/drive/disk/plantgene/output/bioluminescent_brighter = custom_good_name("plant gene disk: bioluminescence (5)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/red = custom_good_name("plant gene disk: light color (red, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/orange = custom_good_name("plant gene disk: light color (orange, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/green = custom_good_name("plant gene disk: light color (green, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/cyan = custom_good_name("plant gene disk: light color (cyan, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/blue = custom_good_name("plant gene disk: light color (blue, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/purple = custom_good_name("plant gene disk: light color (purple, bright)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/red_dark = custom_good_name("plant gene disk: light color (red, dark)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/orange_dark = custom_good_name("plant gene disk: light color (orange, dark)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/green_dark = custom_good_name("plant gene disk: light color (green, dark)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/cyan_dark = custom_good_name("plant gene disk: light color (cyan, dark)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/blue_dark = custom_good_name("plant gene disk: light color (blue, dark)"),
			/obj/item/pc_part/drive/disk/plantgene/pigment/purple_dark = custom_good_name("plant gene disk: light color (purple, dark)")
		)
	)
	hidden_inventory = list(
		"Rare Genes" = list(
			/obj/item/pc_part/drive/disk/plantgene/biochemistry/potency_high = custom_good_name("plant gene disk: potency (100)"),
			/obj/item/pc_part/drive/disk/plantgene/metabolism/no_nutrients_water = custom_good_name("plant gene disk: no nutrients/water"),
			/obj/item/pc_part/drive/disk/plantgene/metabolism/requires_nutrients = custom_good_name("plant gene disk: requires nutrients"),
			/obj/item/pc_part/drive/disk/plantgene/metabolism/requires_water = custom_good_name("plant gene disk: requires water"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/yield_high = custom_good_name("plant gene disk: yield (10)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/production_high = custom_good_name("plant gene disk: production (3)"),
			/obj/item/pc_part/drive/disk/plantgene/vigour/maturation_fast = custom_good_name("plant gene disk: maturation (3)"),
			/obj/item/pc_part/drive/disk/plantgene/diet/carnivorous = custom_good_name("plant gene disk: carnivorous"),
			/obj/item/pc_part/drive/disk/plantgene/diet/noncarnivorous = custom_good_name("plant gene disk: non-carnivorous"),
			/obj/item/pc_part/drive/disk/plantgene/diet/parasitic = custom_good_name("plant gene disk: parasitic"),
			/obj/item/pc_part/drive/disk/plantgene/diet/nonparasitic = custom_good_name("plant gene disk: non-parasitic"),
			/obj/item/pc_part/drive/disk/plantgene/special/chem_producer = custom_good_name("plant gene disk: chem producer"),
			/obj/item/pc_part/drive/disk/plantgene/special/no_chem_producer = custom_good_name("plant gene disk: non-chem producer")
		)
	)
	offer_types = list(
		/obj/item/tool/minihoe = offer_data_mods("modified minihoe (2 upgrades)", 800, 2, OFFER_MODDED_TOOL, 2),
		/obj/item/tool/hatchet = offer_data_mods("modified hatchet (3 upgrades)", 1000, 2, OFFER_MODDED_TOOL, 3)
	)