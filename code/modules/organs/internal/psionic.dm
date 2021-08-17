/obj/item/organ/internal/psionic_tumor
	name = "ascended flesh"
	health = 400 //They need to live awhile longer than other organs. Is this even used by organ code anymore?
	desc = "A tumorous mass that resembles a pulsating muscle-like brain. It's uncomfortable to look at..."
	organ_efficiency = list(BP_PSION = 100)
	parent_organ_base = BP_HEAD
	icon_state = "psion_tumor"
	force = 1.0
	w_class = ITEM_SIZE_SMALL
	specific_organ_size = 2
	throwforce = 1.0
	throw_speed = 3
	throw_range = 5
	layer = ABOVE_MOB_LAYER
	origin_tech = list(TECH_BIO = 6)
	attack_verb = list("attacked", "slapped", "whacked")
	price_tag = 12000
	blood_req = 8
	max_blood_storage = 80
	oxygen_req = 8
	nutriment_req = 6
	var/psi_points = 0
	var/max_psi_points = 0
	var/last_psi_point_gain
	var/psi_point_cost

	owner_verbs = list(
		/obj/item/organ/internal/psionic_tumor/proc/psionic_healing,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_omnitool,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_knife,
		/obj/item/organ/internal/psionic_tumor/proc/telekinetic_fist,
		/obj/item/organ/internal/psionic_tumor/proc/psychosomatictransfer,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress,
		/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress_end,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_tool,
		/obj/item/organ/internal/psionic_tumor/proc/psionic_weapon,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_call,
		/obj/item/organ/internal/psionic_tumor/proc/psychic_banish,
		/obj/item/organ/internal/psionic_tumor/proc/journey_to_nowhere
	)
