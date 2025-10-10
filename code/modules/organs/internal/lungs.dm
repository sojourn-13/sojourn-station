/obj/item/organ/internal/vital/lungs
	name = "lungs"
	icon_state = "lungs"
	desc = "This organ is breathtaking."
	gender = PLURAL
	organ_efficiency = list(OP_LUNGS = 100)
	parent_organ_base = BP_CHEST
	specific_organ_size = 2
	price_tag = 700
	blood_req = 10
	max_blood_storage = 50
	nutriment_req = 10
	var/breath_modulo = 2
	w_class = ITEM_SIZE_SMALL

	// Breathing system variables - Ported from Baystation12
	var/active_breathing = 1
	var/has_gills = FALSE
	var/breath_type
	var/exhale_type
	var/list/poison_types

	var/min_breath_pressure
	var/last_int_pressure
	var/last_ext_pressure
	var/max_pressure_diff = 60

	var/oxygen_deprivation = 0
	var/safe_exhaled_max = 6
	var/safe_toxins_max = 0.2
	var/SA_para_min = 1
	var/SA_sleep_min = 5
	var/breathing = 0
	var/last_successful_breath
	var/breath_fail_ratio // How badly they failed a breath. Higher is worse.

// Drowning and oxygen deprivation functions - Ported from Baystation12
/obj/item/organ/internal/vital/lungs/proc/can_drown()
	return (is_broken() || !has_gills)

/obj/item/organ/internal/vital/lungs/proc/remove_oxygen_deprivation(amount)
	var/last_suffocation = oxygen_deprivation
	oxygen_deprivation = min(species.total_health,max(0,oxygen_deprivation - amount))
	return -(oxygen_deprivation - last_suffocation)

/obj/item/organ/internal/vital/lungs/proc/add_oxygen_deprivation(amount)
	var/last_suffocation = oxygen_deprivation
	oxygen_deprivation = min(species.total_health,max(0,oxygen_deprivation + amount))
	return (oxygen_deprivation - last_suffocation)

// Returns a percentage value for use by GetOxyloss().
/obj/item/organ/internal/vital/lungs/proc/get_oxygen_deprivation()
	if(status & ORGAN_DEAD)
		return 100
	return round((oxygen_deprivation/species.total_health)*100)

/obj/item/organ/internal/vital/lungs/set_dna(datum/dna/new_dna)
	..()
	sync_breath_types()
	// Use default max_pressure_diff value for Sojourn compatibility
	// max_pressure_diff = 60 (already set as default)

/obj/item/organ/internal/vital/lungs/replaced()
	..()
	sync_breath_types()

/**
 *  Set these lungs' breath types based on the lungs' species
 */
/obj/item/organ/internal/vital/lungs/proc/sync_breath_types()
	min_breath_pressure = species.breath_pressure
	breath_type = species.breath_type ? species.breath_type : GAS_OXYGEN
	poison_types = species.poison_type ? list("[species.poison_type]" = TRUE) : list(GAS_PLASMA = TRUE)
	exhale_type = species.exhale_type ? species.exhale_type : GAS_CO2

// Advanced lung processing with infection effects - Ported from Baystation12
/obj/item/organ/internal/vital/lungs/Process()
	..()
	if(!owner)
		return

	if (germ_level > INFECTION_LEVEL_ONE && active_breathing)
		if(prob(5))
			owner.emote("cough")		//respiratory tract infection

	if(is_bruised() && !owner.is_asystole())
		if(prob(2))
			if(active_breathing)
				owner.visible_message(
					"<B>\The [owner]</B> coughs up blood!",
					SPAN_WARNING("You cough up blood!"),
					"You hear someone coughing!",
				)
			else
				var/obj/item/organ/parent = owner.get_organ(parent_organ_base)
				owner.visible_message(
					"blood drips from <B>\the [owner]'s</B> [parent.name]!",
				)

			owner.drip(1)
		if(prob(4))
			if(active_breathing)
				owner.visible_message(
					"<B>\The [owner]</B> gasps for air!",
					SPAN_DANGER("You can't breathe!"),
					"You hear someone gasp for air!",
				)
			else
				to_chat(owner, SPAN_DANGER("You're having trouble getting enough [breath_type]!"))

			owner.losebreath = max(round(damage / 2), owner.losebreath)

/obj/item/organ/internal/vital/lungs/proc/rupture()
	var/obj/item/organ/external/parent = owner.get_organ(parent_organ_base)
	if(istype(parent))
		owner.custom_pain("You feel a stabbing pain in your [parent.name]!", 50)
	take_damage(min_broken_damage, BRUTE)

//exposure to extreme pressures can rupture lungs
/obj/item/organ/internal/vital/lungs/proc/check_rupturing(breath_pressure)
	if(isnull(last_int_pressure))
		last_int_pressure = breath_pressure
		return
	var/datum/gas_mixture/environment = loc.return_air_for_internal_lifeform()
	var/ext_pressure = environment && environment.return_pressure() // May be null if, say, our owner is in nullspace
	var/int_pressure_diff = abs(last_int_pressure - breath_pressure)
	var/ext_pressure_diff = abs(last_ext_pressure - ext_pressure) * owner.get_pressure_weakness(ext_pressure)
	if(int_pressure_diff > max_pressure_diff && ext_pressure_diff > max_pressure_diff)
		var/lung_rupture_prob = BP_IS_ROBOTIC(src) ? prob(30) : prob(60) //Robotic lungs are less likely to rupture.
		if(!is_bruised() && lung_rupture_prob) //only rupture if NOT already ruptured
			rupture()

/obj/item/organ/internal/vital/lungs/proc/handle_failed_breath()
	if(!owner)
		return

	if(prob(15) && active_breathing)
		owner.emote("gasp")

	if(damage < max_damage)
		add_oxygen_deprivation(breath_fail_ratio * 2)

/obj/item/organ/internal/vital/lungs/proc/handle_breath(datum/gas_mixture/breath, forced)
	if(!owner)
		return 1

	if(!breath || (max_damage <= 0))
		breath_fail_ratio = 1
		handle_failed_breath()
		return 1

	var/breath_pressure = breath.return_pressure()
	check_rupturing(breath_pressure)

	var/datum/gas_mixture/environment = loc.return_air_for_internal_lifeform()
	last_ext_pressure = environment && environment.return_pressure()
	last_int_pressure = breath_pressure
	if(breath.total_moles == 0)
		breath_fail_ratio = 1
		handle_failed_breath()
		return 1

	var/safe_pressure_min = min_breath_pressure // Minimum safe partial pressure of breathable gas in kPa
	// Lung damage increases the minimum safe pressure.
	safe_pressure_min *= 1 + rand(1,4) * damage/max_damage

	if(!forced && owner.chem_effects[CE_BREATHLOSS] && !owner.chem_effects[CE_STABLE]) //opiates are bad mmkay
		safe_pressure_min *= 1 + rand(1,4) * owner.chem_effects[CE_BREATHLOSS]

	var/failed_inhale = 0
	var/failed_exhale = 0

	var/inhaling = breath.gas[breath_type]
	var/inhale_efficiency = min(round(((inhaling/breath.total_moles)*breath_pressure)/safe_pressure_min, 0.001), 3)

	// Not enough to breathe
	if(inhale_efficiency < 1)
		if(prob(20) && active_breathing)
			if(inhale_efficiency < 0.8)
				owner.emote("gasp")
			else if(prob(20))
				to_chat(owner, SPAN_WARNING("It's hard to breathe..."))
		breath_fail_ratio = 1 - inhale_efficiency
		failed_inhale = 1
	else
		breath_fail_ratio = 0

	owner.oxygen_alert = failed_inhale * 2

	var/inhaled_gas_used = inhaling / 4
	breath.adjust_gas(breath_type, -inhaled_gas_used, update = 0) //update afterwards

	owner.oxygen_alert = failed_inhale * 2  // Reset oxygen alert based on current breath
	if(!failed_inhale) // Enough gas to tell we're being poisoned via chemical burns or whatever.
		var/poison_total = 0
		if(poison_types)
			for(var/gname in breath.gas)
				if(poison_types[gname])
					poison_total += breath.gas[gname]
		// Basic toxin exposure without plasma_alert system
		if(((poison_total/breath.total_moles)*breath_pressure) > safe_toxins_max)
			// Direct toxin damage instead of alert system
			take_damage(1, BURN, 0, 1)

	// Pass reagents from breathed gases into our body.
	// This logic has been moved to life.dm for better integration
	// Gas->reagent conversion now handled in life.dm

	last_successful_breath = world.time
	breathing = 1

	if(failed_inhale)
		handle_failed_breath()
	else
		remove_oxygen_deprivation(2)

	return failed_exhale

/obj/item/organ/internal/vital/lungs/robotize()
	icon_state = "lungs-prosthetic"

/obj/item/organ/internal/vital/lungs/long
	name = "long lungs"
	icon_state = "long_lungs"
	organ_efficiency = list(OP_LUNGS = 150)
	specific_organ_size = 2.3
	breath_modulo = 8

/obj/item/organ/internal/vital/lungs/prosthetic
	name = "prosthetic lungs"
	desc = "Lungs made out of metal. Still work just as well as normal lungs."
	icon_state = "lungs-prosthetic"
	price_tag = 1000
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/vital/lungs/plant
	name = "air sacs"
	desc = "Lungs made for a plantoid species, works just as well as a normal set."
	icon_state = "lungs_plant"

/obj/item/organ/internal/vital/lungs/long/exalt
	name = "exalt lungs"
	desc = "Augmented lungs for filtering out poor air, and the air of the poor.\
	Likely worth more on the black market."
	price_tag = 2250
