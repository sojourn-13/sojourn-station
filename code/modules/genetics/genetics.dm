/**
* DNA 3: The Phantom Spaghette
*
* @author Hex <Discord: Hex#4569>
* 
* Mutations are stored as a param list string so mobs can store DNA as a string when inactive. 
* This should keep every mob from being 100% more complex just because they have genetic data in them.
* 
* Mutations are either ACTIVE or INACTIVE. Active genes are processed and activated, Inactive genes do nothing and are stored.
* 
* If no mutations in a mob has the onClone value, it will be automatically generated, so genetics can be used to clone just about anything.
* 
* Example:
* mutations_inactive="1=MUTATION_COW_SKIN;2=MUTATION_IMBECILE;3=MUTATION_MKNEWAIFUHAIR"
**/

/datum/genetics/genetics_holder
	var/mob/living/donator //Where the genes came from.
	
    var/list/mutation_pool = list() //Each gene held by the creature. Uses /datum/genetics/mutation.
    
    var/total_instability = 0 //How much instability is present in the gene pool.
	
    var/initialized = FALSE //Whether or not the held genes have been applied to the holder.

//Build a holder based on a mob source
/datum/genetics/genetics_holder/New(mob/living/source)    
    ..()

    /var/tmp/clone_mutation_found = FALSE

    //Add inactive mutations as fully realized objects
    if(source.latent_mutations)
        donator = source
        /var/tmp/latent_mutations = params2list(donator.latent_mutations)
        
        for(source_mutation_index in latent_mutations)
            var/tmp/mutation = new mutations_inactive_list[source_mutation_index](donator)
            mutation.implanted = FALSE
            mutation.active = pick(TRUE, FALSE)
            if(mutation.active)
                total_instability += mutation.instability

            if(mutation.key == "MUTATION_COPY")
                clone_mutation_found = TRUE
            mutation_pool += mutation

    //Add active mutations as fully realized objects.
    if(source.mutations_active)
        for(source_mutation in source.mutations_active.mutation_pool)
            var/tmp/mutation = new source_mutation(donator)
            mutation.implanted = FALSE
            mutation.active = TRUE
            total_instability += mutation.instability


/datum/genetics/genetics_holder/Destroy()
	holder = null
    total_instability = 0
    mutation_pool = list()
	return ..()



/datum/genetics/genetics_holder/proc/irradiate(/datum/genetics/mutation/target)
    //What happens when a gene is irradiated.

/datum/genetics/genetics_holder/proc/getMutation(key)
	RETURN_TYPE(/datum/genetics/mutation)
	if(ispath(key))
		return locate(key) in perks

/datum/genetics/genetics_holder/proc/removeMutation(key)
	var/datum/genetics/mutation/mutation_to_remove = getMutation(key)
	if(mutation_to_remove)
        total_instability -= mutation_to_remove.instability
		mutation_pool -= mutation_to_remove
		mutation_to_remove.onPlayerRemove(src)
        mutation_to_remove.onMobRemove(src)


/*
* Basic outline of mutations
*/
/datum/genetics/mutation
    //Reference to the mob the mutation came from.
    var/mob/living/source_mob = /var/tmp/mob/living/simple_animal/cow
    
    //Name of the Mutation
    var/name = "Mutation Placeholder" 
    
    //Whether or not the mutation is 'activated'.
    var/active = FALSE 

    //easy reference to determine if the mutation is currently living in a creature.
    var/implanted = FALSE 

    //Description of the embryo at different stages of development. Uses /datum/genetics/embryo_state.
    var/list/embryo_descriptions = list() 
    
    //key for the mutation. References to the macro in _DEFINES/genetics.dm
    var/key = "KEY" 
    
    //reference for the instability a mutation contributes to a genome.
    var/instability = 0
    
    //Whether or not the gene can be used for the cloning process.
    var/cloning_mutation = FALSE
    
    //List of potential mutations that the mutation can irradiate into.
    var/list/irradiation_list = list()

    //How many research points the gene is worth.
    var/gene_research_value = 1000   

    New(mob/living/source)
        ..()
        source_mob = source
    
/datum/genetics/embryo_state
    active_stage = 0 //What stage of development the descriptor becomes active.
    desc = "This embryo is looking pretty default."
    hide_development = 0 //When to hide the descriptor. If 0, the description will remain active for the whole of the development process.

/datum/genetics/mutation/proc/onClone()
    //What happens when the mob is spawned in the cloner.

/datum/genetics/mutation/proc/onPlayerImplant(mob/living/carbon/human/target)
    //What happens when the genes are applied to a player.

/datum/genetics/mutation/proc/onMobImplant(mob/living/carbon/target)
    //What happens when the genes are applied to any creature.

/datum/genetics/mutation/proc/onPlayerRemove()
    //What happens when a gene is removed from a player.

/datum/genetics/mutation/proc/onMobRemove()
    //What happens when a gene is removed from a mob.





/*
* Interactions between genes
*/

//TODO: Use Recipe system for combining mutations.
/datum/genetics/proc/onCombine()

/datum/genetics/proc/onCombineFail()
    //TODO: Define what happens when a combination fails.