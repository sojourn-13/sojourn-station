/datum/reagent/organic
	reagent_type = "Organic"
/* Food */

/datum/reagent/organic/nutriment
	name = "Nutriment"
	id = "nutriment"
	description = "All the vitamins, minerals, and carbohydrates the body needs in pure form."
	taste_mult = 4
	reagent_state = SOLID
	metabolism = REM * 2
	var/nutriment_factor = 5 // Per metabolism tick
	var/regen_factor = 0.8 //Used for simple animal health regeneration
	var/injectable = 0
	color = "#664330"
	common = TRUE //People should know that plant food is plant food let's be real
	liver_dependent = FALSE // Basic nutrients, naturally processed without liver

/datum/reagent/organic/nutriment/mix_data(var/list/newdata, var/newamount)
	if(!islist(newdata) || !newdata.len)
		return
	..()
	for(var/i in 1 to newdata.len)
		if(!(newdata[i] in data))
			data.Add(newdata[i])
			data[newdata[i]] = 0
		data[newdata[i]] += newdata[newdata[i]]
	var/totalFlavor = 0
	for(var/i in 1 to data.len)
		totalFlavor += data[data[i]]

	if(totalFlavor != 0)
		var/flavors_to_remove = list()
		for(var/flavor in data) //cull the tasteless
			if(data[flavor]/totalFlavor * 100 < 10)
				flavors_to_remove += flavor

		data -= flavors_to_remove

/datum/reagent/organic/nutriment/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(!injectable)
		M.add_chemical_effect(CE_TOXIN, 5 * effect_multiplier)
		return
	affect_ingest(M, alien, effect_multiplier * 1.2)

/datum/reagent/organic/nutriment/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(VAMPIRE in M.mutations)
		return

	if(ishuman(M))
		if(M.stats.getPerk(PERK_HERBIVORE))
			nutriment_factor = 7
		if(M.stats.getPerk(PERK_CARNIVORE))
			nutriment_factor = 1

	// Small bodymass, more effect from lower volume.
	M.adjustNutrition(nutriment_factor * (issmall(M) ? effect_multiplier * 2 : effect_multiplier)) // For hunger and fatness
	M.add_chemical_effect(CE_BLOODRESTORE, 0.1 * (issmall(M) ? effect_multiplier * 2 : effect_multiplier))

// CFW - 02.03.25 - Adding War Cake taste
/datum/reagent/organic/nutriment/warcake/sweetmemories
	name = "Sweet Memories"
	id = "warcakesm"
	description = "The source of joy and a reminder of better times."
	taste_description = "sweet memories"
	color = "#FFFFFF"
	scannable = FALSE
	injectable = 1
	common = FALSE //It's basically sugar
	price_per_unit = 0.725

/datum/reagent/organic/nutriment/warcake/unendingsadness
	name = "Unending Sadness"
	id = "warcakeus"
	description = "A painful yet necessary reminder of better times."
	taste_description = "unending sadness"
	color = "#FFFFFF"
	scannable = FALSE
	injectable = 1
	common = FALSE //It's basically sugar
	price_per_unit = 0.725

/datum/reagent/organic/nutriment/glucose
	name = "Glucose"
	id = "glucose"
	description = "Most important source of energy in all organisms."
	taste_description = "sweetness"
	color = "#FFFFFF"
	scannable = TRUE
	injectable = 1
	common = TRUE //It's basically sugar
	price_per_unit = 0.725
	liver_dependent = FALSE // Essential nutrient, naturally metabolized without liver

/datum/reagent/organic/nutriment/protein
	name = "Protein"
	taste_description = "some sort of protein"
	id = "protein"
	description = "Essential nutrient for the human body."
	color = "#440000"
	common = TRUE //Protein Shake
	price_per_unit = 0.13
	liver_dependent = FALSE // Essential nutrient, naturally processed without liver

/datum/reagent/organic/nutriment/protein/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(VAMPIRE in M.mutations)
		return

	if(ishuman(M))
		if(M.stats.getPerk(PERK_CARNIVORE))
			nutriment_factor = 7
		if(M.stats.getPerk(PERK_HERBIVORE))
			nutriment_factor = 1

	// Small bodymass, more effect from lower volume.
	M.adjustNutrition(nutriment_factor * (issmall(M) ? effect_multiplier * 2 : effect_multiplier)) // For hunger and fatness
	M.add_chemical_effect(CE_BLOODRESTORE, 0.1 * (issmall(M) ? effect_multiplier * 2 : effect_multiplier))

/datum/reagent/organic/nutriment/preservatives
	name = "Preservatives"
	taste_description = "bland preservatives"
	id = "preservatives"
	description = "A slurry of bland chemical preservatives that takes years, if not decades, to go bad."
	color = "#440000"
	common = TRUE //Snacks
	nutriment_factor = 1
	regen_factor = 0.2
	price_per_unit = 0.01

/datum/reagent/organic/nutriment/preservatives/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	if(VAMPIRE in M.mutations)
		return

	if(ishuman(M))
		if(M.stats.getPerk(PERK_SNACKIVORE))
			M.adjustNutrition(nutriment_factor * 10)
			M.adjustOxyLoss(-0.3 * effect_multiplier)
			M.heal_organ_damage(0.1 * effect_multiplier, 0.1 * effect_multiplier)
			M.add_chemical_effect(CE_TOXIN, 1)
			M.add_chemical_effect(CE_BLOODCLOT, 0.1)

	return ..()

/datum/reagent/organic/nutriment/protein/egg
	name = "Egg Yolk"
	taste_description = "egg"
	id = "egg"
	description = "Store significant amounts of protein and choline"
	color = "#FFFFAA"
	common = TRUE //egg
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/honey
	name = "Honey"
	id = "honey"
	description = "A golden yellow syrup, loaded with sugary sweetness."
	taste_description = "sweetness"
	nutriment_factor = 4
	color = "#FFFF00"
	common = TRUE
	price_per_unit = 0.35

/datum/reagent/organic/nutriment/honey/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.add_chemical_effect(CE_ANTITOX, 0.5)

/datum/reagent/organic/nutriment/flour
	name = "flour"
	id = "flour"
	description = "A powder made by grinding raw grains, roots, beans, nuts, or seeds."
	taste_description = "chalky wheat"
	reagent_state = SOLID
	nutriment_factor = 0.4
	color = "#FFFFFF"
	common = TRUE
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/flour/touch_turf(turf/simulated/T)
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/flour(T)
	return TRUE

/datum/reagent/organic/nutriment/coco
	name = "Coco Powder"
	id = "coco"
	description = "A fatty, bitter paste made from coco beans."
	taste_description = "bitterness"
	taste_mult = 1.3
	reagent_state = SOLID
	nutriment_factor = 2
	color = "#302000"
	common = TRUE
	price_per_unit = 0.14

/datum/reagent/organic/nutriment/soysauce
	name = "Soysauce"
	id = "soysauce"
	description = "A salty sauce made from the soy plant."
	taste_description = "umami"
	taste_mult = 1.1
	reagent_state = LIQUID
	nutriment_factor = 0.8
	color = "#792300"
	common = TRUE
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/ketchup
	name = "Ketchup"
	id = "ketchup"
	description = "It's tomato paste."
	taste_description = "ketchup"
	reagent_state = LIQUID
	nutriment_factor = 2
	color = "#ce190c"
	common = TRUE
	price_per_unit = 0.175

/datum/reagent/organic/nutriment/vinegar
	name = "Vinegar"
	id = "vinegar"
	description = "Alcohol-based vinegar, an ancient and delicious condiment for a great variety of foods and salads."
	taste_description = "tartness" // Not making it extreme so it may be used as condiment for salads and whatnot, but why would you drink pure vinegar.
	color = "#B53C2C" // Red wine vinegar.
	reagent_state = LIQUID
	nutriment_factor = 2
	common = TRUE
	price_per_unit = 0.2

/datum/reagent/organic/nutriment/bbqsauce
	name = "Barbecue sauce"
	id = "bbqsauce"
	description = "Slather it on pork or chicken to greatly enhance its flavor. \
	Or to whatever food you like, to make it taste better. \
	You are, after all, the big boss of your barbecue sauce." // No cayenne pepper though.
	color = "#731008" // Ketchup's old color, to distinguish between the two.
	taste_description = "barbecue sauce"
	reagent_state = LIQUID
	nutriment_factor = 2
	common = TRUE
	price_per_unit = 0.3

/datum/reagent/organic/nutriment/rice
	name = "Rice"
	id = "rice"
	description = "Enjoy the great taste of nothing."
	taste_description = "rice"
	taste_mult = 0.4
	reagent_state = SOLID
	nutriment_factor = 0.4
	color = "#FFFFFF"
	common = TRUE
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/cherryjelly
	name = "Cherry Jelly"
	id = "cherryjelly"
	description = "Totally the best. Only to be spread on foods with excellent lateral symmetry."
	taste_description = "cherry"
	taste_mult = 1.3
	reagent_state = LIQUID
	nutriment_factor = 0.4
	color = "#801E28"
	common = TRUE
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/cornoil
	name = "Corn Oil"
	id = "cornoil"
	description = "An oil derived from various types of corn."
	taste_description = "oil"
	taste_mult = 0.1
	reagent_state = LIQUID
	nutriment_factor = 8
	color = "#302000"
	common = TRUE
	price_per_unit = 0.15

/datum/reagent/organic/nutriment/cornoil/touch_turf(turf/simulated/T)
	if(!istype(T))
		return TRUE

	var/hotspot = (locate(/obj/fire) in T)
	if(hotspot && !istype(T, /turf/space))
		var/datum/gas_mixture/lowertemp = T.remove_air(T:air:total_moles)
		lowertemp.temperature = max(min(lowertemp.temperature-2000, lowertemp.temperature / 2), 0)
		lowertemp.react()
		T.assume_air(lowertemp)
		qdel(hotspot)

	if(volume >= 3)
		T.wet_floor()
	return TRUE

/datum/reagent/organic/nutriment/sprinkles
	name = "Sprinkles"
	id = "sprinkles"
	description = "Multi-colored little bits of sugar, commonly found on donuts. Loved by cops."
	taste_description = "childhood whimsy"
	nutriment_factor = 0.4
	color = "#FF00FF"
	common = TRUE
	price_per_unit = 0.75

/datum/reagent/organic/nutriment/mint
	name = "Mint"
	id = "mint"
	description = "Also known as Mentha."
	taste_description = "mint"
	reagent_state = LIQUID
	color = "#CF3600"
	common = TRUE
	price_per_unit = 0.25

/datum/reagent/other/lipozine // The anti-nutriment.
	name = "Lipozine"
	id = "lipozine"
	description = "A chemical compound that causes a powerful fat-burning reaction."
	taste_description = "mothballs"
	reagent_state = LIQUID
	color = "#BBEDA4"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	price_per_unit = 0.2

/datum/reagent/other/lipozine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.nutrition = max(M.nutrition - 1 * effect_multiplier, 0)

/datum/reagent/organic/nutriment/dry_ramen
	name = "Dry Ramen"
	id = "dry_ramen"
	description = "Space age food, since August 25, 1958. Contains dried noodles, vegetables, and chemicals that boil in contact with water."
	taste_description = "dry and cheap noodles"
	reagent_state = SOLID
	nutriment_factor = 1
	color = "#302000"
	common = TRUE
	price_per_unit = 0.025

/datum/reagent/organic/nutriment/hot_ramen
	name = "Hot Ramen"
	id = "hot_ramen"
	description = "The noodles are boiled, the flavors are artificial, just like being back in college."
	taste_description = "wet and cheap noodles"
	reagent_state = LIQUID
	color = "#302000"
	nutriment_factor = 3
	common = TRUE
	price_per_unit = 0.025

/datum/reagent/organic/nutriment/hot_ramen/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.bodytemperature += 1.5 * TEMPERATURE_DAMAGE_COEFFICIENT
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.frost > 0)
			H.frost -= 5

/datum/reagent/organic/nutriment/hell_ramen
	name = "Hell Ramen"
	id = "hell_ramen"
	description = "The noodles are boiled, the flavors are artificial, just like being back in college."
	taste_description = "wet and cheap noodles on fire"
	reagent_state = LIQUID
	nutriment_factor = "#302000"
	nutriment_factor = 3.2 //So you have a reason to make these over normal ones.
	common = TRUE
	price_per_unit = 0.03

/datum/reagent/organic/nutriment/hell_ramen/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.bodytemperature += 5 * TEMPERATURE_DAMAGE_COEFFICIENT
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.frost > 0)
			H.frost -= 8

/datum/reagent/organic/nothing
	name = "Nothing"
	id = "nothing"
	description = "Absolutely nothing."
	taste_description = "nothing"

	glass_icon_state = "nothing"
	glass_name = "nothing"
	glass_desc = "Absolutely nothing."
	price_per_unit = 1

/* Non-food stuff like condiments */

/datum/reagent/other/sodiumchloride
	name = "Table Salt"
	id = "sodiumchloride"
	description = "Sodium chloride, most commonly known as salt. Commonly used to season food. It is iodized."
	taste_description = "salt"
	taste_tag = list(SALTY_FOOD)
	reagent_state = SOLID
	color = "#FFFFFF"
	overdose = REAGENTS_OVERDOSE
	scannable = TRUE
	common = TRUE

//	Reasoning: Table salt is usually iodized. Iodine saturates glands.
//	Glands are often getting screwed over by isotopes of iodine if exposed to radiation.
//	Yes its a preventatitve method IRL but this is gamyfictaion.

/datum/reagent/sodiumchloride/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.radiation = max(M.radiation - (0.3 * effect_multiplier), 0) //10 times less effective than Hyronalin

/datum/reagent/organic/blackpepper
	name = "Black Pepper"
	id = "blackpepper"
	description = "A powder ground from peppercorns. Used in many medicinal and beauty products."
	taste_description = "pepper"
	reagent_state = SOLID
	color = "#000000"
	common = TRUE

/datum/reagent/organic/enzyme
	name = "Universal Enzyme"
	id = "enzyme"
	description = "A universal enzyme used in the preparation of certain chemicals and foods."
	taste_description = "sweetness"
	taste_mult = 0.7
	reagent_state = LIQUID
	color = "#365E30"
	overdose = REAGENTS_OVERDOSE
	common = TRUE
	price_per_unit = 1.2

/datum/reagent/organic/frostoil
	name = "Frost Oil"
	id = "frostoil"
	description = "A special oil that noticeably chills the body. Extracted from Ice Peppers."
	taste_description = "oily mint"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#B31008"
	price_per_unit = 0.35

/datum/reagent/organic/frostoil/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.bodytemperature = max(M.bodytemperature - 5 * TEMPERATURE_DAMAGE_COEFFICIENT, 0)
	if(prob(1))
		M.emote("shiver")
	if(isslime(M))
		M.bodytemperature = max(M.bodytemperature - rand(10,20), 0)
	holder.remove_reagent("capsaicin", 5)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.frost > 0)
			H.frost += 2


/datum/reagent/organic/capsaicin
	name = "Capsaicin Oil"
	id = "capsaicin"
	description = "This is what makes chili hot."
	taste_description = "hot peppers"
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#B31008"
	var/agony_dose = 5
	var/agony_amount = 2
	var/discomfort_message = "<span class='danger'>Your insides feel uncomfortably hot!</span>"
	var/slime_temp_adj = 10
	common = TRUE //Identifiable by smell.

/datum/reagent/organic/capsaicin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 0.25 * effect_multiplier)

/datum/reagent/organic/capsaicin/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.frost > 0)
			H.frost -= 1
		if((H.species.flags & NO_PAIN) || (PAIN_LESS in H.mutations))
			return
	if(dose < agony_dose)
		if(prob(5) || dose == metabolism) //dose == metabolism is a very hacky way of forcing the message the first time this procs
			to_chat(M, discomfort_message)
	else
		M.adjustHalLoss(agony_amount)
		if(prob(5))
			M.custom_emote(2, "[pick("dry heaves!","coughs!","splutters!")]")
			to_chat(M, SPAN_DANGER("You feel like your insides are burning!"))
	if(isslime(M))
		M.bodytemperature += rand(0, 15) + slime_temp_adj
	holder.remove_reagent("frostoil", 5)

/datum/reagent/organic/capsaicin/condensed
	name = "Condensed Capsaicin"
	id = "condensedcapsaicin"
	description = "A chemical agent used for self-defense and in police work."
	taste_description = "satan's piss"
	taste_mult = 10
	reagent_state = LIQUID
	touch_met = 50 // Get rid of it quickly
	color = "#B31008"
	agony_dose = 0.5
	agony_amount = 4
	discomfort_message = "<span class='danger'>You feel like your insides are burning!</span>"
	slime_temp_adj = 15
	price_per_unit = 0.35

/datum/reagent/organic/capsaicin/condensed/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	var/eyes_covered = 0
	var/mouth_covered = 0
	var/no_pain = 0
	var/obj/item/eye_protection
	var/obj/item/face_protection

	var/list/protection
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		protection = list(H.head, H.glasses, H.wear_mask)
		if((H.species.flags & NO_PAIN) || (PAIN_LESS in H.mutations))
			no_pain = 1 //TODO: living-level can_feel_pain() proc
		if(H.frost > 0)
			H.frost -= 2
	else
		protection = list(M.wear_mask)

	for(var/obj/item/I in protection)
		if(I)
			if(I.body_parts_covered & EYES)
				eyes_covered = 1
				eye_protection = I.name
			if((I.body_parts_covered & FACE) && !(I.item_flags & FLEXIBLEMATERIAL))
				mouth_covered = 1
				face_protection = I.name

	var/message
	if(eyes_covered)
		if(!mouth_covered)
			message = SPAN_WARNING("Your [eye_protection] protects your eyes from the pepper spray!")
	else
		message = SPAN_WARNING("The pepperspray gets in your eyes!")
		if(mouth_covered)
			M.eye_blurry = max(M.eye_blurry, 15)
			M.eye_blind = max(M.eye_blind, 5)
		else
			M.eye_blurry = max(M.eye_blurry, 25)
			M.eye_blind = max(M.eye_blind, 10)

	if(mouth_covered)
		if(!message)
			message = SPAN_WARNING("Your [face_protection] protects you from the pepper spray!")
	else if(!no_pain)
		message = SPAN_DANGER("Your face and throat burn!")
		if(prob(25))
			M.custom_emote(2, "[pick("coughs!","coughs hysterically!","splutters!")]")
		M.Stun(5)
		M.Weaken(5)

/datum/reagent/organic/capsaicin/condensed/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if((H.species.flags & NO_PAIN) || (PAIN_LESS in H.mutations))
			return
	if(dose == metabolism)
		to_chat(M, SPAN_DANGER("You feel like your insides are burning!"))
	else
		M.adjustHalLoss(4)
		if(prob(5))
			M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>", SPAN_DANGER("You feel like your insides are burning!"))
	if(isslime(M))
		M.bodytemperature += rand(15, 30)
	holder.remove_reagent("frostoil", 5)

/datum/reagent/organic/capsaicin/condensed/spider
	name = "Spider Capsaicin"
	id = "condensedcapsaicinspider"
	description = "A strange organic substance with the same effects of Condensed Capsaicin, but only to non-spiders."
	price_per_unit = 0.5

/datum/reagent/organic/capsaicin/condensed/spider/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if (issuperiorspider(M))
		return

	. = ..()

/datum/reagent/organic/capsaicin/condensed/spider/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if (issuperiorspider(M))
		return

	. = ..()

/datum/reagent/organic/capsaicin/condensed/spider/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if (issuperiorspider(M))
		return

	. = ..()



/* Drinks */

/datum/reagent/drink
	name = "Drink"
	id = "drink"
	description = "Uh, some kind of drink."
	reagent_state = LIQUID
	color = "#E78108d0"
	var/nutrition = 0 // Per metabolism tick
	var/adj_dizzy = 0 // Per metabolism tick
	var/adj_drowsy = 0
	var/adj_sleepy = 0
	var/adj_temp = 0
	sanity_gain_ingest = 0.5
	reagent_type = "Drink"
	common = TRUE //Most drinks are obviously identifiable

/datum/reagent/drink/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, 0.25) // Probably not a good idea; not very deadly though
	return

/datum/reagent/drink/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustNutrition(nutrition * effect_multiplier)
	M.dizziness = max(0, M.dizziness + adj_dizzy)
	M.drowsyness = max(0, M.drowsyness + adj_drowsy)
	M.AdjustSleeping(adj_sleepy)
	if(adj_temp > 0 && M.bodytemperature < 310) // 310 is the normal bodytemp. 310.055
		M.bodytemperature = min(310, M.bodytemperature + (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))
	if(adj_temp < 0 && M.bodytemperature > 310)
		M.bodytemperature = min(310, M.bodytemperature - (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))

	var/mob/living/carbon/human/H = M
	if(istype(H))
		H.sanity.onNonAlcohol(src, effect_multiplier)

/datum/reagent/drink/energy_drink_monster
	name = "Claw Energy Drink"
	id = "energy_drink_monster"
	description = "The raw essence of a electrolytes."
	overdose = REAGENTS_OVERDOSE * 2 // Two cans of boomer drink
	taste_description = "chemical water"
	taste_tag = list(TASTE_BUBBLY, TASTE_SWEET)
	color = "#c3b000a9"
	adj_dizzy = -1
	adj_drowsy = -2
	adj_sleepy = -10

/datum/reagent/drink/energy_drink_monster/overdose(mob/living/carbon/M)  // The label warned you.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
		var/obj/item/organ/internal/vital/heart/C = H.random_organ_by_process(OP_LIVER)
		if(istype(L) && !BP_IS_ROBOTIC(L))
			L.take_damage(3, 0)
		if(istype(C) && !BP_IS_ROBOTIC(C))
			L.take_damage(3, 0)

/datum/reagent/drink/energy_drink_baton
	name = "Baton Energy Drink"
	id = "energy_drink_baton"
	description = "The raw essence of a electrolytes and carbonation."
	taste_description = "carbonated chemical water"
	taste_tag = list(TASTE_BUBBLY, TASTE_SWEET)
	overdose = REAGENTS_OVERDOSE * 2 // This is the equivalent of two liters according to core.dm
	color = "#990066d0"
	adj_dizzy = -1
	adj_drowsy = -2
	adj_sleepy = -10

/datum/reagent/drink/energy_drink_baton/overdose(mob/living/carbon/M)  // The label warned you.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
		var/obj/item/organ/internal/vital/heart/C = H.random_organ_by_process(OP_LIVER)
		if(istype(L) && !BP_IS_ROBOTIC(L))
			L.take_damage(3, 0)
		if(istype(C) && !BP_IS_ROBOTIC(C))
			L.take_damage(3, 0)

// Juices

/datum/reagent/drink/banana
	name = "Banana Juice"
	id = "banana"
	description = "The raw essence of a banana."
	taste_description = "banana"
	taste_tag = list(TASTE_SWEET)
	color = "#c3b000a9"

	glass_unique_appearance = TRUE
	glass_icon_state = "banana"
	glass_name = "banana juice"
	glass_desc = "The raw essence of a banana. HONK!"

/datum/reagent/drink/berryjuice
	name = "Berry Juice"
	id = "berryjuice"
	description = "A delicious blend of several different kinds of berries."
	taste_description = "berries"
	taste_tag = list(TASTE_SWEET)
	color = "#990066d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "berryjuice"
	glass_name = "berry juice"
	glass_desc = "Berry juice. Or maybe it's jam. Who cares?"

/datum/reagent/drink/carrotjuice
	name = "Carrot juice"
	id = "carrotjuice"
	description = "Has a uniquely sweet flavor of concentrated carrots."
	taste_description = "carrots"
	taste_tag = list(TASTE_SWEET)
	color = "#FF8C00d0" // rgb: 255, 140, 0

	glass_unique_appearance = TRUE
	glass_icon_state = "carrotjuice"
	glass_name = "carrot juice"
	glass_desc = "It is just like a carrot but without crunching."

/datum/reagent/drink/carrotjuice/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.reagents.add_reagent("imidazoline", effect_multiplier * 0.1)

/datum/reagent/drink/grapejuice
	name = "Grape Juice"
	id = "grapejuice"
	description = "The juice is often sold in stores or fermented and made into wine, brandy, or vinegar."
	taste_description = "grapes"
	taste_tag = list(TASTE_SWEET)
	color = "#863333d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "grapejuice"
	glass_name = "grape juice"
	glass_desc = "It's grrrrrape!"

/datum/reagent/drink/lemonjuice
	name = "Lemon Juice"
	id = "lemonjuice"
	description = "Used to make lemonade, soft drinks, and cocktails."
	taste_description = "sourness"
	taste_tag = list(TASTE_SOUR)
	taste_mult = 1.1
	color = "#AFAF00d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "lemonjuice"
	glass_name = "lemon juice"
	glass_desc = "Sour..."

/datum/reagent/drink/limejuice
	name = "Lime Juice"
	id = "limejuice"
	description = "The sweet-sour juice of limes."
	taste_description = "unbearable sourness"
	taste_tag = list(TASTE_SOUR)
	taste_mult = 1.1
	color = "#35742bd0"

	glass_icon_state = "glass_green"
	glass_name = "lime juice"
	glass_desc = "It's some sweet-sour lime juice"

/datum/reagent/drink/limejuice/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.add_chemical_effect(CE_TOXIN, -0.25 * effect_multiplier)

/datum/reagent/drink/orangejuice
	name = "Orange juice"
	id = "orangejuice"
	description = "Liquid extract of the orange tree fruit, produced by squeezing or reaming oranges."
	taste_description = "oranges"
	taste_tag = list(TASTE_SWEET)
	color = "#E78108d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_orange"
	glass_name = "orange juice"
	glass_desc = "Vitamins! Yay!"

/datum/reagent/drink/orangejuice/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.adjustOxyLoss(-0.2 * effect_multiplier)

/datum/reagent/toxin/poisonberryjuice // It has more in common with toxins than drinks... but it's a juice
	name = "Poison Berry Juice"
	id = "poisonberryjuice"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	taste_description = "berries"
	color = "#863353d0"
	strength = 5

	glass_unique_appearance = TRUE
	glass_icon_state = "poisonberryjuice"
	glass_name = "poison berry juice"
	glass_desc = "Looks like some deadly juice."
	common = FALSE //Queue to the player: 'Hey maybe don't drink this'
	price_per_unit = 0.13

/datum/reagent/drink/potato_juice
	name = "Potato Juice"
	id = "potato"
	description = "Juice of the potato. Best served fresh."
	taste_description = "Irish sadness"
	taste_tag = list(TASTE_PLAIN)
	nutrition = 2
	color = "#302000d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_brown"
	glass_name = "potato juice"
	glass_desc = "Juice from a potato. Bleh."

/datum/reagent/drink/tomatojuice
	name = "Tomato Juice"
	id = "tomatojuice"
	description = "Juice made from tomatoes, usually used as a beverage, either plain or in cocktails"
	taste_description = "tomatoes"
	taste_tag = list(TASTE_UMAMI)
	color = "#731008d0"

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_red"
	glass_name = "tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

/datum/reagent/drink/tomatojuice/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.heal_organ_damage(0, 0.05 * effect_multiplier)

/datum/reagent/drink/watermelonjuice
	name = "Watermelon Juice"
	id = "watermelonjuice"
	description = "Delicious juice made from watermelon."
	taste_description = "sweet watermelon"
	taste_tag = list(TASTE_SWEET)
	color = "#b83333b7"

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_red"
	glass_name = "watermelon juice"
	glass_desc = "Delicious juice made from watermelon."

/datum/reagent/drink/pineapplejuice
	name = "Pineapple Juice"
	id = "pineapplejuice"
	description = "A tart, yet tropical juice."
	taste_description = "pineapple"
	color = "#FFFF66b7"

	glass_icon_state = "glass_yellow"
	glass_name = "pineapple juice"
	glass_desc = "A tart, yet tropical juice."

// Everything else

/datum/reagent/drink/milk
	name = "Milk"
	id = "milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	taste_description = "milk"
	taste_tag = list(TASTE_SLIMEY)
	color = "#DFDFDF"

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_white"
	glass_name = "milk"
	glass_desc = "White and nutritious goodness!"
	price_per_unit = 0.15

/datum/reagent/drink/milk/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.heal_organ_damage(0.05 * effect_multiplier, 0)
	holder.remove_reagent("capsaicin", 1 * effect_multiplier)

/datum/reagent/drink/milk/red
	name = "Strawberry Milk"
	id = "strawberrymilk"
	description = "An opaque red liquid produced by the mammary glands of mammals and berries."
	taste_description = "strawberry milk"
	taste_tag = list(TASTE_SLIMEY, TASTE_SWEET)
	color = "#DFDFDF"

	glass_unique_appearance = FALSE
	glass_icon_state = "glass_red"
	glass_name = "strawberry milk"
	glass_desc = "Strawberry sweet and lactose goodness!"

/datum/reagent/drink/milk/choccymilk
	name = "Chocolate Milk"
	id = "chocolatemilk"
	description = "An opaque brown liquid produced by the mammary glands of mammals and cocoa powerder." // No, this is NOT made with cocaine!
	taste_description = "chocolate milk"
	taste_tag = list(TASTE_SLIMEY, TASTE_SWEET)
	color = "#DFDFDF"

	glass_unique_appearance = FALSE
	glass_icon_state = "chocolateglass"
	glass_name = "Chocolate milk"
	glass_desc = "Chocolate and lactose goodness!"

/datum/reagent/drink/milk/cream
	name = "Cream"
	id = "cream"
	description = "Dairy product composed of the higher-fat layer skimmed from the top of milk before homogenization."
	taste_description = "creamy milk"
	taste_tag = list(TASTE_SLIMEY)
	color = "#dfd7afab"

	glass_icon_state = "glass_white"
	glass_name = "cream"
	glass_desc = "Mmm...creamy."

/datum/reagent/drink/milk/soymilk
	name = "Soy Milk"
	id = "soymilk"
	description = "An opaque white liquid made from soybeans."
	taste_description = "soy milk"
	taste_tag = list(TASTE_SLIMEY)
	color = "#DFDFC7"

	glass_icon_state = "glass_white"
	glass_name = "soy milk"
	glass_desc = "White and nutritious soy goodness!"

/datum/reagent/drink/milk/milkshake
	name = "Milkshake"
	description = "Sweet, cold beverage that is usually made from milk"
	taste_description = "cold creamy vanilla"
	taste_tag = list(TASTE_SLIMEY, TASTE_SWEET)
	id = "milkshake"
	color = "#aee5e4e1"
	adj_temp = -9

	glass_unique_appearance = TRUE
	glass_icon_state = "milkshake"
	glass_name = "milkshake"
	glass_desc = "Glorious brain-freezing mixture."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milk/icedcream
	name = "icecream base"
	id = "icecreambase"
	description = "A slurry of sweetened milk and cream with the consistency of soft serve, the base of every icecream recipe ever. Just chill and serve!"
	color = "#DFD7AF"
	taste_description = "melted icecream"
	taste_tag = list(TASTE_SLIMEY, TASTE_SWEET)

	glass_unique_appearance = FALSE

/datum/reagent/drink/protein_shake
	name = "protein shake"
	id = "protein_shake"
	description = "Pure protein. Typically consumed after a workout in order to aid in muscle recovery."
	taste_description = "strength"
	taste_tag = list(TASTE_SLIMEY)
	sanity_gain_ingest = 0 //Your muscles recover, but not your mind

	glass_unique_appearance = TRUE
	glass_icon_state = "protein_shake"
	glass_name = "protein shake"
	glass_desc = "Pure protein. Typically consumed after a workout in order to aid in muscle recovery."

/datum/reagent/drink/protein_shake/commercial
	name = "commercial protein shake"
	id = "protein_shake_commercial"
	description = "An \"apple-flavored\" protein shake. Typically consumed after a workout in order to aid in muscle recovery... You aren't sure if this will be effective."
	taste_description = "viscous slurry with bits of jelly"
	taste_tag = list(TASTE_SLIMEY, TASTE_SWEET)

	glass_unique_appearance = TRUE
	glass_icon_state = "protein_shake_commercial"
	glass_name = "commercial protein shake"
	glass_desc = "An \"apple-flavored\" protein shake. Typically consumed after a workout in order to aid in muscle recovery... You aren't sure if this will be effective."

//there is no affect_ingest since the 'muscle recovery' is handled in the perk itself


/datum/reagent/drink/tea
	name = "Tea"
	id = "tea"
	description = "Tasty black tea. Contains caffeine."
	taste_description = "tart black tea"
	taste_tag = list(TASTE_LIGHT)
	color = "#AC3700d0"
	adj_dizzy = -2
	adj_drowsy = -1
	adj_sleepy = -3
	adj_temp = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "teaglass"
	glass_name = "black tea"
	glass_desc = "Tasty black tea. It has antioxidants; it's good for you!"

/datum/reagent/drink/tea/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.add_chemical_effect(CE_TOXIN, -0.25 * effect_multiplier)

/datum/reagent/drink/tea/icetea
	name = "Iced Tea"
	id = "icetea"
	description = "A form of cold tea. Usually served in a glass with ice."
	taste_description = "cold, tart tea"
	taste_tag = list(TASTE_LIGHT)
	color = "#B43A00d0"
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "icedteaglass"
	glass_name = "iced tea"
	glass_desc = "No relation to a certain rap artist/ actor."
	glass_center_of_mass = list("x"=15, "y"=10)

//green tea
/datum/reagent/drink/tea/green
	name = "Green Tea"
	id = "greentea"
	description = "Tasty green tea. It has antioxidants; it's good for you!"
	taste_description = "subtle green tea"
	taste_tag = list(TASTE_LIGHT)
	color = "#C33F00d0"

	glass_icon_state = "greentea"
	glass_name = "green tea"
	glass_desc = "Tasty green tea. It has antioxidants; it's good for you!"

/datum/reagent/drink/tea/icetea/green
	name = "Iced Green Tea"
	id = "icegreentea"
	description = "Green tea, cold and served with ice."
	taste_description = "cold green tea"
	taste_tag = list(TASTE_LIGHT)
	color = "#CE4200d0"

	glass_name = "iced green tea"
	glass_desc = "It looks like green tea with ice. One might even call it iced green tea."
	glass_icon_state = "icedgreen"

/*Coffee Starts Here*/

/datum/reagent/drink/coffee
	name = "Coffee"
	id = "coffee"
	description = "Coffee is a brewed drink prepared from roasted seeds, commonly called coffee beans, of the coffee plant."
	taste_description = "bitterness"
	taste_tag = list(TASTE_BITTER)
	taste_mult = 1.3
	color = "#482000d3"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = 10
	overdose = REAGENTS_OVERDOSE * 1.5 // 45u

	glass_unique_appearance = TRUE
	glass_icon_state = "hot_coffee"
	glass_name = "coffee"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."

/datum/reagent/drink/coffee/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(adj_temp > 0)
		holder.remove_reagent("frostoil", 1 * effect_multiplier)
	// Coffee is really bad for you with busted kidneys.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/kidney/K = H.random_organ_by_process(OP_KIDNEYS)
		if(istype(K))
			if(K.is_bruised())
				M.add_chemical_effect(CE_TOXIN, 0.5)
			else if(K.is_broken())
				M.add_chemical_effect(CE_TOXIN, 1)
	M.add_chemical_effect(CE_PULSE, 1)

/datum/reagent/drink/coffee/overdose(mob/living/carbon/M, alien)
	M.make_jittery(5)
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/drink/coffee/espresso
	name = "Espresso"
	id = "espresso"
	description = "A strong coffee made by passing nearly boiling water through coffee seeds at high pressure."
	taste_description = "bitter coffee"
	taste_tag = list(TASTE_BITTER)
	taste_mult = 1
	overdose = REAGENTS_OVERDOSE + 10 // 40u
	color = "#664300d3"
	adj_dizzy = -10
	adj_drowsy = -5
	adj_sleepy = -5 // Stronger than coffee

	glass_icon_state = "espresso"
	glass_name = "shot of espresso"
	glass_desc = "A strong coffee made by passing nearly boiling water through coffee seeds at high pressure."
	price_per_unit = 0.13

/datum/reagent/drink/coffee/espresso/overdose(mob/living/carbon/M, alien)
	M.make_jittery(10) // Stronger coffee, stronger consequences
	M.add_chemical_effect(CE_PULSE, 3)

/datum/reagent/drink/coffee/icecoffee
	name = "Iced Coffee"
	id = "icecoffee"
	description = "Coffee and ice, refreshing and cool."
	taste_description = "bitter coldness"
	taste_tag = list(TASTE_BITTER)
	color = "#102838d3"
	adj_temp = -5

	glass_icon_state = "icedcoffeeglass"
	glass_name = "iced coffee"
	glass_desc = "A drink to perk you up and refresh you!"

/datum/reagent/drink/coffee/soy_latte
	name = "Soy Latte"
	id = "soy_latte"
	description = "A coffee drink made with espresso and steamed soy milk."
	taste_description = "creamy coffee"
	taste_tag = list(TASTE_SLIMEY)
	color = "#664300d3"
	adj_temp = 5

	glass_icon_state = "soy_latte"
	glass_name = "soy latte"
	glass_desc = "A nice and refreshing beverage to drink while you are reading."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/soy_latte/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.heal_organ_damage(0.05 * effect_multiplier, 0)

/datum/reagent/drink/coffee/cafe_latte
	name = "Cafe Latte"
	id = "cafe_latte"
	description = "A nice, strong and tasty beverage to drink while you are reading."
	taste_description = "soft bitterness"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3" // rgb: 102, 67, 0
	adj_temp = 5

	glass_icon_state = "cafe_latte"
	glass_name = "cafe latte"
	glass_desc = "A nice, strong and refreshing beverage to drink while you are reading."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/cafe_latte/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.heal_organ_damage(0.05 * effect_multiplier, 0)

/datum/reagent/drink/coffee/freddo_espresso
	name = "Freddo Espresso"
	id = "freddo_espresso"
	description = "Espresso with ice cubes poured over ice."
	taste_description = "cold and refreshing bitter coffee"
	taste_tag = list(TASTE_REFRESHING, TASTE_BITTER)
	color = "#664300d3" // rgb: 102, 67, 0

	glass_icon_state = "freddo_spr" // Lonestar Shipping Solutions logo and all!
	glass_name = "freddo espresso"
	glass_desc = "Espresso with ice cubes poured over ice."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/caffe_americano
	name = "Caffe Americano"
	id = "caffe_americano"
	description = "Espresso diluted with hot water."
	taste_description = "coffee"
	taste_tag = list(TASTE_LIGHT)
	color = "#664300d3" // rgb: 102, 67, 0


	glass_icon_state = "americano"
	glass_name = "caffe Americano"
	glass_desc = "Your average, watered-down coffee."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/flat_white
	name = "Flat White Espresso"
	id = "flat_white"
	description = "Espresso with a bit of steamy hot milk."
	taste_description = "bitter coffee and a dash of foamy milk"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3"// rgb: 102, 67, 0

	glass_icon_state = "flatwhite"
	glass_name = "flat white"
	glass_desc = "Espresso with a bit of steamy hot milk."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/lattemacchiato
	name = "Latte Macchiato"
	id = "lattemacchiato"
	description = "Foamy milk with a single espresso shot."
	taste_description = "foamy bitterness"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3"// rgb: 102, 67, 0

	glass_icon_state = "lattemacchiato"
	glass_name = "cafe latte"
	glass_desc = "A tall glass of foamy milk with espresso poured on top."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/cappuccino
	name = "Cappuccino"
	id = "cappuccino"
	description = "Espresso with steamed milk foam."
	taste_description = "foamy light coffee"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3" // rgb: 102, 67, 0

	glass_icon_state = "cappuccino"
	glass_name = "cappuccino"
	glass_desc = "Espresso with steamed milk foam."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/freddo_cappuccino
	name = "Freddo Cappuccino"
	id = "freddo_cappuccino"
	description = "Espresso with steamed milk foam, on ice."
	taste_description = "cold and bitter milk foam"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3" // rgb: 102, 67, 0

	glass_icon_state = "freddo_cap"
	glass_name = "freddo cappuccino"
	glass_desc = "Espresso with steamed milk foam, on ice."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/macchiato
	name = "Macchiato"
	id = "macchiato"
	description = "Espresso with milk foam."
	taste_description = "bitter coffee with a hint of foamy milk"
	taste_tag = list(TASTE_LIGHT, TASTE_BITTER)
	color = "#664300d3" // rgb: 102, 67, 0

	glass_icon_state = "macchiato"
	glass_name = "macchiato"
	glass_desc = "Espresso with milk foam."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/mocaccino
	name = "Mocaccino"
	id = "mocaccino"
	description = "Espresso with hot milk and chocolate."
	taste_description = "sweet milk and bitter, chocolatey coffee"
	taste_tag = list(TASTE_BITTER, TASTE_SWEET)
	color = "#664300d3" // rgb: 102, 67, 0

	glass_icon_state = "mocaccino"
	glass_name = "mocaccino"
	glass_desc = "Espresso with hot milk and chocolate."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/coffee/atomicoffee // CDDA reference - Seb
	name = "Atomic coffee"
	id = "atomicoffee"
	description = "Every possible microgram of caffeine and flavor has been carefully extracted for your enjoyment, using the power of the atom. \
	The perfect drink for those that wish to stay awake for days."
	taste_description = "liquid tar"
	taste_tag = list(TASTE_BITTER)
	color =  "#393815" // rgb: 57, 56, 21
	overdose = REAGENTS_OVERDOSE + 1 // A whole cup and a unit more.

	glass_icon_state = "atomicoffee"
	glass_name = "Atomic Coffee"
	glass_desc = "A glass of atomically compressed pure caffeine, perfect to stay awake for days fighting off the inevitable cataclysm."
	glass_center_of_mass = list("x"=15, "y"=9)
	price_per_unit = 0.25

/datum/reagent/drink/coffee/atomicoffee/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.add_chemical_effect(CE_PULSE, 2) // Watch out for that heart!
	M.dizziness = 0
	M.stuttering = 0
	M.confused = 0
	M.slurring = 0
	M.drowsyness = 0 // The ultimate sober up drink
	M.sleeping = 0 // SLEEPISFORTHEWEAKWHONEEDSTOSLEEP

/datum/reagent/drink/coffee/atomicoffee/overdose(mob/living/carbon/M, alien)

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/vital/heart/C = H.random_organ_by_process(OP_HEART) // I said to watch out!!
		if(istype(C) && !BP_IS_ROBOTIC(C))
			M.adjustOxyLoss(0.1) // Hyperventilating
			M.add_chemical_effect(CE_PULSE, 4) // Heart beating TOO fast
			if(C.is_bruised())
				M.adjustOxyLoss(0.3)
				M.paralysis = max(M.paralysis, 5) // HEART ATTACK!
				M.add_chemical_effect(CE_NOPULSE, 1)
		M.add_chemical_effect(CE_SPEEDBOOST, 0.6) // Fry_consumes_100_cups_of_coffee.gif
		M.make_jittery(40) // Except he's not calm!
		M.add_chemical_effect(CE_TOXIN, 0.1) // An alternative to getting irradiated, nobody wants that.



/datum/reagent/drink/coffee/sromshine
	name = "Sromshine"
	id = "sromshine"
	description = "The best part of waking up."
	taste_description = "coffee with an acidic twist"
	taste_tag = list(TASTE_SOUR, TASTE_BITTER)
	color = "#A14702d3"

	glass_icon_state = "sromshine"
	glass_name = "cup of Sromshine"
	glass_desc = "The best part of waking up."
	price_per_unit = 0.2

/*Aurora coffee ends here*/

/datum/reagent/drink/hot_coco
	name = "Hot Chocolate"
	id = "hot_coco"
	description = "A heated drink consisting melted chocolate and heated milk."
	taste_description = "creamy chocolate"
	taste_tag = list(TASTE_SWEET, TASTE_SLIMEY)
	reagent_state = LIQUID
	color = "#403010dc"
	nutrition = 2
	adj_temp = 5

	glass_unique_appearance = TRUE
	glass_icon_state = "chocolateglass"
	glass_name = "hot chocolate"
	glass_desc = "Made with love! And cocoa beans."

/datum/reagent/drink/sodawater
	name = "Soda Water"
	id = "sodawater"
	description = "Water containing dissolved carbon dioxide gas."
	taste_description = "carbonated water"
	taste_tag = list(TASTE_BUBBLY)
	color = "#619494d0"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_clear"
	glass_name = "soda water"
	glass_desc = "Soda water. Why not make a scotch and soda?"

/datum/reagent/drink/grapesoda
	name = "Grape Soda"
	id = "grapesoda"
	description = "Sweetened drink with a grape flavor and a deep purple color."
	taste_description = "grape soda"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#421C52d0"
	adj_drowsy = -3

	glass_unique_appearance = TRUE
	glass_icon_state = "gsodaglass"
	glass_name = "grape soda"
	glass_desc = "Looks like a delicious drink!"

/datum/reagent/drink/tonic
	name = "Tonic Water"
	id = "tonic"
	description = "A carbonated soft drink in which quinine is dissolved. "
	taste_description = "tart and fresh"
	taste_tag = list(TASTE_BUBBLY, TASTE_REFRESHING)
	color = "#664300d0"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_clear"
	glass_name = "tonic water"
	glass_desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."

/datum/reagent/drink/lemonade
	name = "Lemonade"
	description = "Drink using lemon juice, water, and a sweetener such as cane sugar or honey."
	taste_description = "tartness"
	taste_tag = list(TASTE_SOUR)
	id = "lemonade"
	color = "#FFFF00d0"
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "lemonadeglass"
	glass_name = "lemonade"
	glass_desc = "Oh the nostalgia..."
	price_per_unit = 0.13

/datum/reagent/drink/kiraspecial
	name = "Kira Special"
	description = "Long live the guy who everyone had mistaken for a girl. Baka!"
	taste_description = "fruity sweetness"
	taste_tag = list(TASTE_SWEET)
	id = "kiraspecial"
	color = "#CCCC99d0"
	adj_temp = -5
	price_per_unit = 0.13

	glass_unique_appearance = TRUE
	glass_icon_state = "kiraspecial"
	glass_name = "Kira Special"
	glass_desc = "Long live the guy who everyone had mistaken for a girl. Baka!"
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/drink/brownstar
	name = "Brown Star"
	description = "It's not what it sounds like..."
	taste_description = "orange and cola soda"
	taste_tag = list(TASTE_BUBBLY, TASTE_SWEET)
	id = "brownstar"
	color = "#9F3400d0"
	adj_temp = -2

	glass_unique_appearance = TRUE
	glass_icon_state = "brownstar"
	glass_name = "Brown Star"
	glass_desc = "It's not what it sounds like..."
	price_per_unit = 0.13

/datum/reagent/drink/rewriter
	name = "Rewriter"
	description = "The secret of the sanctuary of the Librarian..."
	taste_description = "a bad night out"
	taste_tag = list(TASTE_BUBBLY, TASTE_BITTER)
	id = "rewriter"
	color = "#485000d0"
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "rewriter"
	glass_name = "Rewriter"
	glass_desc = "The secret of the sanctuary of the Librarian..."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.13

/datum/reagent/drink/rewriter/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.make_jittery(5)

/datum/reagent/drink/nuka_cola
	name = "Nuka Cola"
	id = "nuka_cola"
	description = "Cola, cola never changes."
	taste_description = "the future"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#100800d0"
	adj_temp = -5
	adj_sleepy = -2
	nerve_system_accumulations = 50

	glass_unique_appearance = TRUE
	glass_icon_state = "nuka_colaglass"
	glass_name = "Nuka-Cola"
	glass_desc = "Don't cry, Don't raise your eye, It's only nuclear wasteland"
	glass_center_of_mass = list("x"=16, "y"=6)
	price_per_unit = 0.85

/datum/reagent/drink/nuka_cola/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.add_chemical_effect(CE_SPEEDBOOST, 0.1)
	M.make_jittery(20 * effect_multiplier)
	M.druggy = max(M.druggy, 30 * effect_multiplier)
	M.dizziness += 5 * effect_multiplier
	M.drowsyness = 0

/datum/reagent/drink/grenadine
	name = "Grenadine Syrup"
	id = "grenadine"
	description = "Made in the modern day with proper pomegranate substitute. Who uses real fruit, anyways?"
	taste_description = "100% pure pomegranate"
	taste_tag = list(TASTE_SWEET)
	color = "#FF004Fd0"

	glass_unique_appearance = TRUE
	glass_icon_state = "grenadineglass"
	glass_name = "grenadine syrup"
	glass_desc = "Sweet and tangy, a bar syrup used to add color or flavor to drinks."
	glass_center_of_mass = list("x"=17, "y"=6)

/datum/reagent/drink/space_cola
	name = "Space Cola"
	id = "cola"
	description = "A refreshing beverage."
	taste_description = "cola"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	reagent_state = LIQUID
	color = "#100800d0"
	adj_drowsy = -3
	adj_temp = -5

	glass_icon_state  = "glass_brown"
	glass_name = "Space Cola"
	glass_desc = "Ah, refreshing Space Cola!"

/datum/reagent/drink/spacemountainwind
	name = "Mountain Wind"
	id = "spacemountainwind"
	description = "Blows right through you like a space wind."
	taste_description = "sweet citrus soda"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#102000d0"
	adj_drowsy = -7
	adj_sleepy = -1
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "Space_mountain_wind_glass"
	glass_name = "Space Mountain Wind"
	glass_desc = "Space Mountain Wind. As you know, there are no mountains in space, only wind."

/datum/reagent/drink/dr_gibb
	name = "Dr. Gibb"
	id = "dr_gibb"
	description = "A delicious blend of 42 different flavors"
	taste_description = "cherry soda"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#102000d0"
	adj_drowsy = -6
	adj_temp = -5
	glass_unique_appearance = TRUE
	glass_icon_state = "dr_gibb_glass"
	glass_name = "Dr. Gibb"
	glass_desc = "Dr. Gibb. Not as dangerous as the name might imply."

/datum/reagent/drink/space_up
	name = "Space-Up"
	id = "space_up"
	description = "Tastes like a hull breach in your mouth."
	taste_description = "a hull breach"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#202800d0"
	adj_temp = -8

	glass_unique_appearance = TRUE
	glass_icon_state = "space-up_glass"
	glass_name = "Space-up"
	glass_desc = "Space-up. It helps keep your cool."

/datum/reagent/drink/lemon_lime
	name = "Lemon Lime"
	description = "A tangy substance made of lime and lemon."
	taste_description = "tangy lime and lemon soda"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	id = "lemon_lime"
	color = "#878F00d0"
	adj_temp = -8

	glass_unique_appearance = TRUE
	glass_icon_state = "lemonlime"
	glass_name = "lemon lime soda"
	glass_desc = "A tangy substance made of 0.5% natural citrus!"

/datum/reagent/drink/melonsoda
	name = "Mellon Soda"
	id = "melonsoda"
	description = "A carbinated mellon drink."
	taste_description = "carbinated melon"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	reagent_state = LIQUID
	color = "#82F296d0"
	adj_drowsy = -3
	adj_temp = -5

	glass_icon_state  = "melon_glass"
	glass_name = "Melon soda"
	glass_desc = "Delicious melon soda."

/datum/reagent/drink/doctor_delight
	name = "The Doctor's Delight"
	id = "doctorsdelight"
	description = "A gulp a day keeps the MediBot away. That's probably for the best."
	taste_description = "homely fruit"
	taste_tag = list(TASTE_SWEET, TASTE_SOUR)
	reagent_state = LIQUID
	color = "#FF8CFFd0"
	nutrition = 1
	glass_unique_appearance = TRUE
	glass_icon_state = "doctorsdelightglass"
	glass_name = "The Doctor's Delight"
	glass_desc = "A healthy mixture of juices, guaranteed to keep you healthy until the next toolboxing takes place."
	glass_center_of_mass = list("x"=16, "y"=8)
	common = FALSE //A little too useful for regular people to ID straight off
	price_per_unit = 0.255

/datum/reagent/drink/doctor_delight/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.adjustOxyLoss(-0.4 * effect_multiplier)
	M.heal_organ_damage(0.2 * effect_multiplier, 0.2 * effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, -effect_multiplier)
	if(M.dizziness)
		M.dizziness = max(0, M.dizziness - 15 * effect_multiplier)
	if(M.confused)
		M.confused = max(0, M.confused - 5 * effect_multiplier)

/datum/reagent/drink/ice
	name = "Ice"
	id = "ice"
	description = "Water frozen into a solid state."
	taste_description = "ice"
	taste_mult = 1.5
	reagent_state = SOLID
	color = "#619494"
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "iceglass"
	glass_name = "ice"
	glass_desc = "Generally, you're supposed to put something else in there too..."

/datum/reagent/drink/strawberry_explosive_blast
	name = "Strawberry Explosive Blast"
	id = "strawberry_explosive_blast"
	description = "Sweetened drink with a strawberry flavor and a blast from the past."
	taste_description = "strawberry soda"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#C83F49"

	glass_unique_appearance = TRUE
	glass_icon_state = "strawberryblast"
	glass_name = "strawberry explosive blast soda"
	glass_desc = "Looks like a delicious drink!"
	price_per_unit = 0.255

/* Alcohol */

// Basic

/datum/reagent/ethanol/absinthe
	name = "Absinthe"
	id = "absinthe"
	description = "A anise-flavored spirit derived from botanicals."
	taste_description = "death and licorice"
	taste_mult = 1.5
	taste_tag = list(TASTE_BITTER,TASTE_STRONG)
	color = "#33EE00d0"
	strength = 12

	glass_unique_appearance = TRUE
	glass_icon_state = "absintheglass"
	glass_name = "absinthe"
	glass_desc = "Wormwood, anise, oh my."
	glass_center_of_mass = list("x"=16, "y"=5)

/datum/reagent/ethanol/ale
	name = "Ale"
	id = "ale"
	description = "A dark alcoholic beverage made by malted barley and yeast."
	taste_description = "hearty barley ale"
	taste_tag = list(TASTE_BITTER,TASTE_STRONG)
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "aleglass"
	glass_name = "ale"
	glass_desc = "A freezing pint of delicious ale"
	glass_center_of_mass = list("x"=16, "y"=8)

/datum/reagent/ethanol/beer
	name = "Beer"
	id = "beer"
	description = "An alcoholic beverage made from malted grains, hops, yeast, and water."
	taste_description = "piss water"
	taste_tag = list(TASTE_BUBBLY)
	color = "#664300d0"
	strength = 35
	nutriment_factor = 1

	glass_unique_appearance = TRUE
	glass_icon_state = "beerglass"
	glass_name = "beer"
	glass_desc = "A freezing pint of beer"
	glass_center_of_mass = list("x"=16, "y"=8)

/datum/reagent/ethanol/beer/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.jitteriness = max(M.jitteriness - 3 * effect_multiplier, 0)

/datum/reagent/ethanol/Kvass
	name = "Kvass"
	id = "Kvass"
	description = "A traditonal, and very popular slavic drink. Made on the colony."
	taste_description = "sweet, yet very light dark beer."
	taste_tag = list(TASTE_BUBBLY, TASTE_SWEET, TASTE_UMAMI)
	color = "#9F3400d0"
	strength = 60
	adj_temp = -5

	glass_unique_appearance = TRUE
	glass_icon_state = "Kvass_Glass"
	glass_name = "Kvass"
	glass_desc = "A traditonal slavic drink. This version of Kvass is darker, and a bit bolder than normal."

/datum/reagent/ethanol/bluecuracao
	name = "Blue Curacao"
	id = "bluecuracao"
	description = "Exotically blue, fruity drink, distilled from oranges."
	taste_description = "oranges"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG)
	taste_mult = 1.1
	color = "#0000CDd0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "curacaoglass"
	glass_name = "blue curacao"
	glass_desc = "Exotically blue, fruity drink, distilled from oranges."
	glass_center_of_mass = list("x"=16, "y"=5)

/datum/reagent/ethanol/redcandywine
	name = "Candy Liquor"
	id = "redcandyliquor"
	description = "Made from assorted sweets, candies and even flowers."
	taste_description = "sweet and smooth alcohol"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG)
	color = "#E33232d0" // rgb: 227, 50, 50
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "alco-redglass"
	glass_name = "Mister Red"
	glass_desc = "Candy is dandy but liquor is quicker."
	glass_center_of_mass = list("x"=16, "y"=5)

/datum/reagent/ethanol/nanatsunoumi
	name = "Nanatsunoumi"
	id = "nanatsunoumi"
	description = "A harsh salty alcohol that is from Japanese origin."
	taste_description = "salt and young lemons"
	taste_tag = list(TASTE_SALTY, TASTE_SOUR, TASTE_STRONG)
	color = "#FFFFFFd0" // rgb: 255, 255, 255
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "alco-whiteglass"
	glass_name = "Rigingu"
	glass_desc = "A alcohol drink from Japanese origin known for being salty."
	glass_center_of_mass = list("x"=16, "y"=5)

/datum/reagent/ethanol/miss_fortune
	name = "Fortune"
	id = "miss_fortune"
	description = "Mix of Candy Liquor, Nanatsunoumi, Blue Curacao, and Melon Liquor that shockingly tastes good.."
	taste_description = "luck"
	taste_tag = list(TASTE_STRONG, TASTE_SWEET)
	color = "#FFFFFFd0" // rgb: 255, 255, 255
	strength = 5 //Oh no

	glass_unique_appearance = TRUE
	glass_icon_state = "miss_fortuneglass"
	glass_name = "Miss Fortune"
	glass_desc = "A mix of many colors that somehow tastes good."
	glass_center_of_mass = list("x"=16, "y"=5)


/datum/reagent/ethanol/cognac
	name = "Cognac"
	id = "cognac"
	description = "A sweet and strongly alcoholic drink, made after numerous distillations and years of maturing. Classy as fornication."
	taste_description = "rich and smooth alcohol"
	taste_tag = list(TASTE_STRONG, TASTE_SWEET)
	taste_mult = 1.1
	color = "#AB3C05d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "cognacglass"
	glass_name = "cognac"
	glass_desc = "Damn, you feel like some kind of French aristocrat just by holding this."
	glass_center_of_mass = list("x"=16, "y"=6)

/datum/reagent/ethanol/deadrum
	name = "Deadrum"
	id = "deadrum"
	description = "Distilled alcoholic drink made from saltwater."
	taste_description = "salty sea water"
	taste_tag = list(TASTE_SALTY, TASTE_STRONG)
	color = "#664300d0"
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "rumglass"
	glass_name = "rum"
	glass_desc = "Popular with the sailors. Not very popular with everyone else."
	glass_center_of_mass = list("x"=16, "y"=12)
	price_per_unit = 0.155

/datum/reagent/ethanol/deadrum/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.dizziness += 5 * effect_multiplier

/datum/reagent/ethanol/gin
	name = "Gin"
	id = "gin"
	description = "A distilled alcoholic drink that derives its predominant flavor from juniper berries."
	taste_description = "an alcoholic christmas tree"
	taste_tag = list(TASTE_STRONG,TASTE_DRY)
	color = "#664300d0"
	strength = 25

	glass_icon_state = "ginvodkaglass"
	glass_name = "gin"
	glass_desc = "Crystal clear Griffeater gin."
	glass_center_of_mass = list("x"=16, "y"=12)

//Base type for alchoholic drinks containing coffee
/datum/reagent/ethanol/coffee
	overdose = 45
	taste_tag = list(TASTE_BITTER,TASTE_SWEET)

/datum/reagent/ethanol/coffee/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.dizziness = max(0, M.dizziness - 5 * effect_multiplier)
	M.drowsyness = max(0, M.drowsyness - 3 * effect_multiplier)
	M.sleeping = max(0, M.sleeping - 2 * effect_multiplier)
	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (5 * TEMPERATURE_DAMAGE_COEFFICIENT) * effect_multiplier)

/datum/reagent/ethanol/coffee/overdose(mob/living/carbon/M, alien)
	M.make_jittery(5)

/datum/reagent/ethanol/coffee/kahlua
	name = "Kahlua"
	id = "kahlua"
	description = "A widely known, Mexican coffee-flavored liqueur."
	taste_description = "spiked latte"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER)
	taste_mult = 1.1
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "kahluaglass"
	glass_name = "RR coffee liquor"
	glass_desc = "DAMN, THIS THING LOOKS ROBUST"
	glass_center_of_mass = list("x"=15, "y"=7)

/datum/reagent/ethanol/melonliquor
	name = "Melon Liquor"
	id = "melonliquor"
	description = "A relatively sweet and fruity 46 proof liquor."
	taste_description = "fruity alcohol"
	taste_tag = list(TASTE_SWEET)
	color = "#138808d0" // rgb: 19, 136, 8
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "emeraldglass"
	glass_name = "melon liquor"
	glass_desc = "A relatively sweet and fruity 46 proof liquor."
	glass_center_of_mass = list("x"=16, "y"=5)

/datum/reagent/ethanol/rum
	name = "Rum"
	id = "rum"
	description = "Distilled alcoholic drink made from sugarcane byproducts"
	taste_description = "spiked butterscotch"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER)
	taste_mult = 1.1
	color = "#664300d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "rumglass"
	glass_name = "rum"
	glass_desc = "Now you want to Pray for a pirate suit, don't you?"
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/sake
	name = "Sake"
	id = "sake"
	description = " Alcoholic beverage made by fermenting rice that has been polished."
	taste_description = "dry alcohol"
	taste_tag = list(TASTE_DRY)
	color = "#664300d0"
	strength = 25

	glass_icon_state = "sakeglass"
	glass_name = "sake"
	glass_desc = "Wine made from rice: it's sake! Perfect to drink at the hot springs after a long hunt."
	glass_center_of_mass = list("x"=16, "y"=12)
	price_per_unit = 0.155

/datum/reagent/ethanol/tequilla
	name = "Tequila"
	id = "tequilla"
	description = "A strong and mildly flavored, Mexican produced spirit."
	taste_description = "paint stripper"
	taste_tag = list(TASTE_STRONG)
	color = "#FFFF91d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "tequillaglass"
	glass_name = "Tequila"
	glass_desc = "Now where's the salt and lemon?"
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/thirteenloko
	name = "Thirteen Loko"
	id = "thirteenloko"
	description = "A potent mixture of caffeine and alcohol."
	taste_description = "jitters and death"
	taste_tag = list(TASTE_BITTER,TASTE_BUBBLY)
	color = "#102000d0"
	strength = 25
	nutriment_factor = 1

	glass_unique_appearance = TRUE
	glass_icon_state = "thirteen_loko_glass"
	glass_name = "Thirteen Loko"
	glass_desc = "This is a container of Thirteen Loko, it appears to be of the highest quality. The drink, not the container."

/datum/reagent/ethanol/thirteenloko/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.drowsyness = max(0, M.drowsyness - 7 * effect_multiplier)
	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (5 * TEMPERATURE_DAMAGE_COEFFICIENT) * effect_multiplier)
	M.make_jittery(5 * effect_multiplier)
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/ethanol/vermouth
	name = "Vermouth"
	id = "vermouth"
	description = "Aromatized, fortified white wine flavored with various botanicals."
	taste_description = "dry alcohol"
	taste_tag = list(TASTE_DRY, TASTE_STRONG)
	taste_mult = 1.3
	color = "#91FF91d0" // rgb: 145, 255, 145
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "vermouthglass"
	glass_name = "vermouth"
	glass_desc = "You wonder why you're even drinking this straight."
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/vodka
	name = "Vodka"
	id = "vodka"
	description = "Clear distilled alcoholic beverage that originates from Poland and Russia."
	taste_description = "grain alcohol"
	taste_tag = list(TASTE_STRONG, TASTE_BITTER)
	color = "#358adfd0" // rgb: 0, 100, 200
	strength = 5

	glass_unique_appearance = TRUE
	glass_icon_state = "ginvodkaglass"
	glass_name = "vodka"
	glass_desc = "Number one drink and fueling choice for Russians worldwide."
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/vodka/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.apply_effect(max(M.radiation - 0.1 * effect_multiplier, 0), IRRADIATE, check_protection = 0)

/datum/reagent/ethanol/whiskey
	name = "Whiskey"
	id = "whiskey"
	description = "A type of distilled alcoholic beverage made from fermented grain mash."
	taste_description = "molasses"
	taste_tag = list(TASTE_STRONG, TASTE_SWEET)
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "whiskeyglass"
	glass_name = "whiskey"
	glass_desc = "The silky, smoky whiskey goodness inside makes the drink look very classy."
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/wine
	name = "Wine"
	id = "wine"
	description = "An premium alcoholic beverage made from distilled grape juice."
	taste_description = "bitter sweetness"
	taste_tag = list(TASTE_BITTER,TASTE_SWEET)
	color = "#7E4043d0" // rgb: 126, 64, 67
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "wineglass"
	glass_name = "wine"
	glass_desc = "A very classy looking drink."
	glass_center_of_mass = list("x"=15, "y"=7)

/datum/reagent/ethanol/ntcahors
	name = "Absolutism Cahors Wine"
	id = "ntcahors"
	description = "Fortified dessert wine made from cabernet sauvignon, saperavi, and other grapes."
	taste_description = "sweet charcoal"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER)
	color = "#7E4043d0" // rgb: 126, 64, 67
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "wineglass"
	glass_name = "cahors"
	glass_desc = "It looks like wine, but more dark."
	glass_center_of_mass = list("x"=15, "y"=7)
	price_per_unit = 0.25

/datum/reagent/ethanol/ntcahors/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.adjust_hallucination(-0.9 * effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, -2.5 * effect_multiplier)
	M.reagents.remove_reagent("wormwood", 0.8 * effect_multiplier)

// Cocktails

/datum/reagent/ethanol/acid_spit
	name = "Acid Spit"
	id = "acidspit"
	description = "A drink for the daring, can be deadly if incorrectly prepared!"
	taste_description = "stomach acid"
	taste_tag = list(TASTE_SOUR)
	reagent_state = LIQUID
	color = "#365000"
	strength = 30
	glass_unique_appearance = TRUE
	glass_icon_state = "acidspitglass"
	glass_name = "Acid Spit"
	glass_desc = "A drink from the company archives. Made from live aliens."
	glass_center_of_mass = list("x"=16, "y"=7)
	price_per_unit = 0.155

/datum/reagent/ethanol/alliescocktail
	name = "Allies Cocktail"
	id = "alliescocktail"
	description = "A drink made from your allies, not as sweet as when made from your enemies."
	taste_description = "bitter yet free"
	taste_tag = list(TASTE_BITTER,TASTE_DRY)
	color = "#00664dd0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "alliescocktail"
	glass_name = "Allies cocktail"
	glass_desc = "A drink made from your allies."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.155

/datum/reagent/ethanol/aloe
	name = "Aloe"
	id = "aloe"
	description = "So very, very, very good."
	taste_description = "sweet 'n creamy"
	taste_tag = list(TASTE_SWEET,TASTE_SLIMEY)
	color = "#192c00d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "aloe"
	glass_name = "Aloe"
	glass_desc = "Very, very, very good."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.155

/datum/reagent/ethanol/amasec
	name = "Amasec"
	id = "amasec"
	description = "Official drink of the Gun Club!"
	taste_description = "dark and metallic"
	taste_tag = list(TASTE_SALTY,TASTE_DRY)
	reagent_state = LIQUID
	color = "#124da7d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "amasecglass"
	glass_name = "Amasec"
	glass_desc = "Always handy before COMBAT!!!"
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.155

/datum/reagent/ethanol/andalusia
	name = "Andalusia"
	id = "andalusia"
	description = "A nice, strangely named drink."
	taste_description = "lemons"
	taste_tag = list(TASTE_SOUR)
	color = "#665700d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "andalusia"
	glass_name = "Andalusia"
	glass_desc = "A nice, strange named drink."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.155

/datum/reagent/ethanol/antifreeze
	name = "Anti-freeze"
	id = "antifreeze"
	description = "Ultimate refreshment."
	taste_description = "Jack Frost's piss"
	taste_tag = list(TASTE_STRONG,TASTE_SOUR,TASTE_REFRESHING)
	color = "#00fff2d0"
	strength = 12
	adj_temp = 20
	targ_temp = 330

	glass_unique_appearance = TRUE
	glass_icon_state = "antifreeze"
	glass_name = "Anti-freeze"
	glass_desc = "The ultimate refreshment."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.155

/datum/reagent/ethanol/atomicbomb
	name = "Atomic Bomb"
	id = "atomicbomb"
	description = "Nuclear proliferation never tasted so good."
	taste_description = "da bomb"
	taste_tag = list(TASTE_BUBBLY)
	reagent_state = LIQUID
	color = "#6b0000d0"
	strength = 5
	druggy = 50

	glass_unique_appearance = TRUE

	glass_icon_state = "atomicbombglass"
	glass_name = "Atomic Bomb"
	glass_desc = "We cannot take legal responsibility for your actions after imbibing."
	glass_center_of_mass = list("x"=15, "y"=7)
	price_per_unit = 0.155

/datum/reagent/ethanol/coffee/b52
	name = "B-52"
	id = "b52"
	description = "Coffee, Irish Cream, and cognac. You will get bombed."
	taste_description = "angry and Irish"
	taste_tag = list(TASTE_BITTER,TASTE_STRONG)
	taste_mult = 1.3
	color = "#662000d0"
	strength = 10

	glass_unique_appearance = TRUE

	glass_icon_state = "b52glass"
	glass_name = "B-52"
	glass_desc = "Kahlua, Irish cream, and Cognac. You will get bombed."
	price_per_unit = 0.175

/datum/reagent/ethanol/bahama_mama
	name = "Bahama mama"
	id = "bahama_mama"
	description = "Tropical cocktail."
	taste_description = "lime and orange"
	taste_tag = list(TASTE_SWEET)
	color = "#FF7F3Bd0"
	strength = 15

	glass_unique_appearance = TRUE

	glass_icon_state = "bahama_mama"
	glass_name = "Bahama Mama"
	glass_desc = "Tropical cocktail"
	glass_center_of_mass = list("x"=16, "y"=5)
	price_per_unit = 0.175

/datum/reagent/ethanol/bananahonk
	name = "Banana Mama"
	id = "bananahonk"
	description = "A drink from Clown Heaven."
	taste_description = "a bad joke"
	taste_tag = list(TASTE_SWEET)
	nutriment_factor = 1
	color = "#FFFF91d0"
	strength = 6

	glass_unique_appearance = TRUE

	glass_icon_state = "bananahonkglass"
	glass_name = "Banana Honk"
	glass_desc = "A drink from Banana Heaven."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.275

/datum/reagent/ethanol/barefoot
	name = "Barefoot"
	id = "barefoot"
	description = "Barefoot and pregnant"
	taste_description = "creamy berries"
	taste_tag = list(TASTE_SWEET)
	color = "#664300d0"
	strength = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "b&p"
	glass_name = "Barefoot"
	glass_desc = "Barefoot and pregnant"
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.275

/datum/reagent/ethanol/beepsky_smash
	name = "Beepsky Smash"
	id = "beepskysmash"
	description = "Deny drinking this and prepare for THE LAW."
	taste_description = "JUSTICE"
	taste_tag = list(TASTE_STRONG,TASTE_SOUR)
	taste_mult = 2
	reagent_state = LIQUID
	color = "#664300"
	strength = 12
	glass_unique_appearance = TRUE
	glass_icon_state = "beepskysmashglass"
	glass_name = "Beepsky Smash"
	glass_desc = "Heavy, hot and strong. Just like the Iron fist of the LAW."
	glass_center_of_mass = list("x"=18, "y"=10)
	price_per_unit = 0.275

/datum/reagent/ethanol/beepsky_smash/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.Stun(2)

/datum/reagent/ethanol/bilk
	name = "Bilk"
	id = "bilk"
	description = "This appears to be beer mixed with milk. Disgusting."
	taste_description = "desperation and lactate"
	taste_tag = list(TASTE_BUBBLY,TASTE_BITTER,TASTE_UMAMI)
	color = "#895C4C"
	strength = 40
	nutriment_factor = 2

	glass_unique_appearance = TRUE
	glass_icon_state = "glass_brown"
	glass_name = "bilk"
	glass_desc = "A brew of milk and beer. For those alcoholics who fear osteoporosis."
	price_per_unit = 0.13

/datum/reagent/ethanol/black_russian
	name = "Black Russian"
	id = "blackrussian"
	description = "For the lactose-intolerant. Still as classy as a White Russian."
	taste_description = "bitterness"
	taste_tag = list(TASTE_BITTER)
	color = "#360000d0"
	strength = 15

	glass_unique_appearance = TRUE

	glass_icon_state = "blackrussianglass"
	glass_name = "Black Russian"
	glass_desc = "For the lactose-intolerant. Still as classy as a White Russian."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.13

/datum/reagent/ethanol/bloody_mary
	name = "Bloody Mary"
	id = "bloodymary"
	description = "A strange yet pleasurable mixture made of vodka, tomato and lime juice. Tastes like liquid murder"
	taste_description = "tomatoes with a hint of lime"
	taste_tag = list(TASTE_SALTY,TASTE_REFRESHING, TASTE_UMAMI)
	color = "#660000d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "bloodymaryglass"
	glass_name = "Bloody Mary"
	glass_desc = "Tomato juice, mixed with Vodka and a lil' bit of lime. Tastes like liquid murder."
	price_per_unit = 0.13

/datum/reagent/ethanol/booger
	name = "Booger"
	id = "booger"
	description = "Ewww..."
	taste_description = "sweet 'n creamy"
	taste_tag = list(TASTE_SWEET,TASTE_SALTY)
	color = "#8CFF8Cd0"
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "booger"
	glass_name = "Booger"
	glass_desc = "Ewww..."
	price_per_unit = 0.13

/datum/reagent/ethanol/coffee/brave_bull
	name = "Brave Bull"
	id = "bravebull"
	description = "It's just as effective as Dutch-Courage!"
	taste_description = "alcoholic bravery"
	taste_tag = list(TASTE_STRONG,TASTE_DRY)
	taste_mult = 1.1
	color = "#664300d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "bravebullglass"
	glass_name = "Brave Bull"
	glass_desc = "Tequilla and coffee liquor, brought together in a mouthwatering mixture. Drink up."
	glass_center_of_mass = list("x"=15, "y"=8)
	price_per_unit = 0.25

/datum/reagent/ethanol/changelingsting
	name = "Changeling Sting"
	id = "changelingsting"
	description = "You take a tiny sip and feel a burning sensation..."
	taste_description = "your brain coming out your nose"
	taste_tag = list(TASTE_STRONG,TASTE_SOUR,TASTE_UMAMI)
	color = "#2E6671"
	strength = 5

	glass_unique_appearance = TRUE
	glass_icon_state = "changelingsting"
	glass_name = "Changeling Sting"
	glass_desc = "A stingy drink."
	price_per_unit = 0.13

/datum/reagent/ethanol/martini
	name = "Classic Martini"
	id = "martini"
	description = "Vermouth with Gin. Not quite how 007 enjoyed it, but still delicious."
	taste_description = "dry class"
	taste_tag = list(TASTE_SALTY,TASTE_DRY)
	color = "#664300d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "martiniglass"
	glass_name = "classic martini"
	glass_desc = "Damn, the bartender even stirred it, not shook it."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/cuba_libre
	name = "Cuba Libre"
	id = "cubalibre"
	description = "Rum, mixed with cola. Viva la revolucion."
	taste_description = "cola"
	taste_tag = list(TASTE_BUBBLY,TASTE_SWEET)
	color = "#3E1B00d0"
	strength = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "cubalibreglass"
	glass_name = "Cuba Libre"
	glass_desc = "A classic mix of rum and cola. Makes you want to scream 'VIVA!' at the top of your lungs."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.15

/datum/reagent/ethanol/demonsblood
	name = "Demons' Blood"
	id = "demonsblood"
	description = "AHHHH!!!!"
	taste_description = "sweet tasting iron"
	taste_tag = list(TASTE_SPICY,TASTE_DRY)
	taste_mult = 1.5
	color = "#a70000"
	strength = 10

	glass_unique_appearance = TRUE

	glass_icon_state = "demonsblood"
	glass_name = "Demons' Blood"
	glass_desc = "Just looking at this thing makes the hair at the back of your neck stand up."
	glass_center_of_mass = list("x"=16, "y"=2)
	price_per_unit = 0.15

/datum/reagent/ethanol/devilskiss
	name = "Devil's Kiss"
	id = "devilskiss"
	description = "Creepy time!"
	taste_description = "bitter iron"
	taste_tag = list(TASTE_BITTER,TASTE_DRY,TASTE_SLIMEY)
	color = "#A68310d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "devilskiss"
	glass_name = "Devil's Kiss"
	glass_desc = "Creepy time!"
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.15

/datum/reagent/ethanol/driestmartini
	name = "Driest Martini"
	id = "driestmartini"
	description = "Only for the experienced. You think you see sand floating in the glass."
	taste_description = "a beach"
	taste_tag = list(TASTE_BITTER,TASTE_DRY)
	nutriment_factor = 1
	color = "#2E6671d0"
	strength = 12

	glass_unique_appearance = TRUE
	glass_icon_state = "driestmartiniglass"
	glass_name = "Driest Martini"
	glass_desc = "Only for the experienced. You think you see sand floating in the glass."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.45

/datum/reagent/ethanol/ginfizz
	name = "Gin Fizz"
	id = "ginfizz"
	description = "Refreshingly lemony, deliciously dry."
	taste_description = "dry, tart lemons"
	taste_tag = list(TASTE_BUBBLY,TASTE_SOUR,TASTE_DRY)
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "ginfizzglass"
	glass_name = "gin fizz"
	glass_desc = "Refreshingly lemony, deliciously dry."
	glass_center_of_mass = list("x"=16, "y"=7)
	price_per_unit = 0.15

/datum/reagent/ethanol/grog
	name = "Grog"
	id = "grog"
	description = "Watered-down rum, pirate approved!"
	taste_description = "a poor excuse for alcohol"
	taste_tag = list(TASTE_STRONG)
	reagent_state = LIQUID
	color = "#664300d0"
	strength = 90

	glass_unique_appearance = TRUE
	glass_icon_state = "grogglass"
	glass_name = "grog"
	glass_desc = "A fine and cepa drink for Space."
	price_per_unit = 0.13

/datum/reagent/ethanol/erikasurprise
	name = "Erika Surprise"
	id = "erikasurprise"
	description = "The surprise is, it's green!"
	taste_description = "tartness and bananas"
	taste_tag = list(TASTE_SWEET)
	color = "#2E6671d0"
	strength = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "erikasurprise"
	glass_name = "Erika Surprise"
	glass_desc = "The surprise is, it's green!"
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.15

/datum/reagent/ethanol/gargle_blaster
	name = "Pan-Galactic Gargle Blaster"
	id = "gargleblaster"
	description = "Woah, this stuff looks volatile!"
	taste_description = "your brains smashed out by a lemon wrapped around a gold brick"
	taste_tag = list(TASTE_SOUR, TASTE_SPICY, TASTE_STRONG)
	taste_mult = 5
	reagent_state = LIQUID
	color = "#00ffead0"
	strength = 1

	glass_unique_appearance = TRUE

	glass_icon_state = "gargleblasterglass"
	glass_name = "Pan-Galactic Gargle Blaster"
	glass_desc = "Does... does this mean that Arthur and Ford are on the colony? Oh joy."
	glass_center_of_mass = list("x"=17, "y"=6)
	price_per_unit = 1

/datum/reagent/ethanol/gintonic
	name = "Gin and Tonic"
	id = "gintonic"
	description = "An all time classic, mild cocktail."
	taste_description = "mild and tart"
	taste_tag = list(TASTE_STRONG,TASTE_SOUR,TASTE_DRY)
	color = "#004166d0"
	strength = 20

	glass_unique_appearance = TRUE
	glass_icon_state = "gintonicglass"
	glass_name = "gin and tonic"
	glass_desc = "A mild but still great cocktail. Drink up, like a true Englishman."
	glass_center_of_mass = list("x"=16, "y"=7)
	price_per_unit = 0.15

/datum/reagent/ethanol/goldschlager
	name = "Goldschlager"
	id = "goldschlager"
	description = "100 proof cinnamon schnapps, made for alcoholic teen girls on spring break."
	taste_description = "burning cinnamon"
	taste_tag = list(TASTE_LIGHT,TASTE_DRY)
	taste_mult = 1.3
	color = "#004166d0"
	strength = 15

	glass_icon_state = "ginvodkaglass"
	glass_name = "Goldschlager"
	glass_desc = "100 proof that teen girls will drink anything with gold in it."
	glass_center_of_mass = list("x"=16, "y"=12)

/datum/reagent/ethanol/hippies_delight
	name = "Hippies' Delight"
	id = "hippiesdelight"
	description = "You just don't get it maaaan."
	taste_description = "giving peace a chance"
	taste_tag = list(TASTE_SWEET,TASTE_LIGHT)
	reagent_state = LIQUID
	color = "#6daa0cab"
	strength = 15
	druggy = 50

	glass_unique_appearance = TRUE

	glass_icon_state = "hippiesdelightglass"
	glass_name = "Hippie's Delight"
	glass_desc = "A drink enjoyed by people during the 1960's."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.6

/datum/reagent/ethanol/hooch
	name = "Hooch"
	id = "hooch"
	description = "Either someone's failure at cocktail making or attempt in alcohol production. In any case, do you really want to drink that?"
	taste_description = "pure resignation"
	taste_tag = list(TASTE_BITTER,TASTE_DRY)
	color = "#664e00d0"
	strength = 1
	toxicity = 2

	glass_unique_appearance = TRUE
	glass_icon_state = "hoochbottle"
	glass_name = "Hooch"
	glass_desc = "Prohibition can bite my shiny positronic behind."
	price_per_unit = 0.75

/datum/reagent/ethanol/iced_beer
	name = "Iced Beer"
	id = "iced_beer"
	description = "A beer which is so cold the air around it freezes."
	taste_description = "refreshingly cold"
	taste_tag = list(TASTE_BUBBLY, TASTE_STRONG,TASTE_REFRESHING)
	color = "#664300d0"
	strength = 20
	adj_temp = -10
	targ_temp = 270

	glass_icon_state = "iced_beerglass"
	glass_name = "iced beer"
	glass_desc = "A beer so frosty, the air around it freezes."
	glass_center_of_mass = list("x"=16, "y"=7)
	price_per_unit = 0.13

/datum/reagent/ethanol/irishcarbomb
	name = "Irish Car Bomb"
	id = "irishcarbomb"
	description = "Mmm, tastes like chocolate cake..."
	taste_description = "delicious anger"
	taste_tag = list(TASTE_BUBBLY,TASTE_SWEET,TASTE_BITTER)
	color = "#2E6671d0"
	strength = 15

	glass_unique_appearance = TRUE

	glass_icon_state = "irishcarbomb"
	glass_name = "Irish Car Bomb"
	glass_desc = "An irish car bomb."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.25

/datum/reagent/ethanol/coffee/irishcoffee
	name = "Irish Coffee"
	id = "irishcoffee"
	description = "Coffee, and alcohol. More fun than a Mimosa to drink in the morning."
	taste_description = "giving up on the day"
	taste_tag = list(TASTE_SWEET,TASTE_BITTER)
	color = "#664300d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "irishcoffeeglass"
	glass_name = "Irish coffee"
	glass_desc = "Coffee and alcohol. More fun than a Mimosa to drink in the morning."
	glass_center_of_mass = list("x"=15, "y"=10)
	price_per_unit = 0.15

/datum/reagent/ethanol/irish_cream
	name = "Irish Cream"
	id = "irishcream"
	description = "Whiskey-imbued cream, what else would you expect from the Irish."
	taste_description = "creamy alcohol"
	taste_tag = list(TASTE_STRONG,TASTE_SWEET)
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "irishcreamglass"
	glass_name = "Irish cream"
	glass_desc = "It's cream, mixed with whiskey. What else would you expect from the Irish?"
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.15

/datum/reagent/ethanol/longislandicedtea
	name = "Long Island Iced Tea"
	id = "longislandicedtea"
	description = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."
	taste_description = "a mixture of cola and alcohol"
	taste_tag = list(TASTE_STRONG,TASTE_BITTER)
	color = "#664300d0"
	strength = 12

	glass_unique_appearance = TRUE

	glass_icon_state = "longislandicedteaglass"
	glass_name = "Long Island iced tea"
	glass_desc = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/manhattan
	name = "Manhattan"
	id = "manhattan"
	description = "The Ranger's undercover drink of choice. They never could stomach gin..."
	taste_description = "mild dryness"
	taste_tag = list(TASTE_LIGHT,TASTE_DRY)
	color = "#664300d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "manhattanglass"
	glass_name = "Manhattan"
	glass_desc = "The Ranger's undercover drink of choice. They never could stomach gin..."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/manhattan_proj
	name = "Manhattan Project"
	id = "manhattan_proj"
	description = "A scientist's drink of choice, for pondering ways to blow up the colony."
	taste_description = "death, the destroyer of worlds"
	taste_tag = list(TASTE_LIGHT,TASTE_DRY)
	color = "#664300d0"
	strength = 10
	druggy = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "proj_manhattanglass"
	glass_name = "Manhattan Project"
	glass_desc = "A scientist's drink of choice, for pondering ways to blow up the colony."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.45

/datum/reagent/ethanol/manly_dorf
	name = "The Manly Dorf"
	id = "manlydorf"
	description = "Beer and Ale, brought together in a delicious mix. Intended for true men only."
	taste_description = "hair on your chest and your chin"
	taste_tag = list(TASTE_BUBBLY,TASTE_STRONG)
	color = "#664300d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "manlydorfglass"
	glass_name = "The Manly Dorf"
	glass_desc = "A manly concoction made from Ale and Beer. Intended for true men only."
	price_per_unit = 0.13

/datum/reagent/ethanol/margarita
	name = "Margarita"
	id = "margarita"
	description = "On the rocks with salt on the rim. Arriba~!"
	taste_description = "dry and salty"
	taste_tag = list(TASTE_SALTY,TASTE_BITTER)
	color = "#8CFF8Cd0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "margaritaglass"
	glass_name = "margarita"
	glass_desc = "On the rocks with salt on the rim. Arriba~!"
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/mead
	name = "Mead"
	id = "mead"
	description = "A Viking's drink, though a cheap one."
	taste_description = "sweet, sweet alcohol"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG)
	reagent_state = LIQUID
	color = "#664300d0"
	strength = 30
	nutriment_factor = 1

	glass_unique_appearance = TRUE
	glass_icon_state = "meadglass"
	glass_name = "mead"
	glass_desc = "A Viking's beverage, though a cheap one."
	glass_center_of_mass = list("x"=17, "y"=10)
	price_per_unit = 0.5

/datum/reagent/ethanol/moonshine
	name = "Moonshine"
	id = "moonshine"
	description = "You've really hit rock bottom now... your liver packed its bags and left last night."
	taste_description = "cheap ethanol"
	taste_tag = list(TASTE_BITTER,TASTE_STRONG)
	taste_mult = 2.5
	color = "#664300d0"
	strength = 12

	glass_unique_appearance = TRUE
	glass_icon_state = "moonshinebottle"
	glass_name = "moonshine"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."
	price_per_unit = 0.5

/datum/reagent/ethanol/neurotoxin
	name = "Neurotoxin"
	id = "neurotoxin"
	description = "A strong neurotoxin that puts the subject into a death-like state."
	taste_description = "a numbing sensation"
	taste_tag = list(TASTE_STRONG,TASTE_SLIMEY)
	reagent_state = LIQUID
	color = "#2E2E61"
	strength = 10

	glass_unique_appearance = TRUE

	glass_icon_state = "neurotoxinglass"
	glass_name = "Neurotoxin"
	glass_desc = "A drink that is guaranteed to knock you silly."
	glass_center_of_mass = list("x"=16, "y"=8)
	common = FALSE //The fact you don't know what it is should be a tip-off not to drink it.
	price_per_unit = 0.75

/datum/reagent/ethanol/neurotoxin/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.Weaken(3 * effect_multiplier)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/ethanol/patron
	name = "Patron"
	id = "patron"
	description = "Tequila with silver in it, a favorite of alcoholic women in the club scene."
	taste_description = "metallic and expensive"
	taste_tag = list(TASTE_STRONG)
	color = "#585840d0"
	strength = 20

	glass_unique_appearance = TRUE
	glass_icon_state = "patronglass"
	glass_name = "Patron"
	glass_desc = "Drinking patron in the bar, with all the sub-par ladies."
	glass_center_of_mass = list("x"=7, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/pwine
	name = "Poison Wine"
	id = "pwine"
	description = "Is this even wine? Toxic! Hallucinogenic! Probably consumed in boatloads by your superiors!"
	taste_description = "purified alcoholic death"
	taste_tag = list(TASTE_SPICY,TASTE_SWEET,TASTE_BITTER)
	color = "#000000d0"
	strength = 1
	druggy = 50
	halluci = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "pwineglass"
	glass_name = "???"
	glass_desc = "A black ichor with an oily purple sheer on top. Are you sure you should drink this?"
	glass_center_of_mass = list("x"=16, "y"=5)
	common = FALSE //The fact you don't know what it is should be a tip-off not to drink it.
	illegal = TRUE
	price_per_unit = 1.5

/datum/reagent/ethanol/pwine/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	if(dose > 30)
		M.add_chemical_effect(CE_TOXIN, 0.2 * effect_multiplier)
	if(dose > 60 && ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/vital/heart/L = H.random_organ_by_process(OP_HEART)
		if(L && istype(L))
			if(dose < 120)
				L.take_damage(1 * effect_multiplier, 0)
			else
				L.take_damage(10 * effect_multiplier, 0)

/datum/reagent/ethanol/red_mead
	name = "Red Mead"
	id = "red_mead"
	description = "The true Viking's drink! Even though it has a strange red color."
	taste_description = "sweet and salty alcohol"
	taste_tag = list(TASTE_SWEET, TASTE_SALTY)
	color = "#C73C00d0"
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "red_meadglass"
	glass_name = "red mead"
	glass_desc = "A true Viking's beverage, though its color is strange."
	glass_center_of_mass = list("x"=17, "y"=10)
	price_per_unit = 0.13

/datum/reagent/ethanol/riotjuice
	name = "Riot Juice"
	id = "riotjuice"
	description = "A cocktail that is very potent. Perfect for sporting events."
	taste_description = "strong yet drinkable alcohol"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG)
	color = "#33CCFFd0"
	strength = 10

	glass_icon_state = "riotjuice_glass"
	glass_name = "Riot Juice"
	glass_desc = "A very strong mixed drink. Perfect for sporting events, or plasma tag. Not for bug bites."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.2

/datum/reagent/ethanol/sbiten
	name = "Sbiten"
	id = "sbiten"
	description = "A spicy Vodka! Might be a little hot for the little guys!"
	taste_description = "hot and spice"
	taste_tag = list(TASTE_SPICY,TASTE_SLIMEY)
	color = "#004166d0"
	strength = 5
	adj_temp = 25
	targ_temp = 360

	glass_unique_appearance = TRUE
	glass_icon_state = "sbitenglass"
	glass_name = "Sbiten"
	glass_desc = "A spicy mix of Vodka and Peppers. Very hot."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.13

/datum/reagent/ethanol/screwdrivercocktail
	name = "Screwdriver"
	id = "screwdrivercocktail"
	description = "Vodka, mixed with plain ol' orange juice. The result is surprisingly delicious."
	taste_description = "oranges"
	taste_tag = list(TASTE_SOUR,TASTE_SWEET)
	color = "#A68310d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "screwdriverglass"
	glass_name = "Screwdriver"
	glass_desc = "A simple, yet superb mixture of Vodka and orange juice. Just the thing for the tired Adept."
	glass_center_of_mass = list("x"=15, "y"=10)
	price_per_unit = 0.13

/datum/reagent/ethanol/silencer
	name = "Silencer"
	id = "silencer"
	description = "A drink from Mime Heaven."
	taste_description = "a pencil eraser"
	taste_tag = list(TASTE_SWEET,TASTE_DRY)
	taste_mult = 1.2
	nutriment_factor = 1
	color = "#004666d0"
	strength = 12

	glass_unique_appearance = TRUE

	glass_icon_state = "silencerglass"
	glass_name = "Silencer"
	glass_desc = "A drink from mime Heaven."
	glass_center_of_mass = list("x"=16, "y"=9)
	common = FALSE //What even is this
	price_per_unit = 0.85

/datum/reagent/ethanol/singulo
	name = "Singulo"
	id = "singulo"
	description = "A blue-space beverage!"
	taste_description = "concentrated matter"
	taste_tag = list(TASTE_BITTER,TASTE_STRONG)
	color = "#3b0c0cd0"
	strength = 10

	glass_unique_appearance = TRUE

	glass_icon_state = "singulo"
	glass_name = "Singulo"
	glass_desc = "A blue-space beverage."
	glass_center_of_mass = list("x"=17, "y"=4)
	price_per_unit = 0.85

/datum/reagent/ethanol/snowwhite
	name = "Snow White"
	id = "snowwhite"
	description = "A cold refreshment"
	taste_description = "refreshing cold"
	taste_tag = list(TASTE_LIGHT,TASTE_REFRESHING)
	color = "#FFFFFFd0"
	strength = 20

	glass_unique_appearance = TRUE
	glass_icon_state = "snowwhite"
	glass_name = "Snow White"
	glass_desc = "A cold refreshment."
	glass_center_of_mass = list("x"=16, "y"=8)
	price_per_unit = 0.25

/datum/reagent/ethanol/suidream
	name = "Sui Dream"
	id = "suidream"
	description = "Comprised of: White soda, blue curacao, melon liquor."
	taste_description = "fruit"
	taste_tag = list(TASTE_BUBBLY,TASTE_SWEET)
	color = "#00A86Bd0"
	strength = 50

	glass_unique_appearance = TRUE
	glass_icon_state = "sdreamglass"
	glass_name = "Sui Dream"
	glass_desc = "A froofy, fruity, and sweet mixed drink. Understanding the name only brings shame."
	glass_center_of_mass = list("x"=16, "y"=5)
	price_per_unit = 0.85

/datum/reagent/ethanol/syndicatebomb
	name = "Syndicate Bomb"
	id = "syndicatebomb"
	description = "Tastes like terrorism!"
	taste_description = "purified antagonism"
	taste_tag = list(TASTE_STRONG,TASTE_DRY)
	color = "#716c2ed0"
	strength = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "syndicatebomb"
	glass_name = "Syndicate Bomb"
	glass_desc = "Tastes like terrorism!"
	glass_center_of_mass = list("x"=16, "y"=4)
	price_per_unit = 0.85

/datum/reagent/ethanol/tequilla_sunrise
	name = "Tequila Sunrise"
	id = "tequillasunrise"
	description = "Tequila and orange juice. Much like a Screwdriver, only Mexican~"
	taste_description = "oranges"
	taste_tag = list(TASTE_SOUR, TASTE_STRONG)
	color = "#FFE48Cd0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "tequillasunriseglass"
	glass_name = "Tequilla Sunrise"
	glass_desc = "Oh great, now you feel nostalgic about sunrises back on Sol...if you ever lived there."
	price_per_unit = 0.25

/datum/reagent/ethanol/threemileisland
	name = "Three Mile Island Iced Tea"
	id = "threemileisland"
	description = "Made for a woman, strong enough for a man."
	taste_description = "dry"
	taste_tag = list(TASTE_DRY,TASTE_STRONG)
	color = "#666340d0"
	strength = 10
	druggy = 50

	glass_unique_appearance = TRUE

	glass_icon_state = "threemileislandglass"
	glass_name = "Three Mile Island iced tea"
	glass_desc = "A glass of this is sure to prevent a meltdown."
	glass_center_of_mass = list("x"=16, "y"=2)
	price_per_unit = 0.25

/datum/reagent/ethanol/toxins_special
	name = "Toxins Special"
	id = "plasmaspecial"
	description = "This thing is ON FIRE! CALL THE DAMN GUILDIES!"
	taste_description = "spicy toxins"
	taste_tag = list(TASTE_SPICY)
	reagent_state = LIQUID
	color = "#665c00d0"
	strength = 10
	adj_temp = 15
	targ_temp = 330

	glass_unique_appearance = TRUE

	glass_icon_state = "toxinsspecialglass"
	glass_name = "Toxins Special"
	glass_desc = "Woah, this thing is on FIRE"
	price_per_unit = 0.25

/datum/reagent/ethanol/vodkamartini
	name = "Vodka Martini"
	id = "vodkamartini"
	description = "Vodka with Gin. Not quite how 007 enjoyed it, but still delicious."
	taste_description = "shaken, not stirred"
	taste_tag = list(TASTE_LIGHT,TASTE_SOUR)
	color = "#004666d0"
	strength = 12

	glass_unique_appearance = TRUE
	glass_icon_state = "martiniglass"
	glass_name = "vodka martini"
	glass_desc ="A bastardization of the classic martini. Still great."
	glass_center_of_mass = list("x"=17, "y"=8)
	price_per_unit = 0.15

/datum/reagent/ethanol/vodkatonic
	name = "Vodka and Tonic"
	id = "vodkatonic"
	description = "For when a gin and tonic isn't Russian enough."
	taste_description = "tart bitterness"
	taste_tag = list(TASTE_BITTER,TASTE_SOUR)
	color = "#0064C8d0" // rgb: 0, 100, 200
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "vodkatonicglass"
	glass_name = "vodka and tonic"
	glass_desc = "For when a gin and tonic isn't Russian enough."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/ethanol/white_russian
	name = "White Russian"
	id = "whiterussian"
	description = "That's just, like, your opinion, man..."
	taste_description = "bitter cream"
	taste_tag = list(TASTE_BITTER,TASTE_SLIMEY)
	color = "#A68340d0"
	strength = 15

	glass_unique_appearance = TRUE

	glass_icon_state = "whiterussianglass"
	glass_name = "White Russian"
	glass_desc = "A very nice looking drink. But that's just, like, your opinion, man."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.15

/datum/reagent/ethanol/whiskey_cola
	name = "Whiskey Cola"
	id = "whiskeycola"
	description = "Whiskey, mixed with cola. Surprisingly refreshing."
	taste_description = "cola"
	color = "#3E1B00d0"
	strength = 25

	glass_unique_appearance = TRUE
	glass_icon_state = "whiskeycolaglass"
	glass_name = "whiskey cola"
	glass_desc = "An innocent-looking mixture of cola and Whiskey. Delicious."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.13

/datum/reagent/ethanol/whiskeysoda
	name = "Whiskey Soda"
	id = "whiskeysoda"
	description = "For the more refined griffon."
	taste_tag = list(TASTE_BUBBLY,TASTE_SWEET)
	color = "#533600d0"
	strength = 15

	glass_unique_appearance = TRUE
	glass_icon_state = "whiskeysodaglass2"
	glass_name = "whiskey soda"
	glass_desc = "Ultimate refreshment."
	glass_center_of_mass = list("x"=16, "y"=9)
	price_per_unit = 0.13

/datum/reagent/ethanol/atomic_vodka
	name = "Atomic Vodka"
	id = "atomvodka"
	description = "Clear distilled alcoholic beverage that originates from Poland and Russia, now with nuclear taste!"
	taste_description = "strong grain alcohol"
	taste_tag = list(TASTE_BUBBLY,TASTE_SWEET,TASTE_STRONG)
	color = "#0064C8d0" // rgb: 0, 100, 200
	strength = 5
	strength_mod = 10
	toxicity = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "ginvodkaglass"
	glass_name = "atomic vodka"
	glass_desc = "Booze for true drunkards."
	glass_center_of_mass = list("x"=16, "y"=12)
	price_per_unit = 0.25

/datum/reagent/ethanol/atomic_vodka/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(!M.stats.getTempStat(STAT_TGH, "atomvodka") && M.stats.getPerk(PERK_SOMELLIER))
		M.stats.addTempStat(STAT_TGH, STAT_LEVEL_ADEPT, 10 MINUTES, "atomvodka")

/datum/reagent/ethanol/specialwhiskey // Previously unobtainable, bar spawns with a keg full of it, and you can't order more. A luxury drink!
	name = "Special Blend Whiskey"
	id = "specialwhiskey"
	description = "Just when you thought regular colony whiskey was good... This silky, amber goodness has to come along and ruin everything."
	taste_description = "the whiskey gods blessing your tastebuds"
	taste_tag = list(TASTE_LIGHT,TASTE_STRONG)
	color = "#664300d0"
	strength = 10

	glass_unique_appearance = TRUE
	glass_icon_state = "whiskeyglass"
	glass_name = "Special Blend Whiskey"
	glass_desc = "Just when you thought regular colony whiskey was good... This silky, amber goodness has to come along and ruin everything."
	glass_center_of_mass = list("x"=16, "y"=12)
	price_per_unit = 0.25

/datum/reagent/ethanol/schnapps // Inside the hacked vendor, only exist since Lonestar sells to Kriosan Space and this is a highly requested drink there
	name = "Jaeger Schnapps"
	id = "schnapps"
	description = "A crystal clear glass that stings your senses with sub-par berries and acrid spirits. Finally, some real schnapps."
	taste_description = "numbness, summer spirits, and washed-out raspberry"
	taste_tag = list(TASTE_STRONG)
	taste_mult = 1.1
	strength = 10

	glass_icon_state = "schnappsglass"
	glass_name = "raspberry schnapps"
	glass_desc = "A crystal clear glass that stings your senses with sub-par berries and acrid spirits. Finally, some real schnapps."
	glass_center_of_mass = list("x"=16, "y"=6)
	price_per_unit = 0.1

/datum/reagent/ethanol/daiquiri
	name = "Daiquiri"
	id = "daiquiri"
	description = "Refreshing rum and citrus. Time for a tropical get away."
	taste_description = "refreshing citrus and rum"
	taste_tag = list(TASTE_SWEET, TASTE_REFRESHING)
	color = "#d1ff49d0" // rgb(209, 255, 73
	glass_icon_state = "daiquiri"
	strength = 35

	glass_unique_appearance = TRUE
	glass_name = "Daiquiri"
	glass_desc = "Refreshing rum and citrus. Time for a tropical getaway."
	price_per_unit = 0.13

/datum/reagent/ethanol/daiquiri_strawberry
	name = "Daiquiri Pink"
	id = "daiquiri_strawberry"
	description = "Refreshing rum and strawberry juice. Time for a tropical get away, even if its too fruity."
	taste_description = "refreshing strawberry and rum"
	taste_tag = list(TASTE_SWEET, TASTE_REFRESHING)
	color = "#d1ff49d0" // rgb(209, 255, 73
	glass_unique_appearance = TRUE
	glass_icon_state = "daiquiristrawberry"
	strength = 35 //Washed down with FLAVOUR

	glass_name = "Daiquiri Pink"
	glass_desc = "Refreshing rum and strawberry juice. Time for a tropical get away, even if its too fruity."
	price_per_unit = 0.13

/datum/reagent/ethanol/whiskeysour
	name = "Whiskey Sour"
	id = "whiskeysour"
	description = "A smokey, refreshing lemon whiskey."
	taste_description = "smoke and citrus"
	taste_tag = list(TASTE_SWEET, TASTE_SOUR)
	glass_icon_state = "whiskeysour"
	glass_unique_appearance = TRUE
	color = "#a0692ed0" // rgb(160, 105, 46)
	strength = 20

	glass_name = "Whiskey Sour"
	glass_desc = "A smokey, refreshing lemon whiskey."
	price_per_unit = 0.13

/datum/reagent/ethanol/mojito
	name = "Mojito"
	id = "mojito"
	description = "Minty rum and citrus, made for sailing."
	taste_tag = list(TASTE_SWEET, TASTE_REFRESHING)
	taste_description = "minty rum and lime"
	color = "#d1ff49d0" // rgb(209, 255, 73
	strength = 30

	glass_icon_state = "mojito"
	glass_name = "Mojito"
	glass_desc = "Minty rum and citrus, made for sailing."
	price_per_unit = 0.13

/datum/reagent/ethanol/balloon
	name = "Balloon"
	id = "balloon"
	description = "A strange drink invented in the aerostats of Venus."
	taste_description = "strange alcohol"
	taste_tag = list(TASTE_SLIMEY, TASTE_STRONG)
	glass_icon_state = "balloon"
	color = "#FAEBD7d0"
	strength = 66

	glass_unique_appearance = TRUE
	glass_name = "Balloon"
	glass_desc = "A strange drink invented in the aerostats of Venus."
	price_per_unit = 0.13

/datum/reagent/drink/triplecitrus
	name = "Triple Citrus" // This one's for you, Duffy.
	id = "triplecitrus"
	description = "A mixture of citrus juices. Tangy, yet smooth."
	taste_description = "extremely refreshing sourness"
	taste_tag = list(TASTE_STRONG, TASTE_SOUR, TASTE_REFRESHING)
	nutrition = 2
	color = "#bedf00d0" // rgb(190, 223, 0)
	glass_unique_appearance = TRUE
	glass_icon_state = "triplecitrus"
	glass_name = "Triple Citrus"
	glass_desc = "A mixture of citrus juices. Tangy, yet smooth."
	price_per_unit = 0.1

/datum/reagent/drink/sugarrush
	name = "Sugar Rush"
	id = "sugarrush"
	description = "Sweet, light, and fruity - as girly as it gets."
	taste_description = "a sweet, girly drink"
	taste_tag = list(TASTE_SWEET)
	nutrition = 2
	color = "#d51e5e" // rgb(213, 30,94)
	glass_center_of_mass = list("x"=16, "y"=7)
	glass_unique_appearance = TRUE
	glass_icon_state = "sugarrush"
	glass_name = "Sugar Rush"
	glass_desc = "Sweet, light, and fruity - as girly as it gets."
	price_per_unit = 0.1

/datum/reagent/drink/crevicespike
	name = "Crevice Spike"
	id = "crevicespike"
	description = "It will knock the drunkenness out of you or knock you out cold."
	taste_description = "sour, manly, and sobering goodness"
	taste_tag = list(TASTE_SOUR, TASTE_STRONG)
	color = "#5bd231" // rgb(91, 210, 49)
	overdose = 45
	glass_unique_appearance = TRUE
	glass_icon_state = "crevice_spike"
	glass_name = "Crevice Spike"
	glass_desc = "It will knock the drunkenness out of you or knock you out cold."
	price_per_unit = 0.13

/datum/reagent/drink/crevicespike/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.dizziness = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.confused = 0

/datum/reagent/drink/crevicespike/overdose(mob/living/carbon/M, alien)
	..()
	M.Stun(2)

/datum/reagent/ethanol/fringeweaver
	name = "Fringe Weaver"
	id = "fringeweaver"
	description = "It's like drinking ethylic alcohol with a spoonful of sugar."
	taste_description = "sugar dilluted in ethylic alcohol"
	taste_tag = list(TASTE_BITTER, TASTE_STRONG)
	color = "#ffffb3" // rgb(255, 255, 179)
	strength = 15 //Almost like Moonshine
	glass_unique_appearance = TRUE
	glass_icon_state = "fringeweaver"
	glass_name =  "Fringe Weaver"
	glass_desc = "It's like drinking ethylic alcohol with a spoonful of sugar."
	price_per_unit = 0.05

/datum/reagent/ethanol/pianowoman
	name = "Piano Woman"
	id = "pianowoman"
	description = "A rename of a classic mix, with a twist of its own. Some Biosynths seem to love this for some reason..."
	taste_description = "sweet and happy"
	taste_tag = list(TASTE_SWEET)
	color = "#bdffca" // rgb(189, 255, 202)
	strength = 25
	glass_unique_appearance = TRUE
	glass_icon_state = "pianowoman"
	glass_name = "Piano Woman"
	glass_desc = "A rename of a classic mix, the favorite drink of certain robots and biosynths for some reason..."
	price_per_unit = 0.13

/datum/reagent/ethanol/fernet
	name = "Fernet"
	id = "fernet"
	description = "Pure Fernet, a bitter herb digestif. Drink if you dare."
	taste_description = "unbearable bitterness"
	taste_tag = list(TASTE_BITTER)
	color = "#150905d0" // rgb(21, 9, 5)
	strength = 5 //Not meant to be drank on its own!

	glass_icon_state = "fernetpuro"
	glass_name = "pure Fernet"
	glass_desc = "A glass of pure Fernet, a bitter herb digestif. Are you sure you can stomach this undilluted...?"

/datum/reagent/ethanol/fernet/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.nutrition = max(M.nutrition - 1 * effect_multiplier, 0) //Since it's a digestif it allows you to be less "full" by making you hungry!
	if(dose > 10)
		M.add_chemical_effect(CE_TOXIN, 0.2* effect_multiplier) //Toxic! Don't drink alone! May this be a reminder!
	if(dose > 60 && ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER) // This will destroy your liver, don't do it!
		if(L && istype(L))
			if(dose < 120)
				L.take_damage(1 * effect_multiplier, 0)
			else
				L.take_damage(10 * effect_multiplier, 0)

/datum/reagent/ethanol/fernetcola
	name = "Fernet Cola"
	id = "fernetcola"
	description = "Fernet dilluted with Cola, a refreshing and digestive combination."
	taste_description = "bittersweet relief"
	taste_tag = list(TASTE_SWEET, TASTE_BUBBLY)
	color = "#572C00" // rgb(87, 44, 0)
	strength = 35
	glass_unique_appearance = TRUE
	glass_icon_state = "godlyblend"
	glass_name = "sawn-off bottle of Fernet cola"
	glass_desc = "Fernet mixed with cola, served on a sawn-off bottle as per tradition. A smooth digestif for when you've eaten more than you could chew."
	price_per_unit = 0.13

/datum/reagent/ethanol/fernetcola/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	M.nutrition = max(M.nutrition - 1 * effect_multiplier, 0)
	..()

/datum/reagent/drink/fanciulli
	name = "Fanciulli"
	id = "fanciulli"
	description = "Manhattan with Fernet as its bitter."
	taste_description = "a sweet, sobering mix"
	taste_tag = list(TASTE_DRY, TASTE_BITTER)
	glass_unique_appearance = TRUE
	glass_icon_state = "fanciulli"
	glass_name = "Fanciulli"
	glass_desc = "What if the Manhattan cocktail <b>actually</b> used a digestif? Helps you sober up, but makes you sluggish."
	price_per_unit = 0.13

/datum/reagent/drink/fanciulli/affect_ingest(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	..()
	M.nutrition = max(M.nutrition - 1 * effect_multiplier, 0)
	M.dizziness = 0
	M.stuttering = 0
	M.confused = 0
	M.Weaken(2)

/datum/reagent/ethanol/jagerbomb
	name = "Jager bomb"
	id = "jagerbomb"
	strength = 15 // Strong!
	description = "Claw energy drink mixed with Fernet, a sweet drink with a strong bitter aftertaste."
	taste_description = "carbonated sweetness with a strong kick and bitter aftertaste"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER, TASTE_BUBBLY)
	glass_unique_appearance = TRUE
	glass_icon_state = "jagerbomb"
	glass_name = "jager bomb shot"
	glass_desc = "A shot glass of bitter herb digestif dropped into a glass of Claw energy drink \
				makes for a drink beloved by sleep deprived paramedics and Lodge Huntmasters alike. \n Tradition dictates that you must drink this all in one go!"
	price_per_unit = 0.75

/datum/reagent/ethanol/jagerbomb/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.dizziness = 0
	M.confused = 0
	M.sleeping = 0 // FOURTEEN HOURS SHIFT LET'S GOOOOOO
	M.add_chemical_effect(CE_PULSE, 2) // Purely flavor

/datum/reagent/drink/antidepressant
	name = "Antidepressant"
	id = "antidepressant"
	description = "A Bright red cocktail, chill as an empty chimney, yet bright and soothing as a smile. Non-alcoholic. A soul lightener, you can't stay sad at the taste of this."
	taste_description = "a sweet, smooth mix of fruits and joy"
	taste_tag = list(TASTE_SWEET)
	sanity_gain_ingest = 1
	glass_unique_appearance = TRUE
	glass_icon_state = "antidepresant"
	glass_name = "Antidepressant"
	glass_desc = "A Bright red cocktail, chill as an empty chimney, yet bright and soothing as a smile. Non-alcoholic. A soul lightener, you can't stay sad at the taste of this."
	price_per_unit = 1

/datum/reagent/drink/blendedmint
	name = "Blended Mint"
	id = "blendedmint"
	description = "A common condiment to mix with cocktails or other foods. It's just a cup of leaves innit."
	taste_description = "dry mint leaves"
	taste_tag = list(TASTE_BITTER)
	taste_mult = 0.5
	color = "#98CD49"


	glass_icon_state = "booger"
	glass_name = "blended mint leaves"
	glass_desc = "Very dry and bland, but with a minty aftertaste! Not the best thing to be \"drinking\" though."
	price_per_unit = 0.13

/datum/reagent/drink/cinnamonpowder
	name = "Cinnamon Powder"
	id = "cinnamonpowder"
	description = "A common condiment to mix with milkshakes or desserts. Not to be used for challenges."
	taste_description = "dry cinnamon powder"
	taste_tag = list(TASTE_BITTER)
	taste_mult = 0.5
	color = "#D78F5F"

	glass_icon_state = "glass_brown"
	glass_name = "cinnamon powder"
	glass_desc = "Pure grinded up cinnamon powder. Delicious when used as a condiment, but a cough hazard when taken by itself."

/datum/reagent/drink/blueberryjuice
	name = "Blueberry Juice"
	id = "blueberryjuice"
	description = "Used to mix with cocktails, milkshakes or if you just want some refreshing blueberry juice."
	taste_description = "fresh fruity blueberry"
	taste_tag = list(TASTE_SWEET)
	taste_mult = 1.1
	color = "#4D0121"

	glass_icon_state = "grapejuice"
	glass_name = "blueberry juice"
	glass_desc = "Rather simple when it comes to fruit juices, but still refreshing!"

/datum/reagent/drink/strawberryjuice
	name = "Strawberry Juice"
	id = "strawberryjuice"
	description = "Used to mix with cocktails, milkshakes or if you just want some sweet refreshing strawberry juice."
	taste_description = "sweet fruity strawberry"
	taste_tag = list(TASTE_SWEET)
	taste_mult = 1.1
	color = "#C20032"

	glass_icon_state = "berryjuice"
	glass_name = "strawberry juice"
	glass_desc = "Sweet and sugary, but also very refreshing!"

//SoJ based drinks


/datum/reagent/ethanol/southern_saki
	name = "Southern Sake"
	id = "southern_saki"
	description = "Best served warm and in a shallow bowl for lapping."
	taste_description = "unbearable bitterness"
	taste_tag = list(TASTE_BITTER)
	color = "#F9F9F9" // rgb(98, 98, 98)
	strength = 10 //rice wine stronk

	glass_unique_appearance = TRUE
	glass_icon_state = "sake"
	glass_name = "Southern Sake"
	glass_desc = "Best served warm and in a shallow bowl for lapping."
	price_per_unit = 0.2

/datum/reagent/ethanol/nothern_mead
	name = "Nothern Mead"
	id = "nothern_mead"
	description = "Said to make even the strongest of accents all the more unintelligible."
	taste_description = "robust hops and carbon"
	taste_tag = list(TASTE_STRONG, TASTE_SWEET)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 20 //stronk

	glass_unique_appearance = TRUE
	glass_icon_state = "tankardlidfull"
	glass_name = "Nothern Mead"
	glass_desc = "Said to make even the strongest of accents all the more unintelligible."
	price_per_unit = 0.2

/datum/reagent/ethanol/life_line
	name = "Life Line"
	id = "life_line"
	description = "A perfect drink for mass casualties."
	taste_description = "liquid painkillers"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 35 //weak painkiller

	glass_unique_appearance = TRUE
	glass_icon_state = "lifeline"
	glass_name = "Life Line"
	glass_desc = "A perfect drink for mass casualties."
	price_per_unit = 0.2

/datum/reagent/ethanol/posicell
	name = "Posicell"
	id = "posicell"
	description = "The only drink that is shockingly annoying to make in and out of the house."
	taste_description = "rouge hardware and annoyed labcoats"
	taste_tag = list(TASTE_SOUR, TASTE_BITTER, TASTE_DRY)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 60

	glass_unique_appearance = TRUE
	glass_icon_state = "posicell"
	glass_name = "Posicell"
	glass_desc = "The only drink that is shockingly annoying to make in and out of the house."
	price_per_unit = 0.2

/datum/reagent/ethanol/nickle_n_dime
	name = "Nickel And Dime"
	id = "nickle_n_dime"
	description = "For those with a rich taste."
	taste_description = "Nothing." //Nothing
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 120

	glass_unique_appearance = TRUE
	glass_icon_state = "nickleanddime"
	glass_name = "Nickle And Dime"
	glass_desc = "For those with a rich taste."
	price_per_unit = 0.510 // a nickle, and a dime

/datum/reagent/ethanol/arcscrewdriver
	name = "Arc screwdriver"
	id = "arcscrewdriver"
	description = "For one a regular one doesn't cut it."
	taste_description = "electrooptic discussion"
	taste_tag = list(TASTE_SOUR, TASTE_SWEET)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 75

	glass_unique_appearance = TRUE
	glass_icon_state = "arcscrewdriver"
	glass_name = "Arc screwdriver"
	glass_desc = "For one a regular one doesn't cut it."
	price_per_unit = 0.2

/datum/reagent/ethanol/whiskey_rocks
	name = "Whiskey Rocks"
	id = "whiske_rocks"
	description = "Whiskey but for people that like things cold and watered down."
	taste_description = "cold classic"
	taste_tag = list(TASTE_SWEET, TASTE_LIGHT)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 23

	glass_unique_appearance = TRUE
	glass_icon_state = "noirbase"
	glass_name = "Whiskey Rocks"
	glass_desc = "Whiskey but for people that like things cold and watered down."
	price_per_unit = 0.2

/datum/reagent/ethanol/nior
	name = "Noir"
	id = "noir"
	description = "For when things aren't always black and white."
	taste_description = "a cold case"
	taste_tag = list(TASTE_SWEET, TASTE_BITTER)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 38 //.38 subnose if only!

	glass_unique_appearance = TRUE
	glass_icon_state = "noir"
	glass_name = "Noir"
	glass_desc = "For when things aren't always black and white."
	price_per_unit = 0.2

/datum/reagent/ethanol/duress
	name = "Duress"
	id = "duress"
	description = "A good way to get people talking."
	taste_description = "stunglove fibers"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 40 //Same amount as a stubbaton

	glass_unique_appearance = TRUE
	glass_icon_state = "buzzkill"
	glass_name = "Duress"
	glass_desc = "A good way to get people talking."
	price_per_unit = 0.2

/datum/reagent/ethanol/ocular
	name = "Ocular"
	id = "ocular"
	description = "Don't make eye contact, a favorite of the Mar qua."
	taste_description = "fresh mint and inspiration"
	taste_tag = list(TASTE_REFRESHING)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "Marquadrink"
	glass_name = "Ocular"
	glass_desc = "Don't make eye contact, a favorite of the Mar qua."
	price_per_unit = 0.2

/datum/reagent/ethanol/saint_pio
	name = "Saint Pio"
	id = "saint_pio"
	description = "An absolutely perfect choice."
	taste_description = "a crusade of flavors"
	taste_tag = list(TASTE_BITTER, TASTE_STRONG)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 50

	glass_unique_appearance = TRUE
	glass_icon_state = "saint_pio"
	glass_name = "Saint Pio"
	glass_desc = "An absolutely perfect choice."
	price_per_unit = 0.2

/datum/reagent/ethanol/rusty_special
	name = "Rusty Special"
	id = "rusty_special"
	description = "Both Barrels."
	taste_tag = list(TASTE_SWEET, TASTE_STRONG, TASTE_BITTER)
	taste_description = "pellets of iron dancing in smooth whiskey"
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 60

	glass_unique_appearance = TRUE
	glass_icon_state = "buckshot"
	glass_name = "Rusty Special"
	glass_desc = "Both Barrels."
	price_per_unit = 0.2

/datum/reagent/ethanol/western_escargot
	name = "Western Escargot"
	id = "western_escargot"
	description = "The kinda slugs a free man can appreciate."
	taste_description = "an explosion of flavors and a nice kick on its aftertaste"
	taste_tag = list(TASTE_STRONG, TASTE_BITTER, TASTE_SWEET)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 60

	glass_unique_appearance = TRUE
	glass_icon_state = "slug"
	glass_name = "Western Escargot"
	glass_desc = "The kinda slugs a free man can appreciate."
	price_per_unit = 0.2

/datum/reagent/ethanol/prospie
	name = "Prospie"
	id = "prospie"
	description = "Tastes how it looks, like it's namesake"
	taste_description = "a mix of blood sweets and tears."
	taste_tag = list(TASTE_SALTY, TASTE_SWEET)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 60

	glass_unique_appearance = TRUE
	glass_icon_state = "prospie"
	glass_name = "Prospie"
	glass_desc = "Tastes how it looks, like it's namesake."
	price_per_unit = 0.2

/datum/reagent/ethanol/friendlyfire
	name = "Friendly Fire"
	id = "friendlyfire"
	description = "Watch your back when you take a swig."
	taste_description = "002"
	taste_tag = list(TASTE_STRONG, TASTE_DRY)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 60

	glass_unique_appearance = TRUE
	glass_icon_state = "friendlyfire"
	glass_name = "Friendly Fire"
	glass_desc = "Watch your back when you take a swig."
	price_per_unit = 0.2

//Psionic drink
/datum/reagent/ethanol/witch_brew
	name = "Witches Brew"
	id = "witch_brew"
	description = "A long sit-mixed tonic that also happens to be ethanol based. The drink was made in the Soteria Research and Brewing Department to help psionics reach ballmer peak."
	taste_description = "wool of bat and eye of newt"
	taste_tag = list(TASTE_BUBBLY)
	color = "#E0CE8A" // rgb(88, 81, 54)
	strength = 30

	glass_unique_appearance = TRUE
	glass_icon_state = "witch_brew"
	glass_name = "Witches Brew"
	glass_desc = "A long sit-mixed tonic that also happens to be ethanol based. The drink was made in the Soteria Research and Brewing Department to help psionics reach ballmer peak."
	price_per_unit = 2

/datum/reagent/ethanol/witch_brew/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	var/mob/living/carbon/human/H = M
	var/obj/item/organ/internal/psionic_tumor/C = H.random_organ_by_process(BP_PSION)
	var/effective_dose = dose
	if(effective_dose >= 5 && H.random_organ_by_process(BP_PSION)) //We require 5 or more
		if(C.psi_points >= C.max_psi_points)
			return
		C.psi_points += 1
		dose -= 5


