/datum/perk/nanogate
	name = "Spinal Nanite Implant"
	desc = "You have a nanogate implant in your spine."
	gain_text = "Your spine hurt for a bit."

/datum/perk/nanite_regen
	name = "Nanite Regeneration"
	desc = "You set the nanites in your body to the task of repairing your body of any damage it got."
	gain_text = "Your spine hurt for a bit as the nanites start repairing the damage."
	var/regen_rate = 1

/datum/perk/nanite_muscle
	name = "Nanite Muscles"
	desc = "You set the nanites in your body to the task of making you move fast."
	gain_text = "Your spine hurt for a bit as the nanites start make you faster."
	var/speed_bonus = 0.3

/datum/perk/nanite_muscle/assign(mob/living/carbon/human/H)
	..()
	H.tally -= speed_bonus

/datum/perk/nanite_muscle/remove()
	..()
	H.tally += speed_bonus

/datum/perk/nanite_armor
	name = "Nanite Armor"
	desc = "You set the nanites in your body to the task of making you more resilient."
	gain_text = "Your spine hurt for a bit as the nanites reinforce your body."
	var/armor_mod = 0.3

/datum/perk/nanite_muscle/assign(mob/living/carbon/human/H)
	..()
	H.brute_mod -= armor_mod

/datum/perk/nanite_muscle/remove()
	..()
	H.brute_mod += armor_mod
