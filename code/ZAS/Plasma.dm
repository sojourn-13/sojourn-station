var/image/contamination_overlay = image('icons/effects/contamination.dmi')

/pl_control
	var/PLASMA_DMG = 3
	var/PLASMA_DMG_NAME = "Plasma Damage Amount"
	var/PLASMA_DMG_DESC = "Self Descriptive"

	var/CLOTH_CONTAMINATION = TRUE
	var/CLOTH_CONTAMINATION_NAME = "Cloth Contamination"
	var/CLOTH_CONTAMINATION_DESC = "If this is on, plasma does damage by getting into cloth."

	var/PLASMAGUARD_ONLY = FALSE
	var/PLASMAGUARD_ONLY_NAME = "\"PlasmaGuard Only\""
	var/PLASMAGUARD_ONLY_DESC = "If this is on, only biosuits and spacesuits protect against contamination and ill effects."

	var/GENETIC_CORRUPTION = FALSE
	var/GENETIC_CORRUPTION_NAME = "Genetic Corruption Chance"
	var/GENETIC_CORRUPTION_DESC = "Chance of genetic corruption as well as toxic damage, X in 10,000."

	var/SKIN_BURNS = TRUE
	var/SKIN_BURNS_DESC = "Plasma has an effect similar to mustard gas on the un-suited."
	var/SKIN_BURNS_NAME = "Skin Burns"

	var/EYE_BURNS = TRUE
	var/EYE_BURNS_NAME = "Eye Burns"
	var/EYE_BURNS_DESC = "Plasma burns the eyes of anyone not wearing eye protection."

	var/CONTAMINATION_LOSS = 2
	var/CONTAMINATION_LOSS_NAME = "Contamination Loss"
	var/CONTAMINATION_LOSS_DESC = "How much fire damage is dealt from contaminated clothing, per life process."

	var/PLASMA_HALLUCINATION = FALSE
	var/PLASMA_HALLUCINATION_NAME = "Plasma Hallucination"
	var/PLASMA_HALLUCINATION_DESC = "Does being in plasma cause you to hallucinate?"

	var/N2O_HALLUCINATION = TRUE
	var/N2O_HALLUCINATION_NAME = "N2O Hallucination"
	var/N2O_HALLUCINATION_DESC = "Does being in sleeping gas cause you to hallucinate?"


/obj/var/contaminated = 0


/obj/item/proc/can_contaminate()
	if(flags & PLASMAGUARD)
		return FALSE
	return TRUE

//Clothing can be contaminated.
/obj/item/storage/backpack/can_contaminate()
	return FALSE

/obj/item/proc/contaminate()
	//Do a contamination overlay? Temporary measure to keep contamination less deadly than it was.
	if(!contaminated)
		contaminated = 1
		add_overlay(contamination_overlay, TRUE)

/obj/item/proc/decontaminate()
	contaminated = 0
	cut_overlay(contamination_overlay, TRUE)

/mob/proc/contaminate()

/mob/living/carbon/human/contaminate()
	//See if anything can be contaminated.

	if(!pl_suit_protected())
		suit_contamination()

	if(!pl_head_protected())
		if(prob(1)) suit_contamination() //Plasma can sometimes get through such an open suit.

/mob/proc/pl_effects()

/mob/living/carbon/human/pl_effects()
	//Handles all the bad things plasma can do.

	//Contamination
	if(vsc.plc.CLOTH_CONTAMINATION) contaminate()

	//Anything else requires them to not be dead.
	if(stat >= DEAD)
		return

	//if(species.flags & PLASMA_IMMUNE)
	//	return

	//Burn skin if exposed.
	if(vsc.plc.SKIN_BURNS)
		if(!pl_head_protected() || !pl_suit_protected())
			burn_skin(3)
			if(prob(20))
				to_chat(src, SPAN_DANGER("Your skin burns!"))
			updatehealth()

	//Burn eyes if exposed.
	if(vsc.plc.EYE_BURNS)

		var/burn_eyes = 1

		//Check for protective glasses
		if(glasses && (glasses.body_parts_covered & EYES) && (glasses.item_flags & AIRTIGHT))
			burn_eyes = 0

		//Check for protective maskwear
		if(burn_eyes && wear_mask && (wear_mask.body_parts_covered & EYES) && (wear_mask.item_flags & AIRTIGHT))
			burn_eyes = 0

		//Check for protective helmets
		if(burn_eyes && head && (head.body_parts_covered & EYES) && (head.item_flags & AIRTIGHT))
			burn_eyes = 0

		//If we still need to, burn their eyes
		if(burn_eyes)
			burn_eyes()


	//Genetic Corruption
	if(vsc.plc.GENETIC_CORRUPTION)
		if(rand(1,10000) < vsc.plc.GENETIC_CORRUPTION)
			randmutb(src)
			to_chat(src, "<span class='danger'>High levels of toxins cause you to spontaneously mutate!</span>")
			domutcheck(src,null)


/mob/living/carbon/human/proc/burn_eyes()
	//The proc that handles eye burning.
	if (!has_eyes() || species.eyes_are_impermeable)
		return

	var/obj/item/organ/internal/eyes/E = random_organ_by_process(OP_EYES)
	if(E)
		if(prob(20)) to_chat(src, "<span class='danger'>Your eyes burn!</span>")
		E.damage += 2.5
		eye_blurry = min(eye_blurry+1.5,50)
		if (prob(max(0,E.damage - 15) + 1) &&!eye_blind)
			to_chat(src, "<span class='danger'>You are blinded!</span>")
			eye_blind += 20

/mob/living/carbon/human/proc/pl_head_protected()
	//Checks if the head is adequately sealed.
	if(head)
		if(vsc.plc.PLASMAGUARD_ONLY)
			if(head.flags & PLASMAGUARD)
				return 1
		else if(head.body_parts_covered & EYES)
			return 1
	return 0

/mob/living/carbon/human/proc/pl_suit_protected()
	//Checks if the suit is adequately sealed.
	var/coverage = 0
	for(var/obj/item/protection in list(wear_suit, gloves, shoes))
		if(!protection)
			continue
		if(vsc.plc.PLASMAGUARD_ONLY && !(protection.flags & PLASMAGUARD))
			return 0
		coverage |= protection.body_parts_covered

	if(vsc.plc.PLASMAGUARD_ONLY)
		return 1

	return BIT_TEST_ALL(coverage, UPPER_TORSO|LOWER_TORSO|LEGS|ARMS)

/mob/living/carbon/human/proc/suit_contamination()
	//Runs over the things that can be contaminated and does so.
	if(w_uniform) w_uniform.contaminate()
	if(shoes) shoes.contaminate()
	if(gloves) gloves.contaminate()


turf/Entered(atom/movable/thing, turf/oldLoc)
	. = ..(thing, oldLoc)
	//Items that are in plasma, but not on a mob, can still be contaminated.
	var/obj/item/I = thing
	if(istype(I) && vsc.plc.CLOTH_CONTAMINATION && I.can_contaminate())
		var/datum/gas_mixture/env = return_air(1)
		if(!env)
			return
		for(var/g in env.gas)
			if(gas_data.flags[g] & XGM_GAS_CONTAMINANT && env.gas[g] > gas_data.overlay_limit[g] + 1)
				I.contaminate()
				break
