//Macro: MUTATION_WURM_CRY
//uses psn_breath as a base to build off of.
/datum/genetics/mutation/wurm_cry
	name = "Wurm Cry"
	key = "MUTATION_WURM_CRY"
	desc = "Allows the affected to make a blood chilling shreik. The gound shakes with its sound."
	gain_text = "Your throat feels thick."
	instability = 40
	exclusive_type = MUT_TYPE_MOUTH
	var/scream_cooldown = 30 MINUTE
	var/summon_ready = TRUE

/datum/genetics/mutation/wurm_cry/onMobImplant()
	add_verb(container.holder, /mob/living/proc/mutation_wurm_cry)

/datum/genetics/mutation/wurm_cry/onMobRemove()
	remove_verb(container.holder, /mob/living/proc/mutation_wurm_cry)

/datum/genetics/mutation/wurm_cry/proc/summon_ready()
	summon_ready = TRUE

/mob/living/proc/mutation_wurm_cry()
	set name = "Deep Screech"
	set category = "Mutation"


	if(stat!=CONSCIOUS)
		usr.show_message("\blue You must be conscious to perform this ability!")
		return

	//Get the mutation if it exists (delete the verb if it doesn't)
	var/datum/genetics/mutation/wurm_cry/wurm_cry_mutation = src.unnatural_mutations.getMutation("MUTATION_WURM_CRY", TRUE)
	if(!wurm_cry_mutation)
		remove_verb(src, /mob/living/proc/mutation_wurm_cry)
		return

	var/summon_ready = wurm_cry_mutation.summon_ready
	var/scream_cooldown = wurm_cry_mutation.scream_cooldown

	//Check if we are able to actually scream.
	if (!summon_ready)
		usr.show_message("\blue Your throat is to sore to use this right now.")
		return

	//scream and summon
	var/mob/living/carbon/superior_animal/wurm/guardian/S = new /mob/living/carbon/superior_animal/wurm/guardian
	S.loc = get_turf(src)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
	summon_ready = FALSE
	addtimer(CALLBACK(wurm_cry_mutation, TYPE_PROC_REF(/datum/genetics/mutation/wurm_cry, summon_ready)), scream_cooldown)
	return
