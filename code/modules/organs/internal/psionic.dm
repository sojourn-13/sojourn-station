// This organ turns people into a psion once in the body after the first process check. Has alot of stats (on par with a brain) due to giving you lots in return.
// All owner_verbs are standard powers given to psions the moment they ascend. BP_PSION is called for bodily effects relating specifically to psions, such as chemicals.
/obj/item/organ/internal/psionic_tumor
	name = "ascended flesh"
	desc = "A tumorous mass that resembles a pulsating muscle-like brain. It's uncomfortable to look at..."
	organ_efficiency = list(BP_PSION = 100)
	max_damage = 15
	parent_organ_base = BP_HEAD
	icon_state = "psion_tumor"
	force = 1.0
	w_class = ITEM_SIZE_SMALL
	specific_organ_size = 0.5
	throwforce = 1.0
	throw_speed = 3
	throw_range = 5
	layer = ABOVE_MOB_LAYER
	origin_tech = list(TECH_BIO = 20) // Literally a unique organ found in only one place in the entire galaxy.
	attack_verb = list("attacked", "slapped", "whacked")
	price_tag = 12000
	blood_req = 8
	max_blood_storage = 80
	oxygen_req = 8
	nutriment_req = 6
	var/psi_points = 0         //How many points we have currently
	var/max_psi_points = 0
	var/burn
	var/disabled = TRUE        //Whether or not the implant functions.
	var/inhibited = FALSE      //Whether or not the organ has been inhibited by an external force
	var/allow_loop = TRUE      //Used for starting a looping process of regenning poings

	var/list/psion_verbs = list(
		/mob/living/carbon/human/psionic_tumor/proc/psionic_healing,
		/mob/living/carbon/human/psionic_tumor/proc/meditative_focus,
		/mob/living/carbon/human/psionic_tumor/proc/psychosomatictransfer,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_telepathy,
		/mob/living/carbon/human/psionic_tumor/proc/telekineticprowress,
		/mob/living/carbon/human/psionic_tumor/proc/telekineticprowress_end,
		/mob/living/carbon/human/psionic_tumor/proc/pyrokinetic_spark,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_omnitool,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_knife,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_shield,
		/mob/living/carbon/human/psionic_tumor/proc/telekinetic_fist,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_weapon,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_melee,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_tool,
		/mob/living/carbon/human/psionic_tumor/proc/psychic_call,
		/mob/living/carbon/human/psionic_tumor/proc/psychic_banish,
        /mob/living/carbon/human/psionic_tumor/proc/pain_infliction,
		/mob/living/carbon/human/psionic_tumor/proc/pain_transference,
		/mob/living/carbon/human/psionic_tumor/proc/journey_to_nowhere,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_armor,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_swarm,
		/mob/living/carbon/human/psionic_tumor/proc/kinetic_blaster
	)

/obj/item/organ/internal/psionic_tumor/psychiatrist
	name = "cultured flesh"
	psion_verbs = list(
		/mob/living/carbon/human/psionic_tumor/proc/psionic_healing,
		/mob/living/carbon/human/psionic_tumor/proc/meditative_focus,
		/mob/living/carbon/human/psionic_tumor/proc/psychosomatictransfer,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_telepathy,
		/mob/living/carbon/human/psionic_tumor/proc/telekineticprowress,
		/mob/living/carbon/human/psionic_tumor/proc/telekineticprowress_end,
		/mob/living/carbon/human/psionic_tumor/proc/pyrokinetic_spark,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_omnitool,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_knife,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_shield,
		/mob/living/carbon/human/psionic_tumor/proc/telekinetic_fist,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_weapon,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_melee,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_tool,
		/mob/living/carbon/human/psionic_tumor/proc/psychic_call,
		/mob/living/carbon/human/psionic_tumor/proc/psychic_banish,
        /mob/living/carbon/human/psionic_tumor/proc/pain_infliction,
		/mob/living/carbon/human/psionic_tumor/proc/pain_transference,
		/mob/living/carbon/human/psionic_tumor/proc/journey_to_nowhere,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_armor,
		/mob/living/carbon/human/psionic_tumor/proc/kinetic_blaster,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_swarm,
		/mob/living/carbon/human/psionic_tumor/proc/peace_of_mind,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_heal_other,
		/mob/living/carbon/human/psionic_tumor/proc/meditative_focus_other,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_heal_brain,
		/mob/living/carbon/human/psionic_tumor/proc/psionic_gift
	)

/obj/item/organ/internal/psionic_tumor/proc/psion_verb_install()
	owner.verbs |= psion_verbs

/obj/item/organ/internal/psionic_tumor/proc/psion_verb_remove()
	owner.verbs -= psion_verbs
