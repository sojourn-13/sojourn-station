// Blunt
/datum/component/internal_wound/organic/muscle_blunt
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MUSCLEHEAL = 1)
	severity = 0
	severity_max = 3 // with 3 health it takes around 3 wounds to kill myo
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/muscle_blunt/dissection
	name = "myo dissection"

/datum/component/internal_wound/organic/muscle_blunt/erosion //PAINFUL
	name = "myo erosion"
	hal_damage = IWOUND_HEAVY_DAMAGE

// Sharp

/datum/component/internal_wound/organic/muscle_sharp
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_LASER_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MUSCLEHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/muscle_sharp/slice
	name = "traumatic myo"

/datum/component/internal_wound/organic/muscle_sharp/perforation
	name = "myo superonasal perforation"

/datum/component/internal_wound/organic/muscle_sharp/matter
	name = "myo embedded matter"
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)

// Edge
/datum/component/internal_wound/organic/muscle_edge
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 2)
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MUSCLEHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/muscle_edge/laceration
	name = "myo laceration"

/datum/component/internal_wound/organic/muscle_edge/cuts
	name = "cut myo"

/datum/component/internal_wound/organic/muscle_edge/slice
	name = "sliced myo"

// Burn
// Gonna be avoiding infections here. Far more likely you get welding flare then a direct laser to the myo. Makes little sense in some cases but easier then reworking welding!
/datum/component/internal_wound/organic/muscle_burn
	treatments_item = list(/obj/item/stack/medical/ointment/advanced = 2)
	treatments_tool = list(QUALITY_LASER_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MUSCLEHEAL = 1, CE_DEBRIDEMENT = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_MEDIUM_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/organic/muscle_burn/scorch
	name = "scorched myo tissue"
	treatments_tool = list(QUALITY_RETRACTING = FAILCHANCE_HARD)
	next_wound = /datum/component/internal_wound/organic/muscle_burn/muscle_deep_burn

/datum/component/internal_wound/organic/muscle_burn/muscle_deep_burn //stage 2
	name = "scorched deep myo tissue"
	severity = 2 // starts with high damage as it is a second stage
	severity_max = 3
	next_wound = /datum/component/internal_wound/organic/muscle_special

/datum/component/internal_wound/organic/muscle_special
	treatments_item = list(/obj/item/stack/medical/ointment/advanced = 2)
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MUSCLEHEAL = 1)
	severity = 0
	severity_max = 8 //slow death of myo like infection but we dont want it spreading elsewhere!
	progression_threshold = IWOUND_10_MINUTES //very slow! I hope

/datum/component/internal_wound/organic/muscle_special/failer
	name = "myo stiffness"

/datum/component/internal_wound/organic/muscle_special/spasm
	name = "myo spasm"

// Tox (toxins)
/datum/component/internal_wound/organic/muscle_poisoning
	treatments_item = list(/obj/item/stack/medical/bruise_pack/advanced = 1)
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_ANTITOX = 2, CE_MUSCLEHEAL = 1)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_LIGHT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT
	progress_while_healthy = TRUE

/// Cheap hack, but prevents unbalanced toxins from killing someone immediately
/datum/component/internal_wound/organic/muscle_poisoning/InheritComponent()
	if(prob(5))
		progress()

/datum/component/internal_wound/organic/muscle_poisoning/pustule
	name = "myo pustule"
	specific_organ_size_multiplier = 0.20

/datum/component/internal_wound/organic/muscle_poisoning/intoxication
	name = "myo intoxication"
	blood_req_multiplier = 0.25
	nutriment_req_multiplier = 0.25
	oxygen_req_multiplier = 0.25

/datum/component/internal_wound/organic/muscle_poisoning/accumulation
	name = "myo leakage accumulation"
	hal_damage = IWOUND_MEDIUM_DAMAGE

/// Robotic

// Blunt
/datum/component/internal_wound/robotic/muscle_blunt
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_SCREW_DRIVING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.55)		// repair nanites + 3 metals OR repair nanite OD + a metal
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_blunt/bruses
	name = "brused myo"
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/muscle_blunt/jam
    name = "jammed hydraulic"

/datum/component/internal_wound/robotic/muscle_blunt/matrix
	name = "dented myo"
	organ_efficiency_multiplier = -1 // can't see anything because of loose wire

// Sharp

/datum/component/internal_wound/robotic/muscle_sharp
	treatments_item = list(/obj/item/stack/nanopaste = 2)
	treatments_tool = list()
	treatments_chem = list(CE_MECH_REPAIR = 0.85)		// repair nanites + 6 metals OR repair nanite OD + 7 metals
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_sharp/clamp
	name = "locked myo hydraulic"
	treatments_tool = list(QUALITY_ADHESIVE = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/muscle_sharp/shatter
	name = "leaking myo tubing"
	treatments_chem = list(CE_MECH_REPAIR = 0.20)

/datum/component/internal_wound/robotic/muscle_sharp/failure
	name = "mechanical hydraulic failure"
	treatments_item = list(/obj/item/stock_parts/scanning_module = 1, /obj/item/stack/nanopaste = 2)

// Edge
/datum/component/internal_wound/robotic/muscle_edge
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.85)
	severity = 0
	severity_max = 3
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_edge/hydraulics
	name = "scratched myo hydraulics"

/datum/component/internal_wound/robotic/muscle_edge/clamper
	name = "bent myo clamp"

/datum/component/internal_wound/robotic/muscle_edge/slice
	name = "sliced open myo tubing"
	treatments_item = list(/obj/item/stack/cable_coil = 5)

// EMP/burn wounds

/datum/component/internal_wound/robotic/muscle_emp_burn
	treatments_item = list(/obj/item/stack/cable_coil = 5)
	treatments_tool = list(QUALITY_WIRE_CUTTING = FAILCHANCE_HARD)
	treatments_chem = list(CE_MECH_REPAIR = 0.95)	// repair nanite OD + all metals
	severity = 0
	severity_max = 3
	next_wound = /datum/component/internal_wound/robotic/muscle_overheat
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_emp_burn/tube
	name = "burnt myo tubing"
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_tool = list(QUALITY_PULSING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/muscle_emp_burn/inverse
	name = "inversed myo hydraulic"
	treatments_tool = list(QUALITY_SCREW_DRIVING = FAILCHANCE_HARD)

/datum/component/internal_wound/robotic/muscle_emp_burn/carbonized
	name = "mangled hydraulic wiring"

/datum/component/internal_wound/robotic/muscle_overheat
	treatments_item = list(/obj/item/stack/cable_coil = 10, /obj/item/stack/nanopaste = 2)
	treatments_chem = list(CE_MECH_STABLE = 0.5)	// coolant or refrigerant
	severity = 0
	severity_max = IORGAN_MAX_HEALTH
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_overheat/standard
	name = "overheating myo hydraulic"

/datum/component/internal_wound/robotic/muscle_overheat/alt
	name = "coolent lacking myo"
	organ_efficiency_multiplier = -1

// Tox - UNUSED
/datum/component/internal_wound/robotic/muscle_build_up
	treatments_tool = list(QUALITY_CLAMPING = FAILCHANCE_HARD)	// Clear any clog wtih a thin tool
	treatments_chem = list(CE_MECH_ACID = 1)		// sulphiric acid
	severity = 0
	severity_max = 3
	next_wound = /datum/component/internal_wound/robotic/corrosion
	hal_damage = IWOUND_INSIGNIFICANT_DAMAGE
	diagnosis_difficulty = STAT_LEVEL_EXPERT

/datum/component/internal_wound/robotic/muscle_build_up/breach
	name = "breached myo case"
	treatments_tool = list(QUALITY_ADHESIVE = FAILCHANCE_HARD)
	treatments_item = list(/obj/item/stack/nanopaste = 1)
	treatments_chem = list(CE_MECH_REPAIR = 0.30)

/datum/component/internal_wound/robotic/muscle_build_up/clog
	name = "malfuctioning hydraulic clamp"
	severity_max = 5
	hal_damage = IWOUND_MEDIUM_DAMAGE

// Clone/radiation
/datum/component/internal_wound/organic/muscle_radiation
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_ONCOCIDAL = 1, CE_MUSCLEHEAL = 1)
	severity = 1
	severity_max = 1
	hal_damage = IWOUND_LIGHT_DAMAGE
	status_flag = ORGAN_WOUNDED|ORGAN_MUTATED
	progress_while_healthy = TRUE

/datum/component/internal_wound/organic/muscle_radiation/benign
	name = "benign tumor"

/datum/component/internal_wound/organic/muscle_radiation/malignant
	name = "malignant tumor"
	treatments_chem = list(CE_ONCOCIDAL = 2, CE_MUSCLEHEAL = 1)
	characteristic_flag = IWOUND_CAN_DAMAGE|IWOUND_PROGRESS|IWOUND_SPREAD
	severity = 0
	severity_max = IORGAN_MAX_HEALTH	// Will kill any organ
	spread_threshold = IORGAN_SMALL_HEALTH	// This will spread at the same moment it kills a small organ
