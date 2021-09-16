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
	var/mob/living/holder //Who is holding the genes

	var/mob/living/donator //Where the genes came from.

	var/list/mutation_pool = list() //Each gene held by the creature. Uses /datum/genetics/mutation.

	var/total_instability = 0 //How much instability is present in the gene pool.

	var/initialized = FALSE //Whether or not the held genes have been applied to the holder.

//Build a holder based on a mob source
/datum/genetics/genetics_holder/New(var/mob/living/source)
	..()

	//No robots allowed.
	if(issilicon(source))
		return

	donator = source
	var/clone_mutation_found = FALSE

	//Add inactive mutations as fully realized objects
	if(donator.latent_mutations)
		for(var/source_mutation in donator.latent_mutations)
			var/mut_path = source_mutation
			var/datum/genetics/mutation/new_mutation = new mut_path
			new_mutation.container = src
			new_mutation.source_mob = donator
			new_mutation.implanted = FALSE
			new_mutation.active = pick(list(TRUE, FALSE))
			if(new_mutation.active)
				total_instability += new_mutation.instability

			if(istype(new_mutation, MUTATION_COPY))
				clone_mutation_found = TRUE
			mutation_pool += new_mutation

	//Add active mutations as fully realized objects.
	if(donator.active_mutations)
		for(var/datum/genetics/mutation/source_mutation in donator.active_mutations.mutation_pool)
			var/datum/genetics/mutation/new_mutation = new source_mutation(donator)
			new_mutation.container = src
			new_mutation.implanted = FALSE
			new_mutation.active = TRUE
			total_instability += new_mutation.instability
			if(istype(new_mutation, MUTATION_COPY))
				clone_mutation_found = TRUE
			mutation_pool += new_mutation

	//Generate a Copy Mob mutation if one hasn't been created yet.
	if (!clone_mutation_found)
		var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(donator)
		new_mutation.container = src
		new_mutation.implanted = FALSE
		new_mutation.active = TRUE
		total_instability += new_mutation.instability
		mutation_pool += new_mutation


/datum/genetics/genetics_holder/Destroy()
	donator = null
	total_instability = 0
	mutation_pool = list()
	return ..()


/datum/genetics/genetics_holder/proc/irradiate(/datum/genetics/mutation/target)
	//What happens when a gene is irradiated.

/datum/genetics/genetics_holder/proc/getMutation(key)
	RETURN_TYPE(/datum/genetics/mutation)
	if(ispath(key))
		return locate(key) in mutation_pool

/datum/genetics/genetics_holder/proc/removeMutation(key)
	var/datum/genetics/mutation/mutation_to_remove = getMutation(key)
	if(mutation_to_remove)
		total_instability -= mutation_to_remove.instability
		mutation_pool -= mutation_to_remove
		mutation_to_remove.onPlayerRemove(src)
		mutation_to_remove.onMobRemove(src)

//Activate an implant in a mutagen
/proc/implant_mutations(var/mob/living/target, var/datum/genetics/genetics_holder/injection)

	//No robots allowed.
	if(issilicon(target))
		return FALSE

	//Setup the linkage between the mob and the genetics holder
	var/datum/genetics/genetics_holder/container = injection
	container.holder = target
	target.active_mutations = container

	//Process individual mutations, set them to implanted.
	for(var/datum/genetics/mutation/active_mutation in target.active_mutations)
		active_mutation.implanted = TRUE
		//Skip mutations not activated
		if(active_mutation.active)
			if(istype(target, /mob/living/carbon/human))
				active_mutation.onPlayerImplant()

			if(istype(target, /mob/living))
				active_mutation.onMobImplant()

	target.active_mutations.initialized = TRUE

	return TRUE

/*
* Basic outline of mutations
*/
/datum/genetics/mutation

	//Reference to the containing genetics_holder
	var/datum/genetics/genetics_holder/container

	//Reference to the mob the mutation came from.
	var/mob/living/source_mob

	//Name of the Mutation
	var/name = "Mutation Placeholder"

	var/desc = "Description Placeholder"

	//The text displayed to a player when they gain a mutation.
	var/gain_text

	//If the gene is meant for holding onClone data.
	var/clone_gene = FALSE

	//Whether or not the mutation is 'activated'.
	var/active = FALSE

	//easy reference to determine if the mutation is currently living in a creature.
	var/implanted = FALSE

	//Description of the embryo at different stages of development. Uses /datum/genetics/embryo_state.
	var/list/embryo_descriptions = list()

	//reference for the instability a mutation contributes to a genome.
	var/instability = 0

	//Whether or not the gene can be used for the cloning process.
	var/cloning_mutation = FALSE

	//List of potential mutations that the mutation can irradiate into.
	var/list/irradiation_list = list()

	//How many research points the gene is worth.
	var/gene_research_value = 1000

/datum/genetics/embryo_state
	var/active_stage = 0 //What stage of development the descriptor becomes active.
	var/desc = "This embryo is looking pretty default."
	var/hide_development = 0 //When to hide the descriptor. If 0, the description will remain active for the whole of the development process.

//What happens when the mob is spawned in the cloner.
/datum/genetics/mutation/proc/onClone()


//What happens when the genes are applied to a player.
/datum/genetics/mutation/proc/onPlayerImplant()
	if(istype(container.holder, /mob/living/carbon/human) && gain_text)
		to_chat(container.holder, SPAN_NOTICE("[gain_text]"))
		return TRUE
	return FALSE

//What happens when the genes are applied to any creature.
/datum/genetics/mutation/proc/onMobImplant()

//What happens when a gene is removed from a player.
/datum/genetics/mutation/proc/onPlayerRemove()


//What happens when a gene is removed from a mob.
/datum/genetics/mutation/proc/onMobRemove()

//Managing a constantly updating process on a mob.
//Takes the mutation's Process proc and should be called in onPlayerImplant and onMobImplant.
/datum/genetics/mutation/proc/initializeProcessing()
	if(checkProcessingValid())
		START_PROCESSING(SSprocessing, src)

//Check if the process is still valid
/datum/genetics/mutation/proc/checkProcessingValid()
	if(!active)
		log_and_message_admins("Process Cancelled, mutation not active.")
		return FALSE
	else if(!implanted)
		log_and_message_admins("Process Cancelled, mutation not implanted.")
		return FALSE
	else if(!container)
		log_and_message_admins("Process Cancelled, container not referenced.")
		return FALSE
	else if(!container.holder)
		log_and_message_admins("Process Cancelled, container.holder not referenced.")
		return FALSE
	else if(container.holder.stat == DEAD)
		log_and_message_admins("Process Cancelled, container.holder is dead.")
		return FALSE
	else
		return TRUE


//Stopping the process
/datum/genetics/mutation/proc/haltProcessing()
	STOP_PROCESSING(SSprocessing, src)

//What happens when a mutation causes mounting occurences over time, such as intermittant moos.
/datum/genetics/mutation/Process()
	if(!checkProcessingValid())
		log_and_message_admins("Process halted in the Processing step, check processing trigger.")
		haltProcessing()
		return FALSE
	return TRUE





/*
* Interactions between genes
*/

//TODO: Use Recipe system for combining mutations.
/datum/genetics/proc/onCombine()

/datum/genetics/proc/onCombineFail()
	//TODO: Define what happens when a combination fails.