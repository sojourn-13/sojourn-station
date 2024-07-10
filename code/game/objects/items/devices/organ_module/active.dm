//Toggleable embedded module
/obj/item/organ_module/active
	var/verb_name = "Activate"
	var/verb_desc = "activate embedded module"
	var/datum/action/organ_module/organ_action

/obj/item/organ_module/active/Initialize()
	. = ..()
	organ_action = new(src, verb_name, verb_desc)

/obj/item/organ_module/active/Destroy()
	QDEL_NULL(organ_action)
	. = ..()

/obj/item/organ_module/active/onInstall(var/obj/item/organ/external/E)
	if(ishuman(E.owner))
		organ_action.Grant(E.owner)
	// new /obj/item/organ/external/proc/activate_module(E, verb_name, verb_desc)
	E.update_bionics_hud()

/obj/item/organ_module/active/onRemove(var/obj/item/organ/external/E)
	if(ishuman(E.owner))
		organ_action.Remove(E.owner)
	// E.verbs -= /obj/item/organ/external/proc/activate_module
	E.update_bionics_hud()

/obj/item/organ_module/active/organ_removed(obj/item/organ/external/E, mob/living/carbon/human/H)
	onRemove(E)

/obj/item/organ_module/active/organ_installed(obj/item/organ/external/E, mob/living/carbon/human/H)
	onInstall(E)

/obj/item/organ_module/active/proc/can_trigger(var/mob/living/carbon/human/H, var/obj/item/organ/external/E)
	//As long as you're awake you can toggle your own body
	if(H.incapacitated(INCAPACITATION_KNOCKOUT))
		to_chat(H, SPAN_WARNING("You can't do that now!"))
		return
/*
	for(var/obj/item/implant/prosthesis_inhibition/I in H)
		if(I.malfunction)
			continue
		to_chat(H, SPAN_WARNING("[I] in your [I.part] prevent [src] activation!"))
		return FALSE
*/
	return TRUE

/obj/item/organ_module/active/proc/trigger(var/mob/living/carbon/human/H, var/obj/item/organ/external/E)

/datum/action/organ_module
	check_flags = 0

/datum/action/organ_module/New(Target, verb_name, verb_desc)
	. = ..()
	name = verb_name
	desc = verb_desc

/datum/action/organ_module/Checks()
	if(!owner)
		return FALSE
	if(QDELETED(target))
		return FALSE
	if(!istype(target, /obj/item/organ_module/active))
		return FALSE
	if(!istype(target.loc, /obj/item/organ/external))
		return FALSE
	if(!owner.contains(target))
		return FALSE
	return TRUE

/datum/action/organ_module/Trigger()
	if(!Checks())
		return
	var/obj/item/organ_module/active/A = target
	A.trigger(owner, A.loc)
