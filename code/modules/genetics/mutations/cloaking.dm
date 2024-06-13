//Macro: MUTATION_CLOAKING
/datum/genetics/mutation/cloaking
	name = "Cloaking"
	key = "MUTATION_CLOAKING"
	desc = "Causes light to bend around the affected target, making them see-through and harder to hit with ranged attacks."
	gain_text = "Your hands turn see-though..."
	instability = 30
	exclusive_type = MUT_TYPE_SKIN
	var/mutation = CLOAKING


/datum/genetics/mutation/cloaking/onMobImplant()
	//Sneakier
	//We don't bother with holding previous states, because it can be abused with certain items to be permanently invisible without the mutation.
	container.holder.mutations.Add(mutation)
	container.holder.invisibility = INVISIBILITY_WEAK
	container.holder.alpha = 50
	container.holder.visible_message(SPAN_DANGER("[container.holder.name] becomes slightly translucent."))
	anim(get_turf(container.holder), container.holder,'icons/mob/mob.dmi',,"cloak",,container.holder.dir)

/datum/genetics/mutation/cloaking/onMobRemove()
	//Visible again
	container.holder.mutations.Remove(mutation)
	container.holder.invisibility = INVISIBILITY_NONE
	container.holder.alpha = 255
	log_debug("cloaking/onMobRemove() This thing got called for some reason")

//==================================================================================================================================
#define CLOAK_OFF 0
#define CLOAK_STARTED 1
#define CLOAK_INITIALIZED 2
/datum/genetics/mutation/greater_cloaking
	name = "Greater Cloaking"
	key = "MUTATION_GREATER_CLOAKING"
	desc = "Allows you to briefly turn almost completely invisible, causing Turrets and Cameras to have trouble locating you."
	gain_text = "You have to squint in order to see the outline of your hands..."
	instability = 60
	exclusive_type = MUT_TYPE_SKIN
	var/mutation = CLOAKING
	var/activate_cooldown = 10 MINUTES
	var/ability_duration = 1 MINUTES
	var/last_used
	var/state = CLOAK_OFF


/datum/genetics/mutation/greater_cloaking/onMobImplant()
	add_verb(container.holder, /mob/living/proc/mutation_greater_cloaking)
	last_used = world.time - activate_cooldown // Use this instantly the first time
	initializeProcessing()

/datum/genetics/mutation/greater_cloaking/onMobRemove()
	remove_verb(container.holder, /mob/living/proc/mutation_greater_cloaking)
	haltProcessing()
	container.holder.invisibility = INVISIBILITY_NONE
	container.holder.alpha = 255

/datum/genetics/mutation/greater_cloaking/Process()
	if(!..())
		return
	if(state == CLOAK_OFF)
		return
	else if(state == CLOAK_STARTED)
		last_used = world.time //Sanity check
		container.holder.mutations.Add(mutation)
		container.holder.invisibility = INVISIBILITY_LEVEL_ONE
		container.holder.alpha = 25
		container.holder.visible_message(SPAN_DANGER("[container.holder.name] melds into the shadows!"))
		anim(get_turf(container.holder), container.holder,'icons/mob/mob.dmi',,"cloak",,container.holder.dir)
		state = CLOAK_INITIALIZED
	if (state == CLOAK_INITIALIZED && (world.time > last_used + ability_duration))
		if(mutation in container.holder.mutations)
			container.holder.mutations.Remove(mutation)
		container.holder.invisibility = INVISIBILITY_NONE
		last_used = world.time
		state = CLOAK_OFF
		container.holder.visible_message(SPAN_DANGER("[container.holder.name] fades into view."))
		anim(get_turf(container.holder), container.holder,'icons/mob/mob.dmi',,"uncloak",,container.holder.dir)
		spawn(8)
			container.holder.alpha = 255
	return


/mob/living/proc/mutation_greater_cloaking()
	set name = "Greater Cloaking"
	set category = "Mutation"

	if(stat!=CONSCIOUS)
		usr.show_message("\blue You must be conscious to perform this ability!")
		return
		
	//Get the gas mutation if it exists (delete the verb if it doesn't)
	var/datum/genetics/mutation/greater_cloaking/cloak_mutation = src.unnatural_mutations.getMutation("MUTATION_GREATER_CLOAKING", TRUE)
	if(!cloak_mutation)
		remove_verb(src, /mob/living/proc/mutation_greater_cloaking)
		return
	
	if(world.time <= cloak_mutation.last_used + cloak_mutation.activate_cooldown)
		usr.show_message("\blue Your skin shimmers briefly, but it fades after a moment. It will be a little longer before you can use this ability again.")
		return
	
	cloak_mutation.last_used = world.time
	cloak_mutation.state = CLOAK_STARTED

	return TRUE

#undef CLOAK_OFF
#undef CLOAK_STARTED
#undef CLOAK_INITIALIZED
