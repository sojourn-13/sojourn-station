//An isolated section of the gene pool that can be used for creating fleshy sac
/datum/genetics/mutation/sac_mutation
	name = "Fleshy Sac"
	key = "MUTATION_SAC"
	desc = "A pulsing sack of feeble flesh. Good for holding specialized organs during incubation."
	clone_gene = TRUE
	var/obj/item/sac = /obj/item/genetics/flesh_sac

/datum/genetics/mutation/sac_mutation/greater
	name = "Greater Fleshy Sac"
	key = "MUTATION_G_SAC"
	desc = "A pulsing sack of augmented flesh. Good for holding many specialized organs during incubation."
	clone_gene = TRUE
	sac = /obj/item/genetics/flesh_sac/greater

/datum/genetics/mutation/sac_mutation/onClone()
	return sac



//Heart
/datum/genetics/mutation/sac_contents
	name = "Miscellaneous Organ"
	key = "MUTATION_MISC_ORGAN"
	desc = "Produces an organ that is shapeless and strange. You probably got the recipe wrong somehow."
	instability = 0
	var/sac_desc_modifier
	var/loot_size = 1
	var/list/loot = list()

/datum/genetics/mutation/sac_contents/postCloneCreation(var/result)
	if(!istype(result, /obj/item/genetics/flesh_sac))
		return
	#ifdef JANEDEBUG
	log_debug("Detected flesh sac in cloner, running : [src] postCloneCreation script")
	#endif
	var/obj/item/genetics/flesh_sac/our_sac = result
	for(var/i=0, i<src.count, i++)
		our_sac.loot += src.loot
		our_sac.loot_size += src.loot_size
	if(sac_desc_modifier)
		our_sac.desc = our_sac.desc + "\n" + sac_desc_modifier


//Heart
/datum/genetics/mutation/sac_contents/heart
	name = "Humanoid Heart"
	key = "MUTATION_HEART"
	desc = "When cloned in an organ sac, produces a beating human heart."
	loot = list(/obj/item/organ/internal/vital/heart)

/datum/genetics/mutation/sac_contents/b_heart
	name = "Mega Babooon Heart"
	key = "MUTATION_B_HEART"
	desc = "When cloned in an organ sac, produces the heart of a mega-baboon. Beats with the sound of progress."
	loot = list(/obj/item/organ/internal/vital/heart/huge/baboon)

//Lungs
/datum/genetics/mutation/sac_contents/lungs
	name = "Humanoid Lung"
	key = "MUTATION_LUNG"
	desc = "When cloned in an organ sac, produces a set of lungs."
	sac_desc_modifier = "It breathes from an inhuman orifice."
	loot = list(/obj/item/organ/internal/vital/lungs)

/datum/genetics/mutation/sac_contents/g_lungs
	name = "Large Lungs"
	key = "MUTATION_G_LUNG"
	desc = "When cloned in an organ sac, produces abnormally sized lungs."
	sac_desc_modifier = "It takes deep breaths from an inhuman orifice."
	loot = list(/obj/item/organ/internal/vital/lungs/long)

//Liver
/datum/genetics/mutation/sac_contents/liver
	name = "Humanoid Liver"
	key = "MUTATION_LIVER"
	desc = "When cloned in an organ sac, produces a functioning liver."
	loot = list(/obj/item/organ/internal/liver)

/datum/genetics/mutation/sac_contents/g_liver
	name = "Great Liver"
	key = "MUTATION_G_LIVER"
	desc = "When cloned in an organ sac, produces a pretty great liver."
	loot = list(/obj/item/organ/internal/liver/big)

//blood vessels
/datum/genetics/mutation/sac_contents/blood_vessels
	name = "Humanoid Blood Vessels"
	key = "MUTATION_BLOOD_VESSEL"
	desc = "When cloned in an organ sac, causes the sac to be layered thick with pulsating blood vessels."
	loot = list(
		/obj/item/organ/internal/blood_vessel,
		/obj/item/organ/internal/blood_vessel,
		/obj/item/organ/internal/blood_vessel,
		/obj/item/organ/internal/blood_vessel,
		/obj/item/organ/internal/blood_vessel)

/datum/genetics/mutation/sac_contents/e_blood_vessels
	name = "Augmented Blood Vessels"
	key = "MUTATION_E_BLOOD_VESSEL"
	desc = "When cloned in an organ sac, causes the sac to be layered thick with augmented blood vessels."
	loot = list(
		/obj/item/organ/internal/blood_vessel/extensive,
		/obj/item/organ/internal/blood_vessel/extensive)


//muscles
/datum/genetics/mutation/sac_contents/muscles
	name = "Humanoid muscles"
	key = "MUTATION_MUSCLES"
	desc = "When cloned in an organ sac, produces a sinewy muscle."
	loot = list(
		/obj/item/organ/internal/muscle,
		/obj/item/organ/internal/muscle,
		/obj/item/organ/internal/muscle,
		/obj/item/organ/internal/muscle,
		/obj/item/organ/internal/muscle)

/datum/genetics/mutation/sac_contents/s_muscles
	name = "Compacted Muscles"
	key = "MUTATION_S_MUSCLES"
	desc = "When cloned in an organ sac, produces a positively rippling muscle."
	sac_desc_modifier = "It has amazing abs."
	loot = list(
		/obj/item/organ/internal/muscle/super_muscle,
		/obj/item/organ/internal/muscle/super_muscle)

//nerves
/datum/genetics/mutation/sac_contents/nerves
	name = "Humanoid nerves"
	key = "MUTATION_NERVES"
	desc = "When cloned in an organ sac, produces parts of a nervous system."
	loot = list(
		/obj/item/organ/internal/nerve,
		/obj/item/organ/internal/nerve,
		/obj/item/organ/internal/nerve,
		/obj/item/organ/internal/nerve,
		/obj/item/organ/internal/nerve)

/datum/genetics/mutation/sac_contents/s_nerves
	name = "Anomalous nerves"
	key = "MUTATION_S_NERVES"
	desc = "When cloned in an organ sac, produces parts of a nervous system constructed from an unidentified substance."
	sac_desc_modifier = "It twitches at the slightest puff of air."
	loot = list(
		/obj/item/organ/internal/nerve/sensitive_nerve,
		/obj/item/organ/internal/nerve/sensitive_nerve)

/datum/genetics/mutation/sac_contents/eyes
	name = "Humanoid eyes"
	key = "MUTATION_EYES"
	desc = "When cloned in an organ sac, produces functional eyes from an unidentified substance."
	sac_desc_modifier = "It focuses on its surroundings."
	loot = list(/obj/item/organ/internal/eyes)

/datum/genetics/mutation/sac_contents/marqua_eyes
	name = "Marqua eye"
	key = "MUTATION_MARQUA_EYES"
	desc = "When cloned in an organ sac, produces a single Mar'qua-like eye from an unidentified substance."
	sac_desc_modifier = "It watches the world around it."
	loot = list(/obj/item/organ/internal/eyes/marqua)

/datum/genetics/mutation/sac_contents/slime_bone
	name = "Slime bone"
	key = "MUTATION_SLIME_BONE"
	desc = "When cloned in an organ sac, creates a slimy cartilage from an unidentified substance."
	sac_desc_modifier = "It wobbles and jiggles."
	loot = list(/obj/item/organ/internal/bone/slime)
