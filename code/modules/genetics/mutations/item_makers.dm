//An isolated section of the gene pool that can be used for creating fleshy sac
/datum/genetics/mutation/sac_mutation
	name = "Sac Placeholder"
	key = "MUTATION_SAC/DOES/NOT/EXIST"
	desc = "A placeholder mutation for sac producers. Tell hex if you see this in-game."
	clone_gene = TRUE
	var/obj/item/sac = /obj/item/genetics/flesh_sac

/datum/genetics/mutation/sac_mutation/onClone()
	return sac

//Heart
/datum/genetics/mutation/sac_mutation/heart
	name = "Humanoid Heart"
	key = "MUTATION_HEART"
	desc = "When cloned, produces an organ sac containing a beating human heart."
	sac = /obj/item/genetics/flesh_sac/heart

/datum/genetics/mutation/sac_mutation/b_heart
	name = "Mega Babooon Heart"
	key = "MUTATION_B_HEART"
	desc = "When cloned, produces an organ sac containing the heart of a mega-baboon. Beats with the sound of progress."
	sac = /obj/item/genetics/flesh_sac/b_heart

//Lungs
/datum/genetics/mutation/sac_mutation/lungs
	name = "Humanoid Lung"
	key = "MUTATION_LUNG"
	desc = "When cloned, produces an organ sac containing a set of lungs."
	sac = /obj/item/genetics/flesh_sac/lungs

/datum/genetics/mutation/sac_mutation/g_lungs
	name = "Large Lungs"
	key = "MUTATION_G_LUNG"
	desc = "When cloned, produces an organ sac containing abnormally sized lungs."
	sac = /obj/item/genetics/flesh_sac/g_lungs

//Liver
/datum/genetics/mutation/sac_mutation/liver
	name = "Humanoid Liver"
	key = "MUTATION_LIVER"
	desc = "When cloned, produces an organ sac containing a functioning liver."
	sac = /obj/item/genetics/flesh_sac/liver

/datum/genetics/mutation/sac_mutation/g_liver
	name = "Great Liver"
	key = "MUTATION_G_LIVER"
	desc = "When cloned, produces an organ sac containing a pretty great liver."
	sac = /obj/item/genetics/flesh_sac/g_liver

//blood vessels
/datum/genetics/mutation/sac_mutation/blood_vessels
	name = "Humanoid Blood Vessels"
	key = "MUTATION_BLOOD_VESSEL"
	desc = "When cloned, produces an organ sac layered thick with pulsating blood vessels."
	sac = /obj/item/genetics/flesh_sac/blood_vessels

/datum/genetics/mutation/sac_mutation/e_blood_vessels
	name = "Augmented Blood Vessels"
	key = "MUTATION_E_BLOOD_VESSEL"
	desc = "When cloned, produces an organ sac layered thick with augmented blood vessels."
	sac = /obj/item/genetics/flesh_sac/e_blood_vessels

//muscles
/datum/genetics/mutation/sac_mutation/muscles
	name = "Humanoid muscles"
	key = "MUTATION_MUSCLES"
	desc = "When cloned, produces an organ sac filled with sinewy muscle."
	sac = /obj/item/genetics/flesh_sac/muscles

/datum/genetics/mutation/sac_mutation/s_muscles
	name = "Compacted Muscles"
	key = "MUTATION_S_MUSCLES"
	desc = "When cloned, produces an organ sac positively rippling with muscle."
	sac = /obj/item/genetics/flesh_sac/s_muscles

//nerves
/datum/genetics/mutation/sac_mutation/nerves
	name = "Humanoid nerves"
	key = "MUTATION_NERVES"
	desc = "When cloned, produces an organ sac filled with nerves."
	sac = /obj/item/genetics/flesh_sac/nerves

/datum/genetics/mutation/sac_mutation/s_nerves
	name = "Anomalous nerves"
	key = "MUTATION_S_NERVES"
	desc = "When cloned, produces an organ sac filled with nerves constructed from an unidentified substance."
	sac = /obj/item/genetics/flesh_sac/s_nerves

//Everything
/datum/genetics/mutation/sac_mutation/upgraded_organs
	name = "Surpassing Organs"
	key = "MUTATION_ALL_ORGANS"
	desc = "When cloned, produces an organ sac filled with everything needed to create a superior life form."
	sac = /obj/item/genetics/flesh_sac/superior