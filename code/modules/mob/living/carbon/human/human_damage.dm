//Updates the mob's health from organs and mob damage variables
/mob/living/carbon/human/updatehealth()
	if(status_flags & GODMODE)
		health = maxHealth
		stat = CONSCIOUS
		return

	var/total_burn  = 0
	var/total_brute = 0
	var/total_internal = 0
	var/unhealth_factor = 0

	for(var/obj/item/organ/external/O in organs)
		if(O.vital)
			total_brute += O.brute_dam
			total_burn  += O.burn_dam
			total_internal += O.severity_internal_wounds
		else
			//If your lim is damaged and its not vital its 2 damage to 1 health loss
			//This is to help simulate shock as well as help balance out issues with imortal beings
			unhealth_factor += (O.brute_dam * 0.5)
			unhealth_factor  += (O.burn_dam * 0.5)
			unhealth_factor += (O.severity_internal_wounds * 0.5)


	var/oxy_l = ((species.flags & NO_BREATHE) ? 0 : getOxyLoss())

	health = maxHealth - oxy_l - total_burn - total_brute - total_internal - unhealth_factor
	LEGACY_SEND_SIGNAL(src, COMSIG_HUMAN_HEALTH, health)
	return

/mob/living/carbon/human/adjustBrainLoss(var/amount)

	if(status_flags & GODMODE)
		return FALSE	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/vital/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			sponge.take_damage(amount)
			brainloss = (sponge.damage / sponge.max_damage) * 200
		else
			brainloss = 200
	else
		brainloss = 0

/mob/living/carbon/human/setBrainLoss(var/amount)

	if(status_flags & GODMODE)
		return FALSE	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/vital/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			sponge.take_damage(amount)
			brainloss = (sponge.damage / sponge.max_damage) * 200
		else
			brainloss = 200
	else
		brainloss = 0

/mob/living/carbon/human/getBrainLoss()

	if(status_flags & GODMODE)
		return FALSE	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/vital/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			brainloss = (sponge.damage / sponge.max_damage) * 200
		else
			brainloss = 200
	else
		brainloss = 0
	return brainloss

//These procs fetch a cumulative total damage from all organs
/mob/living/carbon/human/getBruteLoss()
	var/amount = 0
	for(var/obj/item/organ/external/O in organs)
		if(BP_IS_ROBOTIC(O))
			continue //robot limbs don't count towards shock and crit
		amount += O.brute_dam
	return amount

/mob/living/carbon/human/getFireLoss()
	var/amount = 0
	for(var/obj/item/organ/external/O in organs)
		if(BP_IS_ROBOTIC(O))
			continue //robot limbs don't count towards shock and crit
		amount += O.burn_dam
	return amount


/mob/living/carbon/human/adjustBruteLoss(var/amount)
	if(amount > 0)
		take_overall_damage(amount, 0)
	else
		heal_overall_damage(-amount, 0)
	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/adjustFireLoss(var/amount)
	if(amount > 0)
		take_overall_damage(0, amount)
	else
		heal_overall_damage(0, -amount)
	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/proc/adjustBruteLossByPart(var/amount, var/organ_name, var/obj/damage_source = null)
	if (organ_name in organs_by_name)
		var/obj/item/organ/external/O = get_organ(organ_name)

		if(amount > 0)
			O.take_damage(amount, 0, sharp=is_sharp(damage_source), edge=has_edge(damage_source), used_weapon=damage_source)
		else
			//if you don't want to heal robot organs, they you will have to check that yourself before using this proc.
			O.heal_damage(-amount, 0, robo_repair=(BP_IS_ROBOTIC(O)))

	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/proc/adjustFireLossByPart(var/amount, var/organ_name, var/obj/damage_source = null)
	if (organ_name in organs_by_name)
		var/obj/item/organ/external/O = get_organ(organ_name)

		if(amount > 0)
			O.take_damage(0, amount, sharp=is_sharp(damage_source), edge=has_edge(damage_source), used_weapon=damage_source)
		else
			//if you don't want to heal robot organs, they you will have to check that yourself before using this proc.
			O.heal_damage(0, -amount, robo_repair=(BP_IS_ROBOTIC(O)))

	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/Stun(amount)
	if(HULK in mutations)	return
	..()

/mob/living/carbon/human/Weaken(amount)
	if(HULK in mutations)	return
	..()

/mob/living/carbon/human/Paralyse(amount)
	if(HULK in mutations)	return
	// Notify our AI if they can now control the suit.
	if(wearing_rig && !stat && paralysis < amount) //We are passing out right this second.
		wearing_rig.notify_ai(SPAN_DANGER("Warning: user consciousness failure. Mobility control passed to integrated intelligence system."))
	..()

/mob/living/carbon/human/getCloneLoss()
	return

/mob/living/carbon/human/setCloneLoss(var/amount)
	adjustCloneLoss(amount)

/mob/living/carbon/human/adjustCloneLoss(var/amount)
	if(species.flags & (NO_SCAN))
		cloneloss = 0
		return

	var/mut_prob = min(80, amount+10)
	if (amount > 0)
		if (prob(mut_prob))
			var/list/obj/item/organ/external/candidates = list()
			for (var/obj/item/organ/external/O in organs)
				if(!(O.status & ORGAN_MUTATED))
					candidates |= O
			if (candidates.len)
				var/obj/item/organ/external/O = pick(candidates)
				O.mutate()
				to_chat(src, "<span class = 'notice'>Something is not right with your [O.name]...</span>")
				return

	BITSET(hud_updateflag, HEALTH_HUD)

// Defined here solely to take species flags into account without having to recast at mob/living level.
/mob/living/carbon/human/getOxyLoss()
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	return ..()

/mob/living/carbon/human/adjustOxyLoss(amount)
	if(in_stasis && amount > 0)		// Stasis prevents oxy loss
		return
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	else
		amount = amount*species.oxy_mod*src.oxy_mod_perk
		if(stats.getPerk(PERK_LUNGS_OF_IRON) && amount > 0)
			amount *= 0.5
		//Does not completely protect against damage, as that would lead to cases of immorality if stacked a lot.
		if(amount > 1 && oxy_armor)
			amount = max(1, amount - oxy_armor)
		..(amount)

/mob/living/carbon/human/setOxyLoss(var/amount)
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	else
		..()

/mob/living/carbon/human/getToxLoss()
	return

/mob/living/carbon/human/adjustToxLoss()
	return

/mob/living/carbon/human/setToxLoss()
	return

/mob/living/carbon/human/adjustHalLoss(amount)
	if(species.flags & NO_PAIN)
		return FALSE    //lmao pain
	if(PAIN_LESS in mutations)
		return FALSE    //lmao pain
	..()

////////////////////////////////////////////

//Returns a list of damaged organs
/mob/living/carbon/human/proc/get_damaged_organs(var/brute, var/burn)
	var/list/obj/item/organ/external/parts = list()
	for(var/obj/item/organ/external/O in organs)
		if((brute && O.brute_dam) || (burn && O.burn_dam))
			parts += O
	return parts

//Returns a list of damageable organs
/mob/living/carbon/human/proc/get_damageable_organs()
	var/list/obj/item/organ/external/parts = list()
	for(var/obj/item/organ/external/O in organs)
		if(O.is_damageable())
			parts += O
	return parts

//Heals ONE external organ, organ gets randomly selected from damaged ones.
//It automatically updates damage over-lays if necesary
//It automatically updates health status
/mob/living/carbon/human/heal_organ_damage(var/brute, var/burn, var/additionally_brute_percent = 0, var/additionaly_burn_percent = 0)
	var/list/obj/item/organ/external/parts = get_damaged_organs(brute,burn)
	if(!parts.len)	return
	var/obj/item/organ/external/picked = pick(parts)
	if(picked.heal_damage(brute + (picked.brute_dam/100 * additionally_brute_percent),burn + (picked.burn_dam/100 * additionaly_burn_percent)))
		UpdateDamageIcon()
		BITSET(hud_updateflag, HEALTH_HUD)
	updatehealth()


/*
In most cases it makes more sense to use apply_damage() instead! And make sure to check armour if applicable.
*/
//Damages ONE external organ, organ gets randomly selected from damagable ones.
//It automatically updates damage over-lays if necesary
//It automatically updates health status
/mob/living/carbon/human/take_organ_damage(var/brute, var/burn, var/sharp = 0, var/edge = 0)
	var/list/obj/item/organ/external/parts = get_damageable_organs()
	if(!parts.len)	return
	var/obj/item/organ/external/picked = pick(parts)
	if(picked.take_damage(brute,burn,sharp,edge))
		UpdateDamageIcon()
		BITSET(hud_updateflag, HEALTH_HUD)
	updatehealth()
	speech_problem_flag = 1


//Heal MANY external organs, in random order
/mob/living/carbon/human/heal_overall_damage(var/brute, var/burn, var/robo_repair = 0)
	var/list/obj/item/organ/external/parts = get_damaged_organs(brute,burn)
	var/update = 0
	while(parts.len && (brute>0 || burn>0) )
		var/obj/item/organ/external/picked = pick(parts)

		var/brute_was = picked.brute_dam
		var/burn_was = picked.burn_dam

		update |= picked.heal_damage(brute,burn,robo_repair)

		brute -= (brute_was-picked.brute_dam)
		burn -= (burn_was-picked.burn_dam)

		parts -= picked
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	speech_problem_flag = 1
	if(update)	UpdateDamageIcon()

// damage MANY external organs, in random order
/mob/living/carbon/human/take_overall_damage(brute, burn, sharp = FALSE, edge = FALSE, used_weapon)
	if(status_flags & GODMODE)	return	//godmode
	var/list/obj/item/organ/external/parts = get_damageable_organs()
	var/update = 0
	while(parts.len && (brute>0 || burn>0) )
		var/obj/item/organ/external/picked = pick(parts)

		var/brute_was = picked.brute_dam
		var/burn_was = picked.burn_dam

		update |= picked.take_damage(brute, BRUTE, sharp = sharp, edge = edge, used_weapon = used_weapon)
		update |= picked.take_damage(burn, BURN, sharp = sharp, edge = edge, used_weapon = used_weapon)
		brute	-= (picked.brute_dam - brute_was)
		burn	-= (picked.burn_dam - burn_was)

		parts -= picked
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	if(update)
		UpdateDamageIcon()


////////////////////////////////////////////

/*
This function restores the subjects blood to max.
*/
/mob/living/carbon/human/proc/restore_blood()
	if(species.flags & NO_BLOOD)
		return
	if(vessel.total_volume < species.blood_volume)
		vessel.add_reagent("blood", species.blood_volume - vessel.total_volume)

/*
This function restores all organs.
*/
/mob/living/carbon/human/restore_all_organs()
	for(var/obj/item/organ/external/current_organ in organs)
		current_organ.rejuvenate()

/mob/living/carbon/human/proc/HealDamage(zone, brute, burn)
	var/obj/item/organ/external/E = get_organ(zone)
	if(istype(E, /obj/item/organ/external))
		if (E.heal_damage(brute, burn))
			UpdateDamageIcon()
			BITSET(hud_updateflag, HEALTH_HUD)
	else
		return 0
	return


/mob/living/carbon/human/proc/get_organ(var/zone)
	RETURN_TYPE(/obj/item/organ/external)
	if(!zone)
		zone = BP_CHEST
	else if(zone in list(BP_EYES, BP_MOUTH))
		zone = BP_HEAD
	return organs_by_name[zone]

/mob/living/carbon/human/apply_damage(damage = 0, damagetype = BRUTE, def_zone, armor_divisor = 1, wounding_multiplier = 1, sharp = FALSE, edge = FALSE, obj/used_weapon, armor_divisor)

	//visible_message("Hit debug. [damage] | [damagetype] | [def_zone] | [blocked] | [sharp] | [used_weapon]")

	//Order of operations here, we dont want to even try and check synths past this point
	if(species?.reagent_tag != IS_SYNTHETIC && damagetype == TOX)
		return

	//Handle other types of damage

	if(damagetype != BRUTE && damagetype != BURN)
		if(damagetype == HALLOSS && !((species.flags & NO_PAIN) || (PAIN_LESS in mutations)))
			if(!stat && (damage > 25 && prob(20)) || (damage > 50 && prob(60)))
				emote("painscream")

		if(damagetype == PSY)
			sanity.onPsyDamage(damage)
			var/obj/item/organ/brain = random_organ_by_process(BP_BRAIN)
			brain.take_damage(damage, PSY, (armor_divisor * 0.1), wounding_multiplier)
			return TRUE

		if(damagetype == TOX && stats.getPerk(PERK_BLOOD_OF_LEAD))
			damage /= 2

		. = ..(damage, damagetype, def_zone)
	else	//Handle BRUTE and BURN damage
		handle_suit_punctures(damagetype, damage, def_zone)
		//We're moving these calculations to organ/external/take_damage for ease of maintenance.
		// switch(damagetype)
		// 	if(BRUTE)
		// 		damage = (damage*species.brute_mod)*src.brute_mod_perk
		// 	if(BURN)
		// 		damage = (damage*species.burn_mod)*src.burn_mod_perk

	var/obj/item/organ/external/organ = null
	if(isorgan(def_zone))
		organ = def_zone
	else
		if(!def_zone)
			def_zone = ran_zone(def_zone)
		organ = get_organ(check_zone(def_zone))
	if(!organ)
		return FALSE

	damageoverlaytemp = 20
	if(organ.take_damage(damage, damagetype, armor_divisor, wounding_multiplier, sharp, edge, used_weapon))
		UpdateDamageIcon()

	sanity.onDamage(damage)

	// Will set our damageoverlay icon to the next level, which will then be set back to the normal level the next mob.Life().
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	return TRUE


//Falling procs
/mob/living/carbon/human/get_fall_damage(var/turf/from, var/turf/dest)
	var/damage = 15 * falls_mod

	if(from && dest)
		damage *= abs(from.z - dest.z)

	return damage

