#define NSA_THRESHOLD_MINIMUM 50 //The lowest someone's NSA Threshhold can reach

/datum/reagents/metabolism
	var/metabolism_class //CHEM_TOUCH, CHEM_INGEST, or CHEM_BLOOD
	var/mob/living/carbon/parent

/datum/reagents/metabolism/New(var/max = 100, mob/living/carbon/parent_mob, var/met_class)
	..(max, parent_mob)

	metabolism_class = met_class
	if(istype(parent_mob))
		parent = parent_mob

/datum/reagents/metabolism/Destroy()
	parent = null
	return ..()


/datum/reagents/metabolism/proc/metabolize()
	expose_temperature(parent.bodytemperature, 0.25)

	var/metabolism_type = 0 //non-human mobs
	if(ishuman(parent))
		var/mob/living/carbon/human/H = parent
		metabolism_type = H.species.reagent_tag

	for(var/current in reagent_list)
		var/datum/reagent/R = current

		parent.metabolism_effects.check_reagent(R, metabolism_class)
		R.on_mob_life(parent, metabolism_type, metabolism_class)

	update_total()

// Lasting side effects from reagents: addictions, withdrawals.
/datum/metabolism_effects
	var/list/nerve_system_accumulations = list() // Nerve system accumulations
	var/nsa_threshold = 100
	var/nsa_bonus = 0 //For various perks and organs affecting the nsa threshhold
	var/nsa_viv = 0   //For stats increases
	var/nsa_chem_bonus = 0 //For chems (detox in specific) affecting the nsa threshhold
	var/nsa_mult = 1 //Multiplier for nsa, used by specific perks. Added so the number doesn't fuck with other numbers.
	var/nsa_organ_bonus = 0 //For efficiency modifiers on the nerves
	var/nsa_current = 0

	var/mob/living/carbon/parent
	var/list/present_reagent_ids = list()

	var/list/datum/reagent/withdrawal_list = list()
	var/list/datum/reagent/active_withdrawals = list()
	var/list/datum/reagent/addiction_list = list()
	var/addiction_tick = 1
	/// The final chance for an addiction to manifest is multiplied by this value before being passed to prob.
	var/addiction_chance_multiplier = 1

/datum/metabolism_effects/Destroy()
	parent = null
	withdrawal_list.Cut()
	active_withdrawals.Cut()
	addiction_list.Cut()
	return ..()

//Must be called WHENEVER you modify nsa_bonus, nsa_chem_bonus, nsa_mult, or when you change nerve efficiency.
//calc_nerves: Activates nerve efficiency recalculation, so its not recalculated every time.
/datum/metabolism_effects/proc/calculate_nsa(calc_nerves = FALSE)
	nsa_viv = parent.stats.getStat(STAT_VIV)
	if(calc_nerves && ishuman(parent))
		var/mob/living/carbon/human/parent_human = parent
		nsa_organ_bonus = (parent_human.get_organ_efficiency(OP_NERVE) - 700) / 2
	nsa_threshold = round((100 + nsa_bonus + nsa_chem_bonus + nsa_organ_bonus + nsa_viv) * nsa_mult)
	nsa_threshold = max(nsa_threshold, NSA_THRESHOLD_MINIMUM) //Can't be below for any reason. Keeps
	return nsa_threshold

/datum/metabolism_effects/proc/adjust_nsa(value, tag)
	if(!tag)
		CRASH("no tag given to adjust_nsa()")
	nerve_system_accumulations[tag] = value

/datum/metabolism_effects/proc/remove_nsa(tag)
	for(var/i in nerve_system_accumulations)
		if(findtext(i, tag, 1, 0) == 1)
			nerve_system_accumulations.Remove(i)


/datum/metabolism_effects/proc/get_nsa_value(tag)
	if(nerve_system_accumulations[tag])
		return nerve_system_accumulations[tag]

/datum/metabolism_effects/proc/get_nsa()
	LEGACY_SEND_SIGNAL(parent, COMSING_NSA, nsa_current)
	return nsa_current

/datum/metabolism_effects/proc/get_nsa_target()
	var/accumulatedNSA = 0
	for(var/tag in nerve_system_accumulations)
		accumulatedNSA += nerve_system_accumulations[tag]
	return accumulatedNSA

/datum/metabolism_effects/proc/handle_nsa()
	var/nsa_target = get_nsa_target()
	if(nsa_target != nsa_current)
		nsa_current = nsa_target > nsa_current \
		            ? min(nsa_current + nsa_target / 30, nsa_target) \
		            : max(nsa_current - 6.66, nsa_target)
		nsa_changed()
	if(get_nsa() > nsa_threshold)
		nsa_breached_effect()

/datum/metabolism_effects/proc/nsa_changed()
	if(get_nsa() > nsa_threshold)
		var/stat_mod = get_nsa() > 140 ? -20 : -10
		for(var/stat in ALL_STATS_FOR_LEVEL_UP)
			parent.stats.addTempStat(stat, stat_mod, INFINITY, "nsa_breach")
	else
		for(var/stat in ALL_STATS_FOR_LEVEL_UP)
			parent.stats.removeTempStat(stat, "nsa_breach")
	var/obj/screen/nsa/hud = parent.HUDneed["neural system accumulation"]
	hud?.update_icon()

//NSA Overloads!
//First we have a tell were over are limit, harmless shaking
/datum/metabolism_effects/proc/nsa_breached_effect()
	var/nsa_amount = get_nsa()
	if(nsa_amount < nsa_threshold*1.1)
		return
	parent.make_jittery(2)

	if(nsa_amount < nsa_threshold*1.2)
		return
	parent.drop_l_hand()
	parent.drop_r_hand()

	if(nsa_amount < nsa_threshold*1.3)
		return
	parent.vomit()

	if(nsa_amount < nsa_threshold*1.4)
		return
	parent.adjust_hallucination(8,12)

	if(nsa_amount < nsa_threshold*1.5)
		return
	parent.eye_blurry = max(parent.eye_blurry, 3)

	if(nsa_amount < nsa_threshold*1.6)
		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			var/blood_volume = H.vessel.get_reagent_amount("blood")
			var/blood_percent =  round((blood_volume / H.species.blood_volume)*100)
			if(blood_percent * H.effective_blood_volume > H.total_blood_req + BLOOD_VOLUME_BAD_MODIFIER)
				return
		parent.drip_blood(10) //This is quite a bit but your also suffering a lot

	//At this point were starting to have a heart attack
	if(nsa_amount < nsa_threshold*1.7)
		return
	if(ishuman(parent))
		var/mob/living/carbon/human/H = parent
		var/obj/item/organ/internal/vital/heart/C = H.random_organ_by_process(OP_HEART)
		if(H && istype(H))
			C.take_damage(0.5, FALSE)

	if(nsa_amount < nsa_threshold*1.8)
		return
	parent.confused = max(parent.confused, 3)

	if(nsa_amount < nsa_threshold*1.9)
		return
	parent.paralysis = max(parent.paralysis, 10)

	if(nsa_amount < nsa_threshold*2)
		return
	parent.Sleeping(2)


/datum/metabolism_effects/New(mob/living/carbon/parent_mob)
	..()
	if(istype(parent_mob))
		parent = parent_mob

/datum/metabolism_effects/proc/check_reagent(datum/reagent/R, metabolism_class)
	present_reagent_ids += R.id

	//Nerve System Accumulation
	parent.metabolism_effects.adjust_nsa(R.nerve_system_accumulations, "[R.id]_[metabolism_class]")

	// Withdrawals
	if(R.withdrawal_threshold && R.volume >= R.withdrawal_threshold && !is_type_in_list(R, withdrawal_list))
		if(R.volume >= R.withdrawal_threshold)
			var/datum/reagent/new_reagent = new R.type()
			new_reagent.max_dose = R.max_dose
			withdrawal_list[new_reagent] = R.max_dose

	if(is_type_in_list(R, withdrawal_list))
		for(var/withdrawal in withdrawal_list)
			var/datum/reagent/A = withdrawal
			if(istype(R, A))
				withdrawal_list[A] = max(withdrawal_list[A], R.max_dose)

	// Addictions
	if(R.addiction_threshold || R.addiction_chance)
		var/add_addiction_flag = R.volume >= R.addiction_threshold

		if(!add_addiction_flag && R.addiction_chance)
			var/percent = ((R.addiction_chance + parent.metabolism_effects.get_nsa()/3) - (R.addiction_chance/2 * parent.stats.getMult(STAT_TGH))) * addiction_chance_multiplier
			percent = CLAMP(percent, 1, 100)
			add_addiction_flag = prob(percent)


		if(add_addiction_flag && !is_type_in_list(R, addiction_list))
			var/datum/reagent/new_reagent = new R.type()
			new_reagent.max_dose = R.max_dose
			addiction_list.Add(new_reagent)
			addiction_list[new_reagent] = 0
			for(var/mob/living/carbon/human/H in viewers(parent))
				LEGACY_SEND_SIGNAL(H, COMSIG_CARBON_ADICTION, parent, R)

	if(is_type_in_list(R, addiction_list))
		for(var/addiction in addiction_list)
			var/datum/reagent/A = addiction
			if(istype(R, A))
				addiction_list[A] = -15 // you're satisfied for a good while.


/datum/metabolism_effects/proc/process()
	process_withdrawals()
	handle_nsa()

	if(addiction_tick == 6)
		addiction_tick = 1
		process_addictions()
	addiction_tick++

	present_reagent_ids.Cut()

/datum/metabolism_effects/proc/process_withdrawals()
	for(var/withdrawal in withdrawal_list - active_withdrawals)
		var/datum/reagent/R = withdrawal
		if(!(R.id in present_reagent_ids))
			start_withdrawal(R)

	for(var/withdrawal in active_withdrawals)
		var/datum/reagent/R = withdrawal
		if((R.id in present_reagent_ids))
			stop_withdrawal(R)
			continue

		if(withdrawal_list[R] <= 0)
			stop_withdrawal(R)
			withdrawal_list.Remove(R)
			continue

		if(!parent.chem_effects[CE_NOWITHDRAW])
			R.withdrawal_act(parent)
		withdrawal_list[R] -= R.withdrawal_rate

/datum/metabolism_effects/proc/start_withdrawal(datum/reagent/R)
	active_withdrawals += R
	R.withdrawal_start(parent)

/datum/metabolism_effects/proc/stop_withdrawal(datum/reagent/R)
	active_withdrawals -= R
	R.withdrawal_end(parent)


/datum/metabolism_effects/proc/process_addictions()
	for(var/addiction in addiction_list)
		var/datum/reagent/R = addiction
		if(!R)
			addiction_list.Remove(R)
			continue

		addiction_list[R] += 1
		if(!parent.chem_effects[CE_PURGER])

			switch(addiction_list[R])
				if(1 to 10)
					R.addiction_act_stage1(parent)
				if(10 to 20)
					R.addiction_act_stage2(parent)
				if(20 to 30)
					R.addiction_act_stage3(parent)
				if(30 to 40)
					R.addiction_act_stage4(parent)
				if(40 to INFINITY)
					R.addiction_end(parent)
					addiction_list.Remove(R)

/datum/metabolism_effects/proc/clear_effects()
	for(var/withdrawal in active_withdrawals)
		stop_withdrawal(withdrawal)

	active_withdrawals.Cut()
	withdrawal_list.Cut()
	addiction_list.Cut()

/mob/living/carbon/proc/remove_all_addictions()
	metabolism_effects.addiction_list.Cut()

/mob/living/carbon/proc/get_metabolism_handler(var/location)
	if(location == CHEM_TOUCH)
		return touching
	else if(location == CHEM_INGEST)
		return ingested
	else if(location == CHEM_BLOOD)
		return bloodstr
