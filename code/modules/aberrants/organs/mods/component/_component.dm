/datum/component/modification/organ
	install_start_msg = ""
	install_success_msg = ""
	install_time = WORKTIME_FAST
	//install_tool_quality = null
	install_difficulty = FAILCHANCE_HARD
	install_stat = STAT_BIO
	install_sound = 'sound/effects/squelch1.ogg'

	removal_time = WORKTIME_SLOW
	removal_tool_quality = QUALITY_LASER_CUTTING
	removal_difficulty = FAILCHANCE_VERY_HARD
	removal_stat = STAT_BIO

	bypass_perk = PERK_ADVANCED_MEDICAL

	destroy_on_removal = FALSE 
	removable = TRUE
	breakable = TRUE		// Needs high Bio or a perk to remove

	apply_to_types = list(/obj/item/organ/internal/scaffold)

	examine_msg = "Can be attached to organ scaffolds and abnormal organs."
	examine_stat = STAT_BIO
	examine_difficulty = STAT_LEVEL_EXPERT

	// Internal organ stuff
	var/list/owner_verb_adds = list()

	// Additive adjustments
	var/list/organ_efficiency_mod = list()
	var/specific_organ_size_mod = null
	var/max_blood_storage_mod = null
	var/blood_req_mod = null
	var/nutriment_req_mod = null
	var/oxygen_req_mod = null
	var/min_bruised_damage_mod = null
	var/min_broken_damage_mod = null
	var/max_damage_mod = null

	// Multiplicative adjustments
	var/organ_efficiency_multiplier = null
	var/specific_organ_size_multiplier = null
	var/max_blood_storage_multiplier = null
	var/blood_req_multiplier = null
	var/nutriment_req_multiplier = null
	var/oxygen_req_multiplier = null
	var/min_bruised_damage_multiplier = null
	var/min_broken_damage_multiplier = null
	var/max_damage_multiplier = null

	var/max_upgrade_mod = null
	var/scanner_hidden = FALSE


/datum/component/modification/organ/apply_values(obj/item/organ/internal/holder)
	ASSERT(holder)
	
	var/using_generated_name = FALSE
	var/using_generated_color = FALSE

	var/obj/item/organ/internal/scaffold/S
	if(istype(holder, /obj/item/organ/internal/scaffold))
		S = holder

	if(S)
		using_generated_name = S.use_generated_name
		using_generated_color = S.use_generated_color

	if(new_name && !using_generated_name)
		holder.name = new_name
	if(prefix)
		holder.prefixes += prefix
	if(new_desc)
		holder.desc = new_desc
	if(new_color && !using_generated_color)
		holder.color = new_color

	if(!islist(holder.organ_efficiency))
		holder.organ_efficiency = list()

	if(organ_efficiency_mod.len)
		for(var/organ in organ_efficiency_mod)
			var/added_efficiency = organ_efficiency_mod[organ]
			if(holder.organ_efficiency.Find(organ))
				holder.organ_efficiency[organ] += round(added_efficiency, 1)
			else
				holder.organ_efficiency.Add(organ)
				holder.organ_efficiency[organ] = round(added_efficiency, 1)

	if(organ_efficiency_multiplier)
		for(var/organ in holder.organ_efficiency)
			holder.organ_efficiency[organ] = round(holder.organ_efficiency[organ] * (1 + organ_efficiency_multiplier), 1)

	if(specific_organ_size_multiplier)
		holder.specific_organ_size *= 1 - round(specific_organ_size_multiplier, 0.01)
	if(max_blood_storage_multiplier)
		holder.max_blood_storage *= 1 + round(max_blood_storage_multiplier, 0.01)
	if(blood_req_multiplier)
		holder.blood_req *= 1 - round(blood_req_multiplier, 0.01)
	if(nutriment_req_multiplier)
		holder.nutriment_req *= 1 - round(nutriment_req_multiplier, 0.01)
	if(oxygen_req_multiplier)
		holder.oxygen_req *= 1 - round(oxygen_req_multiplier, 0.01)

	if(specific_organ_size_mod)
		holder.specific_organ_size += round(specific_organ_size_mod, 0.01)
	if(max_blood_storage_mod)
		holder.max_blood_storage += round(max_blood_storage_mod, 0.01)
	if(blood_req_mod)
		holder.blood_req += round(blood_req_mod, 0.01)
	if(nutriment_req_mod)
		holder.nutriment_req += round(nutriment_req_mod, 0.01)
	if(oxygen_req_mod)
		holder.oxygen_req += round(oxygen_req_mod, 0.01)
	if(max_upgrade_mod)
		holder.max_upgrades += max_upgrade_mod

	if(scanner_hidden)
		holder.scanner_hidden = scanner_hidden

	for(var/owner_verb in owner_verb_adds)
		holder.owner_verbs |= owner_verb

/datum/component/modification/organ/uninstall(obj/item/I, mob/living/user)
	..()
	if(istype(I, /obj/item/organ/internal/scaffold))
		var/obj/item/organ/internal/scaffold/S = I
		S.try_ruin()
