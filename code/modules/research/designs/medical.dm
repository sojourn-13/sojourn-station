/datum/design/research/item/medical
	name_category = "biotech device prototype"
	category = "Medical"

/datum/design/research/item/clothing/health
	name = "Health Scanner"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject."
	build_path = /obj/item/clothing/glasses/hud/health

/datum/design/research/item/makeshift_centrifuge
	name = "Portable centrifuge"
	desc = "A centrifuge with manual mechanism."
	build_path = /obj/item/device/makeshift_centrifuge
	category = "Medical"

/datum/design/research/item/medical/roller_bed
	name = "Roller Bed"
	desc = "A foldable roller bed that can be carried around."
	build_path = /obj/item/roller

/datum/design/research/item/medical/compact_roller_bed
	name = "Compact Roller bed"
	desc = "A more costly but durable and compact version of the roller bed."
	build_path = /obj/item/roller/compact

//Scanners

/datum/design/research/item/medical/autopsy_scanner
	name = "Autopsy Scanner"
	desc = "A device used to scan a corpses' wounds for identification of causes of death."
	build_path = /obj/item/autopsy_scanner

/datum/design/research/item/medical/robot_scanner
	name = "Robot Analyzer"
	desc = "A hand-held scanner able to diagnose robotic injuries."
	build_path = /obj/item/device/robotanalyzer

/datum/design/research/item/medical/mass_spectrometer
	name = "Mass Spectrometer"
	desc = "A device for analyzing chemicals present in blood samples."
	build_path = /obj/item/device/scanner/mass_spectrometer

/datum/design/research/item/medical/adv_mass_spectrometer
	name = "Advanced Mass Spectrometer"
	desc = "An advanced device for analyzing chemicals present in blood and their quantities."
	build_path = /obj/item/device/scanner/mass_spectrometer/adv

/datum/design/research/item/medical/reagent_scanner
	name = "Reagent Scanner"
	desc = "A device for identifying chemicals."
	build_path = /obj/item/device/scanner/reagent

/datum/design/research/item/medical/adv_reagent_scanner
	name = "Advanced Reagent Scanner"
	desc = "An advanced device for identifying chemicals and their proportions."
	build_path = /obj/item/device/scanner/reagent/adv

// Greyson health scanner design
/datum/design/research/item/medical/greyson_health_scanner
	name = "Greyson Health Analyzer"
	desc = "An advanced Greyson health analyzer with built-in nano-AI for expanded diagnostics."
	build_path = /obj/item/device/scanner/health/greyson
	materials = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 4, MATERIAL_PLATINUM = 4, MATERIAL_SILVER = 2, MATERIAL_DIAMOND = 1)
	category = "Medical"

//Defibs

/datum/design/research/item/medical/defibs
	name = "Defibrillator"
	desc = "Large paddles that get charged via a cell to give a controlled shock for revival."
	build_path = /obj/item/device/defib_kit

/datum/design/research/item/medical/compact_defibs
	name = "Compact Defibrillator"
	desc = "A compact defibrillator built into a belt, for ease of carrying."
	build_path = /obj/item/device/defib_kit/compact

/datum/design/research/item/medical/combat_defibs
	name = "Combat Defibrillator"
	desc = "A compact defibrillator built into a belt for ease of carrying. This one has their safety protocols turned off, allowing for stronger, yet controlled shocks that can bypass the interference of hardsuits and body armors."
	build_path = /obj/item/device/defib_kit/compact/combat

//Storage

/datum/design/research/item/medical/cryobag
	name = "Stasis Bag"
	desc = "A body bag for a dead or dying body, used to slow down their metabolism through cryostasis technology while transporting them."
	materials = list(MATERIAL_STEEL = 2, MATERIAL_GLASS = 3, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 1)
	build_path = /obj/item/bodybag/cryobag

/datum/design/research/item/medical/blue
	name = "Portable Freezer"
	desc = "A blue-colored, compact cryo box for holding organs for safe transportation while preserving their integrity."
	build_path = /obj/item/storage/freezer

/datum/design/research/item/medical/red
	name = "Organ Freezer"
	desc = "A red-colored, compact cryo box for holding organs for safe transportation preserving their integrity. This one has expanded capacity."
	build_path = /obj/item/storage/freezer/medical

/datum/design/research/item/beaker
	name_category = "beaker prototype"
	category = "Medical"

/datum/design/research/item/beaker/noreact
	name = "Cryostasis Beaker"
	desc = "A small beaker imprinted with cryostasis technology that allows for chemical storage without reactions. Can hold up to 50 units."
	build_path = /obj/item/reagent_containers/glass/beaker/noreact

/datum/design/research/item/beaker/bluespace
	name = "Bluespace beaker"
	desc = "A bluespace beaker, powered by experimental bluespace technology and Element Cuban combined with Compound Pete. Can hold up to 300 units."
	build_path = /obj/item/reagent_containers/glass/beaker/bluespace

/datum/design/research/item/beaker/smoll
	name = "Glass beaker"
	build_path = /obj/item/reagent_containers/glass/beaker

/datum/design/research/item/beaker/big
	name = "Large glass beaker"
	build_path = /obj/item/reagent_containers/glass/beaker/large

/datum/design/research/item/fire_kit
	name = "Empty Fire Firstaid Kit"
	build_path = /obj/item/storage/firstaid/fire/empty
	category = "Medical"

/datum/design/research/item/regular_kit
	name = "Empty Firstaid Kit"
	build_path = /obj/item/storage/firstaid/regular/empty
	category = "Medical"


// Greyson medical kits (advanced, require nanites to fabricate)
/datum/design/research/item/firstaid/regular_kit_greyson
	name = "Greyson Empty Firstaid Kit"
	desc = "An empty Greyson-branded first aid kit shell designed to accept Greyson medical cartridges. Requires nanite chemicals to fabricate."
	build_path = /obj/item/storage/firstaid/greyson/empty
	materials = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 6)
	category = "Medical"


/datum/design/research/item/firstaid/fire_kit_greyson
	name = "Greyson Empty Fire Firstaid Kit"
	desc = "Greyson-branded fire first aid kit shell. Requires medical nanites to fabricate."
	build_path = /obj/item/storage/firstaid/greyson/burn/empty
	materials = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 6)
	category = "Medical"

// Greyson burn/bruise packs
/datum/design/research/item/medical/bruise_pack_greyson
	name = "Greyson Advanced Treatment Pack"
	desc = "A Greyson-branded advanced treatment pack for bruises and tissue trauma. Requires medical nanites to print."
	build_path = /obj/item/stack/medical/bruise_pack/greyson
	materials = list(MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 2, MATERIAL_PLATINUM = 2)
	chemicals = list("uncap nanites" = 1)
	category = "Medical"

/datum/design/research/item/medical/ointment_greyson
	name = "Greyson Advanced Burn-Treatment Pack"
	desc = "A Greyson-branded advanced burn treatment pack preloaded with medical nanites. Requires nanite chemicals to print."
	build_path = /obj/item/stack/medical/ointment/greyson
	materials = list(MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 2, MATERIAL_PLATINUM = 2)
	chemicals = list("uncap nanites" = 1)
	category = "Medical"

/datum/design/research/item/toxin_kit
	name = "Empty Toxin Firstaid Kit"
	build_path = /obj/item/storage/firstaid/toxin/empty
	category = "Medical"

/datum/design/research/item/o2_kit
	name = "Empty Oxygen Deprivation Kit"
	build_path = /obj/item/storage/firstaid/o2/empty
	category = "Medical"

/datum/design/research/item/adv_kit
	name = "Empty Advanced Kit"
	build_path = /obj/item/storage/firstaid/adv/empty
	category = "Medical"

/datum/design/research/item/si_kit
	name = "Empty Soteria Advanced Kit"
	build_path = /obj/item/storage/firstaid/regular/si/empty
	category = "Medical"


//Surgery tools
/datum/design/research/item/surgery_kit
	name = "Advanced Surgery Kit"
	desc = "A box for advanced surgery tools."
	build_path = /obj/item/storage/firstaid/surgery/si/empty
	category = "Medical"

/datum/design/research/item/medical/medimplant_sci
	name = "Soteria Medical Omnitool"
	desc = "An all-in-one smart medical tool implant based on the legendary Greyson Positronic model."
	build_path = /obj/item/tool/medmultitool/medimplant/sci
	materials = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 5, MATERIAL_SILVER = 1)
	category = CAT_TOOLS

/datum/design/research/item/scalpel_laser
	name = "Laser Scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting while instantly searing bleeding cuts through laser cauterization."
	build_path = /obj/item/tool/scalpel/laser/si
	category = CAT_TOOLS

/datum/design/research/item/scalpel_adv
	name = "Advanced Scalpel"
	build_path = /obj/item/tool/scalpel/advanced/si
	category = CAT_TOOLS

/datum/design/research/item/drill_s_adv
	name = "Long-nose Hand Drill"
	build_path = /obj/item/tool/surgicaldrill/adv/si
	category = CAT_TOOLS

/datum/design/research/item/bonesetter_adv
	name = "Bone Clamp Setter"
	desc = "An advanced bone clamping tool, allows for more precise settling of bones with less wrist force required."
	build_path = /obj/item/tool/bonesetter/adv/si
	category = CAT_TOOLS

/datum/design/research/item/cautery_adv
	name = "High Power Cautery"
	desc = "A cautery with self-regulating heat transfer capabilities, allows for quicker and more precise cauterization of surgical incisions."
	build_path = /obj/item/tool/cautery/adv/si
	category = CAT_TOOLS

/datum/design/research/item/hemostat_adv
	name = "Precise Hemostat"
	desc = "An advanced hemostat with better vein clamping strength and an adaptive tip tuned to also allow easier extraction of shrapnel, organs, and implants."
	build_path = /obj/item/tool/hemostat/adv/si
	category = CAT_TOOLS

/datum/design/research/item/retractor_adv
	name = "Extended Retractor"
	desc = "Retracts surgical incisions with greater precision and speed than normal."
	build_path = /obj/item/tool/retractor/adv/si
	category = CAT_TOOLS

/datum/design/research/item/medsaw_circular
	name = "Medical Circular Saw"
	desc = "For clean bone cutting, but doesn't seem all that durable. Spins slower than the normal saw to allow for higher surgical precision."
	build_path = /obj/item/tool/saw/circular/medical/si
	category = CAT_TOOLS

/datum/design/research/item/medical/nanopaste
	name = "Nanopaste"
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing mechanical body parts, organs, and smart purging of toxic buildup."
	build_path = /obj/item/stack/nanopaste
	chemicals = list("nanites" = 5)

/datum/design/research/item/bonegel
	name = "Super Bone Gel"
	desc = "An improved gel-like calcium composite formula used as a surgical substitute for broken or missing bone pieces."
	build_path = /obj/item/tool/tape_roll/bonegel/si
	materials = list(MATERIAL_PLASTIC = 10)
	category = CAT_TOOLS

/datum/design/research/item/fiber_medical
	name = "Medical Fiber Tape"
	desc = "A roll of medical fiber tape, used for quick bandaging of wounds and fractures."
	build_path = /obj/item/tool/tape_roll/fiber/medical
	materials = list(MATERIAL_PLASTIC = 5)
	category = CAT_TOOLS


/datum/design/research/item/mmi
	name = "Man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi
	category = "Medical"


// Greyson bruise pack printing
/datum/design/research/item/medical/bruise_pack_greyson
	name = "Greyson Advanced Treatment Pack"
	desc = "A Greyson-branded advanced treatment pack filled with programmed medical nanites. Requires nanites to print."
	build_path = /obj/item/stack/medical/bruise_pack/greyson
	materials = list(MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 2)
	chemicals = list("nanosymbiotes" = 4, "fbp_repair" = 1)
	category = "Medical"

/datum/design/research/item/mmi_radio
	name = "Radio-enabled man-machine interface"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/device/mmi/radio_enabled
	category = "Medical"
