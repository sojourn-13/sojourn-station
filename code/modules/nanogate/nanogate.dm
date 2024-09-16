// Main page for nanogates and non-power stuff. If it is related to nanogates and you don't know where to put it, put it here. -R4d6

// Proc to give people nanogates. Add the organ, and it will do the rest.
 // HOW TO USE: Right click person -> Click 'Advanced Proc Call Target -> Type 'give_nanogate' -> Click finish to give a normal nanogate, click 'num' then type '1', *then* finished to give them an opifex nanogate.
/mob/proc/give_nanogate(var/gate_type = "Standard")
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)

		if(head)
			var/obj/item/organ/internal/nanogate/B
			switch(gate_type)
				if("Standard")
					B = new /obj/item/organ/internal/nanogate
				if("Artificer")
					B = new /obj/item/organ/internal/nanogate/artificer
				if("Opifex")
					B = new /obj/item/organ/internal/nanogate/opifex
			B.replaced(head)
			return TRUE
	return FALSE

//Special replace function to remove a psionic tumor on insert
/obj/item/organ/internal/nanogate/replaced(obj/item/organ/external/affected)
	inserted_and_processing = TRUE
	if(affected.owner)
		var/obj/item/organ/internal/psionic_tumor/installed_tumor = affected.owner.random_organ_by_process(BP_PSION)
		if(installed_tumor)
			to_chat(affected.owner, SPAN_DANGER("You hear a synthetic voice, \"FOREIGN ORGANISM DETECTED. NEUTRALIZING\"."))
			affected.owner.visible_message(SPAN_DANGER("Nanites inside [affected.owner] devour the ascended flesh!"))
			installed_tumor.removed_mob()
			qdel(installed_tumor)
	..(affected)

// The main process. Ends forever when it does what it needs to.
/obj/item/organ/internal/nanogate/Process()
	..()
	if(owner)
		if(!owner.stats.getPerk(PERK_NANOGATE))
			owner.stats.addPerk(PERK_NANOGATE)
			src.give_internal_computer()
		return PROCESS_KILL



// Check if there's enough nano points and remove them.
/obj/item/organ/internal/nanogate/proc/pay_power_cost(var/nano_cost)
	if(owner.stat == DEAD)
		to_chat(usr, "You are dead.")
		return FALSE
	if(owner.stat == UNCONSCIOUS)
		to_chat(usr, "You cannot use your nanogates powers while unconsious.")
		return FALSE
	if(nanite_points < nano_cost)
		to_chat(usr,"You lack the nanites to do this.")
		return FALSE
	else
		nanite_points -= nano_cost
		return TRUE

/obj/item/organ/internal/nanogate/removed_mob()
	//Remove purchased powers
	SEND_SIGNAL(src, COMSIG_NANOGATE_REMOVED)
	..()

/obj/item/organ/internal/nanogate/proc/give_internal_computer()
	var/obj/item/modular_computer/tablet/nanogate/I = new/obj/item/modular_computer/tablet/nanogate
	I.action = new/datum/action/item_action/hands_free/nanogate_vm
	I.action.name = I.action_button_name
	I.action.target = I
	I.action.Grant(owner)
	I.loc = owner
	I.linked_nanogate = src
	vm = I
	vm.login_email()
