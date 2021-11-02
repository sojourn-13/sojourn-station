//All mutations:
#define MUTATION_COPY /datum/genetics/mutation/copy_mob
#define MUTATION_COW_SKIN /datum/genetics/mutation/cow_skin
#define MUTATION_IMBECILE /datum/genetics/mutation/imbecile
#define MUTATION_MOO /datum/genetics/mutation/cow_moo

//Exclusive Mutation types:
#define MUT_TYPE_NONE 0 //not an exclusive mutation type
#define MUT_TYPE_SKIN 1 //An exclusive mutation type for skin.

//Types of Mutation recipes:
#define MUT_TYPE_COMBINATION 1
#define MUT_TYPE_IRRADIATON 2

//Mutation flags (BIG TODO, these don't work yet)
//These values are held by the flags variable in the /datum/genetics/mutation class.
//They handle certain things happening dynamically when a mutation is added (IE: Destroying an abiotic part messily)
#define MUT_FORCE_REQ 0x1 //If the target doesn't have requirements, it will force out abiotic parts.
#define MUT_PURE_BIO_REQ 0x2 //Target needs to be entirely biotic and have no abiotic augments.
#define MUT_FULL_BIO_REQ 0x4 //Target must only have biotic body parts (Not checking internals)
#define MUT_BIO_ARM_REQ 0x8 //Target needs biotic arms
#define MUT_BIO_LEG_REQ 0x16  //Target needs biotic legs
#define MUT_BIO_UPPER_BODY_REQ 0x32  //Target needs biotic upper body
#define MUT_BIO_LOWER_BODY_REQ 0x64  //Target needs biotic lower body
#define MUT_BIO_HEAD_REQ 0x128 //Target needs a biotic head.

//TODO: Add more for all organs