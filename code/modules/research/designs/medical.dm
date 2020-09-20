/datum/design/research/item/medical
	name_category = "biotech device prototype"
	category = "Medical"

/datum/design/research/item/hud/health
	name = "health scanner"
	build_path = /obj/item/clothing/glasses/hud/health
	category = "Medical"

/datum/design/research/item/makeshift_centrifuge
	name = "Portable centrifuge"
	desc = "A centrifuge with manual mechanism."
	build_path = /obj/item/device/makeshift_centrifuge
	category = "Medical"

/datum/design/research/item/medical/roller_bed
	name = "Roller Bed"
	build_path = /obj/item/roller

/datum/design/research/item/medical/compact_roller_bed
	name = "Compact Roller bed"
	desc = "A more costly but durable and compact version of the roller bed ."
	build_path = /obj/item/roller/compact

//Scanners

/datum/design/research/item/medical/autopsy_scanner
	name = "Autopsy Scanner"
	build_path = /obj/item/weapon/autopsy_scanner

/datum/design/research/item/medical/robot_scanner
	desc = "A hand-held scanner able to diagnose robotic injuries."
	build_path = /obj/item/device/robotanalyzer

/datum/design/research/item/medical/mass_spectrometer
	desc = "A device for analyzing chemicals in blood."
	build_path = /obj/item/device/scanner/mass_spectrometer

/datum/design/research/item/medical/adv_mass_spectrometer
	desc = "A device for analyzing chemicals in blood and their quantities."
	build_path = /obj/item/device/scanner/mass_spectrometer/adv

/datum/design/research/item/medical/reagent_scanner
	desc = "A device for identifying chemicals."
	build_path = /obj/item/device/scanner/reagent

/datum/design/research/item/medical/adv_reagent_scanner
	desc = "A device for identifying chemicals and their proportions."
	build_path = /obj/item/device/scanner/reagent/adv

//Defibs

/datum/design/research/item/medical/defibs
	desc = "Large paddles that get charged via a cell to give a controlled shock for revival."
	build_path = /obj/item/device/defib_kit

/datum/design/research/item/medical/compact_defibs
	desc = "Much smaller defibulators build into a belt, to more easily carry."
	build_path = /obj/item/device/defib_kit/compact

/datum/design/research/item/medical/combat_defibs
	desc = "Much smaller defibulators build into a belt, to more easily carry. This one has no safeties..."
	build_path = /obj/item/device/defib_kit/compact/combat

//Storage

/datum/design/research/item/medical/cryobag
	desc = "A body bag for a dieing or dead body to stablize them using cryo tech."
	materials = list(MATERIAL_STEEL = 2, MATERIAL_GLASS = 3, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 1)
	build_path = /obj/item/bodybag/cryobag

/datum/design/research/item/medical/red
	desc = "A mini-cryo box for holding foods and organs. This one comes in blue."
	build_path = /obj/item/weapon/storage/freezer

/datum/design/research/item/medical/blue
	desc = "A thicker red box for only holding organs."
	build_path = /obj/item/weapon/storage/freezer/medical

/datum/design/research/item/beaker
	name_category = "beaker prototype"
	category = "Medical"

/datum/design/research/item/beaker/noreact
	name = "cryostasis"
	desc = "A cryostasis beaker that allows for chemical storage without reactions. Can hold up to 50 units."
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/noreact

/datum/design/research/item/beaker/bluespace
	name = "bluespace"
	desc = "A bluespace beaker, powered by experimental bluespace technology and Element Cuban combined with the Compound Pete. Can hold up to 300 units."
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/bluespace


//Surgery tools
/datum/design/research/item/medical/medimplant_sci
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model."
	build_path = /obj/item/weapon/tool/medmultitool/medimplant/sci
	materials = list(MATERIAL_STEEL = 15, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 15, MATERIAL_GOLD = 3, MATERIAL_SILVER = 5)

/datum/design/research/item/scalpel_laser
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field."
	build_path = /obj/item/weapon/tool/scalpel/laser
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
	category = "Medical"

/datum/design/research/item/hemostat_adv
	name = "Precise Hemostat"
	desc = "A much more precise hemostat with finer grip."
	build_path = /obj/item/weapon/tool/hemostat/adv
	category = "Medical"

/datum/design/research/item/retractor_adv
	name = "Extended Retractor"
	desc = "Retracts with greater force and length then normal."
	build_path = /obj/item/weapon/tool/retractor/adv
	category = "Medical"

/datum/design/research/item/medsaw_circular
	name = "Medical Cirular Saw"
	desc = "For clean bone cutting but dosnt seem all that durable. Spins slower then the normal saw as well."
	build_path = /obj/item/weapon/tool/saw/circular/medical
	category = "Medical"

/datum/design/research/item/medical/nanopaste
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	build_path = /obj/item/stack/nanopaste

//Brain stuff
/datum/design/research/item/posibrain
	name = "Positronic brain"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi/digital/posibrain
	category = "Medical"

/datum/design/research/item/mmi
	name = "Man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi
	category = "Medical"

/datum/design/research/item/mmi_radio
	name = "Radio-enabled man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi/radio_enabled
	category = "Medical"
