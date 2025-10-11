// /mob/var/stat things.
#define CONSCIOUS   0
#define UNCONSCIOUS 1
#define DEAD        2

// Bitflags defining which status effects could be or are inflicted on a mob.
#define CANSTUN				BITFLAG(0)
#define CANWEAKEN			BITFLAG(1)
#define CANPARALYSE			BITFLAG(2)
#define CANPUSH				BITFLAG(3)
#define LEAPING				BITFLAG(4)
#define REBUILDING_ORGANS	BITFLAG(5)
#define PASSEMOTES			BITFLAG(6)	// Mob has a holder inside of it that need to see emotes.
#define BLEEDOUT			BITFLAG(7)
#define HARDCRIT			BITFLAG(8)
#define GODMODE				BITFLAG(9)
#define FAKEDEATH			BITFLAG(10)	// Replaces stuff like changeling.changeling_fakedeath.
#define NO_ANTAG_MOB		BITFLAG(11)	// Players are restricted from gaining antag roles when occupying this mob
#define XENO_HOST			BITFLAG(12)	// Tracks whether we're gonna be a baby alien's mummy.
#define ENABLE_AI			BITFLAG(13)	// Regardless of player control, the mob is using AI.

#define BORGMESON		BITFLAG(0)
#define BORGTHERM		BITFLAG(1)
#define BORGXRAY		BITFLAG(2)
#define BORGMATERIAL	BITFLAG(3)

#define HOSTILE_STANCE_IDLE			1
#define HOSTILE_STANCE_ALERT		2
#define HOSTILE_STANCE_ATTACK		3
#define HOSTILE_STANCE_ATTACKING	4
#define HOSTILE_STANCE_TIRED		5
#define HOSTILE_STANCE_INSIDE		6

#define LEFT	BITFLAG(0)
#define RIGHT	BITFLAG(1)
#define UNDER	BITFLAG(2)

// Pulse levels, very simplified.
#define PULSE_NONE    0   // So !M.pulse checks would be possible.
#define PULSE_SLOW    1   // <60     bpm
#define PULSE_NORM    2   //  60-90  bpm
#define PULSE_FAST    3   //  90-120 bpm
#define PULSE_2FAST   4   // >120    bpm
#define PULSE_THREADY 5   // Occurs during hypovolemic shock
#define GETPULSE_HAND 0   // Less accurate. (hand)
#define GETPULSE_TOOL 1   // More accurate. (med scanner, sleeper, etc.)
#define PULSE_MAX_BPM 250 // Highest, readable BPM by machines and humans.

//intent flags
#define I_HELP		"help"
#define I_DISARM	"disarm"
#define I_GRAB		"grab"
#define I_HURT		"harm"

//These are used Bump() code for living mobs, in the mob_bump_flag, mob_swap_flags, and mob_push_flags vars to determine whom can bump/swap with whom.
#define HUMAN 1
#define MONKEY 2
#define ALIEN 4
#define ROBOT 8
#define SLIME 16
#define SIMPLE_ANIMAL 32
#define HEAVY 64
#define ALLMOBS (HUMAN|MONKEY|ALIEN|ROBOT|SLIME|SIMPLE_ANIMAL|HEAVY)

// Robot AI notifications
#define ROBOT_NOTIFICATION_NEW_UNIT 1
#define ROBOT_NOTIFICATION_NEW_NAME 2
#define ROBOT_NOTIFICATION_NEW_MODULE 3
#define ROBOT_NOTIFICATION_MODULE_RESET 4
#define ROBOT_NOTIFICATION_SIGNAL_LOST 5

// Appearance change flags
#define APPEARANCE_UPDATE_DNA			BITFLAG(0)
#define APPEARANCE_RACE					(BITFLAG(1)|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_GENDER				BITFLAG(2)
#define APPEARANCE_BODY					(BITFLAG(3)|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_SKIN					BITFLAG(4)
#define APPEARANCE_HAIR					BITFLAG(5)
#define APPEARANCE_HAIR_COLOR			BITFLAG(6)
#define APPEARANCE_FACIAL_HAIR			BITFLAG(7)
#define APPEARANCE_FACIAL_HAIR_COLOR	BITFLAG(8)
#define APPEARANCE_EYE_COLOR			BITFLAG(9)
#define APPEARANCE_NAME					BITFLAG(10)
#define APPEARANCE_ALL_HAIR          (APPEARANCE_HAIR|APPEARANCE_HAIR_COLOR|APPEARANCE_FACIAL_HAIR|APPEARANCE_FACIAL_HAIR_COLOR)
#define APPEARANCE_ALL               (APPEARANCE_UPDATE_DNA|APPEARANCE_RACE|APPEARANCE_GENDER|APPEARANCE_BODY|APPEARANCE_SKIN|APPEARANCE_EYE_COLOR|APPEARANCE_ALL_HAIR)

// Click cooldown
#define DEFAULT_LONG_COOLDOWN   16//Extra long timeout for some gear
#define DEFAULT_ATTACK_COOLDOWN 8 //Default timeout for aggressive actions
#define DEFAULT_QUICK_COOLDOWN  4

#define FAST_WEAPON_COOLDOWN -2
#define DEFAULT_WEAPON_COOLDOWN 5
#define SLOW_WEAPON_COOLDOWN 7

#define MIN_SUPPLIED_LAW_NUMBER 15
#define MAX_SUPPLIED_LAW_NUMBER 50

// Corporate alignment for the character
#define COMPANY_LOYAL 			"Loyal"
#define COMPANY_SUPPORTATIVE	"Supportive"
#define COMPANY_NEUTRAL 		"Neutral"
#define COMPANY_SKEPTICAL		"Skeptical"
#define COMPANY_OPPOSED			"Opposed"

#define COMPANY_ALIGNMENTS		list(COMPANY_LOYAL,COMPANY_SUPPORTATIVE,COMPANY_NEUTRAL,COMPANY_SKEPTICAL,COMPANY_OPPOSED)

// Defines mob sizes, used by lockers and to determine what is considered a small sized mob, etc.
#define MOB_LARGE  		100
#define MOB_MEDIUM 		20
#define MOB_SMALL 		10
#define MOB_TINY 		5
#define MOB_MINISCULE	1

// Defines mob health modifier, all mobs of a subtype will have their health modified by this. Mobs may have multiple types, attached to a max() operator.
// Mobs may have multiple types, attached to a max() operator.  this is mostly because some 'miscelaneous' mobs are grouped more generally.
// If you don't see something here that seems to fit what you want, it may very well not have a define.
#define ROACH_HEALTH_MOD         1            //all roaches other than kaisers./
#define SPIDER_HEALTH_MOD        0.5          //all spiders other than reapers./
#define TERMITE_HEALTH_MOD       0.5          //all termites./
#define CAVEMOB_HEALTH_MOD       0.70         //wurms, Sargoyle./
#define AMGOLEM_HEALTH_MOD       0.70         //ameridien golems./
#define CHURCHMOB_HEALTH_MOD     1            //Rooks and other church related mobs.
#define XENOMORPH_HEALTH_MOD     1            //Xenos, duh. includes queens.
#define REPUBLICON_HEALTH_MOD    1            //preppers bots, including seekers and drones.
#define GREYSONWEAK_HEALTH_MOD   0.8          //Weak greyson bots
#define GREYSONROBUST_HEALTH_MOD 0.70         //Strong greyson bots
#define CARP_HEALTH_MOD          1            //All space carp./
#define VOIDWOLF_HEALTH_MOD      0.75         //all voidwolves other than reavers.
#define MEGAFAUNA_HEALTH_MOD     1            //all megafauna other than levaiathans. Renders, mukwah, nightmare stalkers.
#define VOXBIRD_HEALTH_MOD       1            //all the tribal birds./
#define EXCELSIOR_HEALTH_MOD     0.7          //all the excelsior mobs, including mindslaves, and bears.
#define LEVIATHAN_HEALTH_MOD     1            //leviathans; Kaiser, Reaper, Patriarch, etc./
#define PSIMOB_HEALTH_MOD        0.5          //Deepmaints mobs other than bosses./
#define DVEY_HEALTH_MOD          0.6          //'corrupted beings', I.E Daskvey and their pets./
#define PSIBOSS_HEALTH_MOD       1            //deepmaints bosses, be careful with this one. it's generally preferable to manually tweak them because they're...yknow, uniques./




// Defines how strong the species is compared to humans. Think like strength in D&D
#define STR_VHIGH       2
#define STR_HIGH        1
#define STR_MEDIUM      0
#define STR_LOW        -1
#define STR_VLOW       -2

// Gluttony levels.
#define GLUT_TINY 1       // Eat anything tiny and smaller
#define GLUT_SMALLER 2    // Eat anything smaller than we are
#define GLUT_ANYTHING 4   // Eat anything, ever

#define GLUT_ITEM_TINY 8         // Eat items with a w_class of small or smaller
#define GLUT_ITEM_NORMAL 16      // Eat items with a w_class of normal or smaller
#define GLUT_ITEM_ANYTHING 32    // Eat any item
#define GLUT_PROJECTILE_VOMIT 64 // When vomitting, does it fly out?

// Devour speeds, returned by can_devour()
#define DEVOUR_SLOW 1
#define DEVOUR_FAST 2

#define TINT_NONE 0
#define TINT_LOW 1
#define TINT_MODERATE 2
#define TINT_HEAVY 4
#define TINT_BLIND 8

#define FLASH_PROTECTION_VULNERABLE -2
#define FLASH_PROTECTION_REDUCED -1
#define FLASH_PROTECTION_NONE 0
#define FLASH_PROTECTION_MINOR 1
#define FLASH_PROTECTION_MODERATE 2
#define FLASH_PROTECTION_MAJOR 3

#define EAR_PROTECTION_VULNERABLE -2
#define EAR_PROTECTION_REDUCED -1
#define EAR_PROTECTION_NONE 0
#define EAR_PROTECTION_MINOR 1
#define EAR_PROTECTION_MODERATE 2
#define EAR_PROTECTION_MAJOR 3

#define ANIMAL_SPAWN_DELAY 5 MINUTES
#define DRONE_SPAWN_DELAY  5 MINUTES

// Incapacitation flags, used by the mob/proc/incapacitated() proc
#define INCAPACITATION_NONE 0
#define INCAPACITATION_RESTRAINED 1
#define INCAPACITATION_BUCKLED_PARTIALLY 2
#define INCAPACITATION_BUCKLED_FULLY 4
#define INCAPACITATION_STUNNED 8
#define INCAPACITATION_FORCELYING 16 //needs a better name - represents being knocked down BUT still conscious.
#define INCAPACITATION_KNOCKOUT 32
#define INCAPACITATION_WEAKENED 64

#define INCAPACITATION_UNRESISTING (INCAPACITATION_KNOCKOUT|INCAPACITATION_STUNNED)
#define INCAPACITATION_DISRUPTED   (INCAPACITATION_UNRESISTING|INCAPACITATION_WEAKENED)
#define INCAPACITATION_KNOCKDOWN   (INCAPACITATION_KNOCKOUT|INCAPACITATION_FORCELYING)
#define INCAPACITATION_DISABLED    (INCAPACITATION_KNOCKDOWN|INCAPACITATION_STUNNED)
#define INCAPACITATION_DEFAULT     (INCAPACITATION_RESTRAINED|INCAPACITATION_BUCKLED_FULLY|INCAPACITATION_DISABLED)
#define INCAPACITATED_ROACH (INCAPACITATION_BUCKLED_FULLY | INCAPACITATION_DISABLED)
#define INCAPACITATION_ALL         (~INCAPACITATION_NONE)

// Organ processes
#define OP_EYES          "eyes"
#define OP_HEART         "heart"
#define OP_CELL          "cell"
#define OP_LUNGS         "lungs"
#define OP_LIVER         "liver"
#define OP_KIDNEYS       "kidneys"
#define OP_APPENDIX      "appendix"
#define OP_STOMACH       "stomach"
#define OP_BONE          "bone"
#define OP_MUSCLE        "muscle"
#define OP_NERVE         "nerve"
#define OP_BLOOD_VESSEL  "blood vessel"

// Extra organs
#define OP_KIDNEY_LEFT    "left kidney"
#define OP_KIDNEY_RIGHT   "right kidney"

// Carrion organ processes
#define OP_MAW       "carrion maw"
#define OP_SPINNERET "carrion spinneret"
#define OP_CHEMICALS "chemical vessel"

// Organs.
#define BP_MOUTH    "mouth"
#define BP_EYES     "eyes"
#define BP_BRAIN    "brain"
#define BP_B_CHEST  "rib cage"
#define BP_B_GROIN  "pelvis"
#define BP_B_HEAD   "skull"
#define BP_B_L_ARM  "left humerus"
#define BP_B_R_ARM  "right humerus"
#define BP_B_L_LEG  "left femur"
#define BP_B_R_LEG  "right femur"

#define BP_PSION "psionic organ"
#define BP_NANOGATE "nanogate"

// Funny Organs.
#define BP_HIVE     "hive node"
#define BP_NUTRIENT "nutrient vessel"
#define BP_ACID     "acid gland"
#define BP_EGG      "egg sac"
#define BP_RESIN    "resin spinner"
#define BP_STRATA   "neural strata"
#define BP_RESPONSE "response node"
#define BP_GBLADDER "gas bladder"
#define BP_POLYP    "polyp segment"
#define BP_ANCHOR   "anchoring ligament"
#define BP_ACETONE  "acetone reactor"

// Robo Organs.
#define BP_POSIBRAIN         "posibrain"
#define BP_VOICE             "vocal synthesiser"
#define BP_STACK             "stack"
#define BP_OPTICS            "optics"
#define BP_SYSTEM_CONTROLLER "system controller"

// Unique carrion Organs.
#define BP_SPCORE   "spider core"

//Augmetations
#define BP_AUGMENT_R_ARM        "right arm augment"
#define BP_AUGMENT_L_ARM        "left arm augment"
#define BP_AUGMENT_R_HAND       "right hand augment"
#define BP_AUGMENT_L_HAND       "left hand augment"
#define BP_AUGMENT_R_LEG        "right leg augment"
#define BP_AUGMENT_L_LEG        "left leg augment"
#define BP_AUGMENT_CHEST_ARMOR "chest armor augment"
#define BP_AUGMENT_CHEST_ACTIVE "active chest augment"
#define BP_AUGMENT_HEAD         "head augment"

//Augment flags
#define AUGMENTATION_MECHANIC 1
#define AUGMENTATION_ORGANIC  2

// Limbs.
#define BP_L_LEG  "l_leg"
#define BP_R_LEG  "r_leg"
#define BP_L_FOOT "l_foot"
#define BP_R_FOOT "r_foot"
#define BP_L_ARM  "l_arm"
#define BP_R_ARM  "r_arm"
#define BP_L_HAND "l_hand"
#define BP_R_HAND "r_hand"
#define BP_HEAD   "head"
#define BP_CHEST  "torso"
#define BP_TORSO  "torso"
#define BP_BACK   "back"
#define BP_GROIN  "groin"
#define BP_LEGS list(BP_R_LEG, BP_L_LEG)
#define BP_ARMS list(BP_R_ARM, BP_L_ARM)
#define BP_ALL_LIMBS list(BP_CHEST, BP_GROIN, BP_HEAD, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
#define BP_BY_DEPTH list(BP_HEAD, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_GROIN, BP_CHEST)
#define BP_BASE_PARTS list(BP_TORSO, BP_GROIN)

// Limb Extensions
#define BP_L_LEG_EXTRA	list(BP_L_FOOT)
#define BP_R_LEG_EXTRA	list(BP_R_FOOT)
#define BP_L_ARM_EXTRA	list(BP_L_HAND)
#define BP_R_ARM_EXTRA	list(BP_R_HAND)

// Prosthetic helpers.
#define BP_IS_ORGANIC(org)		(!QDELETED(org) && (org.nature == MODIFICATION_ORGANIC || org.nature == MODIFICATION_SUPERIOR))
#define BP_IS_ROBOTIC(org)		(!QDELETED(org) && (org.nature == MODIFICATION_SILICON || org.nature == MODIFICATION_LIFELIKE))
#define BP_IS_SLIME(org)		(!QDELETED(org) && (org.nature == MODIFICATION_SLIME))
#define BP_IS_PROSTHETIC(org)	(!QDELETED(org) && (org.nature == MODIFICATION_SILICON))
#define BP_IS_BRITTLE(org)		(!QDELETED(org) && (org.status	& ORGAN_BRITTLE))
#define BP_IS_CRYSTAL(org)		(!QDELETED(org) && (org.nature	& ORGAN_PROP_CRYSTAL))
#define BP_IS_ASSISTED(org)		(!QDELETED(org) && (org.nature == MODIFICATION_ASSISTED))
#define BP_IS_LIFELIKE(org)		(!QDELETED(org) && (org.nature == MODIFICATION_LIFELIKE))
#define BP_IS_REMOVED(org)		(!QDELETED(org) && (org.nature == MODIFICATION_REMOVED))

//Organ Properties Setters
#define BP_SET_PROSTHETIC(org) org.organ_properties |= ORGAN_PROP_PROSTHETIC;
#define BP_SET_CRYSTAL(org)    org.organ_properties |= ORGAN_PROP_CRYSTAL;

// Limb flag helpers
#define BP_IS_DEFORMED(org) (org.nature & ORGAN_FLAG_DEFORMED)

#define SYNTH_BLOOD_COLOR "#030303"
#define SYNTH_FLESH_COLOR "#575757"

#define MOB_PULL_NONE 0
#define MOB_PULL_SMALLER 1
#define MOB_PULL_SAME 2
#define MOB_PULL_LARGER 3

//carbon taste sensitivity defines, used in mob/living/carbon/proc/ingest
#define TASTE_HYPERSENSITIVE 3 //anything below 5%
#define TASTE_SENSITIVE 2 //anything below 7%
#define TASTE_NORMAL 1 //anything below 15%
#define TASTE_DULL 0.5 //anything below 30%
#define TASTE_NUMB 0.1 //anything below 150%

//Used by show_message() and emotes
#define VISIBLE_MESSAGE 1
#define AUDIBLE_MESSAGE 2

//used for getting species temp values
#define COLD_LEVEL_1 -1
#define COLD_LEVEL_2 -2
#define COLD_LEVEL_3 -3
#define HEAT_LEVEL_1 1
#define HEAT_LEVEL_2 2
#define HEAT_LEVEL_3 3

//Synthetic human temperature vals
#define SYNTH_COLD_LEVEL_1 50
#define SYNTH_COLD_LEVEL_2 -1
#define SYNTH_COLD_LEVEL_3 -1
#define SYNTH_HEAT_LEVEL_1 500
#define SYNTH_HEAT_LEVEL_2 1000
#define SYNTH_HEAT_LEVEL_3 2000

#define CORPSE_CAN_REENTER 1
#define CORPSE_CAN_REENTER_AND_RESPAWN 2

#define SURGERY_CLOSED 0
#define SURGERY_OPEN 1
#define SURGERY_RETRACTED 2
#define SURGERY_ENCASED 3

#define SPECIES_BLOOD_DEFAULT 560

//Used in mob/proc/get_input
#define MOB_INPUT_TEXT "text"
#define MOB_INPUT_MESSAGE "message"
#define MOB_INPUT_NUM "num"

#define FACTION_NEUTRAL "neutral"
#define FACTION_EXCELSIOR "excelsior"
#define FACTION_BORERS "borers"
#define FACTION_XENOMORPHS "xenomorphs"
#define FACTION_SERBS	"serbians"

#define DEXTERITY_NONE            0
#define DEXTERITY_SIMPLE_MACHINES 1
#define DEXTERITY_KEYBOARDS       2
#define DEXTERITY_TOUCHSCREENS    3
#define DEXTERITY_GRIP            4
#define DEXTERITY_WEAPONS         5
#define DEXTERITY_COMPLEX_TOOLS   6
#define DEXTERITY_FULL            7

// used in /mob/living/carbon/human/can_inject, and by various callers of that proc
#define CAN_INJECT 1
#define INJECTION_PORT 2
#define INJECTION_PORT_DELAY 3 SECONDS // used by injectors to apply delay due to searching for a port on the injectee's suit

// Simple animal icon state flags.
#define MOB_ICON_HAS_LIVING_STATE BITFLAG(0)
#define MOB_ICON_HAS_DEAD_STATE   BITFLAG(1)
#define MOB_ICON_HAS_REST_STATE   BITFLAG(2)
#define MOB_ICON_HAS_SLEEP_STATE  BITFLAG(3)
#define MOB_ICON_HAS_GIB_STATE    BITFLAG(4)

// Termite defines

#define TERMITE_HEALTH_LOW 20 * TERMITE_HEALTH_MOD
#define TERMITE_HEALTH_MED 45 * TERMITE_HEALTH_MOD
#define TERMITE_HEALTH_HIGH 70 * TERMITE_HEALTH_MOD
#define TERMITE_HEALTH_ULTRA 100 * TERMITE_HEALTH_MOD

#define TERMITE_DMG_LOW 15
#define TERMITE_DMG_MED 25
#define TERMITE_DMG_HIGH 35
#define TERMITE_DMG_ULTRA 50

#define TERMITE_SPEED_SLUG 9
#define TERMITE_SPEED_LOW 7
#define TERMITE_SPEED_MED 5
#define TERMITE_SPEED_HIGH 3

// Target prioritization defines.
#define RANDOM 		0
#define CLOSEST 	1
#define FURTHEST 	2

// Grab levels.
#define GRAB_PASSIVE    1
#define GRAB_AGGRESSIVE 2
#define GRAB_PRENECK 2.5
#define GRAB_NECK       3
#define GRAB_UPGRADING  4
#define GRAB_KILL       5

#define ALL_TYPE 1
#define MELEE_TYPE 2
#define RANGED_TYPE 3
#define RANGED_RAPID_TYPE 4

// Superior mob attack reaction flags
#define ALWAYS_SEE 1
#define GUESS_LOCATION_WITH_AURA 2
#define GUESS_LOCATION_WITH_LINE 3
#define GUESS_LOCATION_WITH_END_OF_LINE 4

// Superior mob attack ranged retaliation modes
#define NO_RETALIATION 0
#define ALWAYS_ATTACK_AGGRESSOR (1<<1)
#define ATTACK_RANDOM_AREA_IN_LINE (1<<2)
#define ATTACK_RANDOM_AREA_IN_AURA (1<<3)
#define APPROACH_ATTACKER (1<<4)

// Defines the argument used for get_mobs_and_objs_in_view_fast
#define GHOSTS_ALL_HEAR 1
#define ONLY_GHOSTS_IN_VIEW 0

// Flags for mob types by Nanako. Primarily used for distinguishing organic from synthetic mobs
#define CLASSIFICATION_ORGANIC      1	// Almost any creature under /mob/living/carbon and most simple animals
#define CLASSIFICATION_SYNTHETIC    2	// Everything under /mob/living/silicon, plus hivebots and similar simple mobs
#define CLASSIFICATION_HUMANOID     4	// Humans and humanoid player characters
#define CLASSIFICATION_WEIRD        8	// Slimes, constructs, demons, and other creatures of a magical or bluespace nature.
#define CLASSIFICATION_INCORPOREAL 16 // Mobs that don't really have any physical form to them. Ghosts mostly

#define MOB_BASE_MAX_HUNGER 400

//Time of Death constants
//Used with a list in preference datums to track times of death
#define	CREW 	"crew"//Used for crewmembers, AI, cyborgs, nymphs, antags
#define ANIMAL	"animal"//Used for mice and any other simple animals
#define MINISYNTH	"minisynth"//Used for drones and pAIs

#define CRYOPOD_SPAWN_BONUS	15 //Going to sleep in a cryopod takes this much off your respawn time in minutes
#define CRYOPOD_SPAWN_BONUS_DESC	"15 minutes"	//Tells players how long they have until respawn.

#define MOVED_DROP 1

//Health
#define HEALTH_THRESHOLD_SOFTCRIT 0
#define HEALTH_THRESHOLD_CRIT -50
#define HEALTH_THRESHOLD_DEAD -100

#define ORGAN_HEALTH_MULTIPLIER 1
#define ORGAN_REGENERATION_MULTIPLIER 0.2
#define WOUND_BLEED_MULTIPLIER 0.05 //Bleeding wounds drip damage*this units of blood per process tick - increased from 0.015 to make bleeding more dangerous
#define OPEN_ORGAN_BLEED_AMOUNT 0.5 //Wounds with open, unclamped incisions bleed this many units of blood per process tick - increased from 0.25

#define HEAT_MOBIGNITE_THRESHOLD 530 //minimum amount of heat an object needs to ignite a mob when it hits the mob


//------------------------------ Stuff from Vore which may need Porting ------------------------------//

// Used to seperate simple animals by ""intelligence"".
#define SA_PLANT	1
#define SA_ANIMAL	2
#define SA_ROBOTIC	3
#define SA_HUMANOID	4

// For slime commanding.  Higher numbers allow for more actions.
#define SLIME_COMMAND_OBEY		1 // When disciplined.
#define SLIME_COMMAND_FACTION	2 // When in the same 'faction'.
#define SLIME_COMMAND_FRIEND	3 // When befriended with a slime friendship agent.

//Vision flags, for dealing with plane visibility
#define VIS_FULLBRIGHT		1
#define VIS_LIGHTING		2
#define VIS_GHOSTS			3
#define VIS_AI_EYE			4

#define VIS_CH_STATUS		5
#define VIS_CH_HEALTH		6
#define VIS_CH_LIFE			7
#define VIS_CH_ID			8
#define VIS_CH_WANTED		9
#define VIS_CH_IMPLOYAL		10
#define VIS_CH_IMPTRACK		11
#define VIS_CH_IMPCHEM		12
#define VIS_CH_SPECIAL		13
#define VIS_CH_STATUS_OOC	14

#define VIS_ADMIN1			15
#define VIS_ADMIN2			16
#define VIS_ADMIN3			17

#define VIS_MESONS			18

#define VIS_TURFS			19
#define VIS_OBJS			20
#define VIS_MOBS			21

// Sojourn changes

#define VIS_CH_STATUS_R		22
#define VIS_CH_HEALTH_VR	23
#define VIS_CH_BACKUP		24
#define VIS_CH_VANTAG		25

#define VIS_AUGMENTED		26

#define VIS_COUNT			26 //Must be highest number from above.

//Some mob icon layering defines
#define BODY_LAYER		-100

// Clothing flags, organized in roughly top-bottom
#define EXAMINE_SKIPHELMET			0x0001
#define EXAMINE_SKIPEARS			0x0002
#define EXAMINE_SKIPEYEWEAR			0x0004
#define EXAMINE_SKIPMASK			0x0008
#define EXAMINE_SKIPJUMPSUIT		0x0010
#define EXAMINE_SKIPTIE				0x0020
#define EXAMINE_SKIPHOLSTER			0x0040
#define EXAMINE_SKIPSUITSTORAGE		0x0080
#define EXAMINE_SKIPBACKPACK		0x0100
#define EXAMINE_SKIPGLOVES			0x0200
#define EXAMINE_SKIPBELT			0x0400
#define EXAMINE_SKIPSHOES			0x0800

// Body flags
#define EXAMINE_SKIPHEAD			0x0001
#define EXAMINE_SKIPEYES			0x0002
#define EXAMINE_SKIPFACE			0x0004
#define EXAMINE_SKIPBODY			0x0008
#define EXAMINE_SKIPGROIN			0x0010
#define EXAMINE_SKIPARMS			0x0020
#define EXAMINE_SKIPHANDS			0x0040
#define EXAMINE_SKIPLEGS			0x0080
#define EXAMINE_SKIPFEET			0x0100

// Sojourn Additions End

#define RANDOM_BLOOD_TYPE pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+")

#define is_dead(M) M.stat == DEAD
