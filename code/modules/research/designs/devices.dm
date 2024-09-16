// Tools/misc clothing?


/datum/design/research/item/clothing/weldermask
	name = "welding mask"
	build_path = /obj/item/clothing/head/welding

/datum/design/research/item/tool/combat_shovel
	name = "combat shovel"
	build_path = /obj/item/tool/shovel/combat

/datum/design/research/item/tool/rcd
	name = "rapid construction device"
	build_path = /obj/item/rcd

/datum/design/research/item/tool/pneumatic_crowbar
	name = "pneumatic crowbar"
	build_path = /obj/item/tool/crowbar/pneumatic

/datum/design/research/item/light_replacer
	name = "light replacer"
	desc = "A device to automatically replace lights. Refill with working lightbulbs."
	build_path = /obj/item/device/lightreplacer
	category = "Misc"

/datum/design/research/item/science_tool
	name = "science tool"
	build_path = /obj/item/device/science_tool
	category = "Misc"

/datum/design/research/item/clothing/security
	name = "security records"
	build_path = /obj/item/clothing/glasses/hud/security

/datum/design/research/item/tracker_tablet
	name = "Tracker tablet frame"
	desc = "Modified tablet frame with extra screens for use with sensor monitoring software."
	build_path = /obj/item/modular_computer/tablet/moebius
	category = "Medical"

/datum/design/research/item/cogenhancer
	name = "Cognitive Enhancer Implanter"
	desc = "A device used to install Cognitive Enhancer."
	build_path = /obj/item/device/hardware_imprinter/cogenhance
	category = "Medical"

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
	name = "Bluespace Tracking Beacon"
	build_path = /obj/item/device/radio/beacon
	category = "Bluespace Telecoms"

/datum/design/research/item/bag_holding
	name = "'Bag of Holding'"
	desc = "Using localized pockets of bluespace this bag prototype offers incredible storage capacity with the contents weighting nothing. It's a shame the bag itself is pretty heavy."
	build_path = /obj/item/storage/backpack/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/belt_holding
	name = "'Belt of Holding'"
	desc = "Using localized pockets of bluespace this belt prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/storage/belt/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/pouch_holding
	name = "'Pouch of Holding'"
	desc = "Using localized pockets of bluespace this pouch prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/storage/pouch/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/trashbag_holding
	name = "'Trash Bag of Holding'"
	desc = "Using localized pockets of bluespace this trashbag prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/storage/bag/trash/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/oresatchel_holding
	name = "'Ore satchel of Holding'"
	desc = "Using localized pockets of bluespace this ore satchel prototype offers incredible storage capacity with the contents weighting nothing."
	build_path = /obj/item/storage/bag/ore/holding
	category = "Bluespace Telecoms"

/datum/design/research/item/si_bluespace_scanner
	name = "Bluespace Tuning Device"
	desc = "A tool used by SI to stablize and get readings of bluespace entropy."
	build_path = /obj/item/oddity/si_bluespace_scanner
	category = "Bluespace Telecoms"

/datum/design/research/item/omnitranslator_handheld
	name = "Handheld Universal Translator"
	materials = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 4, MATERIAL_PLASTIC = 2)
	desc = "A handheld device that translates foreign language to a language known to the user."
	build_path = /obj/item/device/universal_translator
	category = "Bluespace Telecoms"
	
/datum/design/research/item/omnitranslator_earpiece
	name = "Universal Translator Earpiece"
	desc = "A headset that translates foreign languages to a known language of the users choice."
	materials = list(MATERIAL_STEEL = 2, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	build_path = /obj/item/device/universal_translator/ear
	category = "Bluespace Telecoms"
