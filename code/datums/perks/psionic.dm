/datum/perk/psion
	name = "Psionic"
	desc = "You have, through some method you may or may not understand, delved into the secrets of psionic ascension and gained powers beyond your understanding. While your mind has become far strong, \
	your body has weakened slightly. You take increased damage from all sources and require a bit more food to support the specialized organs you've developed. Addtionally, you must always maintain \
	purity of body, any implants, cruciforms, or synthetics will be violently rejected as long as your psionic organ is in your head."
	gain_text = "You suddenly get a splitting headache before your vision blurs painfully. By the time its over, you feel like a whole new world of possibilities has opened for you."

/datum/perk/psion/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk *= 1.15
	holder.burn_mod_perk *= 1.15
	holder.oxy_mod_perk *= 1.15
	holder.toxin_mod_perk *= 1.15

/datum/perk/psion/remove()
	holder.brute_mod_perk /= 1.15
	holder.burn_mod_perk /= 1.15
	holder.oxy_mod_perk /= 1.15
	holder.toxin_mod_perk /= 1.15
	..()
