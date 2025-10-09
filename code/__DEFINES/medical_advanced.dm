// Advanced Medical System Constants and Definitions

// Infection levels
#define INFECTION_LEVEL_ONE   100
#define INFECTION_LEVEL_TWO   500
#define INFECTION_LEVEL_THREE 1000

// Blood volume states
#define BLOOD_VOLUME_OKAY     0.85
#define BLOOD_VOLUME_BAD      0.70
#define BLOOD_VOLUME_SURVIVE  0.40

// Chemical effects - Note: CE_ANTIBIOTIC is defined in chemistry.dm
// CE_NOPULSE is defined in mobs.dm
#define CE_BREATHLOSS   "breathloss"

// Pulse constants are defined in mobs.dm

// Organ status flags for new system
#define ORGAN_ASSISTED  0x40  // Organ is being assisted
#define ORGAN_ROBOT     0x80  // Fully artificial organ

// Font sizing for important messages
#define FONT_HUGE(text) "<font size='4'><b>[text]</b></font>"

// Injury types for wounds
#define INJURY_TYPE_BLUNT "blunt"
#define INJURY_TYPE_SHARP "sharp"
#define INJURY_TYPE_EDGE  "edge"
#define INJURY_TYPE_CUT   "cut"
#define INJURY_TYPE_PIERCE "pierce"

// Organ status flags
#define ORGAN_ARTERY_CUT  0x100

// Breathing difficulty levels
#define BREATH_LEVEL_NONE    0
#define BREATH_LEVEL_SLIGHT  1
#define BREATH_LEVEL_NOISY   2
#define BREATH_LEVEL_FAILING 3
