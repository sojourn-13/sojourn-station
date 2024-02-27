//Slime wounds! We have a different composition to other organics, thus we have snowflake wounds and ways of healing
//generally speaking, we do not get the same tangible benefit from things like ATKs when attempting to repair our insides
// - but chems to fix us are much simpler.
//Our limbs don't break, but the structure can become damaged and bruised which is bad for us
// as we only have 1 organ that serves as bone, nerve, vessel and muscle

/datum/component/internal_wound/slime
	treatments_item = list(/obj/item/stack/nanopaste = 1) //generally we are too complicated to treat with ATKS or similar, at best you can use nanopaste if you need a quick fix.
	diagnosis_stat = STAT_COG //We aren't like most organics. A knowledge of chemistry and microbiology is more useful than organic anatomy will be.
	diagnosis_difficulty = STAT_LEVEL_ADEPT
	wound_nature = MODIFICATION_SLIME


// Blunt
/datum/component/internal_wound/slime/blunt
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_OXYGENATED = 0.55) //DEX+ ,oxygen is used to fuel internal repair processes
	next_wound = /datum/component/internal_wound/organic/swelling
	severity = 0
	severity_max = 5
	hal_damage = IWOUND_MEDIUM_DAMAGE

/datum/component/internal_wound/slime/blunt/bruised
	name = "bruised cartilage"

/datum/component/internal_wound/slime/blunt/disruption
	name = "crushed membranes"

/datum/component/internal_wound/slime/blunt/burst
	name = "burst nuclei"


//sharp

/datum/component/internal_wound/slime/sharp
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_BLOODCLOT = 0.50) //quickclot OD helps cells clump together for healing.
	severity = 0
	severity_max = 5
	hal_damage = IWOUND_MEDIUM_DAMAGE

/datum/component/internal_wound/slime/sharp/perforation
	name = "perforation"

/datum/component/internal_wound/slime/sharp/cavity
	name = "cavitation"

/datum/component/internal_wound/slime/sharp/gore
	name = "gored membranes"

// Edge
/datum/component/internal_wound/slime/edge
	treatments_tool = list(QUALITY_CAUTERIZING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_BLOODRESTORE = 0.7) //Iron. We use this to power the rapid restoration of our cytoplasm
	severity = 0
	severity_max = 5
	next_wound = /datum/component/internal_wound/slime/swelling
	hal_damage = IWOUND_MEDIUM_DAMAGE

/datum/component/internal_wound/slime/edge/laceration
	name = "laceration"

/datum/component/internal_wound/slime/edge/gash
	name = "deep gash"

/datum/component/internal_wound/slimeedge/rip
	name = "ripped membranes"

// Burn
/datum/component/internal_wound/slime/burn
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_ANTIBIOTIC = 0.70)//We can heal ourselves, but other organisms may take root inside dead cells if they're left to fester.
	severity = 0
	severity_max = 5
	next_wound = /datum/component/internal_wound/slime/infection
	hal_damage = IWOUND_MEDIUM_DAMAGE

/datum/component/internal_wound/slime/burn/scorch
	name = "scorched cytoplasm"

/datum/component/internal_wound/slime/burn/char
	name = "charred cytostructures"

/datum/component/internal_wound/slime/burn/incinerate
	name = "incinerated membranes"

// Clone/radiation
/datum/component/internal_wound/slime/radiation //much more dangerous for us, we have far fewer organs for these to spread to and thus it can take us over faster.
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_ONCOCIDAL = 1) //the process of removal remains largely the same.
	severity = 1
	severity_max = 1
	hal_damage = IWOUND_LIGHT_DAMAGE
	status_flag = ORGAN_WOUNDED|ORGAN_MUTATED

/datum/component/internal_wound/slime/radiation/benign
	name = "benign growth"

/datum/component/internal_wound/slime/radiation/malignant
	name = "malignant growth"
	treatments_chem = list(CE_ONCOCIDAL = 2)
	characteristic_flag = IWOUND_CAN_DAMAGE|IWOUND_PROGRESS|IWOUND_SPREAD
	severity = 0
	severity_max = IORGAN_MAX_HEALTH	// Will kill any organ
	spread_threshold = IORGAN_SMALL_HEALTH	// This will spread at the same moment it kills a small organ


// Secondary wounds
/datum/component/internal_wound/slime/swelling
	treatments_tool = list(QUALITY_CUTTING = FAILCHANCE_NORMAL)
	treatments_chem = list(CE_STABLE = 1) //INnnaprovaline to help the swelling go down.
	severity = 0
	severity_max = 3
	next_wound = /datum/component/internal_wound/slime/infection
	hal_damage = IWOUND_LIGHT_DAMAGE
	specific_organ_size_multiplier = 0.2

/datum/component/internal_wound/organic/swelling/normal
	name = "swollen membranes"


// Infections
/datum/component/internal_wound/slime/infection
	treatments_chem = list(CE_ANTIBIOTIC = 5)
	characteristic_flag = IWOUND_CAN_DAMAGE|IWOUND_PROGRESS |IWOUND_SPREAD
	severity = 0
	severity_max = IORGAN_MAX_HEALTH
	progression_threshold = IWOUND_8_MINUTES
	hal_damage = IWOUND_LIGHT_DAMAGE
	spread_threshold = IORGAN_SMALL_HEALTH
	status_flag = ORGAN_WOUNDED|ORGAN_INFECTED

/datum/component/internal_wound/slime/infection/standard
	name = "infection"
