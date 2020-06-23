/*
/obj/item/rig_module/chem_dispenser
/obj/item/rig_module/autodoc*/

/datum/design/research/item/autodoc
	name = "trial autodoc module"
	desc = "A complex surgery system for almost all your needs."
	build_path = /obj/item/rig_module/autodoc
	sort_string = "VDAAF"
	category = "Medical"

/datum/design/research/item/autodoc_commercial
	name = "commercial autodoc module"
	desc = "A complex surgery system for almost all your needs."
	build_path = /obj/item/rig_module/autodoc/commercial
	sort_string = "VDAAG"
	category = "Medical"

/datum/design/research/item/chem_dispenser
	name = "mounted chemical dispenser"
	desc = "A complex web of tubing and needles suitable for hardsuit use."
	build_path = /obj/item/rig_module/chem_dispenser
	sort_string = "VDAAD"
	category = "Medical"

/datum/design/research/item/medhud
	name = "hardsuit medical hud"
	desc = "A simple medical status indicator for a hardsuit."
	build_path = /obj/item/rig_module/vision/medhud
	sort_string = "VDAAE"
	category = "Medical"

/datum/design/research/item/lasercannon
	name = "hardsuit laser cannon"
	desc = "A high power laser gun mounted onto a rig."
	build_path = /obj/item/rig_module/mounted
	category = CAT_WEAPON

/datum/design/research/item/lasermount
	name = "hardsuit laser gun"
	desc = "A laser gun mounted onto a rig."
	build_path = /obj/item/rig_module/mounted/egun
	category = CAT_WEAPON

/datum/design/research/item/tasermount
	name = "hardsuit taser"
	desc = "A taser mounted onto a rig."
	build_path = /obj/item/rig_module/mounted/taser
	category = CAT_WEAPON

/datum/design/research/item/rig_grenade_launcher
	name = "hardsuit grenade launcher"
	desc = "A mounted grenade launcher onto a rig. Holds smoke bombs, emps and flashbangs for non-lethal riot controle."
	build_path = /obj/item/rig_module/grenade_launcher
	category = CAT_WEAPON

/datum/design/research/item/rig_flash
	name = "hardsuit integrated flash"
	desc = "A flash that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/device/flash
	category = CAT_WEAPON

/datum/design/research/item/storage
	name = "hardsuit integrated storage"
	desc = "A storage case that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/storage

/datum/design/research/item/ai_container
	name = "hardsuit integrated AI container"
	desc = "A storage case for AI units that has been integrated into a hardsuit."
	build_path = /obj/item/rig_module/ai_container

/datum/design/research/item/rigjets
	name = "hardsuit integrated jetpack"
	desc = "Integrated jets into a hardsuit."
	build_path = /obj/item/rig_module/maneuvering_jets //Kinda useless on a planet...

/datum/design/research/item/rigrcd
	name = "hardsuit integrated RCD"
	desc = "Integrated RCD into a hardsuit."
	build_path = /obj/item/rig_module/device/rcd

/datum/design/research/item/rig_drill
	name = "hardsuit integrated diamond drill"
	desc = "Integrated diamond tip drill into a hardsuit."
	build_path = /obj/item/rig_module/device/drill
	category = CAT_MINING

/datum/design/research/item/rig_anomaly_scanner
	name = "hardsuit integrated anomaly scanner"
	desc = "Integrated anomaly scanner for a hardsuit."
	build_path = /obj/item/rig_module/device/anomaly_scanner
	category = CAT_MINING

/datum/design/research/item/rig_ore_scanner
	name = "hardsuit integrated ore scanner"
	desc = "Integrated ore scanner for a hardsuit."
	build_path = /obj/item/rig_module/device/orescanner
	category = CAT_MINING

