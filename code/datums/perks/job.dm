/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost... somehow."
	//icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/active_inspiration
	name = "Exotic Inspiration (Active)"
	//icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/active_inspiration/assign(mob/living/carbon/human/H)
	..()
	holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/active_inspiration/remove()
	holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/timeismoney
	name = "Time is Money"
	desc = "Sometimes you just need to run away from a bad deal, so fast you forget how to use your hands as you sprint."
	var/cooldown_time = 0
	active = FALSE
	toggleable = TRUE

/datum/perk/timeismoney/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You feel tired, you will need to rest for a bit before using this ability again."))
		return FALSE
	cooldown_time = world.time + 7 MINUTES
	addtimer(CALLBACK(src, .proc/deactivate), 1 MINUTES)
	return ..()

/datum/perk/selfmedicated
	name = "Medical Expertise"
	desc = "You've been trained in the art of Soteria medicine, applying chemicals in the most efficient ways to lessen addiction chance and prevent as much nerve shock."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/selfmedicated/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 0.5
	holder.metabolism_effects.nsa_threshold += 10

/datum/perk/selfmedicated/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold -= 10
	..()

/datum/perk/solborn
	name = "Sol Born"
	desc = "Clean living in the Sol System has prevented you from building up a tolerance to most chemicals, your body can't handle the more hardcore drugs that most can and you find yourself getting \
	addicted slightly easier."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/solborn/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 1.2
	holder.metabolism_effects.nsa_threshold -= 15

/datum/perk/solborn/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold += 15
	..()

/datum/perk/addict
	name = "Chem Addict"
	desc = "You've been an addict all your life, for whatever piss poor reason you've told yourself. Your body is able to handle a variety of drugs, more than the average person, but you get \
	easily addicted to most of them."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/addict/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_threshold += 20

/datum/perk/addict/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold -= 20
	..()

/datum/perk/merchant
	name = "Greedy at Heart"
	desc = "Money is what matters for you, and it's so powerful it lets you improve your skills the more you have on your person."
	//icon_state = "merchant" // https://game-icons.net/1x1/lorc/cash.html and https://game-icons.net/1x1/delapouite/graduate-cap.html slapped on https://game-icons.net/1x1/lorc/trade.html

/datum/perk/merchant/assign(mob/living/carbon/human/H)
	..()
	holder.sanity.valid_inspirations += /obj/item/weapon/spacecash/bundle

/datum/perk/merchant/remove()
	holder.sanity.valid_inspirations -= /obj/item/weapon/spacecash/bundle
	..()

/datum/perk/sanityboost
	name = "True Faith"
	desc = "When near an obelisk, you feel your mind at ease. You slowly heal due to its latent effects."
	//icon_state = "sanityboost" // https://game-icons.net/1x1/lorc/templar-eye.html

/datum/perk/sanityboost/assign(mob/living/carbon/human/H)
	..()
	H.adjustOxyLoss(-0.6)
	H.heal_organ_damage(0.3)
	H.adjustToxLoss(-0.3)
	H.add_chemical_effect(CE_BLOODCLOT, 0.1)

/datum/perk/sanityboost/remove()
	holder.adjustOxyLoss(-0.6)
	holder.heal_organ_damage(0.3)
	holder.adjustToxLoss(-0.3)
	holder.add_chemical_effect(CE_BLOODCLOT, 0.1)
	..()