//Base power for all of our nanite powers, because we need somewhere to put EMP behavior handling and other functionality
/datum/perk/nanite_power
	name = "Nanite Power"
	desc = "The base object for all nanogate powers. If you're reading this, please report it as a bug."
	icon_state = "nanogateimplant"
	gain_text = "You've gained a nanite power, but something is not quite right! Please report this as a bug!"
	var/emped_message = null		//Message displayed when affected by an EMP
	var/emped_end_message = null	//Message displayed when EMP effect ends
	var/emped = FALSE				//Whether we are currently being affected by an EMP
	var/emp_duration = 0			//Duration of EMP effects
	copy_protected = TRUE //Yeah. No.

/datum/perk/nanite_power/assign(mob/living/L)
	. = ..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		var/obj/item/organ/internal/nanogate/target_ng = H.random_organ_by_process(BP_NANOGATE)
		RegisterSignal(target_ng, COMSIG_NANOGATE_EMP, PROC_REF(on_emp))
		RegisterSignal(target_ng, COMSIG_NANOGATE_REMOVED, PROC_REF(remove_power))

//Used for handling behaviors when EMP'd, such as shutting off regeneration or applying negative effects
//Remember that severity 1 is the strongest EMP
/datum/perk/nanite_power/proc/on_emp(obj/item/organ/internal/nanogate/nano, severity)
	if(emped_message)
		to_chat(holder, SPAN_WARNING("[emped_message]"))
	if(emp_duration > 0 && !emped) //Only actually set emped to true if we have a duration, and if we aren't already EMP'd (So we don't make an unnecessary number of timers)
		emped = TRUE
		addtimer(CALLBACK(src, PROC_REF(end_emp)), emp_duration, TIMER_STOPPABLE)
	return

//Called when EMP effect ends
/datum/perk/nanite_power/proc/end_emp()
	if(emped)
		emped = FALSE
	if(emped_end_message)
		to_chat(holder, SPAN_WARNING("[emped_end_message]"))
	return

//Called when we need to remove the power, such as when our nanogate is ripped out of our head
//Be sure to use this instead of the .remove() proc, because that proc may not properly remove the power
/datum/perk/nanite_power/proc/remove_power()
	holder.stats.removePerk(src)
