
/datum/perk/data_collector
	name = "Augment: Data Collection Armor Plating"
	desc = "The pinical of GP Adaptive Armor plating has been installed into you, hopefully you can interface with it for it to function."
	gain_text = "You are implanted with some high tech stuff!"
	lose_text = "You are no longer implanted with high tech armor plating."
	var/list/armor = list(melee = -10, bullet = -10, energy = -10, bomb = -10, bio = 100, rad = 100) //Starting wise we are less then armorless

/datum/perk/adaptive_exoskeleton
	name = "Adaptive Exoskeleton"
	desc = "The chiten ever mending and repairing itself making every layer stronger then the last."
	gain_text = "Your form when ripped and teared grows a harder shell over the wound"
	lose_text = "Your built up shell flakes off and refuses to grow."
	var/list/armor = list(melee = 10, bullet = 8, energy = 6, bomb = 0, bio = 0, rad = 0, agony = 0)

//The armor can only get so strong before it no longer can sustain improvement, a limit for a lower being.
/datum/perk/adaptive_exoskeleton/proc/cap_check()
	for(var/armor_horrors in armor)
		if(armor_horrors == "melee")
			if(armor[armor_horrors] >= 20)
				armor[armor_horrors] = 20
			if(armor[armor_horrors] == 0)
				armor[armor_horrors] = -0.25
		if(armor_horrors == "bullet")
			if(armor[armor_horrors] >= 16)
				armor[armor_horrors] = 16
			if(armor[armor_horrors] == 0)
				armor[armor_horrors] = -0.25
		if(armor_horrors == "energy")
			if(armor[armor_horrors] >= 12)
				armor[armor_horrors] = 12
			if(armor[armor_horrors] == 0)
				armor[armor_horrors] = -0.25
