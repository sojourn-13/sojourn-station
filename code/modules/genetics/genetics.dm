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
* Example of an inherent_mutations list:
* inherent_mutations= List(MUTATION_COW_SKIN, MUTATION_IMBECILE, MUTATION_MKNEWAIFUHAIR)
**/
//#define JANEDEBUG 1

/*
* =================================================================================================
* Genetics Holder calls and helper functions
* =================================================================================================
*/

/datum/genetics/genetics_holder
	var/mob/living/holder //Who is holding the genes. Null, if contained within a device.

	var/list/mutation_pool = list() //Each gene held by the creature. Uses /datum/genetics/mutation.

	//Amount of copies allowed in a given mutation within the mutation pool. If 0, there is no limit.
	var/max_copies = 0

	var/total_instability = 0 //How much instability is present in the gene pool.

	var/initialized = FALSE //Whether or not the held genes have been applied to the holder.

	var/processing_destabilization = FALSE //Whether or not we've kicked off the process to cause destabilization.

	var/last_destability_check

	var/stage = 0

//Build a holder from scratch
/datum/genetics/genetics_holder/New(mob/living/holding_mob)
	if(holding_mob)
		holder = holding_mob
	..()

//Copy a genetics holder wholesale for reuse.
/datum/genetics/genetics_holder/proc/Copy(var/copy_holder = FALSE)
	#ifdef JANEDEBUG
	log_debug("genetics_holder copied. copy_holder(bool): [copy_holder]")
	#endif
	var/datum/genetics/genetics_holder/duplicate = new type(src)
	if(copy_holder)
		duplicate.holder = holder
	else
		duplicate.holder = null
	duplicate.max_copies = max_copies
	duplicate.initialized = FALSE
	for (var/datum/genetics/mutation/old_mutation in mutation_pool)
		var/datum/genetics/mutation/new_mutation = old_mutation.copy()
		duplicate.addMutation(new_mutation)
	return duplicate

//Initialize a genetics holder based on an existing mob.
/datum/genetics/genetics_holder/proc/initializeFromMob(var/mob/living/source)
	#ifdef JANEDEBUG
	log_debug("func initializeFromMob called. Mob: [source]")
	#endif
	//No robots allowed.
	if(issynthetic(source))
		return
	addInherentMutations(source.inherent_mutations, source.type, source.name)
	addUnnaturalMutations(source.unnatural_mutations.mutation_pool)
	attemptAddCopyMobMutation(source.type, source.name)

//Initialize a genetics holder based on a slab of meat.
/datum/genetics/genetics_holder/proc/initializeFromMeat(var/obj/item/reagent_containers/food/snacks/meat/gene_meat)
	#ifdef JANEDEBUG
	log_debug("func initializeFromMeat called. Meat: [gene_meat]")
	#endif
	addInherentMutations(gene_meat.inherent_mutations, gene_meat.source_mob, gene_meat.source_name)
	addUnnaturalMutations(gene_meat.unnatural_mutations.mutation_pool)
	attemptAddCopyMobMutation(gene_meat.source_mob, gene_meat.source_name)
	toggleAllImplanted(FALSE)

//Add inherent mutations based on a source mob
/datum/genetics/genetics_holder/proc/addInherentMutations(var/list/inherent_mutations, var/source, var/source_name)
	#ifdef JANEDEBUG
	log_debug("func addInherentMutations called, adding:")
	#endif
	if(source && inherent_mutations && inherent_mutations.len > 0)
		#ifdef JANEDEBUG
		for(var/source_mutation in inherent_mutations)
			log_debug("-> [source_mutation]")
		#endif
		for(var/incoming_mutation in inherent_mutations)
			var/datum/genetics/mutation/new_mutation = new incoming_mutation()
			new_mutation.source_mob = source
			new_mutation.source_name = source_name
			addMutation(new_mutation)

//Add unnatural mutations already generated
/datum/genetics/genetics_holder/proc/addUnnaturalMutations(var/list/unnatural_mutations)
	#ifdef JANEDEBUG
	log_debug("func addUnnaturalMutations called, adding:")
	#endif
	if(unnatural_mutations && unnatural_mutations.len > 0)
		for(var/datum/genetics/mutation/source_mutation in unnatural_mutations)
			log_debug("-> [source_mutation]")
			var/datum/genetics/mutation/new_mutation = source_mutation.copy()
			new_mutation.implanted = FALSE
			addMutation(new_mutation)

//Generate a Copy Mob mutation if one hasn't been created yet.
//Also, Check to make sure there are no duplicates. Copy_mob is robust enough to not treat clone mutations of other mobs as a duplicate.
/datum/genetics/genetics_holder/proc/attemptAddCopyMobMutation(var/incoming_type, var/incoming_name)
	#ifdef JANEDEBUG
	log_debug("attemptAddCopyMobMutation: [incoming_type] , [incoming_name]")
	#endif
	if(!getMutation("MUTATION_COPY_[incoming_type]"))
		var/datum/genetics/mutation/new_mutation = new /datum/genetics/mutation/copy_mob(incoming_type, incoming_name)
		new_mutation.active = TRUE
		addMutation(new_mutation)
		return TRUE
	return FALSE

//Turn on/off the implanted key for all implants.
/datum/genetics/genetics_holder/proc/toggleAllImplanted(var/state = FALSE)
	#ifdef JANEDEBUG
	log_debug("toggleAllImplanted: turning all mutation's implanted values to state=[state]")
	#endif

	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		selected_mutation.implanted = state

//Get a random active clone mutation for cloning
/datum/genetics/genetics_holder/proc/findCloneMutation()
	#ifdef JANEDEBUG
	log_debug("findCloneMutation: getting a random active clone mutation for cloning")
	#endif
	var/list/clone_mutation_pool = list()
	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		if(selected_mutation.clone_gene && selected_mutation.active)
			clone_mutation_pool += selected_mutation
	if(clone_mutation_pool.len)
		return pick(clone_mutation_pool)
	else
		return null

//Randomly toggle random mutations in a holder as active; helps obfuscate unidentified mutations.
/datum/genetics/genetics_holder/proc/randomizeActivations()
	#ifdef JANEDEBUG
	log_debug("randomizeActivations: randomizing activated state in some genetics_holder, somewhere")
	#endif
	for (var/datum/genetics/mutation/selected_mutation in mutation_pool)
		if (prob(50))
			selected_mutation.activate(TRUE)
		else
			selected_mutation.deactivate()

/datum/genetics/genetics_holder/Destroy()
	#ifdef JANEDEBUG
	log_debug("Destroyed a genetics holder- that's unusual...")
	#endif
	total_instability = 0
	mutation_pool = list()
	return ..()

//What happens when a gene is irradiated.
/datum/genetics/genetics_holder/proc/irradiate(var/datum/genetics/mutation/target)
	var/list/mutation_group = list(target.key)

	if(!getMutation(target.key))
		error("irradiate(): Target mutation not in genetics holder.")

	var/datum/genetics/mutation/new_mutation = getRecipeResult(mutation_group, MUT_TYPE_IRRADIATON)

	if(removeMutation(target.key))
		addMutation(new_mutation)
		return new_mutation
	return null

//What happens when two or more genes are combined.
/datum/genetics/genetics_holder/proc/combine(var/list/combining_mutations)
	var/list/mutation_group = list()
	//Validate the mutations to make sure we have everything.
	for (var/list/mutation_amount_pair in combining_mutations)
		var/datum/genetics/mutation/combining_mutation = mutation_amount_pair[1]
		if(!getMutation(combining_mutation.key))
			#ifdef JANEDEBUG
			log_debug("combine(): Target mutation [combining_mutation] not in genetics holder.")
			#endif
			return null

		var/amount = mutation_amount_pair[2]
		if(amount > combining_mutation.count)
			#ifdef JANEDEBUG
			log_debug("combine(): Trying to combine more mutations than exist in the holder!")
			#endif
			return null

		for(var/i=1; i<=amount; i++)
			#ifdef JANEDEBUG
			log_debug("combine(): Added key [combining_mutation.key]")
			#endif
			mutation_group += combining_mutation.key

	var/datum/genetics/mutation/new_mutation = getRecipeResult(mutation_group, MUT_TYPE_COMBINATION)

	//Go back and remove the mutations combined.
	var/could_remove = TRUE
	for (var/list/mutation_amount_pair in combining_mutations)
		var/datum/genetics/mutation/combining_mutation = mutation_amount_pair[1]
		var/amount = mutation_amount_pair[2]
		if(!removeMutation(combining_mutation.key, amount))
			#ifdef JANEDEBUG
			log_debug("combine(): COULD NOT REMOVE [combining_mutation]")
			#endif
			could_remove = FALSE

	if(could_remove && new_mutation)
		addMutation(new_mutation)
		return new_mutation
	return null

//Determine Crappy mutation made for failed / corroded / bad mutation recipes
/datum/genetics/genetics_holder/proc/onRecipeFail()
	var/list/fail_list = getFailList() //get call defined in code/modules/genetics/recipes/fail_recipes.dm
	var/fail_mutation_path = pick(fail_list)
	var/datum/genetics/mutation/fail_mutation = new fail_mutation_path()
	fail_mutation.active = pick(TRUE,FALSE) //You remembered to keep track of the undiscovered mutation IDs, right?
	return fail_mutation

//Build a recipe compare string for searching through the global mutation recipe list
/datum/genetics/genetics_holder/proc/getRecipeResult(var/list/mutation_group, var/recipe_type)
	RETURN_TYPE(/datum/genetics/mutation)

	if(!recipe_type)
		#ifdef JANEDEBUG
		log_debug("getRecipeResult: Empty recipe_type!")
		#endif
		return null

	var/compare_string = ""
	if(recipe_type == MUT_TYPE_COMBINATION)
		compare_string = "C~"
	else if (recipe_type == MUT_TYPE_IRRADIATON)
		compare_string = "I~"
	else
		#ifdef JANEDEBUG
		log_debug("getRecipeResult: Unknown recipe_type!")
		#endif
		return null

	sortList(mutation_group)

	//Add compare text for non clone mutations.
	for (var/group_key in mutation_group)
		var/datum/genetics/mutation/incoming_mutation = getMutation(group_key)
		if(!incoming_mutation)
			#ifdef JANEDEBUG
			log_debug("getRecipeResult: Mutation with key [group_key] not found in genetics holder!")
			#endif
			return null
		if(!incoming_mutation.clone_gene)
			compare_string = compare_string + "G~" + "[incoming_mutation.type]"

	//Add compare text for the clone mutations. While we're here, we'll also build a list of them for later use.
	var/list/clone_mutation_list = list()
	for (var/group_key in mutation_group)
		var/datum/genetics/mutation/incoming_mutation = getMutation(group_key)
		if(incoming_mutation.clone_gene)
			clone_mutation_list += incoming_mutation
			compare_string = compare_string + "M~"
	#ifdef JANEDEBUG
	log_debug("getRecipeResult: Comparing recipe string of: [compare_string]")
	#endif
	//Case when don't find a recipe with the compare string- the recipe is a failure and returns a bad mutation.
	if(!GLOB.mutation_recipe_list[compare_string])
		#ifdef JANEDEBUG
		log_debug("getRecipeResult: Could not find recipe!")
		#endif
		return onRecipeFail()

	//Actually going out and finding the recipe from the global mutation_recipe list.
	var/datum/genetics/mutation_recipe/recipe
	var/list/potential_recipes = GLOB.mutation_recipe_list[compare_string]
	if(potential_recipes.len == 0)
		#ifdef JANEDEBUG
		log_debug("getRecipeResult: potential_recipes list was 0 for some reason...")
		#endif
		return onRecipeFail()
	else //Despair, for the WC of this loop is O(N^3)
		for(var/datum/genetics/mutation_recipe/target_recipe in potential_recipes)
			var/has_all_clone_data = TRUE
			if(target_recipe.required_on_clone_types)
				for (var/clone_path in target_recipe.required_on_clone_types)
					var/found_path = FALSE
					for(var/datum/genetics/mutation/incoming_mutation in clone_mutation_list)
						if(ispath(incoming_mutation.onClone(), clone_path))
							found_path = TRUE
							break
					if(!found_path)
						has_all_clone_data = FALSE
						break
			if(has_all_clone_data && target_recipe.recipe_type == recipe_type)
				#ifdef JANEDEBUG
				log_debug("getRecipeResult: found recipe with valid clone data and type!")
				#endif
				if(!recipe || (target_recipe.priority > recipe.priority))
					#ifdef JANEDEBUG
					log_debug("getRecipeResult: found recipe at priority target_recipe.priority")
					#endif
					recipe = target_recipe

	if(!recipe)
		#ifdef JANEDEBUG
		log_debug("getRecipeResult: Couldn't find a valid recipe out of the returned compare list")
		#endif
		return onRecipeFail()
	#ifdef JANEDEBUG
	log_debug("getRecipeResult: resulting recipe- [recipe.type]")
	#endif

	var/datum/genetics/mutation/new_mutation = recipe.get_result()
	new_mutation.active = pick(TRUE,FALSE)
	return(new_mutation)

//Search function for a specific mutation living in a genetics holder.
//Key- relates to a stored identifying string in the mutation datum, can be different for datums of the same object
//active_required- Mutation must be active in order to return properly.
//Function must return a mutation datum from the mutation pool on a success, and a null value that evaluates to FALSE on a fail.
/datum/genetics/genetics_holder/proc/getMutation(var/key, var/active_required = FALSE)
	RETURN_TYPE(/datum/genetics/mutation)
	if(!mutation_pool)
		return null
	for(var/datum/genetics/mutation/source_mutation in mutation_pool)
		if(source_mutation.key == key)
			if(!active_required || source_mutation.active)
				return source_mutation
			else
				return null
	return null


/datum/genetics/genetics_holder/proc/removeMutation(var/key , var/amt_to_remove = 1)
	#ifdef JANEDEBUG
	log_debug("removeMutation: removing [key] mutation. Amt=[amt_to_remove]")
	#endif
	var/datum/genetics/mutation/mutation_to_remove = getMutation(key)
	if(mutation_to_remove)

		mutation_to_remove.count -= amt_to_remove
		//make a return mutation object
		var/datum/genetics/mutation/return_mutation = mutation_to_remove.copy()

		if(mutation_to_remove.count <= 0)
			if(holder && mutation_to_remove.active)
				mutation_to_remove.onPlayerRemove(src)
				mutation_to_remove.onMobRemove(src)
			mutation_pool -= mutation_to_remove


			return_mutation.count = amt_to_remove + mutation_to_remove.count
			total_instability -= (mutation_to_remove.instability * (amt_to_remove + mutation_to_remove.count))
			check_destabilize()
			qdel(mutation_to_remove)
		else
			return_mutation.count = amt_to_remove
			total_instability -= (mutation_to_remove.instability * amt_to_remove)
			check_destabilize()
		return return_mutation
	else
		#ifdef JANEDEBUG
		log_debug("removeMutation: Couldn't find mutation")
		#endif
		return FALSE

/datum/genetics/genetics_holder/proc/removeAllMutations()
	for (var/datum/genetics/mutation/mutation_to_remove in mutation_pool)
		removeMutation(mutation_to_remove.key, mutation_to_remove.count)
	initialized = FALSE

//Proc for easily adding mutations to a genetics holder, so it can be called quickly.
/datum/genetics/genetics_holder/proc/addMutation(var/datum/genetics/mutation/incoming_mutation, var/force_add = FALSE)
	#ifdef JANEDEBUG
	log_debug("Adding mutation: [incoming_mutation.name], Force Add: [force_add]")
	#endif
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

	total_instability += (incoming_mutation.instability * incoming_mutation.count)
	check_destabilize()

//Inject a mutagen into a living person.
//MAKE SURE HOLDER IS SET FIRST.
/datum/genetics/genetics_holder/proc/inject_mutations(var/mob/living/target, var/activate_all=FALSE)
	#ifdef JANEDEBUG
	log_debug("beginning implant: [target.name] ->[target.key], [target.ckey]")
	#endif

	//No robots allowed.
	if(issynthetic(target))
		return FALSE

	//Opifex or Nanogate can't use genetics. If they try, their body begins removing the affected cells- manually.
	if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(human_target.random_organ_by_process(BP_NANOGATE))
			to_chat(human_target, SPAN_DANGER("You hear a synthetic voice, \"FOREIGN ORGANISM DETECTED. NEUTRALIZING\" before you feel something eating away at you on a cellular level."))
			target.adjustCloneLoss(10)
			return FALSE

		if(human_target.species && human_target.species.reagent_tag == IS_SYNTHETIC)
			return FALSE

	//Add the mutations in a separate loop from the activation step.
	for(var/datum/genetics/mutation/injected_mutation in mutation_pool)
		var/datum/genetics/mutation/new_mutation = injected_mutation.copy()
		new_mutation.implanted = FALSE //Sanity checking for activation loop.
		if(activate_all)
			new_mutation.active=TRUE
		target.unnatural_mutations.addMutation(new_mutation)

	//Process individual mutations, set them to implanted, and apply their effects to the target.
	for(var/datum/genetics/mutation/unnatural_mutation in target.unnatural_mutations.mutation_pool)
		if(unnatural_mutation.implanted) //Skip mutations already marked as implanted.
			#ifdef JANEDEBUG
			log_debug("Skipping Mutation, already implanted.")
			#endif
			continue
		unnatural_mutation.implanted = TRUE
		if(!unnatural_mutation.active) //Skip mutations not activated
			#ifdef JANEDEBUG
			log_debug("Skipping Mutation, inactive.")
			#endif
			continue
		if(istype(target, /mob/living/carbon/human))
			#ifdef JANEDEBUG
			log_debug("Ran On Player proc for: [unnatural_mutation]")
			#endif
			unnatural_mutation.onPlayerImplant()
		if(istype(target, /mob/living))
			#ifdef JANEDEBUG
			log_debug("Ran On Mob proc for [unnatural_mutation]")
			#endif
			unnatural_mutation.onMobImplant()

	target.unnatural_mutations.initialized = TRUE

	return TRUE

/datum/genetics/genetics_holder/proc/unmark_all_mutations()
	for(var/datum/genetics/mutation/selected_mutation in mutation_pool)
		selected_mutation.marked = FALSE

/datum/genetics/genetics_holder/proc/mark_all_mutations()
	for(var/datum/genetics/mutation/selected_mutation in mutation_pool)
		selected_mutation.marked = TRUE

//Function for kicking off destabilization events.
//Generally, we call it whenever a mutation is added.
//However, it can also get called if a person with mutations is revived for any reason
/datum/genetics/genetics_holder/proc/check_destabilize()
	//check if the holder is a valid mob. Sometimes it's not set, so we use this instead.
	if(!holder_is_living())
		return "not living"

	if(processing_destabilization)
		//Stop processing if we fall below the base value, or if the holder is already dead- Since we won't be needing it anymore
		if(total_instability < DESTABILIZE_LEVEL_BASE)
			STOP_PROCESSING(SSprocessing, src)
			stage = 0
			processing_destabilization = FALSE
			return "turning off destabilization"
	else
		//Start the process if we hit the threshold base value
		if(total_instability >= DESTABILIZE_LEVEL_BASE)
			last_destability_check = world.time
			START_PROCESSING(SSprocessing, src)
			processing_destabilization = TRUE
			return "turning on destabilization"
	return "None of the above happened."

//Function for processing destabilization, it will only start if total_instability in a valid holder exceeds DESTABILIZE_LEVEL_BASE.
//Doesn't start OR stop unless check_destabilize() tells it to.
/datum/genetics/genetics_holder/Process()
	if(world.time < last_destability_check + DESTABILIZE_CHECK_INTERVAL)
		return

	last_destability_check = world.time

	if(total_instability >= DESTABILIZE_LEVEL_WAS)
		stage++
		switch(stage)
			if(1)
				to_chat(holder, SPAN_DANGER("You don't feel too good."))
			if(6)
				holder.visible_message(SPAN_DANGER("The muscles beneath the skin of \the [holder] ripple and bulge."))
				to_chat(holder, SPAN_DANGER("Your form wavers. Ascension calls to you."))
			if(12)
				to_chat(holder, SPAN_DANGER("You feel yourself becoming... More. You answer the call."))
			if(13)
				holder.visible_message(SPAN_DANGER("[holder] shifts and reforms into... By science... What is that!?"))
				new /mob/living/carbon/superior_animal/psi_monster/wasonce(holder)
	if((total_instability >= DESTABILIZE_LEVEL_CLONE_DAMAGE) && (holder.getCloneLoss() < 30))
		holder.adjustCloneLoss(1)





//
/datum/genetics/genetics_holder/nano_ui_data(var/list/known_mutations)
	var/list/data = list()
	data["instability"] = total_instability
	var/list/mutation_pool_data = null
	if(mutation_pool)
		mutation_pool_data = list()
		for(var/datum/genetics/mutation/selected_mutation in mutation_pool)
			mutation_pool_data += list(selected_mutation.nano_ui_data(known_mutations))
	data["mutation_pool"] = mutation_pool_data

	return data

//Quick Check if our holder is living
/datum/genetics/genetics_holder/proc/holder_is_living()
	return ((holder && istype(holder, /mob/living)) ? TRUE : FALSE)

//Quick Check if our holder is human
/datum/genetics/genetics_holder/proc/holder_is_human()
	return ((holder && istype(holder, /mob/living/carbon/human)) ? TRUE : FALSE)


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

	//reference for the instability a mutation contributes to a genome.
	var/instability = 10

	//Series of bitflags for setting certain restrictions on a mutation, like needing an arm or a leg.
	//A few are outlined in code/__DEFINES/genetics, we'll add more as needed.
	var/requirement_flags

	//How many research points the gene is worth.
	var/gene_research_value = 1000

	var/virtual_id = 0 //A unique "ID" that the mutation holds, only set SPECIFICALLY when contained inside of an R&D server, and nowhere else.

	var/marked = FALSE //Whether or not the mutation was marked in a genetic analyzer

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
	duplicate.instability = instability
	duplicate.requirement_flags = requirement_flags
	duplicate.gene_research_value = gene_research_value
	duplicate.marked = marked
	return duplicate

//Obfuscate the data if we don't know it yet.
/datum/genetics/mutation/nano_ui_data(var/list/known_mutations)
	var/list/data = list()
	if(known_mutations[key])
		data["source_mob"] = source_mob
		data["source_name"] = source_name
		data["name"] = name
		data["desc"] = desc
		data["key"] = key
		data["count"] = count
		data["clone_gene"] = clone_gene
		data["active"] = active
		data["implanted"] = implanted
		data["instability"] = instability
		data["requirement_flags"] = requirement_flags
		data["gene_research_value"] = gene_research_value
		data["marked"] = marked
	else
		data["source_mob"] = source_mob
		data["source_name"] = source_name
		data["name"] = "UNDEFINED"
		data["desc"] = "New genetic information encountered. Analyze for further details."
		data["key"] = key
		data["count"] = count
		data["clone_gene"] = clone_gene
		data["active"] = active
		data["implanted"] = implanted
		data["instability"] = "??%"
		data["requirement_flags"] = requirement_flags
		data["gene_research_value"] = "????"
		data["marked"] = marked
	return data

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

//Modifier function that happens directly after cloning. Used to instantiate clones in special ways.
/datum/genetics/mutation/proc/postCloneCreation(var/result)

//What happens when the genes are applied to a player.
/datum/genetics/mutation/proc/onPlayerImplant()
	#ifdef JANEDEBUG
	log_debug("Ran the default Player implant proc for [name] as per usual")
	#endif
	if(container.holder_is_human())
		if(gain_text)
			to_chat(container.holder, SPAN_NOTICE("[gain_text]"))
		return TRUE
	return FALSE

//What happens when the genes are applied to any creature.
//This function will be applied to ANY mob, including players, so be sure to exclude appropriately for edge cases.
/datum/genetics/mutation/proc/onMobImplant()
	#ifdef JANEDEBUG
	log_debug("Ran the default Mob proc for [name]")
	#endif
	return container.holder_is_living()


//What happens when a gene is removed from a player.
/datum/genetics/mutation/proc/onPlayerRemove()
	#ifdef JANEDEBUG
	log_debug("Ran the default Player Remove proc for [name] as per usual")
	#endif
	return container.holder_is_human()

//What happens when a gene is removed from a mob.
/datum/genetics/mutation/proc/onMobRemove()
	return container.holder_is_living()

//Managing a constantly updating process on a mob.
//Takes the mutation's Process proc and should be called in onPlayerImplant and onMobImplant.
/datum/genetics/mutation/proc/initializeProcessing()
	if(checkProcessingValid())
		START_PROCESSING(SSprocessing, src)

//Check if the process is still valid
/datum/genetics/mutation/proc/checkProcessingValid()
	if(!active)
		#ifdef JANEDEBUG
		log_debug("[src] Process Cancelled, mutation not active.")
		#endif
		return FALSE
	else if(!implanted)
		#ifdef JANEDEBUG
		log_debug("[src] Process Cancelled, mutation not implanted.")
		#endif
		return FALSE
	else if(!container)
		#ifdef JANEDEBUG
		log_debug("[src] Process Cancelled, container not referenced.")
		#endif
		return FALSE
	else if(!container.holder)
		#ifdef JANEDEBUG
		log_debug("[src] Process Cancelled, container.holder not referenced.")
		#endif
		return FALSE
	else if(container.holder.stat == DEAD)
		#ifdef JANEDEBUG
		log_debug("[src] Process Cancelled, container.holder is dead.")
		#endif
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
