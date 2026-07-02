/mob/living/carbon/superior/spider/uniquic_isValidAttackTarget(atom/O)
	//Normal isliving checks to not over-ride them.
	if(isliving(O))
		var/mob/living/L = O
		var/datum/perk/cooldown/malice_of_weeve/MW = L.stats.getPerk(PERK_MALICE_WEEVE)
		if(MW)
			//Your not apart of the family are you?
			if(L.faction == faction && MW.gruges + MW.malice > 3)
				return TRUE

//Slowly but surely understand who is and is not apart of the family
/mob/living/carbon/superior/spider/react_to_attack(var/mob/living/carbon/superior/source = src, var/obj/item/attacked_with, var/atom/attacker, params)
	..()
	if(attacked_with && (isprojectile(attacked_with)))
		var/obj/item/projectile/Proj = attacked_with
		if (!Proj.testing)
			if(Proj.silenced && prob(80)) //Gives silenced weapons more use
				return
			if(isliving(Proj.original_firer))
				var/mob/living/L = Proj.original_firer
				var/datum/perk/cooldown/malice_of_weeve/MW = L.stats.getPerk(PERK_MALICE_WEEVE)
				if(!MW) //Are malice will exstend to you
					L.stats.addPerk(PERK_MALICE_WEEVE)
					MW = L.stats.getPerk(PERK_MALICE_WEEVE)
				MW.gruges += 0.02
				MW.perk_lifetime += 1 SECONDS
			return

	if(isliving(attacker))
		var/mob/living/L = attacker
		var/datum/perk/cooldown/malice_of_weeve/MW = L.stats.getPerk(PERK_MALICE_WEEVE)
		if(!MW) //Are malice will exstend to you
			L.stats.addPerk(PERK_MALICE_WEEVE)
			MW = L.stats.getPerk(PERK_MALICE_WEEVE)
		MW.gruges += 0.05
		MW.perk_lifetime += 2 SECONDS
	return


/mob/living/carbon/superior/spider/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)

	if(!damage || !istype(user))
		return

	if(isliving(user))
		var/mob/living/L = user
		var/datum/perk/cooldown/malice_of_weeve/MW = L.stats.getPerk(PERK_MALICE_WEEVE)
		if(!MW) //Are malice will exstend to you
			L.stats.addPerk(PERK_MALICE_WEEVE)
			MW = L.stats.getPerk(PERK_MALICE_WEEVE)
		MW.gruges += 0.05
		MW.perk_lifetime += 2 SECONDS

	..()
