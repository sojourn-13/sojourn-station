//For perks granted by augmentations such as non-core implants. They don't really fit anywhere else.
//Should probably move the hardware imprinter ones here.
////////////////
//Current list//
////////////////

/datum/perk/augmentation/subdermal
	name = "Subdermal Armor"
	desc = "Armored plating installed beneath your skin protects you from physical trauma. It is not every effective at resisting high energy discharge, however."
	gain_text = "You feel a strange weight to your movements that you gradually become accustomed to, a new layer of protection just out of sight."
	icon_state = "riotshield"

/datum/perk/augmentation/subdermal/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.3

/datum/perk/augmentation/subdermal/remove()
	holder.brute_mod_perk += 0.3
	..()
