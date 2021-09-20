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
* mutations_inactive= List(MUTATION_COW_SKIN, MUTATION_IMBECILE, MUTATION_MKNEWAIFUHAIR)
**/

/datum/genetics/genetics_holder
	var/mob/living/holder //Who is holding the genes

	var/list/mutation_pool = list() //Each gene held by the creature. Uses /datum/genetics/mutation.

	var/max_instability = 1000 //How much instability we can deal with before bad things happen.

	var/total_instability = 0 //How much instability is present in the gene pool.

	var/initialized = FALSE //Whether or not the held genes have been applied to the holder.


//Build a holder based on a mob source
/datum/genetics/genetics_holder/New(var/list/unnatural_mutations, var/list/inherant_mutations, var/mob/living/source)
	..()

	if(source)
		log_debug("--------------")
		log_debug("Creating new Genetics with source reference")
		log_debug("source: [source]")
		//No robots allowed.
		if(issilicon(source))
			return


	//Add inherant mutations as fully realized objects
	if(inherant_mutations && inherant_mutations.len > 0)
		log_debug("inherant mutations:")
		for(var/source_mutation in inherant_mutations)
			log_debug("-> [source_mutation]")

		for(var/incoming_mutation in inherant_mutations)
			var/datum/genetics/mutation/source_mutation = new incoming_mutation()
			//Check to make sure there are no duplicates
			log_debug("Attempting to read an inherant mutation: [source_mutation]")
			if(getMutation(source_mutation.key))
				continue
			log_debug("Couldn't find existing mutation, moving on to try and add one:")
			var/datum/genetics/mutation/new_mutation = source_mutation.copy()
			new_mutation.container = src
			if(source)
				new_mutation.source_mob = source
			new_mutation.implanted = FALSE
			new_mutation.active = pick(list(TRUE, FALSE))
			if(new_mutation.active)
				total_instability += new_mutation.instability
			mutation_pool += new_mutation

	//Add unnaturally implanted mutations as fully realized objects.
	if(unnatural_mutations && unnatural_mutations.len > 0)
		log_debug("unnatural mutations:")
		for(var/source_mutation in unnatural_mutations)
			log_debug("-> [source_mutation]")

		for(var/datum/genetics/mutation/source_mutation in unnatural_mutations)
			//Check to make sure there are no duplicates
			if(getMutation(source_mutation.key))
				continue
			var/datum/genetics/mutation/new_mutation = source_mutation.copy()
			new_mutation.container = src
			new_mutation.implanted = FALSE
			if(new_mutation.active)
				total_instability += new_mutation.instability
			mutation_pool += new_mutation

		//Generate a Copy Mob mutation if one hasn't been created yet.
		//Also, Check to make sure there are no duplicates. Copy_mob is robust enough to not treat clone mutations of other mobs as a duplicate.
	if(source && !getMutation("MUTATION_COPY_[source.type]"))
		var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(source)
		new_mutation.container = src
		new_mutation.implanted = FALSE
		new_mutation.active = TRUE
		total_instability += new_mutation.instability
		mutation_pool += new_mutation

/datum/genetics/genetics_holder/Destroy()
	total_instability = 0
	mutation_pool = list()
	return ..()

/datum/genetics/genetics_holder/proc/irradiate(datum/genetics/mutation/target)
	//What happens when a gene is irradiated.

//Search function for a specific mutation living in a genetics holder.

//Key- relates to a stored identifying string in the mutation datum, can be different for datums of the same object
//Function must return a mutation datum from the mutation pool on a success, and a null value that evaluates to FALSE on a fail.
/datum/genetics/genetics_holder/proc/getMutation(var/key)
	RETURN_TYPE(/datum/genetics/mutation)
	log_debug("--------------")
	log_debug("Beginning search for [key]")
	for(var/datum/genetics/mutation/source_mutation in mutation_pool)
		if(source_mutation.key == key)
			log_debug("Found key [key] in [source_mutation], which has key [source_mutation.key]")
			return source_mutation
	return null

/datum/genetics/genetics_holder/proc/removeMutation(var/key)
	var/datum/genetics/mutation/mutation_to_remove = getMutation(key)
	if(mutation_to_remove)
		total_instability -= mutation_to_remove.instability
		mutation_pool -= mutation_to_remove
		mutation_to_remove.onPlayerRemove(src)
		mutation_to_remove.onMobRemove(src)

/datum/genetics/genetics_holder/proc/remove_all_mutations()
	total_instability = 0
	for (var/datum/genetics/mutation/mutation_to_remove in mutation_pool)
		if(istype(holder, /mob/living/carbon/human))
			mutation_to_remove.onPlayerRemove()
		if(istype(holder, /mob/living))
			mutation_to_remove.onMobRemove()
	mutation_pool = list()
	initialized = FALSE

//Activate an implant in a mutagen
/proc/inject_mutations(var/mob/living/target, var/list/injection=list())

	log_debug("--------------")
	log_debug("beginning implant.")
	log_debug("target person:")
	log_debug("[target.name] ->[target.key], [target.ckey]")

	//No robots allowed.
	if(issilicon(target))
		return FALSE

	//Initialize this if we haven't already
	target.unnatural_mutations.holder = target

	//Add the mutations in a separate loop from the activation step.
	for(var/datum/genetics/mutation/injected_mutation in injection)
		var/datum/genetics/mutation/new_mutation = injected_mutation.copy()
		if(new_mutation.active) //Only active genes contribute to instability.
			target.unnatural_mutations.total_instability += injected_mutation.instability
			if(target.unnatural_mutations.total_instability > target.unnatural_mutations.max_instability)
				new_mutation.active = FALSE
		new_mutation.implanted = FALSE //Sanity checking for activation loop.
		new_mutation.container = target.unnatural_mutations
		target.unnatural_mutations.mutation_pool += new_mutation

	//Process individual mutations, set them to implanted, and apply their effects to the target.
	for(var/datum/genetics/mutation/unnatural_mutation in target.unnatural_mutations.mutation_pool)
		if(unnatural_mutation.implanted) //Skip mutations already marked as implanted.
			log_debug("Skipping Mutation, already implanted.")
			continue
		unnatural_mutation.implanted = TRUE

		if(!unnatural_mutation.active) //Skip mutations not activated
			log_debug("Skipping Mutation, inactive.")
			continue

		if(istype(target, /mob/living/carbon/human))
			log_debug("Ran On Player proc for: [unnatural_mutation]")
			unnatural_mutation.onPlayerImplant()
		if(istype(target, /mob/living))
			log_debug("Ran On Mob proc for [unnatural_mutation]")
			unnatural_mutation.onMobImplant()

	target.unnatural_mutations.initialized = TRUE

	//The part where bad things happen.
	if(target.unnatural_mutations.total_instability > target.unnatural_mutations.max_instability)
		target.unnatural_mutations.destabilize()

	return TRUE

//Function handling instability of a creature exceeding their maximum.
/datum/genetics/genetics_holder/proc/destabilize()
	//TODO: All of this.

	//Akira message:
	holder.visible_message(SPAN_DANGER("\The [holder]'s body begins to warp and change! BY SCIENCE, WHAT IS THAT!?"))


/*
* =================================================================================================
* Mutation calls and helper functions
* =================================================================================================
*/
/datum/genetics/mutation

	//Reference to the containing genetics_holder
	var/datum/genetics/genetics_holder/container

	//Reference to the mob the mutation came from.
	var/mob/living/source_mob

	//Name of the Mutation
	var/name = "Mutation Placeholder"

	var/desc = "Description Placeholder"

	//The key of the object, used to search for it easily. Often matches the Macro text.
	var/key = "DEFAULT"

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

/datum/genetics/mutation/proc/copy(var/copy_container = FALSE)
	var/datum/genetics/mutation/duplicate = new type(src)
	if(copy_container)
		duplicate.container = container
	duplicate.source_mob = source_mob
	duplicate.name = name
	duplicate.desc = desc
	duplicate.key = key
	duplicate.gain_text = gain_text
	duplicate.clone_gene = clone_gene
	duplicate.active = active
	duplicate.implanted = implanted
	duplicate.embryo_descriptions = embryo_descriptions.Copy()
	duplicate.instability = instability
	duplicate.cloning_mutation = cloning_mutation
	duplicate.irradiation_list = irradiation_list.Copy()
	duplicate.gene_research_value = gene_research_value
	return duplicate

/datum/genetics/embryo_state
	var/active_stage = 0 //What stage of development the descriptor becomes active.
	var/desc = "This embryo is looking pretty default."
	var/hide_development = 0 //When to hide the descriptor. If 0, the description will remain active for the whole of the development process.

//What happens when the mob is spawned in the cloner.
/datum/genetics/mutation/proc/onClone()


//What happens when the genes are applied to a player.
/datum/genetics/mutation/proc/onPlayerImplant()
	log_debug("Ran the default Player implant proc for [name] as per usual")
	if(istype(container.holder, /mob/living/carbon/human) && gain_text)
		to_chat(container.holder, SPAN_NOTICE("[gain_text]"))
		return TRUE
	return FALSE

//What happens when the genes are applied to any creature.
//This function will be applied to ANY mob, including players, so be sure to exclude appropriately for edge cases.
/datum/genetics/mutation/proc/onMobImplant()
	log_debug("Ran the default Mob proc for [name]")

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
		return FALSE
	return TRUE





/*
* Interactions between genes
*/

//TODO: Use Recipe system for combining mutations.
/datum/genetics/proc/onCombine()

/datum/genetics/proc/onCombineFail()
	//TODO: Define what happens when a combination fails.