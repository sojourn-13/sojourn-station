/obj/item/modification/organ/internal/special
	name = "membrane"
	desc = "A graftable outer membrane for organ tissues."
	icon_state = "membrane"

/obj/item/modification/organ/internal/special/update_icon()
	icon_state = initial(icon_state) + "-[rand(1,5)]"

/obj/item/modification/organ/internal/special/on_examine

/obj/item/modification/organ/internal/special/on_examine/brainloss
	name = "eldritch membrane"
	desc = "A graftable outer membrane for organ tissues. The alien textures are painful to look at."

/obj/item/modification/organ/internal/special/on_examine/brainloss/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	AddComponent(/datum/component/modification/organ/on_examine/brainloss)
	..()


/obj/item/modification/organ/internal/special/on_pickup

/obj/item/modification/organ/internal/special/on_pickup/shock
	name = "shocking membrane"
	desc = "A graftable outer membrane for organ tissues. There is bioelectric phenomena present and it hurts to touch."
	icon_state = "membrane-hive"

/obj/item/modification/organ/internal/special/on_pickup/shock/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	AddComponent(/datum/component/modification/organ/on_pickup/shock)
	..()

/obj/item/modification/organ/internal/special/on_pickup/shock/update_icon()
	return

/obj/item/modification/organ/internal/special/on_pickup/shock/powerful
	name = "powerful shocking membrane"
	desc = "A graftable outer membrane for organ tissues. There is significant bioelectric phenomena present and it hurts to touch."
	
/obj/item/modification/organ/internal/special/on_pickup/shock/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	AddComponent(/datum/component/modification/organ/on_pickup/shock/powerful)
	..()


/obj/item/modification/organ/internal/special/on_cooldown

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect
	name = "endocrinal membrane"
	desc = "A graftable membrane for organ tissues. Secretes hormones when the primary organ function triggers."

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_special_info)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	if(chosen_special_info?.len >= 2)
		S.effect = chosen_special_info[1]
		S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[S.effect] * chosen_special_info[2]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/bloodrestore
/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/bloodrestore/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	S.effect = CE_BLOODRESTORE
	S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[CE_BLOODRESTORE]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/bloodclot
/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/bloodclot/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	S.effect = CE_BLOODCLOT
	S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[CE_BLOODCLOT]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/painkiller
/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/painkiller/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	S.effect = CE_PAINKILLER
	S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[CE_PAINKILLER]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/antitox
/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/antitox/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	S.effect = CE_ANTITOX
	S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[CE_ANTITOX]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/speedboost
/obj/item/modification/organ/internal/special/on_cooldown/chemical_effect/speedboost/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/chemical_effect/S = AddComponent(/datum/component/modification/organ/on_cooldown/chemical_effect)

	S.effect = CE_SPEEDBOOST
	S.magnitude = ALL_USABLE_POSITIVE_CHEM_EFFECTS[CE_SPEEDBOOST]
	..()


/obj/item/modification/organ/internal/special/on_cooldown/stat_boost
	name = "superior endocrinal membrane"
	desc = "A graftable membrane for organ tissues. Secretes stimulating hormones when the primary organ function triggers."

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/New(loc, generate_organ_stats = FALSE, predefined_modifier = null, list/chosen_special_info)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	if(chosen_special_info?.len >= 3)
		S.stat = chosen_special_info[1]
		S.boost = chosen_special_info[2]
		S.delay = chosen_special_info[3]
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/mechanical_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/mechanical_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_MEC
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/cognition_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/cognition_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_COG
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/biology_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/biology_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_BIO
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/robustness_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/robustness_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_ROB
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/toughness_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/toughness_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_TGH
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()

/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/vigilance_5
/obj/item/modification/organ/internal/special/on_cooldown/stat_boost/vigilance_5/New(loc, generate_organ_stats = FALSE, predefined_modifier = null)
	var/datum/component/modification/organ/on_cooldown/stat_boost/S = AddComponent(/datum/component/modification/organ/on_cooldown/stat_boost)

	S.stat = STAT_VIG
	S.boost = 5
	S.delay = STANDARD_ABERRANT_STIM_TIME
	..()
