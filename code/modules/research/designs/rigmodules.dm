/*
/obj/item/rig_module/chem_dispenser
/obj/item/rig_module/autodoc*/

/datum/design/research/item/autodoc
	name = "trial autodoc module"
	desc = "A complex surgery system for almost all your needs."
	build_path = /obj/item/rig_module/autodoc
	category = "RIG"

/datum/design/research/item/autodoc_commercial
	name = "commercial autodoc module"
	desc = "A complex surgery system for almost all your needs."
	build_path = /obj/item/rig_module/autodoc/commercial
	category = "RIG"

/datum/design/research/item/chem_dispenser
	name = "mounted chemical dispenser"
	desc = "A complex web of tubing and needles suitable for hardsuit use."
	build_path = /obj/item/rig_module/modular_injector
	category = "RIG"

/datum/design/research/item/chem_injector
	name = "mounted chemical injector"
	desc = "A complex web of tubing and needles suitable for hardsuit use."
	build_path = /obj/item/rig_module/modular_injector/medical
	materials = list(MATERIAL_STEEL = 15, MATERIAL_GLASS = 10, MATERIAL_PLASTIC = 10, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1, MATERIAL_DIAMOND = 1)
	category = "RIG"

/datum/design/research/item/healthscanner
	name = "mounted health scanner"
	desc = "A hardsuit-mounted health scanner."
	build_path = /obj/item/rig_module/device/healthscanner
	category = "RIG"

/datum/design/research/item/combat_injector
	name = "mounted combat injector"
	desc = "A complex web of tubing and needles suitable for hardsuit use."
	build_path = /obj/item/rig_module/modular_injector/combat
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 2, MATERIAL_SILVER = 2, MATERIAL_DIAMOND = 1)
	category = "RIG"

/datum/design/research/item/medhud
	name = "hardsuit medical hud"
	desc = "A simple medical status indicator for a hardsuit."
	build_path = /obj/item/rig_module/vision/medhud
	category = "RIG"

// Hardsuit weapons are balanced around its costs in a both points, time and costs of mats.
// In any given round this should be the last option for these items as you can dig them out of trash piles.

/datum/design/research/item/lasercannon
	name = "hardsuit laser cannon"
	desc = "A high power laser gun mounted onto a rig."
	build_path = /obj/item/rig_module/mounted
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 6, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 3)
	category = "RIG"

/datum/design/research/item/lasermount
	name = "hardsuit laser gun"
	desc = "A laser gun mounted onto a rig."
	build_path = /obj/item/rig_module/mounted/egun
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 5, MATERIAL_SILVER = 5)
	category = "RIG"

/datum/design/research/item/tasermount
	name = "hardsuit taser"
	desc = "A taser mounted onto a rig."
	build_path = /obj/item/rig_module/mounted/taser
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_SILVER = 5)
	category = "RIG"

/datum/design/research/item/rig_grenade_launcher
	name = "hardsuit grenade launcher"
	desc = "A mounted grenade launcher onto a rig. Holds smoke bombs, emps and flashbangs for non-lethal riot controle."
	build_path = /obj/item/rig_module/grenade_launcher
	materials = list(MATERIAL_STEEL = 75, MATERIAL_PLASTIC = 65)
	category = "RIG"

/datum/design/research/item/rig_flash
	name = "hardsuit integrated flash"
	desc = "A flash that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/device/flash
	materials = list(MATERIAL_STEEL = 25, MATERIAL_PLASTIC = 25, MATERIAL_GLASS = 45)
	category = "RIG"

//MISC and odds and sods for hardsuits/rigs

/datum/design/research/item/storage
	name = "hardsuit storage system"
	desc = "A storage case that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/storage
	materials = list(MATERIAL_STEEL = 45, MATERIAL_PLASTIC = 25)
	category = "RIG"

/datum/design/research/item/storage/large
	name = "hardsuit distributed storage system"
	desc = "A system of pouches that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/storage/large
	materials = list(MATERIAL_STEEL = 60, MATERIAL_PLASTIC = 40)
	category = "RIG"

/datum/design/research/item/storagemed
	name = "hardsuit medical storage system"
	desc = "A system of various storage solutions for a RIG. This one is designed for medicine."
	build_path = /obj/item/rig_module/storage/med
	materials = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 15)
	category = "RIG"

/datum/design/research/item/storagetac
	name = "hardsuit tactical  storage system"
	desc = "A system of various storage solutions for a RIG. This one is designed for munitions."
	build_path = /obj/item/rig_module/storage/combat
	materials = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 15)
	category = "RIG"

/datum/design/research/item/storageengi
	name = "hardsuit engineering  storage system"
	desc = "A system of various storage solutions for a RIG. This one is designed for tools.."
	build_path = /obj/item/rig_module/storage/engi
	materials = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 15)
	category = "RIG"

/datum/design/research/item/ai_container
	name = "hardsuit integrated AI container"
	desc = "A storage case for AI units that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/ai_container
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 5)
	category = "RIG"

/datum/design/research/item/rigrcd
	name = "hardsuit integrated RCD"
	desc = "Integrated RCD into a hardsuit."
	build_path = /obj/item/rig_module/device/rcd
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 15, MATERIAL_PLASTIC = 15, MATERIAL_URANIUM = 5)
	category = "RIG"

//Mining based Rig/hardsuit stuff Drills and scanners

/datum/design/research/item/rigjets
	name = "hardsuit integrated jetpack"
	desc = "Integrated jets into a hardsuit."
	build_path = /obj/item/rig_module/maneuvering_jets //Kinda useless on a planet...
	materials = list(MATERIAL_STEEL = 45, MATERIAL_PLASTIC = 25)
	category = "RIG"

/datum/design/research/item/rig_drill
	name = "hardsuit integrated diamond drill"
	desc = "Integrated diamond tip drill into a hardsuit."
	build_path = /obj/item/rig_module/device/drill
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 15, MATERIAL_DIAMOND = 1)
	category = "RIG"

/datum/design/research/item/rig_anomaly_scanner
	name = "hardsuit integrated anomaly scanner"
	desc = "Integrated anomaly scanner for a hardsuit."
	build_path = /obj/item/rig_module/device/anomaly_scanner
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5, MATERIAL_GLASS = 15)
	category = "RIG"

/datum/design/research/item/rig_ore_scanner
	name = "hardsuit integrated ore scanner"
	desc = "Integrated ore scanner for a hardsuit."
	build_path = /obj/item/rig_module/device/orescanner
	materials = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 25, MATERIAL_GLASS = 10)
	category = "RIG"

/datum/design/research/item/rig_meson_goggles
	name = "Meson Hardsuit Goggles"
	desc = "Integrated mesons that link to a hardsuit internal cell."
	build_path = /obj/item/rig_module/vision/meson
	category = "RIG"

/datum/design/research/item/rig_nvgoggles
	name = "Night Vision Hardsuit Goggles"
	desc = "Hardsuit-linked goggles that magnify visible light perceived, allowing the user to see better in the dark."
	build_path = /obj/item/rig_module/vision/nvg
	category = "RIG"

/datum/design/research/item/rig_thermalgoggles
	name = "Thermal Vision Hardsuit Goggles"
	desc = "Hardsuit-linked goggles that allow the user to see heat-emitting lifeforms through walls."
	build_path = /obj/item/rig_module/vision/thermal
	category = "RIG"

/datum/design/research/item/clothing/rig_cheap
	name = "SI 'Spacer' control module"
	desc = "An ultra light rig suit that a protolathe is only just able to print off..."
	build_path = /obj/item/rig/light/ultra_light
	build_type = MECHFAB | PROTOLATHE
	category = "RIG"

/datum/design/research/item/clothing/rig_advhazmat
	name = "Advanced AMI control module"
	build_path = /obj/item/rig/advhazmat
	build_type = MECHFAB
	category = "RIG"

/datum/design/research/item/clothing/rig_hazmat
	name = "AMI control module"
	build_path = /obj/item/rig/hazmat
	materials = list(MATERIAL_STEEL = 30, MATERIAL_PLASTIC = 25, MATERIAL_GOLD = 10, MATERIAL SILVER = 15)
	build_type = MECHFAB
	category = "RIG"

//misc rig things
/datum/design/research/item/riggrapple
	name = "hardsuit integrated grappler"
	desc = "Integrated grappling hook into a hardsuit."
	build_path = /obj/item/rig_module/grappler
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 50)
	category = "RIG"

/datum/design/research/item/rig_clamp
	name = "hardsuit integrated cargo clamp"
	desc = "Integrated cargo handling system into a hardsuit."
	build_path = /obj/item/rig_module/cargo_clamp
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 15)
	category = "RIG"

/datum/design/research/item/ion_jaunt
	name = "Ion Jaunt"
	desc = "A special device designed to reduce the impact of EMPs on electrical systems."
	build_path = /obj/item/robot_parts/robot_component/ion_jaunt
	category = "RIG"
