// Main page for psionic processes and functions. Put all non-power functions here. -Kazkin

 // Useful proc for making people psions, in case its needed for an event, debugging, or fixing. Adds the organ to the head and then the organ takes care of the rest.
 // HOW TO USE: Right click person -> view variables -> call proc -> type "make_psion" -> click finished -> done
/mob/proc/make_psion()
	var/mob/living/carbon/human/user = src
	if(user.is_mannequin) //Quick return to stop them adding mages to mannequins
		return
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)

		if(head)
			var/obj/item/organ/internal/psionic_tumor/B = new /obj/item/organ/internal/psionic_tumor
			B.disabled = FALSE
			B.replaced(head)

/mob/proc/make_psion_psych()
	var/mob/living/carbon/human/user = src
	if(user.is_mannequin) //Quick return to stop them adding mages to mannequins
		return
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)

		if(head)
			var/obj/item/organ/internal/psionic_tumor/psychiatrist/B = new /obj/item/organ/internal/psionic_tumor/psychiatrist
			B.disabled = FALSE
			B.replaced(head)

//Special proc call for psions to check for nanogate
/obj/item/organ/internal/psionic_tumor/replaced(obj/item/organ/external/affected)
	if(affected.owner)
		var/obj/item/organ/internal/nanogate/installed_nanogate = affected.owner.random_organ_by_process(BP_NANOGATE)
		if(installed_nanogate)
			to_chat(affected.owner, SPAN_DANGER("You hear a synthetic voice, \"FOREIGN ORGANISM DETECTED. NEUTRALIZING\"."))
			affected.owner.visible_message(SPAN_DANGER("Nanites inside [affected.owner] devour the ascended flesh!"))
			qdel(src)
			return
	..(affected)

// Main process, this runs through all the needed checks for a psion. Removal of implants like cruciforms and synthetics are called here.
// This also handles psi points limits and regeneration, the effect is dynamic so increases to cognition through things like stims and chems will update accordingly.
/obj/item/organ/internal/psionic_tumor/Process()
	..()
	if(!disabled && allow_loop && owner)
		regen_points() //We start
		allow_loop = FALSE



/obj/item/organ/internal/psionic_tumor/proc/regen_points()
	if(!owner)
		return
	if(!disabled && damage < 10)

		//First we undo any inhibitation or add it if needed
		if(!inhibited && owner.psi_blocking > 0)
			owner.show_message("\blue Your psionic power has been inhibited by an outside force!")
			inhibited = TRUE
		else if(inhibited && owner.psi_blocking <= 0)
			owner.show_message("\blue Your psionic power has been freed from its captivity!")
			inhibited = FALSE

		//Removes any implants that are metal, including death alarms
		remove_synthetics()

		//Now we do are math to under are point cap and regen
		var/psi_max_bonus = 0
		var/cognitive_potential = 1

		if(!owner.stats.getPerk(PERK_PSION))
			owner.stats.addPerk(PERK_PSION)

		if(owner.stats.getPerk(PERK_PSI_HARMONY))
			psi_max_bonus += 2

		if(owner.stats.getPerk(PERK_PSI_PSYCHOLOGIST))
			psi_max_bonus += 5

		max_psi_points = round(clamp((owner.stats.getStat(STAT_COG) * 0.1), 1, 30)) + psi_max_bonus

		cognitive_potential = round(clamp((owner.stats.getStat(STAT_COG) * 0.2), 0, 5))


		if(owner.stats.getPerk(PERK_PSI_GRACE))
			addtimer(CALLBACK(src, .proc/regen_points), (10 MINUTES - cognitive_potential MINUTES) * 0.5)
		else
			addtimer(CALLBACK(src, .proc/regen_points), (10 MINUTES - cognitive_potential MINUTES))

		if(psi_points < max_psi_points)
			psi_points += 1

/obj/item/organ/internal/psionic_tumor/removed_mob(mob/living/user)
	..()
	disabled = TRUE
	allow_loop = TRUE

// This proc removes all implants. Synthetic limbs and implants are exploded out of the body while organ_modules and synthetic organs are teleported away.
/obj/item/organ/internal/psionic_tumor/proc/remove_synthetics()
	if(!owner)
		return
	for(var/obj/item/organ/O in owner.organs)
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue
			owner.visible_message(SPAN_DANGER("[owner]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()

	for(var/obj/item/organ/O in owner.internal_organs)
		if(istype(O, /obj/item/organ/internal))
			var/obj/item/organ/internal/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != owner)
				continue
			to_chat(owner, SPAN_DANGER("You feeling a sickeningly emptying feeling as the synthetic organ within your body is forcefully shunted elsewhere by your psionic power."))
			qdel(O)
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()

		if(istype(O, /obj/item/organ_module))
			if(O == src)
				continue
			var/obj/item/organ_module/R = O
			if(R.is_organic_module == FALSE)
				owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s body."),\
				SPAN_DANGER("[R.name] rips through your body."))
				to_chat(owner, SPAN_DANGER("You feeling a sickeningly emptying feeling as the synthetic module within your body is forcefully shunted elsewhere by your psionic power."))
				qdel(O)
				if(ishuman(owner))
					var/mob/living/carbon/human/H = owner
					H.update_implants()

	for(var/obj/item/implant/O in owner.contents)
		if(istype(O, /obj/item/implant))
			var/obj/item/implant/I = O
			remove_implanted(I)



// This proc removes all implanters other then non-metal ones.
/obj/item/organ/internal/psionic_tumor/proc/remove_implanted(metal_implant)
	if(istype(metal_implant, /obj/item/implant))
		var/obj/item/implant/R = metal_implant
		if(R.implanted)
			owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s body."),\
			SPAN_DANGER("[R.name] rips through your body."))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()


// This proc handles paying for your powers and checks if you attempt to use your power while you are dead or unconcious. Placed here so it doesn't need to be in every power function.
/obj/item/organ/internal/psionic_tumor/proc/pay_power_cost(var/psi_cost)
	if(disabled == 1)
		to_chat(src, "Your connection is cut to your psionic essence, something is wrong!.")
		return FALSE
	if(owner.stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(owner.stat == UNCONSCIOUS)
		to_chat(src, "You cannot use your psionic powers while unconscious.")
		return
	if(psi_points < psi_cost)
		to_chat(usr,"You lack the psionic essence to do this.")
		return FALSE
	else
		psi_points -= psi_cost
		if(owner.psi_blocking >= 10)
			to_chat(usr,"Your mind struggles to break the confines of its prison, but cannot escape.")
			return FALSE
		return TRUE
