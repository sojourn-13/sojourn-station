/datum/reagent/acetone
	name = "Acetone"
	id = "acetone"
	description = "A colorless liquid solvent used in chemical synthesis."
	taste_description = "acid"
	reagent_state = LIQUID
	color = "#808080"
	metabolism = REM * 0.2
	reagent_type = "General"

/datum/reagent/acetone/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 1.5 * effect_multiplier)

/datum/reagent/acetone/touch_obj(var/obj/O)	//I copied this wholesale from ethanol and could likely be converted into a shared proc. ~Techhead
	if(istype(O, /obj/item/paper))
		var/obj/item/paper/paperaffected = O
		paperaffected.clearpaper()
		to_chat(usr, "The solution dissolves the ink on the paper.")
		return
	if(istype(O, /obj/item/book))
		if(volume < 5)
			return
		var/obj/item/book/affectedbook = O
		affectedbook.dat = null
		to_chat(usr, "<span class='notice'>The solution dissolves the ink on the book.</span>")
	return

/datum/reagent/metal
	reagent_type = "Metal"

/datum/reagent/metal/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_MECH_REPAIR, 0.05)	// Makes metals useful and stackable for FBPs

/datum/reagent/metal/affect_ingest(var/mob/living/carbon/M, var/alien)
	if(M.species.reagent_tag == IS_CHTMANT)
		M.add_chemical_effect(CE_TOXIN, 0.1)

	if(M.stats.getPerk(PERK_NANITE_METAL_EATER))
		M.add_chemical_effect(CE_BLOODCLOT, 0.2)
		M.adjustNutrition(0.4) //Metal even with the perk isnt that filling


/datum/reagent/metal/affect_blood(var/mob/living/carbon/M, var/alien)
	if(M.species.reagent_tag == IS_CHTMANT)
		M.add_chemical_effect(CE_TOXIN, 0.2)


/datum/reagent/metal/aluminum
	name = "Aluminum"
	id = "aluminum"
	taste_description = "metal"
	taste_mult = 1.1
	description = "A silvery white and ductile member of the boron group of chemical elements."
	reagent_state = SOLID
	color = "#A8A8A8"
	common = TRUE //Identifiable on sight

/datum/reagent/toxin/ammonia
	name = "Ammonia"
	id = "ammonia"
	taste_description = "mordant"
	taste_mult = 2
	description = "A caustic substance commonly used in fertilizer or household cleaners."
	reagent_state = LIQUID
	color = "#404030"
	metabolism = REM * 0.5
	common = TRUE //Identifiable by smell

/datum/reagent/toxin/ammonia/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 0.7 * effect_multiplier)

/datum/reagent/carbon
	name = "Carbon"
	id = "carbon"
	description = "A chemical element, the building block of life."
	taste_description = "sour chalk"
	taste_mult = 1.5
	reagent_state = SOLID
	color = "#1C1300"
	ingest_met = REM * 5
	reagent_type = "Reactive nonmetal"

/datum/reagent/carbon/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(M.ingested && M.ingested.reagent_list.len > 1) // Need to have at least 2 reagents - cabon and something to remove
		var/effect = 1 / (M.ingested.reagent_list.len - 1)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(R == src)
				continue
			M.ingested.remove_reagent(R.id, effect_multiplier * effect)

/datum/reagent/carbon/touch_turf(turf/T)
	if(!istype(T, /turf/space))
		var/obj/effect/decal/cleanable/dirt/dirtoverlay = locate(/obj/effect/decal/cleanable/dirt, T)
		if (!dirtoverlay)
			dirtoverlay = new/obj/effect/decal/cleanable/dirt(T)
			dirtoverlay.alpha = volume * 30
		else
			dirtoverlay.alpha = min(dirtoverlay.alpha + volume * 30, 255)
	return TRUE

/datum/reagent/metal/copper
	name = "Copper"
	id = "copper"
	description = "A highly ductile metal."
	taste_description = "copper"
	color = "#6E3B08"
	common = TRUE //Identifiable on sight

/datum/reagent/ethanol
	name = "Ethanol" //Parent class for all alcoholic reagents.
	id = "ethanol"
	description = "A well-known alcohol with a variety of applications."
	taste_description = "pure alcohol"
	reagent_state = LIQUID
	color = "#404030"
	ingest_met = REM * 4
	touch_met = 5
	var/nutriment_factor = 0
	var/strength = 10 // This is, essentially, units between stages - the lower, the stronger. Less fine tuning, more clarity.
	var/strength_mod = 2
	var/toxicity = 1

	var/druggy = 0
	var/adj_temp = 0
	var/targ_temp = 310
	var/halluci = 0
	taste_tag = list(TASTE_STRONG)
	sanity_gain_ingest = 0.5
	common = TRUE //All alchoholic reagents can be ID'd pretty easily
	liver_dependent = TRUE // Alcohol requires liver to metabolize

	glass_icon_state = "glass_clear"
	glass_name = "ethanol"
	glass_desc = "A well-known alcohol with a variety of applications."
	reagent_type = "Alchohol"

/datum/reagent/ethanol/touch_mob(var/mob/living/L, var/amount)
	if(istype(L))
		L.adjust_fire_stacks(amount / 15)

/datum/reagent/ethanol/on_mob_add(mob/living/L)
	..()
	LEGACY_SEND_SIGNAL(L, COMSIG_CARBON_HAPPY, src, MOB_ADD_DRUG)

/datum/reagent/ethanol/on_mob_delete(mob/living/L)
	..()
	LEGACY_SEND_SIGNAL(L, COMSIG_CARBON_HAPPY, src, MOB_DELETE_DRUG)

/datum/reagent/ethanol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, toxicity * (issmall(M) ? effect_multiplier * 2 : effect_multiplier))
	M.add_chemical_effect(CE_PAINKILLER, (dose + 1) * 6.25)
	M.add_chemical_effect(CE_ONCOCIDAL, 0.5)	// STALKER reference
	LEGACY_SEND_SIGNAL(M, COMSIG_CARBON_HAPPY, src, ON_MOB_DRUG)
	return

/datum/reagent/ethanol/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustNutrition(nutriment_factor * (issmall(M) ? effect_multiplier * 2 : effect_multiplier))

	M.add_chemical_effect(CE_ALCOHOL, 1)


//Tough people can drink a lot
	var/tolerance = max(5, strength + (M.stats.getStat(STAT_TGH) * 0.5)) //TGH scaling is 50%


	if(dose * strength_mod >= tolerance) // Slurring
		M.slurring = max(M.slurring, 30)

	if(dose * strength_mod >= tolerance * 1.5) // Early warning
		M.make_dizzy(6) // It is decreased at the speed of 3 per tick

	if(dose * strength_mod >= tolerance * 2) // Confusion - walking in random directions
		M.confused = max(M.confused, 3)

	if(dose * strength_mod >= tolerance * 3) // Blurry vision
		M.eye_blurry = max(M.eye_blurry, 5)

	if(dose * strength_mod >= tolerance * 4) // Drowsyness - periodically falling asleep
		M.drowsyness = max(M.drowsyness, 5)

	if(dose * strength_mod >= tolerance * 5) // Pass out
		M.paralysis = max(M.paralysis, 10)
		M.sleeping  = max(M.sleeping, 15)

	if(dose * strength_mod >= tolerance * 6) // Toxic dose
		M.add_chemical_effect(CE_ALCOHOL_TOXIC, toxicity)


	if(druggy != 0)
		M.druggy = max(M.druggy, druggy)

	if(adj_temp > 0 && M.bodytemperature < targ_temp) // 310 is the normal bodytemp. 310.055
		M.bodytemperature = min(targ_temp, M.bodytemperature + (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))
	if(adj_temp < 0 && M.bodytemperature > targ_temp)
		M.bodytemperature = min(targ_temp, M.bodytemperature - (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))

	if(halluci)
		M.adjust_hallucination(halluci, halluci)

	apply_sanity_effect(M, effect_multiplier)
	LEGACY_SEND_SIGNAL(M, COMSIG_CARBON_HAPPY, src, ON_MOB_DRUG)

	var/mob/living/carbon/human/H = M
	if(istype(H))
		H.sanity.onAlcohol(src, effect_multiplier)
		if(H.frost > 0)
			H.frost -= 1


/datum/reagent/ethanol/touch_obj(var/obj/O)
	if(istype(O, /obj/item/paper))
		var/obj/item/paper/paperaffected = O
		paperaffected.clearpaper()
		to_chat(usr, "The solution dissolves the ink on the paper.")
		return
	if(istype(O, /obj/item/book))
		if(volume < 5)
			return
		var/obj/item/book/affectedbook = O
		affectedbook.dat = null
		to_chat(usr, "<span class='notice'>The solution dissolves the ink on the book.</span>")
	return

/datum/reagent/toxin/hydrazine
	name = "Hydrazine"
	id = "hydrazine"
	description = "A toxic, colorless, flammable liquid with a strong ammonia-like odor, in hydrate form."
	taste_description = "sweet tasting metal"
	reagent_state = LIQUID
	color = "#808080"
	metabolism = REM * 0.2
	touch_met = 5

/datum/reagent/toxin/hydrazine/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 2 * effect_multiplier)

/datum/reagent/toxin/hydrazine/affect_touch(var/mob/living/carbon/M, var/alien, var/effect_multiplier) // Hydrazine is both toxic and flammable.
	M.adjust_fire_stacks(0.4 / 12)
	M.add_chemical_effect(CE_TOXIN, effect_multiplier)

/datum/reagent/toxin/hydrazine/touch_turf(turf/T)
	new /obj/effect/decal/cleanable/liquid_fuel(T, volume)
	remove_self(volume)
	return TRUE

/datum/reagent/metal/iron
	name = "Iron"
	id = "iron"
	description = "Pure iron is a metal."
	taste_description = "metal"
	reagent_state = SOLID
	color = "#353535"
	scannable = TRUE // Helps with blood restoration, should avoid confusion with other stuff


/datum/reagent/metal/iron/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.add_chemical_effect(CE_BLOODRESTORE, 0.8 * effect_multiplier)

/datum/reagent/metal/lithium
	name = "Lithium"
	id = "lithium"
	description = "A chemical element, used as antidepressant."
	taste_description = "metal"
	reagent_state = SOLID
	color = "#808080"

/datum/reagent/metal/lithium/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	if(M.canmove && !M.restrained() && istype(M.loc, /turf/space))
		step(M, pick(cardinal))
	if(prob(5))
		M.emote(pick("twitch", "drool", "moan"))

/datum/reagent/metal/mercury
	name = "Mercury"
	id = "mercury"
	description = "A chemical element."
	taste_mult = 0 //mercury apparently is tasteless. IDK
	reagent_state = LIQUID
	color = "#484848"
	common = TRUE //everyone knows what mercury looks like


/datum/reagent/metal/mercury/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	if(M.canmove && !M.restrained() && istype(M.loc, /turf/space))
		step(M, pick(cardinal))
	if(prob(5))
		M.emote(pick("twitch", "drool", "moan"))
	M.adjustBrainLoss(0.1)

/datum/reagent/phosphorus
	name = "Phosphorus"
	id = "phosphorus"
	description = "A chemical element, the backbone of biological energy carriers."
	taste_description = "vinegar"
	reagent_state = SOLID
	color = "#832828"
	reagent_type = "Reactive nonmetal"


/datum/reagent/metal/potassium
	name = "Potassium"
	id = "potassium"
	description = "A soft, low-melting solid that can easily be cut with a knife. Reacts violently with water."
	taste_description = "sweetness" //potassium is bitter in higher doses but sweet in lower ones.
	reagent_state = SOLID
	color = "#A0A0A0"
	scannable = TRUE // Helps with pinpointing kidney failure

/datum/reagent/metal/potassium/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	if(volume > 3)
		M.add_chemical_effect(CE_PULSE, 1)
	if(volume > 10)
		M.add_chemical_effect(CE_PULSE, 1)

/datum/reagent/metal/radium
	name = "Radium"
	id = "radium"
	description = "Radium is an alkaline earth metal. It is extremely radioactive."
	taste_description = "the color blue, and regret"
	reagent_state = SOLID
	color = "#C7C7C7"

/datum/reagent/metal/radium/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.apply_effect(1 * (issmall(M) ? effect_multiplier * 2 : effect_multiplier), IRRADIATE, 0) // Radium may increase your chances to cure a disease


/datum/reagent/metal/radium/touch_turf(turf/T)
	if(volume >= 3)
		if(!istype(T, /turf/space))
			var/obj/effect/decal/cleanable/greenglow/glow = locate(/obj/effect/decal/cleanable/greenglow, T)
			if(!glow)
				new /obj/effect/decal/cleanable/greenglow(T)
			return TRUE
	return TRUE

/datum/reagent/acid
	name = "Sulphuric acid"
	id = "sacid"
	description = "A very corrosive mineral acid with the molecular formula H2SO4."
	taste_description = "acid"
	reagent_state = LIQUID
	color = "#DB5008"
	metabolism = REM * 2
	touch_met = 50 // It's acid!
	var/power = 5
	var/meltdose = 10 // How much is needed to melt
	reagent_type = "Acid"

/datum/reagent/acid/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_MECH_ACID, 0.2 * power)

/datum/reagent/acid/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.take_organ_damage(0, (issmall(M) ? effect_multiplier * 2: effect_multiplier * power * 2))

/datum/reagent/acid/affect_touch(mob/living/carbon/M, alien, effect_multiplier) // This is the most interesting
	if(!ishuman(M))
		M.apply_damage(volume * power * 0.2, BURN)
		return
	var/mob/living/carbon/human/our_man = M
	var/list/bodyparts = list(HEAD,UPPER_TORSO,LOWER_TORSO,ARM_LEFT,ARM_RIGHT,LEG_LEFT,LEG_RIGHT)
	var/units_per_bodypart = volume / 7
	var/list/obj/item/clothing/wearing_1 = list(
		our_man.head,
		our_man.glasses,
		our_man.wear_suit,
		our_man.shoes,
		our_man.gloves
	)
	var/list/obj/item/clothing/wearing_2 = list(
		our_man.wear_mask,
		our_man.w_uniform,
	)
	var/factor = 0.3 // rather randomly chosen
	remove_self(volume)
	for(var/bodypart in bodyparts)
		var/stop_loop = FALSE
		var/units_for_this_part = units_per_bodypart
		// handles first layer of clothing.
		for(var/obj/item/clothing/C in wearing_1)
			if(!(C.body_parts_covered & bodypart))
				continue
			if(C.unacidable || C.armor.bio > 99)
				stop_loop = TRUE
				continue
			var/melting_requirement = (C.armor.bio / 100) * factor * meltdose
			if(C.armor.bio >= 100 || melting_requirement > units_per_bodypart)
				stop_loop = TRUE
			else
				to_chat(our_man, SPAN_DANGER("The [C.name] melts under the action of acid."))
				units_for_this_part -= melting_requirement
				our_man.remove_from_mob(C)
				wearing_1 -= C
				qdel(C)
		if(stop_loop)
			continue
		// second layer of clothing.
		for(var/obj/item/clothing/C in wearing_2)
			if(!(C.body_parts_covered & bodypart))
				continue
			if(C.unacidable || C.armor.bio > 99)
				stop_loop = TRUE
				continue
			var/melting_requirement = (C.armor.bio / 100) * factor * meltdose
			if(C.armor.bio >= 100 || melting_requirement > units_per_bodypart)
				stop_loop = TRUE
			else
				to_chat(our_man, SPAN_DANGER("The [C.name] melts under the action of acid."))
				units_for_this_part -= melting_requirement
				our_man.remove_from_mob(C)
				wearing_2 -= C
				qdel(C)

		if (stop_loop)
			continue
		// third layer of clothing, no bio protection
		for(var/obj/item/underwear/U in our_man.worn_underwear)
			if(!(U.required_free_body_parts & bodypart))
				continue
			our_man.worn_underwear -= U
			qdel(U)
		our_man.update_underwear()

		if(stop_loop)
			continue
		M.take_organ_damage(0, units_for_this_part * power * 0.1)

/datum/reagent/acid/touch_obj(obj/O)
	if(istype(O, /obj/effect/plant/hivemind))
		qdel(O)
	if(O.unacidable)
		return
	if((istype(O, /obj/item) || istype(O, /obj/effect/plant)) && (volume > meltdose))
		var/obj/effect/decal/cleanable/molten_item/I = new/obj/effect/decal/cleanable/molten_item(O.loc)
		I.desc = "Looks like this was \an [O] some time ago."
		for(var/mob/M in viewers(5, O))
			to_chat(M, "<span class='warning'>\The [O] melts.</span>")
		qdel(O)
		remove_self(meltdose) // 10 units of acid will not melt EVERYTHING on the tile

/datum/reagent/acid/hydrochloric //Like sulfuric, but less toxic and more acidic.
	name = "Hydrochloric Acid"
	id = "hclacid"
	description = "A very corrosive mineral acid with the molecular formula HCl."
	taste_description = "stomach acid"
	reagent_state = LIQUID
	color = "#808080"
	power = 3
	meltdose = 8

/datum/reagent/silicon
	name = "Silicon"
	id = "silicon"
	description = "A tetravalent metalloid, silicon is less reactive than its chemical analog carbon."
	reagent_state = SOLID
	color = "#A8A8A8"
	reagent_type = "Metalloid"

/datum/reagent/metal/sodium
	name = "Sodium"
	id = "sodium"
	description = "A chemical element, readily reacts with water."
	taste_description = "salty metal"
	reagent_state = SOLID
	color = "#808080"

/datum/reagent/organic/sugar
	name = "Sugar"
	id = "sugar"
	description = "The organic compound commonly known as table sugar and sometimes called saccharose. This white, odorless, crystalline powder has a pleasing, sweet taste."
	taste_description = "sugar"
	taste_mult = 1.8
	reagent_state = SOLID
	color = "#FFFFFF"
	glass_icon_state = "iceglass"
	glass_name = "sugar"
	glass_desc = "The organic compound commonly known as table sugar and sometimes called saccharose. This white, odorless, crystalline powder has a pleasing, sweet taste."
	common = TRUE //everyone knows what sugar is
	liver_dependent = FALSE // Basic nutrient, doesn't need liver processing

/datum/reagent/organic/sugar/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.adjustNutrition(4 * effect_multiplier)

/datum/reagent/sulfur
	name = "Sulfur"
	id = "sulfur"
	description = "A chemical element with a pungent smell."
	taste_description = "old eggs"
	reagent_state = SOLID
	color = "#BF8C00"
	reagent_type = "Reactive nonmetal"
	common = TRUE //everyone knows this smell

/datum/reagent/metal/tungsten
	name = "Tungsten"
	id = "tungsten"
	description = "A chemical element, and a strong oxidizing agent."
	taste_mult = 0 //no taste
	reagent_state = SOLID
	color = "#DCDCDC"
