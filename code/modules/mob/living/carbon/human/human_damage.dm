//Updates the mob's health from organs and mob damage variables
/mob/living/carbon/human/updatehealth()

	if(status_flags & GODMODE)
		health = maxHealth
		stat = CONSCIOUS
		return
	var/total_burn  = 0
	var/total_brute = 0
	for(var/obj/item/organ/external/O in organs)	//hardcoded to streamline things a bit
		if(BP_IS_ROBOTIC(O) && !O.vital)
			continue //*non-vital* robot limbs don't count towards shock and crit
		total_brute += O.brute_dam
		total_burn  += O.burn_dam

	var/oxy_l = ((species.flags & NO_BREATHE) ? 0 : getOxyLoss())
	var/tox_l = ((species.flags & NO_POISON) ? 0 : getToxLoss())
	var/clone_l = getCloneLoss()

	health = maxHealth - oxy_l - tox_l - clone_l - total_burn - total_brute
	LEGACY_SEND_SIGNAL(src, COMSIG_HUMAN_HEALTH, health)
	//TODO: fix husking
	if( (total_burn > 400) && stat == DEAD)
		ChangeToHusk()
	return

/mob/living/carbon/human/adjustBrainLoss(var/amount)

	if(status_flags & GODMODE)	return 0	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			sponge.take_damage(amount)
			brainloss = sponge.damage
		else
			brainloss = 200
	else
		brainloss = 0

/mob/living/carbon/human/setBrainLoss(var/amount)

	if(status_flags & GODMODE)	return 0	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			sponge.damage = min(max(amount, 0),(maxHealth*2))
			brainloss = sponge.damage
		else
			brainloss = 200
	else
		brainloss = 0

/mob/living/carbon/human/getBrainLoss()

	if(status_flags & GODMODE)	return 0	//godmode

	if(species && species.has_process[BP_BRAIN])
		var/obj/item/organ/internal/brain/sponge = random_organ_by_process(BP_BRAIN)
		if(sponge)
			brainloss = min(sponge.damage,maxHealth*2)
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
	amount = amount*species.brute_mod*src.brute_mod_perk
	if(amount > 0)
		take_overall_damage(amount, 0)
	else
		heal_overall_damage(-amount, 0)
	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/adjustFireLoss(var/amount)
	amount = amount*species.burn_mod*src.burn_mod_perk
	if(amount > 0)
		take_overall_damage(0, amount)
	else
		heal_overall_damage(0, -amount)
	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/proc/adjustBruteLossByPart(var/amount, var/organ_name, var/obj/damage_source = null)
	amount = amount*species.brute_mod*src.brute_mod_perk
	if (organ_name in organs_by_name)
		var/obj/item/organ/external/O = get_organ(organ_name)

		if(amount > 0)
			O.take_damage(amount, 0, sharp=is_sharp(damage_source), edge=has_edge(damage_source), used_weapon=damage_source)
		else
			//if you don't want to heal robot organs, they you will have to check that yourself before using this proc.
			O.heal_damage(-amount, 0, robo_repair=(BP_IS_ROBOTIC(O)))

	BITSET(hud_updateflag, HEALTH_HUD)

/mob/living/carbon/human/proc/adjustFireLossByPart(var/amount, var/organ_name, var/obj/damage_source = null)
	amount = amount*species.burn_mod*src.burn_mod_perk
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
	if(species.flags & (NO_SCAN))
		cloneloss = 0
	return ..()

/mob/living/carbon/human/setCloneLoss(var/amount)
	if(species.flags & (NO_SCAN))
		cloneloss = 0
	else
		..()

/mob/living/carbon/human/adjustCloneLoss(var/amount)
	..()

	if(species.flags & (NO_SCAN))
		cloneloss = 0
		return

	var/heal_prob = max(0, 80 - getCloneLoss())
	var/mut_prob = min(80, getCloneLoss()+10)
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
	else
		if (prob(heal_prob))
			for (var/obj/item/organ/external/O in organs)
				if (O.status & ORGAN_MUTATED)
					O.unmutate()
					to_chat(src, "<span class = 'notice'>Your [O.name] is shaped normally again.</span>")
					return

	if (getCloneLoss() < 1)
		for (var/obj/item/organ/external/O in organs)
			if (O.status & ORGAN_MUTATED)
				O.unmutate()
				to_chat(src, "<span class = 'notice'>Your [O.name] is shaped normally again.</span>")
	BITSET(hud_updateflag, HEALTH_HUD)

// Defined here solely to take species flags into account without having to recast at mob/living level.
/mob/living/carbon/human/getOxyLoss()
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	return ..()

/mob/living/carbon/human/adjustOxyLoss(amount)
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	else
		amount = amount*species.oxy_mod*src.oxy_mod_perk
		if(stats.getPerk(PERK_LUNGS_OF_IRON) && amount > 0)
			amount *= 0.5
		..(amount)

/mob/living/carbon/human/setOxyLoss(var/amount)
	if(species.flags & NO_BREATHE)
		oxyloss = 0
	else
		..()

/mob/living/carbon/human/getToxLoss()
	if(species.flags & NO_POISON)
		toxloss = 0
	return ..()

/mob/living/carbon/human/adjustToxLoss(amount)
	if(species.flags & NO_POISON)
		toxloss = 0
	else
		amount = amount*species.toxins_mod*src.toxin_mod_perk
		if(stats.getPerk(PERK_BLOOD_OF_LEAD || PERK_BETTER_TOXINS) && amount > 0)
			amount *= 0.5
		..(amount)

								//// TOXIN ORGAN ROT ////
		var/mob/living/carbon/human/H = src
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
		if (ishuman(H))
			var toxThreshHold
			if(!L)
				return
			if (L.is_usable())
				if (L.nature == MODIFICATION_SILICON)
					toxThreshHold = 100
				else
					toxThreshHold = 75 // Synthetic organs buy an additional 25 points of toxin processing before becoming overloaded
			else
				toxThreshHold = 0

			if ((H.getToxLoss() > toxThreshHold) && (amount>0)) // If toxloss is above a certain threshhold, more toxin damage will cause internal organ damage. For reference: 50 is DANGEROUS TOXIN LEVELS DETECTED
				var/obj/item/organ/internal/targeted_organ
				if ((!L.is_usable()) || (H.getToxLoss() > 100)) // If the liver is dead, the toxin begins to rot out the other organs. If you have more than 100 toxin, your body begins to rot regardless of liver status
					var/list/listed_organs  = list("brain",OP_EYES,"heart","lungs","stomach","kidneys","appendix","psionic organ")
					targeted_organ = H.random_organ_by_process(pick(listed_organs))
				else
					targeted_organ = H.random_organ_by_process("liver")
				if (targeted_organ && targeted_organ.is_usable())
					if (targeted_organ.nature !=MODIFICATION_SILICON) // If randomly chosen organ is prothestic, no damage.
						targeted_organ.damage += rand (2,6) // How much damage is dealt to each organ. Please adjust for balance

/mob/living/carbon/human/setToxLoss(var/amount)
	if(!(species.flags & NO_POISON) && !isSynthetic())
		adjustToxLoss(amount-getToxLoss())

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
/mob/living/carbon/human/heal_overall_damage(var/brute, var/burn)
	var/list/obj/item/organ/external/parts = get_damaged_organs(brute,burn)

	var/update = 0
	while(parts.len && (brute>0 || burn>0) )
		var/obj/item/organ/external/picked = pick(parts)

		var/brute_was = picked.brute_dam
		var/burn_was = picked.burn_dam

		update |= picked.heal_damage(brute,burn)

		brute -= (brute_was-picked.brute_dam)
		burn -= (burn_was-picked.burn_dam)

		parts -= picked
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	speech_problem_flag = 1
	if(update)	UpdateDamageIcon()

// damage MANY external organs, in random order
/mob/living/carbon/human/take_overall_damage(var/brute, var/burn, var/sharp = 0, var/edge = 0, var/used_weapon = null)
	if(status_flags & GODMODE)	return	//godmode
	var/list/obj/item/organ/external/parts = get_damageable_organs()
	var/update = 0
	while(parts.len && (brute>0 || burn>0) )
		var/obj/item/organ/external/picked = pick(parts)

		var/brute_was = picked.brute_dam
		var/burn_was = picked.burn_dam

		update |= picked.take_damage(brute,burn,sharp,edge,used_weapon)
		brute	-= (picked.brute_dam - brute_was)
		burn	-= (picked.burn_dam - burn_was)

		parts -= picked
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	if(update)	UpdateDamageIcon()


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

/mob/living/carbon/human/apply_damage(var/damage = 0, var/damagetype = BRUTE, var/def_zone = null, var/sharp = 0, var/edge = 0, var/obj/used_weapon = null)

	//visible_message("Hit debug. [damage] | [damagetype] | [def_zone] | [blocked] | [sharp] | [used_weapon]")

	//Handle PSY damage
	if(damagetype == PSY)
		sanity.onPsyDamage(damage)
		return TRUE

	//Handle other types of damage
	if(damagetype != BRUTE && damagetype != BURN)
		if(damagetype == HALLOSS && !(species && (species.flags & NO_PAIN)))
			if (!stat && (damage > 25 && prob(20)) || (damage > 50 && prob(60)))
				emote("painscream")

		..(damage, damagetype, def_zone)
		sanity.onDamage(damage)
		return TRUE

	//Handle BRUTE and BURN damage
	handle_suit_punctures(damagetype, damage, def_zone)

	var/obj/item/organ/external/organ = null
	if(isorgan(def_zone))
		organ = def_zone
	else
		if(!def_zone)	def_zone = ran_zone(def_zone)
		organ = get_organ(check_zone(def_zone))
	if(!organ)	return FALSE

	switch(damagetype)
		if(BRUTE)
			damageoverlaytemp = 20
			damage = damage*species.brute_mod
			if(organ.take_damage(damage, 0, sharp, edge, used_weapon))
				UpdateDamageIcon()

						/////BRUTE FORCE TRAUMA/////
			var/mob/living/carbon/human/A = src
			if (ishuman(A)) // Is the mob being damaged human?
				if ((organ.name in list("left arm","right arm","left leg","right leg")) && (organ.brute_dam >=45))
					if ((!sharp) && (!edge)) // Blunt Weapon Smash Bone
						for (var/obj/item/organ/internal/bone/boneHit in organ.internal_organs)
							boneHit.take_damage(damage)
					if ((sharp) && (!edge))  //Bullets Shred Muscles
						for (var/obj/item/organ/internal/muscle/muscleHit in organ.internal_organs)
							muscleHit.take_damage(damage)
					else if ((sharp) && (edge))		//Blades shred blood vessels
						for (var/obj/item/organ/internal/blood_vessel/vesselHit in organ.internal_organs)
							vesselHit.take_damage(damage)

				else
					if ((organ.name in list("torso","groin")) && (organ.brute_dam >=75))
						if ((sharp) && (!edge)) // Bullets or Shovel(?) make swiss chees of internal organs
							var/obj/item/organ/internal/targetOrgan = pick(organ.internal_organs)
							if (!(istype(targetOrgan,/obj/item/organ/internal/bone)))
								targetOrgan.take_damage(damage)
						if ((!sharp) && (!edge)) // Blunt Weapon Smash Bone
							for (var/obj/item/organ/internal/bone/boneHit in organ.internal_organs)
								boneHit.take_damage(damage)


		if(BURN)
			damageoverlaytemp = 20
			damage = damage*species.burn_mod
			if(organ.take_damage(0, damage, sharp, edge, used_weapon))
				UpdateDamageIcon()

						/////NERVE BURN DAMAGE/////
			var/mob/living/carbon/human/A = src
			if (ishuman(A)) // Is the mob being damaged human?
				if ((organ.nature != MODIFICATION_SILICON) && (organ.burn_dam >=45)) // Is the organ a limb? Is it not synthetic? Is it severely damaged?
					for (var/obj/item/organ/internal/nerve/N in organ.internal_organs) // Check every nerve in the person
						N.take_damage(damage) // Damage

	sanity.onDamage(damage)

	// Will set our damageoverlay icon to the next level, which will then be set back to the normal level the next mob.Life().
	updatehealth()
	BITSET(hud_updateflag, HEALTH_HUD)
	return TRUE


//Falling procs
/mob/living/carbon/human/get_fall_damage(var/turf/from, var/turf/dest)
	var/damage = 15 * falls_mod

	if (from && dest)
		damage *= abs(from.z - dest.z)

	return damage

