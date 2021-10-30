// /mob/var/stat things.
#define CONSCIOUS   0
#define UNCONSCIOUS 1
#define DEAD        2

// Bitflags defining which status effects could be or are inflicted on a mob.
#define CANSTUN     0x1
#define CANWEAKEN   0x2
#define CANPARALYSE 0x4
#define CANPUSH     0x8
#define LEAPING     0x10
#define REBUILDING_ORGANS     0x20
#define PASSEMOTES  0x40    // Mob has a cortical borer or holders inside of it that need to see emotes.
#define BLEEDOUT    0x80
#define GODMODE     0x1000
#define FAKEDEATH   0x2000  // Replaces stuff like carrion.carrion_fakedeath.
#define DISFIGURED  0x4000  // Set but never checked. Remove this sometime and replace occurences with the appropriate organ code
#define XENO_HOST   0x8000  // Tracks whether we're gonna be a baby alien's mummy.

// Grab levels.
#define GRAB_PASSIVE    1
#define GRAB_AGGRESSIVE 2
#define GRAB_NECK       3
#define GRAB_UPGRADING  4
#define GRAB_KILL       5

#define BORGMESON 0x1
#define BORGTHERM 0x2
#define BORGXRAY  0x4
#define BORGMATERIAL  8

#define HOSTILE_STANCE_IDLE      1
#define HOSTILE_STANCE_ALERT     2
#define HOSTILE_STANCE_ATTACK    3
#define HOSTILE_STANCE_ATTACKING 4
#define HOSTILE_STANCE_TIRED     5

#define LEFT  1
#define RIGHT 2

// Pulse levels, very simplified.
#define PULSE_NONE    0 // So !M.pulse checks would be possible.
#define PULSE_SLOW    1 // <60     bpm
#define PULSE_NORM    2 //  60-90  bpm
#define PULSE_FAST    3 //  90-120 bpm
#define PULSE_2FAST   4 // >120    bpm
#define PULSE_THREADY 5 // Occurs during hypovolemic shock
#define GETPULSE_HAND 0 // Less accurate. (hand)
#define GETPULSE_TOOL 1 // More accurate. (med scanner, sleeper, etc.)

//intent flags, why wasn't this done the first time?
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
#define APPEARANCE_UPDATE_DNA  0x1
#define APPEARANCE_RACE       (0x2|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_GENDER     (0x4|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_SKIN        0x8
#define APPEARANCE_HAIR        0x10
#define APPEARANCE_HAIR_COLOR  0x20
#define APPEARANCE_FACIAL_HAIR 0x40
#define APPEARANCE_FACIAL_HAIR_COLOR 0x80
#define APPEARANCE_EYE_COLOR 	0x100
#define APPEARANCE_BUILD	 	0x200
#define APPEARANCE_NAME	 		0x400
#define APPEARANCE_ALL_HAIR (APPEARANCE_HAIR|APPEARANCE_HAIR_COLOR|APPEARANCE_FACIAL_HAIR|APPEARANCE_FACIAL_HAIR_COLOR)
#define APPEARANCE_ALL       0xFFFF

// Click cooldown
#define DEFAULT_ATTACK_COOLDOWN 8 //Default timeout for aggressive actions
#define DEFAULT_QUICK_COOLDOWN  4


#define MIN_SUPPLIED_LAW_NUMBER 15
#define MAX_SUPPLIED_LAW_NUMBER 50

// NT's alignment towards the character
#define COMPANY_LOYAL 			"Loyal"
#define COMPANY_SUPPORTATIVE	"Supportive"
#define COMPANY_NEUTRAL 		"Neutral"
#define COMPANY_SKEPTICAL		"Skeptical"
#define COMPANY_OPPOSED			"Opposed"

#define COMPANY_ALIGNMENTS		list(COMPANY_LOYAL, COMPANY_SUPPORTATIVE, COMPANY_NEUTRAL, COMPANY_SKEPTICAL, COMPANY_OPPOSED)


// Defines the argument used for get_mobs_and_objs_in_view_fast
#define GHOSTS_ALL_HEAR 1
#define ONLY_GHOSTS_IN_VIEW 0

// Defines mob sizes, used by lockers and to determine what is considered a small sized mob, etc.
#define MOB_LARGE  		100
#define MOB_MEDIUM 		20
#define MOB_SMALL 		10
#define MOB_TINY 		5
#define MOB_MINISCULE	1

// Gluttony levels.
#define GLUT_TINY 1       // Eat anything tiny and smaller
#define GLUT_SMALLER 2    // Eat anything smaller than we are
#define GLUT_ANYTHING 3   // Eat anything, ever



// Flags for mob types by Nanako. Primarily used for distinguishing organic from synthetic mobs
#define CLASSIFICATION_ORGANIC      1	// Almost any creature under /mob/living/carbon and most simple animals
#define CLASSIFICATION_SYNTHETIC    2	// Everything under /mob/living/silicon, plus hivebots and similar simple mobs
#define CLASSIFICATION_HUMANOID     4	// Humans and humanoid player characters
#define CLASSIFICATION_WEIRD        8	// Slimes, constructs, demons, and other creatures of a magical or bluespace nature.
#define CLASSIFICATION_INCORPOREAL 16 // Mobs that don't really have any physical form to them. Ghosts mostly


#define TINT_NONE 0
#define TINT_MODERATE 1
#define TINT_HEAVY 2
#define TINT_BLIND 3

#define FLASH_PROTECTION_REDUCED -1
#define FLASH_PROTECTION_NONE 0
#define FLASH_PROTECTION_MODERATE 1
#define FLASH_PROTECTION_MAJOR 2

#define MOB_BASE_MAX_HUNGER 400

//Time of Death constants
//Used with a list in preference datums to track times of death
#define	CREW 	"crew"//Used for crewmembers, AI, cyborgs, nymphs, antags
#define ANIMAL	"animal"//Used for mice and any other simple animals
#define MINISYNTH	"minisynth"//Used for drones and pAIs

#define ANIMAL_SPAWN_DELAY 5 MINUTES
#define DRONE_SPAWN_DELAY  10 MINUTES

#define CRYOPOD_SPAWN_BONUS	20 MINUTES//Going to sleep in a cryopod takes this much off your respawn time in minutes
#define CRYOPOD_SPAWN_BONUS_DESC	"20 minutes"	//Tells players how long they have until respawn.


// Incapacitation flags, used by the mob/proc/incapacitated() proc
#define INCAPACITATION_NONE 0
#define INCAPACITATION_RESTRAINED 1
#define INCAPACITATION_BUCKLED_PARTIALLY 2
#define INCAPACITATION_BUCKLED_FULLY 4
#define INCAPACITATION_STUNNED 8
#define INCAPACITATION_FORCELYING 16 //needs a better name - represents being knocked down BUT still conscious.
#define INCAPACITATION_UNCONSCIOUS 32

#define INCAPACITATION_KNOCKDOWN (INCAPACITATION_UNCONSCIOUS|INCAPACITATION_FORCELYING)
#define INCAPACITATION_DISABLED (INCAPACITATION_KNOCKDOWN|INCAPACITATION_STUNNED)
#define INCAPACITATION_DEFAULT (INCAPACITATION_RESTRAINED|INCAPACITATION_BUCKLED_FULLY|INCAPACITATION_DISABLED)
#define INCAPACITATION_ALL (~INCAPACITATION_NONE)


#define MOB_PULL_NONE 0
#define MOB_PULL_SMALLER 1
#define MOB_PULL_SAME 2
#define MOB_PULL_LARGER 3

#define MOVED_DROP 1

//carbon taste sensitivity defines, used in mob/living/carbon/proc/ingest
#define TASTE_HYPERSENSITIVE 3 //anything below 5%
#define TASTE_SENSITIVE 2 //anything below 7%
#define TASTE_NORMAL 1 //anything below 15%
#define TASTE_DULL 0.5 //anything below 30%
#define TASTE_NUMB 0.1 //anything below 150%

//Health
#define HEALTH_THRESHOLD_SOFTCRIT 0
#define HEALTH_THRESHOLD_CRIT -50
#define HEALTH_THRESHOLD_DEAD -100

#define ORGAN_HEALTH_MULTIPLIER 1
#define ORGAN_REGENERATION_MULTIPLIER 0.2
#define WOUND_BLEED_MULTIPLIER 0.01 //Bleeding wounds drip damage*this units of blood per process tick
#define OPEN_ORGAN_BLEED_AMOUNT 0.5 //Wounds with open, unclamped incisions bleed this many units of blood per process tick

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

//Surgery operation defines
#define CAN_OPERATE_ALL 1 //All possible surgery types are available
#define CAN_OPERATE_STANDING -1 //Only limited surgery types are available (gouging out shrapnel, for instance)

// Sojourn Additions End

#define RANDOM_BLOOD_TYPE pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+")
