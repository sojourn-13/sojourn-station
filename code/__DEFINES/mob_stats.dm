#define STAT_VALUE_DEFAULT         0
#define STAT_VALUE_DEFAULT_MAXIMUM 150

#define STAT_MEC			"Mechanical"
#define STAT_COG			"Cognition"
#define STAT_BIO			"Biology"
#define STAT_ROB			"Robustness"
#define STAT_TGH			"Toughness"
#define STAT_VIG			"Vigilance"
#define STAT_VIV			"Vivification"
#define STAT_ANA			"Anatomy"

#define ALL_STATS	list(STAT_MEC,STAT_COG,STAT_BIO,STAT_ROB,STAT_TGH,STAT_VIG,STAT_VIV,STAT_ANA)
#define ALL_STATS_FOR_LEVEL_UP	list(STAT_MEC,STAT_COG,STAT_BIO,STAT_ROB,STAT_TGH,STAT_VIG,STAT_VIV) //Cant naturally gain more ana
#define ALL_STATS_FOR_DEFIBS	list(STAT_MEC,STAT_COG,STAT_BIO,STAT_ROB,STAT_TGH,STAT_VIG) //Used for defibs (no ana/viv)
#define ALL_STATS_TO_IMPRINT list(STAT_MEC,STAT_COG,STAT_BIO,STAT_ROB,STAT_VIG) //So that people stop memeing the imprinter

#define STAT_LEVEL_NONE       0
#define STAT_LEVEL_NOVICE     7
#define STAT_LEVEL_BASIC      15
#define STAT_LEVEL_ADEPT      25
#define STAT_LEVEL_EXPERT     40
#define STAT_LEVEL_PROF       60
#define STAT_LEVEL_MASTER     80
#define STAT_LEVEL_HIGHER     100
#define STAT_LEVEL_COSMIC     120
#define STAT_LEVEL_UNIVERSAL  150
#define STAT_LEVEL_BYOND      200

#define STAT_LEVEL_MIN      0 // Min stat value selectable
#define STAT_LEVEL_MAX      60 // Max stat value selectable

/// Bitflag for shared perk abilities
#define PERK_SHARED_SEE_REAGENTS 0x1
#define PERK_SHARED_SEE_COMMON_REAGENTS 0x2
#define PERK_SHARED_SEE_ILLEGAL_REAGENTS 0x3

