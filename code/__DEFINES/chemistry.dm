#define DEFAULT_HUNGER_FACTOR 0.2 // Factor of how fast mob nutrition decreases

#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH		1	// splashing
#define CHEM_INGEST		2	// ingestion
#define CHEM_BLOOD		3	// injection

// Atom reagent_flags
#define INJECTABLE		(1<<0)	// Makes it possible to add reagents through droppers and syringes.
#define DRAWABLE		(1<<1)	// Makes it possible to remove reagents through syringes.

#define REFILLABLE		(1<<2)	// Makes it possible to add reagents through any reagent container.
#define DRAINABLE		(1<<3)	// Makes it possible to remove reagents through any reagent container.

#define TRANSPARENT		(1<<4)	// For containers with fully visible reagents.
#define AMOUNT_VISIBLE	(1<<5)	// For non-transparent containers that still have the general amount of reagents in them visible.

#define NO_REACT        (1<<6)  // Applied to a reagent holder, the contents will not react with each other.


// Is an open container for all intents and purposes.
#define OPENCONTAINER 	(REFILLABLE | DRAINABLE | TRANSPARENT)


#define MINIMUM_CHEMICAL_VOLUME 0.01

#define SOLID			1
#define LIQUID			2
#define GAS				3

#define REAGENTS_OVERDOSE 30

#define REAGENTS_MIN_EFFECT_MULTIPLIER 0.2
#define REAGENTS_MAX_EFFECT_MULTIPLIER 2.5

#define CHEM_SYNTH_ENERGY 3000 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

// Some on_mob_life() procs check for alien races.
#define IS_XENOS   1
#define IS_CHTMANT 2
#define IS_SYNTHETIC 3
#define IS_SLIME 4
#define IS_MARQUA 5
#define IS_KRIOSAN 6
#define IS_AKULA 7
#define IS_TREE 8
#define IS_OPIFEX 9
#define IS_NARAMAD 10
#define IS_CINDARITE 11
#define IS_TAJ 12

#define CE_STABLE			"stable" // Inaprovaline
#define CE_ANTIBIOTIC		"antibiotic" // Spaceacilin
#define CE_BLOODRESTORE		"bloodrestore" // Iron/nutriment
#define CE_PAINKILLER		"painkiller"
#define CE_ALCOHOL			"alcohol" // Liver filtering
#define CE_ALCOHOL_TOXIC	"alcotoxic" // Liver damage
#define CE_SPEEDBOOST 		"gofast" // Makes you go faster
#define CE_SLOWDOWN 		"goslower" // Makes you go slower
#define CE_PULSE      		"xcardic" // increases or decreases heart rate
#define CE_NOPULSE    		"heartstop" // stops heartbeat
#define CE_MIND    		 	"mindbending"  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_ANTITOX       	"antitox"      // Dylovene
#define CE_TOXIN         	"toxins"       // Generic toxins, stops autoheal.
#define CE_SPEECH_VOLUME	"speach_volume"    // speech volume multiplier , default volume is integer and equals 2
#define CE_BLOODCLOT		"bloodclot"	// Promote healing but thickens blood, slows and stops bleeding (range 0 - 1)
#define CE_OXYGENATED		"oxygen"       // Dexalin.
#define CE_PURGER			"purger"	//Purger
#define CE_NOWITHDRAW		"no_withdrawal"
#define CE_VOICEMIMIC		"voice_mimic"
#define CE_DYNAMICFINGERS	"dynfingers"
#define CE_ONCOCIDAL        "anticancer"
#define CE_DARKSIGHT 		"darksight"	//Vision methods built into a mob.
#define CE_DEBRIDEMENT      "debriding agent" //for fixing burn/necrosis type wounds.
#define CE_ATTACK_COOLDOWN  "attacking cooldown adder" //Used to *add* attack cooldown, negitives will increase attack speed

//Chem affects that just heal a spefic organ
#define CE_BRAINHEAL		"neural tissue restoration"
#define CE_EYEHEAL			"sensory organ regeneration stimulant"
#define CE_LIVERHEAL		"hepatoprotective agent stimulantion"
#define CE_HEARTHEAL		"cardiac resynchronization therapy stimulant"
#define CE_LUNGHEAL			"pulmo regeneration stimulant"
#define CE_BONE_MEND		"bone mending"	// Ossisine
#define CE_MUSCLEHEAL		"muscle mending"
#define CE_NERVESHEAL		"nerve regeneration"
#define CE_BLOODVESSELSHEAL	"blood vessel regeneration"


#define CE_WOUND_STABLIZE   "wound stablizer" //for preventing internal wounds form progressing

// Chem effects for robotic/assisted organs
#define CE_MECH_STABLE 		"cooling"
#define CE_MECH_ACID 		"acid"
#define CE_MECH_LUBE		"lubrication"       // Unused
#define CE_MECH_REPAIR 		"nanite repair"     // Repair damage
#define CE_MECH_REPLENISH 	"nanite replenish"  // Replenish fluid, unused

// Reagent specific heat is not yet implemented, this is here for compatibility reasons
#define SPECIFIC_HEAT_DEFAULT			200
