/obj/item/organ_module/sanity_mind_helper
	name = "S.M.H Enhancer"
	desc = "Sanity Mental Hider is a small set of plates that when attached to key parts of the brain help it keep the users filter out stressful stimulations."
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_GOLD = 3, MATERIAL_SILVER = 3, MATERIAL_PLATINUM = 2,  MATERIAL_DIAMOND = 1)
	allowed_organs = list(BP_HEAD)
	icon_state = "sanity_bank"

/obj/item/organ_module/sanity_mind_helper/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.sanity.max_level += 50
		H.sanity.negative_prob -= 10
		H.sanity.view_damage_threshold -= 15

/obj/item/organ_module/sanity_mind_helper/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.sanity.max_level -= 50
		H.sanity.negative_prob += 10
		H.sanity.view_damage_threshold += 15

//This is not as powerful as you would think, it turns passive regen of 0.2 (out of 200) into 1, out of 200, for **passive** heal ticks
/obj/item/organ_module/sanity_on_a_buget
	name = "Cortex Support Cyberware"
	desc = "A small set of braces, tubes and some wiring to help the user calm down much faster after stressful stimulations."
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_GOLD = 3, MATERIAL_SILVER = 3, MATERIAL_PLATINUM = 2)
	allowed_organs = list(BP_HEAD)
	icon_state = "sanity_regen"

/obj/item/organ_module/sanity_on_a_buget/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.sanity.sanity_passive_gain_multiplier *= 5

/obj/item/organ_module/sanity_on_a_buget/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.sanity.sanity_passive_gain_multiplier /= 5
