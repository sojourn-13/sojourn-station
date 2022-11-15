//Macro: MUTATION_PSN_BREATH
//One of the more complicated mutations. Adds a verb for 
/datum/genetics/mutation/psn_breath
	name = "Poison Breath"
	key = "MUTATION_PSN_BREATH"
	desc = "Allows the affected to spew gouts of blattedin gas. Warning- this mutation does not grant immunity to said gas."
	gain_text = "You feel almost like burping..."
	instability = 30
	var/datum/reagents/gas_sac
	var/initial_time
	var/reagent_add_cooldown = 1 MINUTE

/datum/genetics/mutation/psn_breath/onMobImplant()
	container.holder.verbs += /mob/living/proc/mutation_psn_breath
	initial_time = world.time
	gas_sac = new /datum/reagents(100, container.holder)
	initializeProcessing()

/datum/genetics/mutation/psn_breath/onMobRemove()
	container.holder.verbs -= /mob/living/proc/mutation_psn_breath
	qdel(gas_sac)
	haltProcessing()

/datum/genetics/mutation/psn_breath/Process()
	if(!..())
		return
	//Every minute, add 10u of Blattedin. This means that the ability can be used every minute,
	//Or, optionally, the effect can be saved and used once every 10 minutes.
	if(world.time < initial_time + reagent_add_cooldown)
		return
	initial_time = world.time
	gas_sac.add_reagent("blattedin", 10)
	return


/mob/living/proc/mutation_psn_breath()
	set name = "Poison Breath"
	set category = "Mutation"

	if(stat!=CONSCIOUS)
		usr.show_message("\blue You must be conscious to perform this ability!")
		return
		
	//Get the gas mutation if it exists (delete the verb if it doesn't)
	var/datum/genetics/mutation/psn_breath/gas_mutation = src.unnatural_mutations.getMutation("MUTATION_PSN_BREATH", TRUE)
	if(!gas_mutation)
		src.verbs -= /mob/living/proc/mutation_psn_breath
		return
	
	var/datum/reagents/gas_sac = gas_mutation.gas_sac

	//Check if we have enough gas
	if (!gas_sac.has_reagent("blattedin", 20))
		usr.show_message("\blue The pressure inside of you is not yet strong enough...")
		return

	//Gas script(cribbed from Seuche roach)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/S = new
	S.attach(location)
	S.set_up(gas_sac, gas_sac.total_volume, 0, location)
	src.visible_message(SPAN_DANGER("\the [src] secretes strange vapors!"))
	spawn(0)
		S.start()
	gas_sac.clear_reagents()

	return TRUE