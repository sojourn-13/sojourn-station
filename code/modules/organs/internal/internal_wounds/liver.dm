// Blunt
/datum/component/internal_wound/organic/liver_blunt
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)
	treatments_chem = list(CE_LIVERHEAL = 1)
	severity = 0
	severity_max = 3 // with 3 health it takes around 3 wounds to kill liver
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/liver_blunt/dissection
	name = "hepatic dissection"

/datum/component/internal_wound/organic/liver_blunt/erosion //PAINFUL
	name = "hepatic erosion"
	hal_damage = IWOUND_HEAVY_DAMAGE

// Sharp

/datum/component/internal_wound/organic/liver_sharp
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_LASER_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_LIVERHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/liver_sharp/slice
	name = "traumatic hepatic"

/datum/component/internal_wound/organic/liver_sharp/perforation
	name = "hepatic superonasal perforation"

/datum/component/internal_wound/organic/liver_sharp/matter
	name = "hepatic foreign matter"
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)

// Edge
/datum/component/internal_wound/organic/liver_edge
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_HARD)
	treatments_chem = list(CE_LIVERHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/liver_edge/laceration
	name = "hepatic laceration"

/datum/component/internal_wound/organic/liver_edge/cuts
	name = "cut hepatic"

/datum/component/internal_wound/organic/liver_edge/slice
	name = "sliced hepatic"

// Burn
// Gonna be avoiding infections here. Far more likely you get welding flare then a direct laser to the liver. Makes little sense in some cases but easier then reworking welding!
/datum/component/internal_wound/organic/liver_burn
	treatments_item = list(/obj/item/stack/medical/ointment/advanced = 2)
	treatments_tool = list(QUALITY_LASER_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_LIVERHEAL = 1, CE_DEBRIDEMENT = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/liver_burn/scorch
	name = "scorched hepatic tissue"
	treatments_tool = list(QUALITY_RETRACTING = FAILCHANCE_HARD)
	next_wound = /datum/component/internal_wound/organic/liver_burn/liver_deep_burn

/datum/component/internal_wound/organic/liver_burn/liver_deep_burn //stage 2
	name = "scorched deep hepatic tissue"
	severity = 2 // starts with high damage as it is a second stage
	severity_max = 3
	next_wound = /datum/component/internal_wound/organic/liver_special

/datum/component/internal_wound/organic/liver_special
	treatments_item = list(/obj/item/stack/medical/ointment/advanced = 2)
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)
	treatments_chem = list(CE_LIVERHEAL = 1)
	severity = 0
	severity_max = 8 //slow death of liver like infection but we dont want it spreading elsewhere!
	progression_threshold = IWOUND_10_MINUTES //very slow! I hope

/datum/component/internal_wound/organic/liver_special/failer
	name = "hepatic failer"

/datum/component/internal_wound/organic/liver_special/still
	name = "hepatic stillness"

// Tox (toxins)
/datum/component/internal_wound/organic/liver_poisoning
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 1)
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_ANTITOX = 2, CE_LIVERHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_LIGHT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT
	progress_while_healthy = TRUE

/// Cheap hack, but prevents unbalanced toxins from killing someone immediately
/datum/component/internal_wound/organic/liver_poisoning/InheritComponent()
	if(prob(5))
		progress()

/datum/component/internal_wound/organic/liver_poisoning/pustule
	name = "hepatic pustule"
	specific_organ_size_multiplier = 0.20

/datum/component/internal_wound/organic/liver_poisoning/intoxication
	name = "hepatic intoxication"
	blood_req_multiplier = 0.25
	nutriment_req_multiplier = 0.25
	oxygen_req_multiplier = 0.25

/datum/component/internal_wound/organic/liver_poisoning/accumulation
	name = "hepatic backlogged accumulation"
	hal_damage = IWOUND_MEDIUM_DAMAGE

/// Robotic

// Blunt
/datum/component/internal_wound/robotic/liver_blunt
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_SCREW_DRIVING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.55)		// repair nanites + 3 metals OR repair nanite OD + a metal
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_blunt/bruses
	name = "brused hepatic"
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/liver_blunt/jam
    name = "jammed mechanics"

/datum/component/internal_wound/robotic/liver_blunt/matrix
	name = "dented hepatic"
	organ_efficiency_multiplier = -1 // can't see anything because of loose wire

// Sharp

/datum/component/internal_wound/robotic/liver_sharp
	treatments_item = list(/obj/item/stack/nanopaste = 2)
	treatments_tool = list()
	treatments_chem = list(CE_MECH_REPAIR = 0.85)		// repair nanites + 6 metals OR repair nanite OD + 7 metals
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_sharp/leaking
	name = "leaking hepatic tank"
	treatments_tool = list(QUALITY_ADHESIVE = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/liver_sharp/shatter
	name = "leaking hepatic tubing"
	treatments_chem = list(CE_MECH_REPAIR = 0.20)

/datum/component/internal_wound/robotic/liver_sharp/failure
	name = "mechanical hepatic failure"
	treatments_item = list(/obj/item/stock_parts/scanning_module = 1, /obj/item/stack/nanopaste = 2)

// Edge
/datum/component/internal_wound/robotic/liver_edge
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.85)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_edge/ocular
	name = "scratched hepatic"

/datum/component/internal_wound/robotic/liver_edge/focuser
	name = "torn hepatic tube"

/datum/component/internal_wound/robotic/liver_edge/slice
	name = "sliced open hepatic tank"
	treatments_item = list(/obj/item/stack/cable_coil = 5)

// EMP/burn wounds

/datum/component/internal_wound/robotic/liver_emp_burn
	treatments_item = list(/obj/item/stack/cable_coil = 5)
	treatments_tool = list(QUALITY_WIRE_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.95)	// repair nanite OD + all metals
	severity = 0
	severity_max = 3
	next_wound = /datum/component/internal_wound/robotic/liver_overheat
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_emp_burn/tube
	name = "burnt hepatic tubing"
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_PULSING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/liver_emp_burn/inverse
	name = "inversed hepatic moter"
	treatments_tool = list(QUALITY_SCREW_DRIVING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/liver_emp_burn/carbonized
	name = "mangled wiring"

/datum/component/internal_wound/robotic/liver_overheat
	treatments_item = list(/obj/item/stack/cable_coil = 10, /obj/item/stack/nanopaste = 2)
	treatments_chem = list(CE_MECH_STABLE = 0.5)	// coolant or refrigerant
	severity = 0
	severity_max = IORGAN_MAX_HEALTH
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_overheat/standard
	name = "overheating hepatic link"

/datum/component/internal_wound/robotic/liver_overheat/alt
	name = "coolent lacking hepatic"
	organ_efficiency_multiplier = -1

// Tox - UNUSED
/datum/component/internal_wound/robotic/liver_build_up
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)	// Clear any clog wtih a thin tool
	treatments_chem = list(CE_MECH_ACID = 1)		// sulphiric acid
	severity = 0
	severity_max = 3
	next_wound = /datum/component/internal_wound/robotic/corrosion
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/liver_build_up/breach
	name = "breached bioisolation"
	treatments_tool = list(QUALITY_ADHESIVE = FAILCHANCE_HARD)
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_chem = list(CE_MECH_REPAIR = 0.30)

/datum/component/internal_wound/robotic/liver_build_up/clog
	name = "clogged circuitry"
	severity_max = 5
	hal_damage = IWOUND_MEDIUM_DAMAGE

// Clone/radiation
/datum/component/internal_wound/organic/liver_radiation
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_ONCOCIDAL = 1, CE_LIVERHEAL = 1)
	severity = 1
	severity_max = 1
	hal_damage = IWOUND_LIGHT_DAMAGE
	status_flag = ORGAN_WOUNDED|ORGAN_MUTATED
	progress_while_healthy = TRUE

/datum/component/internal_wound/organic/liver_radiation/benign
	name = "benign tumor"

/datum/component/internal_wound/organic/liver_radiation/malignant
	name = "malignant tumor"
	treatments_chem = list(CE_ONCOCIDAL = 2, CE_LIVERHEAL = 1)
	characteristic_flag = IWOUND_CAN_DAMAGE|IWOUND_PROGRESS|IWOUND_SPREAD
	severity = 0
	severity_max = IORGAN_MAX_HEALTH	// Will kill any organ
	spread_threshold = IORGAN_SMALL_HEALTH	// This will spread at the same moment it kills a small organ
