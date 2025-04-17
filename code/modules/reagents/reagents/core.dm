/datum/reagent/organic/blood
	data = new/list("donor" = null, "species" = "Human", "blood_DNA" = null, "blood_type" = null, "blood_colour" = "#A10808", "resistances" = null, "trace_chem" = null, "carrion" = null)
	name = "Blood"
	id = "blood"
	reagent_state = LIQUID
	metabolism = REM * 5
	color = "#C80000"
	taste_description = "iron"
	taste_mult = 1.3
	scannable = TRUE
	glass_icon_state = "glass_red"
	glass_name = "tomato juice"
	glass_desc = "Are you sure this is tomato juice?"
	nerve_system_accumulations = 0
	common = TRUE //Everyone knows what blood looks like

/datum/reagent/organic/blood/initialize_data(var/newdata)
	..()
	if(data && data["blood_colour"])
		color = data["blood_colour"]
	return

/datum/reagent/organic/blood/get_data() // Just in case you have a reagent that handles data differently.
	return data.Copy()

/datum/reagent/organic/blood/touch_turf(turf/simulated/T)
	if(!istype(T) || volume < 3)
		return TRUE
	var/datum/weakref/D = data["donor"]
	if(!istype(D))
		blood_splatter(T, src, 1)
		return

	var/mob/living/something = D.resolve()
	if(istype(something, /mob/living/carbon/human))
		blood_splatter(T, src, 1)
	else if(istype(something, /mob/living/carbon/alien))
		var/obj/effect/decal/cleanable/blood/B = blood_splatter(T, src, 1)
		if(B)
			B.blood_DNA["UNKNOWN DNA STRUCTURE"] = "X*"
	return TRUE

/datum/reagent/organic/blood/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)

	if(VAMPIRE in M.mutations)
		M.adjustNutrition(20) // For hunger
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			H.sanity.onNonAlcohol(src, effect_multiplier)
			H.sanity.onAlcohol(src, effect_multiplier)
			apply_sanity_effect(M, effect_multiplier)
			LEGACY_SEND_SIGNAL(M, COMSIG_CARBON_HAPPY, src, ON_MOB_DRUG)

		return //No other badness

	var/effective_dose = dose
	if(issmall(M)) effective_dose *= 2

	if(effective_dose > 5)
		M.add_chemical_effect(CE_TOXIN, effect_multiplier)
	if(effective_dose > 15)
		M.add_chemical_effect(CE_TOXIN, effect_multiplier)

/datum/reagent/organic/blood/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.inject_blood(src, volume)
	remove_self(volume)

#define WATER_LATENT_HEAT 19000 // How much heat is removed when applied to a hot turf, in J/unit (19000 makes 120 u of water roughly equivalent to 4L)
/datum/reagent/water
	name = "Water"
	id = "water"
	description = "A ubiquitous chemical substance that is composed of hydrogen and oxygen."
	reagent_state = LIQUID
	color = "#0064C877"
	metabolism = REM * 10
	taste_description = "water"
	glass_icon_state = "glass_clear"
	glass_name = "water"
	glass_desc = "The father of all refreshments."
	nerve_system_accumulations = 0
	var/fire_suppression_effect = 1 //19000 times this.
	reagent_type = "Water"
	common = TRUE //You know what water is.

/datum/reagent/water/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.stats.getPerk(PERK_STAY_HYDRATED))
		M.adjustOxyLoss(-0.6 * effect_multiplier)
		M.heal_organ_damage(0.3 * effect_multiplier, 0.3 * effect_multiplier)
		M.add_chemical_effect(CE_ANTITOX, 0.3 * effect_multiplier)
		M.add_chemical_effect(CE_BLOODCLOT, 0.1)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 1 * effect_multiplier)
	if(!ishuman(M))
		M.adjustHalLoss(-0.5)

/datum/reagent/water/affect_blood(var/mob/living/carbon/M, var/alien)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 2)

/datum/reagent/water/extinguisher
	name = "Extinguisher"
	id = "abwater"
	description = "A mix of water, with chemicals to reduce heat, oil and suppress fire with heavy particulates."
	taste_description = "watered down chemicals"
	glass_icon_state = "glass_clear"
	glass_name = "water"
	glass_desc = "The father of all refreshments, this one has floating particulates in it..."
	nerve_system_accumulations = 50 //Chemical soup
	fire_suppression_effect = 3 //Three times better at putting out fire than water.

/datum/reagent/water/extinguisher/touch_turf(turf/T)
	..()
	if(volume >= 1)
		if(istype(T, /turf/simulated))
			var/turf/simulated/S = T
			if(S.wet >= 2)
				S.wet_floor(1, TRUE)
		for(var/obj/effect/O in T)
			if(istype(O,/obj/effect/decal/cleanable/liquid_fuel)) //We only clean flue spills
				qdel(O)
		for(var/mob/living/carbon/slime/M in T)
			M.adjustToxLoss(rand(15, 25))

	T.color = "white"
	return TRUE

/datum/reagent/water/extinguisher/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 1 * effect_multiplier)

/datum/reagent/water/extinguisher/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 1 * effect_multiplier)

/datum/reagent/water/extinguisher/affect_blood(var/mob/living/carbon/M, var/alien)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 2)

/datum/reagent/water/holywater
	name = "Holy Water"
	description = "A ubiquitous chemical substance that is composed of hydrogen and oxygen with the blessings of faith."
	fire_suppression_effect = 1.1 //When your hopeful this works...
	id = "holywater"

/datum/reagent/water/holywater/affect_ingest(mob/living/carbon/human/M, alien, effect_multiplier)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 2)
	var/obj/item/implant/core_implant/I = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
	if(!I && !I.wearer) //Do we have a core implant?
		return
	if(!I.active) //Is it active?
		return
	M.heal_organ_damage(0, 0.2 * effect_multiplier, 0, 3 * effect_multiplier)
	..()

/datum/reagent/water/holywater/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 1 * effect_multiplier)

/datum/reagent/water/holywater/affect_blood(var/mob/living/carbon/M, var/alien)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 2)

/datum/reagent/water/holywater/touch_turf(turf/T)
	..()
	if(volume >= 5)
		T.holy = 1
	return TRUE

/datum/reagent/water/touch_turf(turf/simulated/T)
	if(!istype(T))
		return TRUE

	var/datum/gas_mixture/environment = T.return_air()
	var/min_temperature = T0C + 100 // 100C, the boiling point of water

	var/hotspot = (locate(/obj/fire) in T)
	if(hotspot && !istype(T, /turf/space))
		var/datum/gas_mixture/lowertemp = T.remove_air(T:air:total_moles)
		lowertemp.temperature = max(min(lowertemp.temperature-2000, lowertemp.temperature / 2), 0)
		lowertemp.react()
		T.assume_air(lowertemp)
		qdel(hotspot)

	if (environment && environment.temperature > min_temperature) // Abstracted as steam or something
		var/removed_heat = between(0, volume * (WATER_LATENT_HEAT * fire_suppression_effect), -environment.get_thermal_energy_change(min_temperature))
		environment.add_thermal_energy(-removed_heat)
		if (prob(5))
			T.visible_message(SPAN_WARNING("The water sizzles as it lands on \the [T]!"))

	else if(volume >= 10)
		T.wet_floor(1)
	return TRUE

/datum/reagent/water/touch_obj(obj/O)
	if(istype(O, /obj/item/reagent_containers/snacks/monkeycube))
		var/obj/item/reagent_containers/snacks/monkeycube/cube = O
		if(!cube.wrapped)
			cube.Expand()

/datum/reagent/water/touch_mob(var/mob/living/L, var/amount)
	if(istype(L))
		L.fire_stacks = 0
		L.ExtinguishMob()
		/*
		var/needed = L.fire_stacks * 10
		if(amount > needed)
			L.fire_stacks = 0
			L.ExtinguishMob()
			remove_self(needed)
		else
			L.adjust_fire_stacks(-(amount / 10))
			remove_self(amount)
		*/

/datum/reagent/water/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species.reagent_tag == IS_SLIME)
		M.take_organ_damage(0, 2)
	if(isslime(M))
		var/mob/living/carbon/slime/S = M
		S.adjustToxLoss(20 * effect_multiplier) // Babies have 150 health, adults have 200; So, 10 units and 13.5
		if(!S.client)
			if(S.Target) // Like cats
				S.Target = null
				++S.Discipline
		if(dose >= MTR(effect_multiplier, CHEM_TOUCH))
			S.visible_message(SPAN_WARNING("[S]'s flesh sizzles where the water touches it!"), SPAN_DANGER("Your flesh burns in the water!"))

/datum/reagent/toxin/fuel
	name = "Welding fuel"
	id = "fuel"
	description = "Required for welders. Inflammable."
	taste_description = "gross metal"
	reagent_state = LIQUID
	color = "#660000"
	touch_met = 5

	glass_icon_state = "dr_gibb_glass"
	glass_name = "welder fuel"
	glass_desc = "Unless you are an industrial tool, this is probably not safe for consumption."
	common = TRUE //Ubiquitous enough for everyone to have dealt with it, there are canisters of it all over the place.

/datum/reagent/toxin/fuel/touch_turf(turf/T)
	new /obj/effect/decal/cleanable/liquid_fuel(T, volume)
	remove_self(volume)
	return TRUE

/datum/reagent/toxin/fuel/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 2 * (issmall(M) ? effect_multiplier * 2 : effect_multiplier))

/datum/reagent/toxin/fuel/touch_mob(mob/living/L, var/amount)
	if(istype(L))
		L.adjust_fire_stacks(amount / 10) // Splashing people with welding fuel to make them easy to ignite!
