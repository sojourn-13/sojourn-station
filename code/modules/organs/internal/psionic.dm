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
	var/psi_point_cost
	var/inhibited = FALSE      //Whether or not the organ has been inhibited by an external force
	var/allow_loop = TRUE      //Used for starting a looping process of regenning poings

	owner_verbs = list(
		/obj/item/organ/internal/psionic_tumor/proc/psionic_healing,
		/obj/item/organ/internal/psionic_tumor/proc/meditative_focus,
		/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress_end,
		/obj/item/organ/internal/psionic_tumor/proc/pyrokinetic_spark,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_knife,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_shield,
		/obj/item/organ/internal/psionic_tumor/proc/telekinetic_fist,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_weapon,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_melee,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_tool,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_call,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_banish,
		/obj/item/organ/internal/psionic_tumor/proc/journey_to_nowhere,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_armor,
		/obj/item/organ/internal/psionic_tumor/proc/kinetic_blaster
	)

/obj/item/organ/internal/psionic_tumor/psychiatrist
	name = "cultured flesh"
	owner_verbs = list(
		/obj/item/organ/internal/psionic_tumor/proc/psionic_healing,
		/obj/item/organ/internal/psionic_tumor/proc/meditative_focus,
		/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress_end,
		/obj/item/organ/internal/psionic_tumor/proc/pyrokinetic_spark,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_knife,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_shield,
		/obj/item/organ/internal/psionic_tumor/proc/telekinetic_fist,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_weapon,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_melee,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_tool,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_call,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_banish,
		/obj/item/organ/internal/psionic_tumor/proc/journey_to_nowhere,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_armor,
		/obj/item/organ/internal/psionic_tumor/proc/kinetic_blaster,
		// Psych unique powers just for them. Do not add these to other lists. -Kaz
		/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_other,
		/obj/item/organ/internal/psionic_tumor/proc/meditative_focus_other,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_heal_brain,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_gift
	)
