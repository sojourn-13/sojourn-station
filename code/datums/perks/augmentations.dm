//For perks granted by augmentations such as non-core implants. They don't really fit anywhere else.
//Should probably move the hardware imprinter ones here.
////////////////
//Current list//
////////////////

/datum/perk/augmentation
	gain_text = "The flesh is weak. But you have been made more."

/datum/perk/augmentation/subdermal
	name = "Subdermal Armor"
	desc = "Lightweight plating installed beneath your skin protects you from impact damage. It is not every effective at resisting high energy discharge."
	gain_text = "You feel a strange weight across your body that you gradually become accustomed to, a layer of protection just beneath your skin."
	icon_state = "riotshield"

/datum/perk/augmentation/subdermal/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.3

/datum/perk/augmentation/subdermal/remove()
	holder.brute_mod_perk += 0.3
	..()
