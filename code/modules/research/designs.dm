/***************************************************************
**						Design Datums						  **
**	All the data for building stuff and tracking reliability. **
***************************************************************/
/*
For the materials datum, it assumes you need reagents unless specified otherwise. To designate a material that isn't a reagent,
you use one of the material IDs below. These are NOT ids in the usual sense (they aren't defined in the object or part of a datum),
they are simply references used as part of a "has materials?" type proc. They all start with a  to denote that they aren't reagents.
The currently supporting non-reagent materials:

Don't add new keyword/IDs if they are made from an existing one (such as rods which are made from metal). Only add raw materials.

Design Guidlines
- When adding new designs, check rdreadme.dm to see what kind of things have already been made and where new stuff is needed.
- A single sheet of anything is 1 unit of material. Materials besides metal/glass require help from other jobs (mining for
other types of metals and chemistry for reagents).

*/


/datum/design/research				//Datum for object designs, used in construction
	starts_unlocked = FALSE

/datum/design/research/item
	build_type = AUTOLATHE | PROTOLATHE
	category = "Misc" //No more unsorted things

/datum/design/research/item/mechfab
	build_type = MECHFAB
	category = "Misc"

/datum/design/research/item/flash
	name = "flash"
	build_type = AUTOLATHE | MECHFAB
	build_path = /obj/item/device/flash
	category = "Misc"

/datum/design/research/item/science_tool
	name = "science tool"
	build_path = /obj/item/device/science_tool

/datum/design/research/item/hud
	name_category = "HUD glasses"

/datum/design/research/item/hud/health
	name = "health scanner"
	build_path = /obj/item/clothing/glasses/hud/health
	sort_string = "GAAAA"

/datum/design/research/item/hud/security
	name = "security records"
	build_path = /obj/item/clothing/glasses/hud/security
	sort_string = "GAAAB"

/datum/design/research/item/mesons
	name = "Optical meson scanners"
	desc = "Using the meson-scanning technology those glasses allow you to see through walls, floor or anything else."
	build_path = /obj/item/clothing/glasses/powered/meson
	sort_string = "GAAAC"

/datum/design/research/item/medical
	name_category = "biotech device prototype"
	category = "Medical"

/datum/design/research/item/medical/robot_scanner
	desc = "A hand-held scanner able to diagnose robotic injuries."
	build_path = /obj/item/device/robotanalyzer
	sort_string = "MACFA"

/datum/design/research/item/medical/mass_spectrometer
	desc = "A device for analyzing chemicals in blood."
	build_path = /obj/item/device/scanner/mass_spectrometer
	sort_string = "MACAA"

/datum/design/research/item/medical/adv_mass_spectrometer
	desc = "A device for analyzing chemicals in blood and their quantities."
	build_path = /obj/item/device/scanner/mass_spectrometer/adv
	sort_string = "MACAB"

/datum/design/research/item/medical/reagent_scanner
	desc = "A device for identifying chemicals."
	build_path = /obj/item/device/scanner/reagent
	sort_string = "MACBA"

/datum/design/research/item/medical/adv_reagent_scanner
	desc = "A device for identifying chemicals and their proportions."
	build_path = /obj/item/device/scanner/reagent/adv
	sort_string = "MACBB"

/datum/design/research/item/medical/defibs
	desc = "Large paddles that get charged via a cell to give a controlled shock for revival."
	build_path = /obj/item/device/defib_kit
	sort_string = "MACCA"
	category = "Medical"

/datum/design/research/item/medical/compact_defibs
	desc = "Much smaller defibulators build into a belt, to more easily carry."
	build_path = /obj/item/device/defib_kit/compact
	sort_string = "MACCB"
	category = "Medical"

/datum/design/research/item/medical/combat_defibs
	desc = "Much smaller defibulators build into a belt, to more easily carry. This one has no safeties..."
	build_path = /obj/item/device/defib_kit/compact/combat
	sort_string = "MACCG"
	category = "Medical"

/datum/design/research/item/medical/cryobag
	desc = "A body bag for a dieing or dead body to stablize them using cryo tech."
	materials = list(MATERIAL_STEEL = 2, MATERIAL_GLASS = 3, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 1)
	build_path = /obj/item/bodybag/cryobag
	sort_string = "MACCD"
	category = "Medical"

/datum/design/research/item/medical/red
	desc = "A mini-cryo box for holding foods and organs. This one comes in blue."
	build_path = /obj/item/weapon/storage/freezer
	sort_string = "MACCE"
	category = "Medical"

/datum/design/research/item/medical/blue
	desc = "A thicker red box for only holding organs."
	build_path = /obj/item/weapon/storage/freezer/medical
	sort_string = "MACCF"
	category = "Medical"

/datum/design/research/item/beaker
	name_category = "beaker prototype"
	category = "Medical"

/datum/design/research/item/beaker/noreact
	name = "cryostasis"
	desc = "A cryostasis beaker that allows for chemical storage without reactions. Can hold up to 50 units."
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/noreact
	sort_string = "MADAA"

/datum/design/research/item/beaker/bluespace
	name = "bluespace"
	desc = "A bluespace beaker, powered by experimental bluespace technology and Element Cuban combined with the Compound Pete. Can hold up to 300 units."
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/bluespace
	sort_string = "MADAB"

/datum/design/research/item/medical/nanopaste
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	build_path = /obj/item/stack/nanopaste
	sort_string = "MBAAA"

/datum/design/research/item/medical/medimplant_sci
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model."
	build_path = /obj/item/weapon/tool/medmultitool/medimplant/sci
	materials = list(MATERIAL_STEEL = 15, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 3, MATERIAL_SILVER = 5)
	sort_string = "MBAAB"

/datum/design/research/item/scalpel_laser
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field."
	build_path = /obj/item/weapon/tool/scalpel/laser
	sort_string = "MBBAA"
	category = "Medical"

/datum/design/research/item/makeshift_centrifuge
	name = "Portable centrifuge"
	desc = "A centrifuge with manual mechanism."
	build_path = /obj/item/device/makeshift_centrifuge
	sort_string = "MBBAA"
	category = "Medical"

/datum/design/research/item/bonesetter_adv
	name = "Bone Clamp Settler"
	desc = "A more powerful yet still rather small bone fixing tool."
	build_path = /obj/item/weapon/tool/bonesetter/adv
	sort_string = "MBBBA"
	category = "Medical"

/datum/design/research/item/cautery_adv
	name = "High Power Cautery"
	desc = "A Cautery that has been perfected in heat transfer."
	build_path = /obj/item/weapon/tool/cautery/adv
	sort_string = "MBBBB"
	category = "Medical"

/datum/design/research/item/hemostat_adv
	name = "Precise Hemostat"
	desc = "A much more precise hemostat with finer grip."
	build_path = /obj/item/weapon/tool/hemostat/adv
	sort_string = "MCAAA"
	category = "Medical"

/datum/design/research/item/retractor_adv
	name = "Extended Retractor"
	desc = "Retracts with greater force and length then normal."
	build_path = /obj/item/weapon/tool/retractor/adv
	sort_string = "MCBAA"
	category = "Medical"

/datum/design/research/item/medsaw_circular
	name = "Medical Cirular Saw"
	desc = "For clean bone cutting but dosnt seem all that durable. Spins slower then the normal saw as well."
	build_path = /obj/item/weapon/tool/saw/circular/medical
	sort_string = "MCBBA"
	category = "Medical"

/datum/design/research/item/light_replacer
	name = "light replacer"
	desc = "A device to automatically replace lights. Refill with working lightbulbs."
	build_path = /obj/item/device/lightreplacer
	sort_string = "VAAAH"
	category = "Misc"

/datum/design/research/item/paicard
	name = "'pAI', personal artificial intelligence device"
	build_path = /obj/item/device/paicard
	sort_string = "VABAI"
	category = "Misc"

/datum/design/research/item/intellicard
	name = "'intelliCard', AI preservation and transportation system"
	desc = "Allows for the construction of an intelliCard."
	build_path = /obj/item/device/aicard
	sort_string = "VACAA"
	category = "Misc"

/datum/design/research/item/posibrain
	name = "Positronic brain"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi/digital/posibrain
	category = "Medical"
	sort_string = "VACAB"

/datum/design/research/item/mmi
	name = "Man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi
	category = "Medical"
	sort_string = "VACBA"

/datum/design/research/item/mmi_radio
	name = "Radio-enabled man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi/radio_enabled
	category = "Medical"
	sort_string = "VACBB"

/datum/design/research/item/beacon
	name = "Bluespace tracking beacon design"
	build_path = /obj/item/device/radio/beacon
	sort_string = "VADAA"
	category = "Misc"

/datum/design/research/item/bag_holding
	name = "'Bag of Holding', an infinite capacity bag prototype"
	desc = "Using localized pockets of bluespace this bag prototype offers incredible storage capacity with the contents weighting nothing. It's a shame the bag itself is pretty heavy."
	build_path = /obj/item/weapon/storage/backpack/holding
	sort_string = "VAEAA"
	category = "Misc"
