/obj/item/organ_module/sanity_mind_helper
	name = "S.M.H Module"
	desc = "Sanity Mental Hider is an assortment of electrodes that apply low-voltage pulses to certain areas of the brain to numb the user's \
	perception of stress. A design that already proved itself invaluable in mental health field, as well as dirty frontier work."
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
	name = "Cortex Support Implant"
	desc = "A complicated set of tubes, braces and wiring all hooked up to the user's prefrontal cortex and amygdala in a very delicate manner. It works by \
	applying low voltage pulses to achieve a sense of tranquility as well as slow down the supply of adrenaline to the brain. In essence, stress recovery is much faster."
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
