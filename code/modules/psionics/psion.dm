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
		if(0 > owner.psi_blocking)
			owner.psi_blocking = 0 //Insainity check!

		//Removes any implants that are metal, including death alarms
		remove_synthetics()

		//Now we do are math to under are point cap and regen
		psi_max_bonus = 0 + psi_max_other_sources

		if(!owner.stats.getPerk(PERK_PSION))
			owner.stats.addPerk(PERK_PSION)

		if(owner.stats.getPerk(PERK_PSI_HARMONY))
			psi_max_bonus += 2

		if(owner.stats.getPerk(PERK_PSI_PSYCHOLOGIST))
			psi_max_bonus += 5

		psi_max_bonus += psionic_equipment_check("psi_max_bonus")

		max_psi_points = round(clamp((owner.stats.getStat(STAT_COG) * 0.1), 1, 30)) + psi_max_bonus

		cognitive_potential = round(clamp((owner.stats.getStat(STAT_COG) * 0.1), 0, (cognitive_potential_max+psionic_equipment_check("cognitive_potential_max_bonus"))), 0.1)

		var/regen_points_timer = (5 MINUTES - cognitive_potential MINUTES)

		if(owner.stats.getPerk(PERK_PSI_GRACE))
			regen_points_timer *= 0.5

		regen_points_timer -= (psionic_equipment_check("psi_regen_helpers") SECONDS)

		regen_points_timer -= cognitive_potential MINUTES

		if(min_timer > regen_points_timer)
			regen_points_timer = min_timer

		addtimer(CALLBACK(src, PROC_REF(regen_points)), regen_points_timer)

		if(psi_points < max_psi_points)
			psi_points += 1

		if(owner.psi_blocking < 0) //resets psiblock to zero so people can't somehow farm it into the negatives.
			owner.psi_blocking = 0

//The major types are:
//"psi_max_bonus"
//"psi_regen_helpers" - This is in seconds!
//"cognitive_potential_max_bonus" - caps at 4

/obj/item/organ/internal/psionic_tumor/proc/psionic_equipment_check(type)
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		var/bonus_return = 0
		switch(type)
			if("psi_max_bonus")
				//Waring 4 ear rings does stack in this case
				if(istype(H.l_ear, /obj/item/clothing/ears/psionic_ear_rings))
					var/obj/item/clothing/ears/psionic_ear_rings/PESR = H.l_ear
					bonus_return += PESR.storage_addition
				if(istype(H.r_ear, /obj/item/clothing/ears/psionic_ear_rings))
					var/obj/item/clothing/ears/psionic_ear_rings/PESR = H.r_ear
					bonus_return += PESR.storage_addition

				return bonus_return

			if("psi_regen_helpers")
				if(istype(H.glasses, /obj/item/clothing/glasses/psionic_lens))
					var/obj/item/clothing/glasses/psionic_lens/PL = H.glasses
					bonus_return += PL.psionic_seconds

				return bonus_return

			if("cognitive_potential_max_bonus")
				if(istype(H.w_uniform , /obj/item/clothing/under/psionic_cloths))
					var/obj/item/clothing/under/psionic_cloths/PC = H.w_uniform
					bonus_return += PC.cognitive_potential
				return bonus_return


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
			for(var/obj/item/material/shard/shrapnel/emshrapnel in R.implants)
				R.implants -= emshrapnel
				emshrapnel.loc = get_turf(owner)
				owner.update_implants()
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

/*
	for(var/obj/item/material/shard/O in owner.contents)
		if(istype(O, /obj/item/material/shard))
			var/obj/item/material/shard/I = O
			I.forceMove(get_turf(owner))
*/

	for(var/obj/item/material/shard/emshrapnel in owner.embedded)
		owner.embedded -= emshrapnel
		emshrapnel.on_embed_removal(owner)
		emshrapnel.loc = get_turf(owner)



// This proc removes all implanters other then non-metal ones.
/obj/item/organ/internal/psionic_tumor/proc/remove_implanted(metal_implant)
	if(istype(metal_implant, /obj/item/implant) && !istype(metal_implant, /obj/item/implant/generic))
		var/obj/item/implant/R = metal_implant
		if(R.implanted)
			owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s body."),\
			SPAN_DANGER("[R.name] rips through your body."))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()


// This proc handles paying for your powers and checks if you attempt to use your power while you are dead or unconcious. Placed here so it doesn't need to be in every power function. Dead/unconscious checks are here so you can't somehow spend power points while unconscious
/obj/item/organ/internal/psionic_tumor/proc/pay_power_cost(var/psi_cost)
	if(disabled == 1)
		to_chat(src, "Your connection is cut to your psionic essence, something is wrong!.")
		return FALSE
	if(owner.stat == DEAD)
		to_chat(src, "You are dead.")
		return FALSE
	if(owner.stat == UNCONSCIOUS)
		to_chat(src, "You cannot use your psionic powers while unconscious.")
		return FALSE
	if(psi_points < psi_cost)
		to_chat(usr,"You lack the psionic essence to do this.")
		return FALSE
	else
		psi_points -= psi_cost
		return TRUE

//This proc handles checking whether a power can be used for reasons other than cost. It is called after pay cost
/obj/item/organ/internal/psionic_tumor/proc/check_possibility(targeted = FALSE, var/mob/living/carbon/human/target, require_target_active = FALSE)
	if(!GLOB.deepmaints_data_bool["active_psionics"])
		to_chat(usr,"Your mind struggles to tap into any psionic ablities!")
		return

	if(owner.psi_blocking >= 10)
		owner.stun_effect_act(0, owner.psi_blocking * 5, BP_HEAD)
		owner.weakened = owner.psi_blocking
		to_chat(usr,"Your mind struggles to break the confines of its prison, but cannot escape.")
		return FALSE
	if(targeted) //This should be used only for directly targeted effects, like telepathy, healing, or sleep, not on anything telekinetic.
		if(!target)
			usr.show_message(SPAN_NOTICE("You reach out with your mind, but there's nobody in front of you."))
		if(target.psi_blocking >= 10) //If we try to affect someone with psi blocking, it hurts!
			owner.stun_effect_act(0, target.psi_blocking * 5, BP_HEAD)
			owner.weakened = target.psi_blocking
			usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
			return FALSE
		if(target.species?.reagent_tag == IS_SYNTHETIC) //Can't affect synths
			usr.show_message(SPAN_NOTICE("You feel no mind to touch within this person!"))
			return FALSE
		if(target.stat == DEAD) //Can't affect the dead
			usr.show_message(SPAN_NOTICE("The mind within this person is dead and unable to be affected."))
			return FALSE
		if(target.get_core_implant(/obj/item/implant/core_implant/cruciform)) //Can't affect the baptized
			usr.show_message(SPAN_NOTICE("You feel something greater than your own mind pressing back, resisting your power."))
			return FALSE
		if(require_target_active && target.stat == UNCONSCIOUS) //Some powers like telepathy can't affect the sleeping
			usr.show_message(SPAN_NOTICE("You feel the mind you are attempting to reach is slumbering."))
			return FALSE
	return TRUE
