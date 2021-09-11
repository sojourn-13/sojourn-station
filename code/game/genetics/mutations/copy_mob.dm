//Produce a copy of the mob this gene came from, with 

/datum/genetics/mutation/copy_mob
    key = "MUTATION_COPY"
    embryo_descriptions = list(/datum/genetics/embryo_state/copy_mob_1)
    active = TRUE
    cloneGene = TRUE
    New()
        name = "Genetic Copy of [source_mob.name]"


/datum/genetics/embryo_state/copy_mob_1
    desc = "The embryo resembles its parent closely."
    active_stage = 2 //What stage of development the descriptor becomes active.

/datum/genetics/mutation/proc/onClone()
    //TODO: Spawn perfect copy in cloner.

/datum/genetics/mutation/proc/onIrradiate()
    //TODO: Create a switch statement of different mob types 