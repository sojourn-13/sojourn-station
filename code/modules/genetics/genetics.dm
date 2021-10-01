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
* Duplicates of a mutation aren't stored as separate objects. 
* Instead, they are combined into one mutation object with a higher "count" to save space, sanity, and so on.
*
* The genetics holder is the object to interact with outside of mutations. If you're calling things inside it without a proc,
* and you aren't coding a mutation, you are likely doing something WRONG.
*
* ".Copy() just works"
*
* Example of an inherant_mutations list:
* inherant_mutations= List(MUTATION_COW_SKIN, MUTATION_IMBECILE, MUTATION_MKNEWAIFUHAIR)
**/

/datum/genetics/genetics_holder
	var/mob/living/holder //Who is holding the genes. Null, if contained within a device.

	var/list/mutation_pool = list() //Each gene held by the creature. Uses /datum/genetics/mutation.

	var/max_instability = 1000 //How much instability we can deal with before bad things happen.

	//Amount of copies allowed in a given mutation within the mutation pool. If 0, there is no limit.
	var/max_copies = 0

	var/total_instability = 0 //How much instability is present in the gene pool.

	var/track_instability = TRUE //If we should bother tracking instability

	var/initialized = FALSE //Whether or not the held genes have been applied to the holder.

//A subset of genetics_holders for databases
/datum/genetics/genetics_holder/virtual
	track_instability = FALSE

//Build a holder from scratch
/datum/genetics/genetics_holder/New(mob/living/holding_mob)
	if(holding_mob)
		holder = holding_mob
	..()



//Copy a genetics holder wholesale for reuse.
/datum/genetics/genetics_holder/proc/Copy(var/copy_holder = FALSE)
	log_debug("genetics_holder copied. copy_holder(bool): [copy_holder]")
	var/datum/genetics/genetics_holder/duplicate = new type(src)
	if(copy_holder)
		duplicate.holder = holder
	else
		duplicate.holder = null
	duplicate.max_instability = max_instability
	duplicate.max_copies = max_copies
	duplicate.track_instability = track_instability
	duplicate.initialized = FALSE
	for (var/datum/genetics/mutation/old_mutation in mutation_pool)
		var/datum/genetics/mutation/new_mutation = old_mutation.copy()
		duplicate.addMutation(new_mutation)
	return duplicate

//Initialize a genetics holder based on an existing mob.
/datum/genetics/genetics_holder/proc/initializeFromMob(var/mob/living/source)
	log_debug("func initializeFromMob called. Mob: [source]")
	//No robots allowed.
	if(issilicon(source))
		return
	addInherentMutations(source.inherent_mutations, source.type, source.name)
	addUnnaturalMutations(source.unnatural_mutations.mutation_pool)
	attemptAddCopyMobMutation(source.type, source.name)

//Initialize a genetics holder based on a slab of meat.
/datum/genetics/genetics_holder/proc/initializeFromMeat(var/obj/item/reagent_containers/food/snacks/meat/gene_meat)
	log_debug("func initializeFromMeat called. Meat: [gene_meat]")
	addInherentMutations(gene_meat.inherent_mutations, gene_meat.source_mob, gene_meat.source_name)
	addUnnaturalMutations(gene_meat.unnatural_mutations.mutation_pool)
	attemptAddCopyMobMutation(gene_meat.source_mob, gene_meat.source_name)
	toggleAllImplanted(FALSE)

//Add inherent mutations based on a source mob
/datum/genetics/genetics_holder/proc/addInherentMutations(var/list/inherent_mutations, var/source, var/source_name)
	log_debug("func addInherentMutations called, adding:")
	if(source && inherent_mutations && inherent_mutations.len > 0)
		for(var/source_mutation in inherent_mutations)
			log_debug("-> [source_mutation]")

		for(var/incoming_mutation in inherent_mutations)
			var/datum/genetics/mutation/new_mutation = new incoming_mutation()
			new_mutation.source_mob = source
			new_mutation.source_name = source_name
			addMutation(new_mutation)

//Add unnatural mutations already generated
/datum/genetics/genetics_holder/proc/addUnnaturalMutations(var/list/unnatural_mutations)
	log_debug("func addUnnaturalMutations called, adding:")
	if(unnatural_mutations && unnatural_mutations.len > 0)
		for(var/datum/genetics/mutation/source_mutation in unnatural_mutations)
			log_debug("-> [source_mutation]")
			var/datum/genetics/mutation/new_mutation = source_mutation.copy()
			new_mutation.implanted = FALSE
			addMutation(new_mutation)

//Generate a Copy Mob mutation if one hasn't been created yet.
//Also, Check to make sure there are no duplicates. Copy_mob is robust enough to not treat clone mutations of other mobs as a duplicate.
/datum/genetics/genetics_holder/proc/attemptAddCopyMobMutation(var/incoming_type, var/incoming_name)
	log_debug("attemptAddCopyMobMutation: [incoming_type] , [incoming_name]")
	if(!getMutation("MUTATION_COPY_[incoming_type]"))
		var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(incoming_type, incoming_name)
		new_mutation.active = TRUE
		addMutation(new_mutation)
		return TRUE
	return FALSE

//Turn on/off the implanted key for all implants.
/datum/genetics/genetics_holder/proc/toggleAllImplanted(var/state = FALSE)
	log_debug("toggleAllImplanted: turning all mutation's implanted values to state=[state]")

	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		selected_mutation.implanted = state

//Get a random active clone mutation for cloning
/datum/genetics/genetics_holder/proc/findCloneMutation()
	log_debug("findCloneMutation: getting a random active clone mutation for cloning")
	var/list/clone_mutation_pool
	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		if(selected_mutation.clone_gene && selected_mutation.active)
			clone_mutation_pool += selected_mutation
	return pick(clone_mutation_pool)

//Randomly toggle random mutations in a holder as active; helps obfuscate unidentified mutations.
/datum/genetics/genetics_holder/proc/randomizeActivations()
	log_debug("randomizeActivations: randomizing activated state in some genetics_holder, somewhere")
	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		if (prob(50))
			selected_mutation.activate(TRUE)
		else
			selected_mutation.deactivate()

/datum/genetics/genetics_holder/Destroy()
	log_debug("Destroyed a genetics holder- that's unusual...")
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
	log_debug("getMutation: Beginning search for [key]")
	for(var/datum/genetics/mutation/source_mutation in mutation_pool)
		if(source_mutation.key == key)
			log_debug("getMutation: Found key [key] in [source_mutation], which has key [source_mutation.key]")
			return source_mutation
	return null

/datum/genetics/genetics_holder/proc/removeMutation(var/key , var/amt_to_remove = 1)
	log_debug("removeMutation: removing [key] mutation. Amt=[amt_to_remove]")
	var/datum/genetics/mutation/mutation_to_remove = getMutation(key)
	if(mutation_to_remove)
		total_instability -= (mutation_to_remove.instability * amt_to_remove)
		mutation_to_remove.count -= amt_to_remove
		if(mutation_to_remove.count <= 0)
			mutation_pool -= mutation_to_remove
		if(holder)
			mutation_to_remove.onPlayerRemove(src)
			mutation_to_remove.onMobRemove(src)

/datum/genetics/genetics_holder/proc/removeAllMutations()
	total_instability = 0
	for (var/datum/genetics/mutation/mutation_to_remove in mutation_pool)
		if(istype(holder, /mob/living/carbon/human))
			mutation_to_remove.onPlayerRemove()
		if(istype(holder, /mob/living))
			mutation_to_remove.onMobRemove()
	mutation_pool = list()
	initialized = FALSE

//Proc for easily adding mutations to a genetics holder, so it can be called quickly.
/datum/genetics/genetics_holder/proc/addMutation(var/datum/genetics/mutation/incoming_mutation, var/force_add = FALSE)
	log_debug("Adding mutation: [incoming_mutation.name], Force Add: [force_add]")
	var/datum/genetics/mutation/existing_mutation = getMutation(incoming_mutation.key)
	var/max_copies_reached = FALSE
	if(existing_mutation)
		if((max_copies != 0) && ((existing_mutation.count + incoming_mutation.count) > max_copies))
			max_copies_reached = TRUE

	//actually process adding the object
	if(!max_copies_reached || force_add)
		if(existing_mutation)
			if(max_copies_reached)
				existing_mutation.count = max_copies
			else
				existing_mutation.count += incoming_mutation.count
		else
			//Ensure exclusive mutations come in as inactive if another of the same type already exists and is active.
			if(incoming_mutation.exclusive_type)
				for (var/datum/genetics/mutation/exclusive_mutation in mutation_pool)
					if(incoming_mutation.exclusive_type == exclusive_mutation.exclusive_type && exclusive_mutation.active)
						incoming_mutation.active = FALSE
						break

			incoming_mutation.container = src
			mutation_pool += incoming_mutation
			sortMutation(mutation_pool)

	if(track_instability)
		total_instability += (incoming_mutation.instability * incoming_mutation.count)

//Inject a mutagen into a living person.
//MAKE SURE HOLDER IS SET FIRST.
/datum/genetics/genetics_holder/proc/inject_mutations(var/mob/living/target)
	log_debug("beginning implant: [target.name] ->[target.key], [target.ckey]")

	//No robots allowed.
	if(issilicon(target))
		return FALSE

	//Add the mutations in a separate loop from the activation step.
	for(var/datum/genetics/mutation/injected_mutation in mutation_pool)
		var/datum/genetics/mutation/new_mutation = injected_mutation.copy()
		new_mutation.implanted = FALSE //Sanity checking for activation loop.
		target.unnatural_mutations.addMutation(new_mutation)
		
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
	if(target.unnatural_mutations.track_instability && (target.unnatural_mutations.total_instability > target.unnatural_mutations.max_instability))
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

	//Type of the mob the mutation came from.
	var/source_mob

	//The name of the mob the mutation came from.
	var/source_name = "Edwardo the placeholder Clone"

	//Name of the Mutation
	var/name = "Mutation Placeholder"

	var/desc = "Description Placeholder"

	//The key of the object, used to search for it easily. Often matches the Macro text.
	var/key = "DEFAULT"

	//the exclusive type of the mutation, prevents other mutations in the holder from being active (e.g. there can only be on SKIN mutation.)
	var/exclusive_type = MUT_TYPE_NONE
	
	//The amount of copies of this mutation loaded into a given genetics holder.
	var/count = 1

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
	duplicate.source_name = source_name
	duplicate.name = name
	duplicate.desc = desc
	duplicate.key = key
	duplicate.count = count
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

//Activate a mutation. Deactivates other exclusive mutations if 'force activation' is set to TRUE.
/datum/genetics/mutation/proc/activate(var/force_activation = FALSE)
	if (exclusive_type && force_activation)
		for (var/datum/genetics/mutation/container_mutation in container.mutation_pool)
			if(container_mutation == src)
				continue
			if(exclusive_type == container_mutation.exclusive_type)
				container_mutation.deactivate()
		active = TRUE
	else if (exclusive_type)
		var/found_other_exclusive_mutation = FALSE
		for (var/datum/genetics/mutation/container_mutation in container.mutation_pool)
			if(container_mutation == src)
				continue
			if(exclusive_type == container_mutation.exclusive_type)
				found_other_exclusive_mutation = TRUE
		if(!found_other_exclusive_mutation)
			active = TRUE
	else if (!exclusive_type)
		active = TRUE
	return

/datum/genetics/mutation/proc/deactivate()
	active = FALSE

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
		log_debug("[src] Process Cancelled, mutation not active.")
		return FALSE
	else if(!implanted)
		log_debug("[src] Process Cancelled, mutation not implanted.")
		return FALSE
	else if(!container)
		log_debug("[src] Process Cancelled, container not referenced.")
		return FALSE
	else if(!container.holder)
		log_debug("[src] Process Cancelled, container.holder not referenced.")
		return FALSE
	else if(container.holder.stat == DEAD)
		log_debug("[src] Process Cancelled, container.holder is dead.")
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