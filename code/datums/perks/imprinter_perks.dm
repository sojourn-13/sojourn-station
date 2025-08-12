//You get these via hardware imprinters which are located in code\game\objects\items\devices\hardware_imprinter.dm
////////////////
//Current list//
////////////////

/*
Smartlink/Smartgun - Half of what the kriosan Instinctual Skill (PERK_PERFECT_SHOT) does, nothing more nothing less. | Incompatible with said perk it's based off on
Cognitive Enhancer - Grants 30 cognition and 0.1 (mar'qua have 0.5) bonus to inspiration gain (PERK_INSPIRED) | Incompatible with said mar'qua perk
Chemical Neutralizer - Reduces addiction chance all the way down to 0.1 and increases max NSA by flat 10 (solborn still negates these) does stack with Prospector perk (PERK_PROSPECTOR_CONDITIONING)| Incompatible with Drug Addict (PERK_ADDICT)
*/

/datum/perk/smartlink //Think smartgun from Cyberpunk 2020
	name = "Smartlink Augment"
	desc = "You are augmented with a Smartlink (in some places refered to as Smartgun) making you one with your weapons, allowing you to way better monitor and manage your recoil than a living being normally could."
	gain_text = "You feel as if you were part of your weapon."
	lose_text = "You can no longer feel inner workings of your weapon."
	copy_protected = TRUE

/datum/perk/cognitive_enhancer //Big brain time / To those concerned about nanogate, Mar'qua inspiration rounds to 1.65, Nanogate users get 0.03 to 0.33
	name = "Cognitive Enhancer Augment"
	desc = "You are augmented with a Cognitive Enchancer making you essentially have a second brain. While nowhere near as powerful as the real thing, it does alleviate a lot of strain on your actual brain allowing you to process information faster."
	gain_text = "Your head feels lighter as if huge burden was carried away."
	lose_text = "Your head starts feeling like a boulder again."
	copy_protected = TRUE

/datum/perk/cognitive_enhancer/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_COG, 30)

/datum/perk/cognitive_enhancer/remove()
	holder.stats.changeStat(STAT_COG, -30)
	..()

/datum/perk/chemical_neutralizer //Cleanses brain and helps dealing with chemicals that way
	name = "Chemical Neutralizer Augment"
	desc = "You are augmented with a Chemical Neutralizer, a device capable of correcting chemical imbalance in brain and mandate inhibitor production outright negating almost all side effects of most drugs on the market."
	gain_text = "You feel unnatural calmness."
	lose_text = "Your start to crave after things again."
	copy_protected = TRUE

/datum/perk/chemical_neutralizer/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 0.1
		H.metabolism_effects.nsa_bonus += 10
		H.metabolism_effects.calculate_nsa()

/datum/perk/chemical_neutralizer/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1
		H.metabolism_effects.nsa_bonus -= 10
		H.metabolism_effects.calculate_nsa()
	..()
