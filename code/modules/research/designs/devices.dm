

/datum/design/research/item/light_replacer
	name = "light replacer"
	desc = "A device to automatically replace lights. Refill with working lightbulbs."
	build_path = /obj/item/device/lightreplacer
	category = "Misc"

/datum/design/research/item/science_tool
	name = "science tool"
	build_path = /obj/item/device/science_tool
	category = "Misc"

/datum/design/research/item/hud/security
	name = "security records"
	build_path = /obj/item/clothing/glasses/hud/security
	category = CAT_WEAPON //Strongest weapon in the game is a ED/Beesky combo

//Bluespace stuff

/datum/design/research/item/ano_scanner
	name = "Alden-Saraspova counter"
	desc = "Aids in triangulation of exotic particles."
	build_path = /obj/item/device/ano_scanner
	category = "Bluespace Telecoms"

/datum/design/research/item/beacon_locator
	name = "Beacon Locator"
	desc = "Used to scan and locate signals on a particular frequency according."
	build_path = /obj/item/device/beacon_locator
	category = "Bluespace Telecoms"

/datum/design/research/item/gps
	name = "Relay Positioning Device"
	desc = "Triangulates the approximate co-ordinates."
	build_path = /obj/item/device/gps
	materials = list(MATERIAL_STEEL = 25, MATERIAL_GLASS = 5)
	category = "Bluespace Telecoms"

/datum/design/research/item/bs_snare
	name = "BlueSpace Snare"
	desc = "You can name it as spatial beacon. Triangulates the position of the one who put it on and waits for a signal from the hub associated with it. After activation, pull owner to hub location, process is not reversible."
	build_path = /obj/item/clothing/accessory/bs_silk
	category = "Bluespace Telecoms"

/datum/design/research/item/beacon
	name = "Bluespace tracking beacon design"
	build_path = /obj/item/device/radio/beacon
	category = "Bluespace Telecoms"

/datum/design/research/item/bag_holding
	name = "'Bag of Holding', an infinite capacity bag prototype"
	desc = "Using localized pockets of bluespace this bag prototype offers incredible storage capacity with the contents weighting nothing. It's a shame the bag itself is pretty heavy."
	build_path = /obj/item/weapon/storage/backpack/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/belt_holding
	name = "'Belt of Holding', an infinite capacity belt prototype"
	desc = "Using localized pockets of bluespace this belt prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/weapon/storage/belt/holding
	sort_string = "VAEAB"

/datum/design/research/item/pouch_holding
	name = "'Pouch of Holding', an infinite capacity pouch prototype"
	desc = "Using localized pockets of bluespace this pouch prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/weapon/storage/pouch/holding
	sort_string = "VAEAC"

/datum/design/research/item/trashbag_holding
	name = "'Trashbag of Holding', an infinite capacity trashbag prototype"
	desc = "Using localized pockets of bluespace this trashbag prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/weapon/storage/bag/trash/holding
	sort_string = "VAEAD"

/datum/design/research/item/oresatchel_holding
	name = "'Ore satchel of Holding', an infinite capacity ore satchel prototype"
	desc = "Using localized pockets of bluespace this ore satchel prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/weapon/storage/bag/ore/holding
	sort_string = "VAEAE"