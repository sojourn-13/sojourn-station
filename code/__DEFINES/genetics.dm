//All mutations:
#define MUTATION_COPY /datum/genetics/mutation/copy_mob
#define MUTATION_COW_SKIN /datum/genetics/mutation/cow_skin
#define MUTATION_IMBECILE /datum/genetics/mutation/imbecile
#define MUTATION_GIGANTISM /datum/genetics/mutation/gigantism
#define MUTATION_RAND_UNSTABLE /datum/genetics/mutation/rand_unstable
#define MUTATION_MOO /datum/genetics/mutation/cow_moo
#define MUTATION_EPILEPSY /datum/genetics/mutation/disability/epilepsy
#define MUTATION_COUGHING /datum/genetics/mutation/disability/cough
#define MUTATION_CLUMSY /datum/genetics/mutation/disability/clumsy
#define MUTATION_TOURETTES /datum/genetics/mutation/disability/tourettes
#define MUTATION_NERVOUSNESS /datum/genetics/mutation/disability/nervousness
#define MUTATION_BLINDNESS /datum/genetics/mutation/disability/nervousness
#define MUTATION_DEAF /datum/genetics/mutation/disability/deaf
#define MUTATION_NEARSIGHTED /datum/genetics/mutation/disability/nearsighted
#define MUTATION_EMP /datum/genetics/mutation/emp
#define MUTATION_ROACH_BLOOD /datum/genetics/mutation/roachblood
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
//Exclusive Mutation types:
#define MUT_TYPE_NONE 0 //not an exclusive mutation type
#define MUT_TYPE_SKIN 1 //An exclusive mutation type for skin.
#define MUT_TYPE_FACTION 2

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
#define CLONE_EASY 0.7
#define CLONE_MEDIUM 1
#define CLONE_HARD 1.2

//mutations vars we add to the var/list/mutations list. We start with 11 because the base ends at 10.
//refer to code\__DEFINES\dna.dm for the other states in this list.
//I use these instead of directly checking the mutations datum in some cases because it is quicker.
#define ROACH_BLOOD          11
#define CLOAKING          	 12