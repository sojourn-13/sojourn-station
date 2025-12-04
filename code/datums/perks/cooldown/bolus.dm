/datum/perk/cooldown/bolus_weaken
	name = "Bolus Contamination: Straw Dummy"
	desc = "You have been weakened by a Bolus's affect, this one is reducing armor, and, if you are not human, damage output."
	icon_state = "shield_no"
	perk_lifetime = 8 MINUTES //Gives enuff time for folks to make a last stand
	gain_text = "Something washes into you."
	lose_text = "Whatever afflicting you leaves."

/datum/perk/cooldown/bolus_weaken/assign(mob/living/L)
	..()
	if(!holder)
		return

	if(ishuman(holder))
		var/mob/living/carbon/human/H = L
		//Just add this
		H.stats.addPerk(PERK_ARMOR_REDUCTION)

	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/A = L
		A.melee_damage_lower -= 5
		A.melee_damage_upper -= 5
		A.maxHealth = A.maxHealth * 0.75 //25% less hp

		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] -= 5
			if(key == "bullet")
				A.armor[key] -= 3
			if(key == "energy")
				A.armor[key] -= 3

	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = L
		S.melee_damage_lower -= 5
		S.melee_damage_upper -= 5
		S.maxHealth = S.maxHealth * 0.75 //25% less hp

		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] -= 5
			if(key == "bullet")
				S.armor[key] -= 3
			if(key == "energy")
				S.armor[key] -= 3

/datum/perk/cooldown/bolus_weaken/remove()

	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/A = holder
		A.melee_damage_lower += 5
		A.melee_damage_upper += 5
		A.maxHealth = round(A.maxHealth * 1.33) //Add back are hp and then round to be the same

		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] += 5
			if(key == "bullet")
				A.armor[key] += 3
			if(key == "energy")
				A.armor[key] += 3

	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = holder
		S.melee_damage_lower += 5
		S.melee_damage_upper += 5
		S.maxHealth = round(S.maxHealth * 1.33) //Add back are hp and then round to be the same

		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] += 5
			if(key == "bullet")
				S.armor[key] += 3
			if(key == "energy")
				S.armor[key] += 3

	..()

/datum/perk/cooldown/bolus_armor
	name = "Bolus Contamination: Armor Stand"
	desc = "Whatever your wearing or naturally protecting you is enhanced."
	icon_state = "shield_plus"
	perk_lifetime = 8 MINUTES
	gain_text = "Your protection feels stronger."
	lose_text = "Whatever was giving your protection a bost, is no longer doing so."

//For full affect see: living_defense
//Non-humans that get this are boosted in armor *and* the full affect

/datum/perk/cooldown/bolus_armor/assign(mob/living/L)
	..()
	if(!holder)
		return
	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/A = L
		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] += 5
			if(key == "bullet")
				A.armor[key] += 3
			if(key == "energy")
				A.armor[key] += 3

	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = L

		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] += 5
			if(key == "bullet")
				S.armor[key] += 3
			if(key == "energy")
				S.armor[key] += 3

/datum/perk/cooldown/bolus_armor/remove()

	//Take some fixed damage
	if(isliving(holder))
		var/mob/living/L = holder
		L.apply_damage(15, BURN)
		L.apply_damage(10, BRUTE)

	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/A = holder

		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] -= 5
			if(key == "bullet")
				A.armor[key] -= 3
			if(key == "energy")
				A.armor[key] -= 3

	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = holder
		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] -= 5
			if(key == "bullet")
				S.armor[key] -= 3
			if(key == "energy")
				S.armor[key] -= 3

	..()

//ONLY works for humans as mobs do not ware or have anything reduce their speed
/datum/perk/cooldown/bolus_momentiums
	name = "Bolus Contamination: The Arrows"
	desc = "You have been contanimated by a Bolus that reduces penitalies of waring armor."
	icon_state = "shield_no"
	perk_lifetime = 8 MINUTES //Gives enuff time for folks to make a last stand
	gain_text = "Something washes into you."
	lose_text = "Whatever enhanced you leaves."
	var/stage = 4 //25% recovery if advanced then its 50% recovery

/datum/perk/cooldown/bolus_healing
	name = "Bolus Contamination: Medi-Bolus"
	desc = "You have been contanimated by a Bolus. The affect of this Bolus is a slow release of healing agents, works for metal and flesh alike. \
	These types of Bolus mainly focus on toxins and some internal wounds."
	icon_state = "shield_no"
	perk_lifetime = 1 MINUTES
	gain_text = "Something washes into you."
	lose_text = "Whatever enhanced you leaves."
	var/stage = 1 //Stages for this are exstrealy important as they affect scaling
	var/lucknt = 0

/datum/perk/cooldown/bolus_healing/on_process()
	..()

	//Unfair to robotics do to it not healing robotic damage, but they get additional post-perk
	if(prob(stage))
		lucknt++
		if(prob(100 - (lucknt * 10)))
			holder.heal_organ_damage(-stage, -stage)
			//Some times we heal twice!
			if(prob(5 * stage))
				holder.heal_organ_damage(-stage, -stage)
		else
			lucknt--

	if(stage >= 4)
		//We are pinical type! Heal em all, dont care about is rob or not.
		if(ishuman(holder))
			var/mob/living/carbon/human/H = holder
			var/list/organs_sans_brain_and_bones = H.internal_organs - H.internal_organs_by_efficiency[BP_BRAIN] - H.internal_organs_by_efficiency[OP_BONE] // Peridaxon shouldn't heal brain or bones
			for(var/obj/item/organ/I in organs_sans_brain_and_bones)
				var/list/current_wounds = I.GetComponents(/datum/component/internal_wound)
				if(LAZYLEN(current_wounds) && prob(stage))
					LEGACY_SEND_SIGNAL(I, COMSIG_IORGAN_REMOVE_WOUND, pick(current_wounds))

/datum/perk/cooldown/bolus_healing/remove()
	//Greater then 1 means we heal internal damages, mainly EVERY type of basic infection
	if(ishuman(holder) && stage >= 2)
		var/mob/living/carbon/human/H = holder
		//Make sure its internal no cheating by holding your heart out!
		for(var/obj/item/organ/internal/IO in H.internal_organs)
			var/list/current_wounds = IO.GetComponents(/datum/component/internal_wound)
			for(var/datum/component/internal_wound/organic/infection/cwi in current_wounds)
				LEGACY_SEND_SIGNAL(IO, COMSIG_IORGAN_REMOVE_WOUND, cwi)

			//Stage 3+ we act as a flawless antitoxin
			if(stage >= 3)
				for(var/datum/component/internal_wound/cw in current_wounds)
					if(CE_ANTITOX in cw.treatments_chem)
						LEGACY_SEND_SIGNAL(cw, COMSIG_IORGAN_REMOVE_WOUND, cw)

			//Now we are in the 4+ stage where its quite op
			if(stage > 3)
				//Any internal robotic organ damage is flat out healed. No questions asked the power of a bolus
				for(var/datum/component/internal_wound/robotic/r in current_wounds)
					LEGACY_SEND_SIGNAL(r, COMSIG_IORGAN_REMOVE_WOUND, r)
					H.adjustBruteLoss(-stage) //Heal brute and burn based per wound repaired
					H.adjustFireLoss(-stage)

				//Robots get a small extra boost do to how healing works for them
				for(var/obj/item/organ/external/robotic/E in H.organs)
					E.heal_damage(stage,stage,TRUE)

				//Per internal organ flat heal stage - 2 brute and burn
				H.adjustBruteLoss(-stage + 2)
				H.adjustFireLoss(-stage + 2)

		//We give flesh some anti-death
		if(H.species.reagent_tag != IS_SYNTHETIC)
			H.reagents.add_reagent("blood", 10 * stage) //Recover some blood
			H.adjustOxyLoss(-25 * stage) //Give the breath
			H.adjustHalLoss(-stage * stage)
	else
		//Not human, just heal nuke
		holder.adjustBruteLoss(-stage * stage)
		holder.adjustFireLoss(-stage * stage)
		holder.adjustOxyLoss(-stage * stage)
		holder.adjustToxLoss(-stage * stage)
		holder.setCloneLoss(0) //The power of a bolus.
		holder.adjustHalLoss(-stage * (stage + 5))

	..()

/datum/perk/cooldown/bolus_revive
	name = "Bolus Contamination: Revive"
	desc = "You have been contanimated by a Bolus. The affect of this Bolus is once its fully processed, if you are dead. \
	You will be attempted to be revived."
	icon_state = "shield_no"
	perk_lifetime = 15 MINUTES
	gain_text = "Something washes into you."
	lose_text = "Whatever washed over you leaves."
	var/stage = 1 //Stages for this are exstrealy important as they affect scaling

/datum/perk/cooldown/bolus_revive/remove()
	if(QDELETED(holder))
		..()
		return

	if(isliving(holder))
		var/mob/living/L = holder
		if(L.stat == DEAD)
			if(ishuman(L))
				GLOB.dead_mob_list.Remove(L)
				GLOB.living_mob_list += L

				L.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/return_to_sender, "RETURN_TO_SENDER", skill_gained = stage, learner = L)

				L.timeofdeath = 0
				L.set_stat(CONSCIOUS) //Life() can bring them back to consciousness if it needs to.
				L.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

				//Stablizating
				L.heal_organ_damage(15 * stage, 15 * stage)
				L.adjustOxyLoss(-50 * stage)

				L.emote("gasp")
				L.Weaken(rand(3,5))
				L.updatehealth()
				if(stage > 1)
					L.reagents.add_reagent("blood", 80 * stage) //Recover some blood
					L.adjustOxyLoss(-25 * stage) //Give the breath
					L.heal_organ_damage(15 * stage, 15 * stage)
				return
			else
				L.revive()

	..()

//15% damage increase for items thats quite good.
/datum/perk/cooldown/bolus_cqc
	name = "Bolus Contamination: Palm of Iron"
	desc = "You have been contanimated by a Bolus. The affect of this Bolus is that you deal more damage in melee combat."
	icon_state = "shield_no"
	perk_lifetime = 12 MINUTES //Gives enuff time for folks to make a last stand
	gain_text = "Something washes into you."
	lose_text = "Whatever enhancing you leaves."

/datum/perk/cooldown/bolus_cqc/assign(mob/living/L)
	..()
	if(!holder)
		return

	if(ishuman(holder))
		var/mob/living/carbon/human/H = L
		H.cqc_damage_multiplier += 0.15
		H.punch_damage_increase += 5

	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/A = L
		A.melee_damage_lower += 5
		A.melee_damage_upper += 5


	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = L
		S.melee_damage_lower += 5
		S.melee_damage_upper += 5

/datum/perk/cooldown/bolus_cqc/remove(mob/living/L)
	if(!holder)
		return

	if(ishuman(holder))
		var/mob/living/carbon/human/H = L
		H.cqc_damage_multiplier -= 0.15
		H.punch_damage_increase -= 5

	if(istype(holder, /mob/living/simple/hostile))
		var/mob/living/simple/hostile/A = L
		A.melee_damage_lower -= 5
		A.melee_damage_upper -= 5

	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = L
		S.melee_damage_lower -= 5
		S.melee_damage_upper -= 5
	..()

