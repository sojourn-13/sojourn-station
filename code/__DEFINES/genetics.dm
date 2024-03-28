#define MUTATION_COPY /datum/genetics/mutation/copy_mob
#define MUTATION_MKNEWAIFUHAIR /datum/genetics/mutation/bald
#define MUTATION_COW_SKIN /datum/genetics/mutation/cow_skin
#define MUTATION_IMBECILE /datum/genetics/mutation/imbecile
#define MUTATION_GIGANTISM /datum/genetics/mutation/gigantism
#define MUTATION_DWARFISM /datum/genetics/mutation/dwarfism
#define MUTATION_RAND_UNSTABLE /datum/genetics/mutation/rand_unstable
#define MUTATION_MOO /datum/genetics/mutation/cow_moo
#define MUTATION_EPILEPSY /datum/genetics/mutation/disability/epilepsy
#define MUTATION_COUGHING /datum/genetics/mutation/disability/cough
#define MUTATION_CLUMSY /datum/genetics/mutation/disability/clumsy
#define MUTATION_TOURETTES /datum/genetics/mutation/disability/tourettes
#define MUTATION_NERVOUSNESS /datum/genetics/mutation/disability/nervousness
#define MUTATION_BLINDNESS /datum/genetics/mutation/disability/blindness
#define MUTATION_DEAF /datum/genetics/mutation/disability/deaf
#define MUTATION_NEARSIGHTED /datum/genetics/mutation/disability/nearsighted
#define MUTATION_UNBALANCED /datum/genetics/mutation/unbalanced
#define MUTATION_EMP /datum/genetics/mutation/emp
#define MUTATION_ROACH_BLOOD /datum/genetics/mutation/roachblood
#define MUTATION_GOLD_ROACH /datum/genetics/mutation/gold_roach
#define MUTATION_CHOC_MILK /datum/genetics/mutation/milk_c
#define MUTATION_PROT_MILK /datum/genetics/mutation/milk_p
#define MUTATION_ROBUST_MILK /datum/genetics/mutation/milk_r
#define MUTATION_NO_PAIN /datum/genetics/mutation/painless
#define MUTATION_ROACH_FRIEND /datum/genetics/mutation/roach_friend
#define MUTATION_SPIDER_FRIEND /datum/genetics/mutation/spider_friend
#define MUTATION_SPROACHDER_FRIEND /datum/genetics/mutation/sproachder_friend
#define MUTATION_PSN_BREATH /datum/genetics/mutation/psn_breath
#define MUTATION_CLOAKING /datum/genetics/mutation/cloaking
#define MUTATION_GREATER_CLOAKING /datum/genetics/mutation/greater_cloaking
#define MUTATION_SAC /datum/genetics/mutation/sac_mutation
#define MUTATION_G_SAC /datum/genetics/mutation/sac_mutation/greater
#define MUTATION_HEART /datum/genetics/mutation/sac_contents/heart
#define MUTATION_B_HEART /datum/genetics/mutation/sac_contents/b_heart
#define MUTATION_LUNG /datum/genetics/mutation/sac_contents/lungs
#define MUTATION_G_LUNG /datum/genetics/mutation/sac_contents/g_lungs
#define MUTATION_LIVER /datum/genetics/mutation/sac_contents/liver
#define MUTATION_G_LIVER /datum/genetics/mutation/sac_contents/g_liver
#define MUTATION_BLOOD_VESSEL /datum/genetics/mutation/sac_contents/blood_vessels
#define MUTATION_E_BLOOD_VESSEL /datum/genetics/mutation/sac_contents/e_blood_vessels
#define MUTATION_MUSCLES /datum/genetics/mutation/sac_contents/muscles
#define MUTATION_S_MUSCLES /datum/genetics/mutation/sac_contents/s_muscles
#define MUTATION_NERVES /datum/genetics/mutation/sac_contents/nerves
#define MUTATION_S_NERVES /datum/genetics/mutation/sac_contents/s_nerves
#define MUTATION_EYES /datum/genetics/mutation/sac_contents/eyes
#define MUTATION_MARQUA_EYES /datum/genetics/mutation/sac_contents/marqua_eyes
#define MUTATION_SLIME_BONE /datum/genetics/mutation/sac_contents/slime_bone
#define MUTATION_HYPERION /datum/genetics/mutation/hyperion
#define MUTATION_THICK_FUR /datum/genetics/mutation/thick_fur
#define MUTATION_BAROTRAUMA /datum/genetics/mutation/barotrauma
#define MUTATION_HONK /datum/genetics/mutation/honk
#define MUTATION_BOTTOMLESS_BELLY /datum/genetics/mutation/bottomless_belly
#define MUTATION_TOXIN_RESISTANCE /datum/genetics/mutation/toxin_resistance
#define MUTATION_ECHOLOCATION /datum/genetics/mutation/echolocation
#define MUTATION_SCREAMING /datum/genetics/mutation/screaming
#define MUTATION_CAT_EYES /datum/genetics/mutation/cat_eyes
#define MUTATION_REGENERATION /datum/genetics/mutation/hyperion
#define MUTATION_RAD_PROTECTION /datum/genetics/mutation/rad_protection
//Blood Increasers
#define MUTATION_BLOOD_BANK /datum/genetics/mutation/blood_bank
#define MUTATION_BLOOD_RIVER /datum/genetics/mutation/blood_river
#define MUTATION_BLOOD_LAKE /datum/genetics/mutation/blood_lake
#define MUTATION_BLOOD_SEA /datum/genetics/mutation/blood_sea
#define MUTATION_BLOOD_TEMPLE /datum/genetics/mutation/blood_temple
#define MUTATION_VAMPIRE /datum/genetics/mutation/vampire

#define MUTATION_SEASONED_MIND /datum/genetics/mutation/seasoned_mind
#define MUTATION_SHOCK_LESS /datum/genetics/mutation/shock_less
#define MUTATION_BOMB_RESIST /datum/genetics/mutation/bomb_resist
#define MUTATION_TERMITE_FRIEND /datum/genetics/mutation/termite_friend
#define MUTATION_WURM_CRY /datum/genetics/mutation/wurm_cry
#define MUTATION_SPARK_BREATH /datum/genetics/mutation/spark_breath
#define MUTATION_FLAME_RETARDANT /datum/genetics/mutation/flame_retardant
#define MUTATION_PHASE /datum/genetics/mutation/phasing
#define MUTATION_NO_PRINTS /datum/genetics/mutation/disability/noprints
#define MUTATION_NO_BREATHE /datum/genetics/mutation/disability/nobreathe
#define MUTATION_HULK /datum/genetics/mutation/disability/hulk
#define MUTATION_FRIENDLY /datum/genetics/mutation/friendly
//^^^ All mutations!


//Exclusive Mutation types:
#define MUT_TYPE_NONE 0 //not an exclusive mutation type
#define MUT_TYPE_SKIN 1 //An exclusive mutation type for skin.
#define MUT_TYPE_FACTION 2
#define MUT_TYPE_EYES 3 //An exclusive mutation type for eyes.
#define MUT_TYPE_MOUTH 4 //Exclusive for breaths, spits and crys.

//Types of Mutation recipes:
#define MUT_TYPE_COMBINATION 1
#define MUT_TYPE_IRRADIATON 2

//Mutation flags (BIG TODO, these don't work yet)
//These values are held by the flags variable in the /datum/genetics/mutation class.
//They handle certain things happening dynamically when a mutation is added (IE: Destroying an abiotic part messily)
#define MUT_FORCE_REQ 0x1 //If the target doesn't have requirements, it will force out abiotic parts.
#define MUT_PURE_BIO_REQ 0x2 //Target needs to have biotic internal organs.
#define MUT_BIO_ARM_REQ 0x4 //Target needs biotic arms
#define MUT_BIO_LEG_REQ 0x8  //Target needs biotic legs
#define MUT_BIO_UPPER_BODY_REQ 0x16  //Target needs biotic upper body
#define MUT_BIO_LOWER_BODY_REQ 0x32  //Target needs biotic lower body
#define MUT_BIO_HEAD_REQ 0x64 //Target needs a biotic head.
#define MUT_FULL_BIO_REQ 0x124 //Target must only have biotic body parts (Not checking internals)

//TODO: Add more for all organs

//Cloning difficulty defines. Adjusts how much protein is required to create one creature
#define CLONE_ITEM 0.5
#define CLONE_EASY 0.7
#define CLONE_MEDIUM 1
#define CLONE_HARD 1.2

//mutations vars we add to the var/list/mutations list. We start with 11 because the base ends at 10.
//refer to code\__DEFINES\dna.dm for the other states in this list.
//I use these instead of directly checking the mutations datum in some cases because it is quicker.
#define ROACH_BLOOD          11
#define CLOAKING             12
#define SHOCK_LESS           13
#define VAMPIRE              14


//Thresholds for mutagenic Destabilization
#define DESTABILIZE_LEVEL_WAS 110 //Threshold for turning into the wasonce.
#define DESTABILIZE_LEVEL_CLONE_DAMAGE 100 //Threshold for periodic clone_damage
#define DESTABILIZE_LEVEL_BASE 100 //The lowest destabilization level for activating processing

#define DESTABILIZE_CHECK_INTERVAL 10 SECONDS //How often
