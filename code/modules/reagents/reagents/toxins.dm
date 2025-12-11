/* Toxins, poisons, venoms */

/datum/reagent/toxin
	name = "toxin"
	id = "toxin"
	description = "A toxic chemical."
	taste_description = "bitterness"
	taste_mult = 1.2
	reagent_state = LIQUID
	color = "#CF3600"
	metabolism = REM * 0.05 // 0.01 by default. They last a while and slowly kill you.
	var/sanityloss = 0
	var/strength = 1		// Base CE_TOXIN magnitude, multiplied by effect multiplier
	reagent_type = "Toxin"
	scannable = TRUE
	nerve_system_accumulations = 35 //Baseline toxin is going to heck you up

/datum/reagent/toxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(strength)
		//var/multi = effect_multiplier
		/*if(issmall(M))  // Small bodymass, more effect from lower volume.
			multi *= 2
		M.adjustToxLoss(strength * multi)
		if(sanityloss && ishuman(M))
			var/mob/living/carbon/human/H = M
			H.sanity.onToxin(src, effect_multiplier)
			M.sanity.onToxin(src, multi)*/
		M.add_chemical_effect(CE_TOXIN, strength + dose / 2)

/datum/reagent/toxin/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(strength)
		M.add_chemical_effect(CE_TOXIN, strength + dose / 3)

/datum/reagent/toxin/overdose(mob/living/carbon/M, alien)
	if(strength)
		M.add_chemical_effect(CE_TOXIN, strength * dose / 4)

/datum/reagent/toxin/wormwood
	name = "Wormwood"
	id = "wormwood"
	description = "A mild toxin created as a reaction to the Soul Hunger litany that feeds Absolutists. Can be removed by drinking Cahors."
	appear_in_default_catalog = FALSE
	overdose = REAGENTS_OVERDOSE
	metabolism = REM * 2
	strength = 2


/datum/reagent/toxin/wormwood/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_TOXIN, strength + dose / 2)
	M.add_chemical_effect(CE_SLOWDOWN, 0.75)

/datum/reagent/toxin/plasticide
	name = "Plasticide"
	id = "plasticide"
	description = "Liquid plastic used in creation of plastic sheets."
	taste_description = "plastic"
	reagent_state = LIQUID
	color = "#CF3600"
	strength = 6
	nerve_system_accumulations = 45 //Plastic in blood or stomic is going to make you rather sick

/datum/reagent/toxin/oil
	name = "Oil"
	id = "oil"
	description = "Crude oil, somehow connected to frequent invasions."
	taste_description = "money"
	reagent_state = LIQUID
	color = "#0C0C0C"
	common = TRUE //Identifiable on sight
	nerve_system_accumulations = 15

/datum/reagent/toxin/amatoxin
	name = "Amatoxin"
	id = "amatoxin"
	description = "A powerful poison derived from certain species of mushroom."
	taste_description = "mushroom"
	reagent_state = LIQUID
	color = "#792300"
	strength = 1
	metabolism = REM * 0.1 // Make it not last forever
	nerve_system_accumulations = 60
	heating_point = 523
	heating_products = list("toxin")

/datum/reagent/toxin/carpotoxin
	name = "Carpotoxin"
	id = "carpotoxin"
	description = "A deadly neurotoxin produced by the dreaded space carp."
	taste_description = "fish"
	reagent_state = LIQUID
	color = "#003333"
	strength = 1
	overdose = REAGENTS_OVERDOSE/3
	addiction_chance = 10
	nerve_system_accumulations = 45 //Bad suishie
	heating_point = 523
	heating_products = list("toxin")
	reagent_type = "Toxin/Stimulator"

/datum/reagent/toxin/carpotoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.stats.addTempStat(STAT_VIG, STAT_LEVEL_BASIC, STIM_TIME, "carpotoxin")

/datum/reagent/toxin/carpotoxin/withdrawal_act(mob/living/carbon/M)
	M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_BASIC, STIM_TIME, "carpotoxin_w")
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "carpotoxin_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "carpotoxin_w")

/datum/reagent/toxin/carpotoxin/overdose(mob/living/carbon/M, alien)
	if(prob(80))
		M.adjustBrainLoss(2)
	if(strength)
		if(issmall(M))
			M.add_chemical_effect(CE_TOXIN, strength)
		else
			M.add_chemical_effect(CE_TOXIN, strength)

/datum/reagent/toxin/carpotoxin/gland
	name = "Carpotoxin Gland Mince"
	id = "carpogland-mince"
	description = "A mince made by grinding the fang and gland of particularly large carp with poppy seeds."
	taste_description = "fish and bits of teeth"
	reagent_state = SOLID
	color = "#6C8681"
	strength = 2
	heating_point = 365
	heating_products = list("toxin","protein", "concentrated-carpotoxin")

/datum/reagent/toxin/carpotoxin/concentrated
	name = "Conccentrated Carpotoxin"
	id = "concentrated-carpotoxin"
	description = "A deadly neurotoxin produced by the dreaded space carp. This sample appears particularly vibrant and has poppy seeds throughout. Smells like a swift death."
	taste_description = "acrid lakewater"
	reagent_state = LIQUID
	strength = 6
	color = "#016363"

///datum/reagent/toxin/blattedin is defined in blattedin.dm

/datum/reagent/toxin/plasma
	name = "Plasma"
	id = "plasma"
	description = "Plasma in its liquid form."
	taste_mult = 1.5
	reagent_state = LIQUID
	color = "#9D14DB"
	strength = 3
	touch_met = 5
	nerve_system_accumulations = 75 //Burning your insides

/datum/reagent/toxin/plasma/touch_mob(mob/living/L, var/amount)
	if(istype(L))
		L.adjust_fire_stacks(amount / 5)

/datum/reagent/toxin/plasma/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(M.species?.reagent_tag == IS_SLIME)
		return
	else
		M.take_organ_damage(0, effect_multiplier * 0.1) //being splashed directly with plasma causes minor chemical burns
	if(prob(50))
		M.pl_effects()

/datum/reagent/toxin/plasma/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(strength)
		if(M.species?.reagent_tag == IS_SLIME)
			M.adjustNutrition(strength)
			return
		if(ishuman(M))
			..()
			var/mob/living/carbon/human/H = M
			var/obj/item/organ/internal/kidney/K = H.random_organ_by_process(OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT)
			var/obj/item/organ/internal/liver/L = H.random_organ_by_process(OP_LIVER)
			M.add_chemical_effect(CE_TOXIN, 5 * dose) //very bad.
			if(prob(3 * dose))
				create_overdose_wound(K, M, /datum/component/internal_wound/organic/heavy_poisoning/plasma, "plasma poisoning")
			else if(prob(3 * dose))
				create_overdose_wound(L, M, /datum/component/internal_wound/organic/heavy_poisoning/plasma, "plasma poisoning")

/datum/reagent/toxin/plasma/touch_turf(turf/simulated/T)
	if(!istype(T))
		return
	T.assume_gas("plasma", volume, T20C)
	remove_self(volume)
	return TRUE

/datum/reagent/toxin/plasma/on_mob_add(mob/living/carbon/human/L)
	. = ..()
	var/mob/living/carbon/human/H = L
	if(ishuman(H))
		if((L.species.name == SPECIES_SLIME) && (L.stat == DEAD))
			GLOB.dead_mob_list.Remove(L)
			if((L in GLOB.living_mob_list) || (L in GLOB.dead_mob_list))
				WARNING("Mob [L] was Adenosine+ but already in the living or dead list still!")
			GLOB.living_mob_list += L

			L.timeofdeath = 0
			L.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
			L.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

			//Stablizating
			L.heal_organ_damage(30, 30)
			L.adjustOxyLoss(-50)
			L.stats.addPerk(PERK_SLIMEREZ) //When revived this way we get a nasty rez sickness that affects physical stats and dam-mod, but gives us more rob for a limited time.

			L.custom_emote(2, "vibrates and wobbles, electricity momentarily visible within their transluscent flesh.")
			L.Weaken(rand(10,25))
			L.updatehealth()
			//holder.remove_reagent("plasma", 30)
			return
		else
			return

/datum/reagent/toxin/cyanide //Fast and Lethal
	name = "Cyanide"
	id = "cyanide"
	description = "A highly toxic chemical that prevents cellular respiration as it builds up. Has uses in helping treating nerve system overstimulation"
	taste_mult = 0.6
	reagent_state = LIQUID
	color = "#CF3600"
	strength = 2
	metabolism = REM/4 //0.05 Cyanide lasts within one day but duh...

/datum/reagent/toxin/cyanide/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/organ/internal/vital/heart/S = H.random_organ_by_process(OP_HEART)
	var/obj/item/organ/internal/vital/lungs/O = H.random_organ_by_process(OP_LUNGS)
	if(prob(20))
		M.hallucination(50 * effect_multiplier, 50 * effect_multiplier)
		M.AdjustSleeping(20)
	if(istype(O)) //STAGE 1: CRUSH LUNGS
		create_overdose_wound(O, M, /datum/component/internal_wound/organic/heavy_poisoning, "accumulation")
		M.adjustOxyLoss(5)
	if(istype(S) && (!istype(O) || (O.status & ORGAN_DEAD))) //STAGE 2: NO LUNGS? FUCK YOUR HEART
		create_overdose_wound(S, M, /datum/component/internal_wound/organic/heavy_poisoning, "accumulation")
		M.adjustHalLoss(20)
		M.vomit()

/datum/reagent/toxin/potassium_chloride
	name = "Potassium Chloride"
	id = "potassium_chloride"
	description = "A delicious salt that arrests the heart if injected there."
	taste_description = "salt"
	reagent_state = SOLID
	color = "#FFFFFF"
	strength = 0
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 45

/datum/reagent/toxin/potassium_chloride/overdose(mob/living/carbon/M, alien)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, H.losebreath - 10)
			H.adjustOxyLoss(2)
			H.Weaken(10)
		M.add_chemical_effect(CE_NOPULSE, 1)


/datum/reagent/toxin/potassium_chlorophoride
	name = "Potassium Chlorophoride"
	id = "potassium_chlorophoride"
	description = "A specific chemical based on Potassium Chloride to arrest the heart for surgery."
	taste_description = "salt"
	reagent_state = SOLID
	color = "#FFFFFF"
	strength = 1
	overdose = 20
	nerve_system_accumulations = 85

/datum/reagent/toxin/potassium_chlorophoride/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, M.losebreath-10)
			H.adjustOxyLoss(2)
			H.Weaken(10)
		M.add_chemical_effect(CE_NOPULSE, 1)

/datum/reagent/toxin/zombiepowder
	name = "Zombie Powder"
	id = "zombiepowder"
	description = "A strong neurotoxin that puts the subject into a death-like state. Will fool most medical tests. Very weakly toxic but de-oxygenates the body the longer it's present, potentially causing long-term damage if left too long."
	taste_description = "death"
	reagent_state = SOLID
	color = "#669900"
	metabolism = REM
	strength = 0.4
	illegal = TRUE
	nerve_system_accumulations = -50

/datum/reagent/toxin/zombiepowder/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(dose > 1)
		M.status_flags |= FAKEDEATH
		M.adjustOxyLoss(0.6 * effect_multiplier)
		M.Weaken(10)
		M.silent = max(M.silent, 10)
		M.tod = world.time
		M.add_chemical_effect(CE_NOPULSE, 1)

/datum/reagent/toxin/zombiepowder/Destroy()
	if(holder && holder.my_atom && ismob(holder.my_atom))
		var/mob/M = holder.my_atom
		M.status_flags &= ~FAKEDEATH
	. = ..()

/datum/reagent/toxin/fertilizer //Reagents used for plant fertilizers.
	name = "fertilizer"
	id = "fertilizer"
	description = "A chemical mix good for growing plants with."
	taste_description = "plant food"
	taste_mult = 0.5
	reagent_state = LIQUID
	strength = 0.1 // It's not THAT poisonous.
	color = "#664330"
	common = TRUE
	nerve_system_accumulations = 30

/datum/reagent/toxin/fertilizer/eznutrient
	name = "EZ Nutrient"
	id = "eznutrient"

/datum/reagent/toxin/fertilizer/left4zed
	name = "Left-4-Zed"
	id = "left4zed"

/datum/reagent/toxin/fertilizer/robustharvest
	name = "Robust Harvest"
	id = "robustharvest"
	nerve_system_accumulations = 10

/datum/reagent/toxin/plantbgone
	name = "Plant-B-Gone"
	id = "plantbgone"
	description = "Polytrinic acid is an extremely corrosive chemical substance. Can be used to destroy objects."
	taste_mult = 1
	reagent_state = LIQUID
	color = "#49002E"
	strength = 0.4
	nerve_system_accumulations = 25

/datum/reagent/toxin/plantbgone/touch_turf(turf/T)
	if(istype(T, /turf/simulated/wall))
		var/turf/simulated/wall/W = T
		if(locate(/obj/effect/overlay/wallrot) in W)
			for(var/obj/effect/overlay/wallrot/E in W)
				qdel(E)
			W.visible_message(SPAN_NOTICE("The fungi are completely dissolved by the solution!"))
	return TRUE

/datum/reagent/toxin/plantbgone/touch_obj(obj/O, var/volume)
	if(istype(O, /obj/effect/plant) && !istype(O, /obj/effect/plant/hivemind))
		qdel(O)
	if(istype(O, /obj/machinery/portable_atmospherics/hydroponics))
		var/obj/machinery/portable_atmospherics/hydroponics/T = O
		T.seed = null
		T.weedlevel = 0
		T.pestlevel = 0
		T.update_icon()
		return

/datum/reagent/acid/polyacid
	name = "Polytrinic acid"
	id = "pacid"
	description = "Polytrinic acid is an extremely corrosive chemical substance."
	taste_description = "acid"
	reagent_state = LIQUID
	color = "#8E18A9"
	power = 10
	meltdose = 4
	metabolism = REM * 2 //should neutralize reasonably fast in your blood if you want it more accurate to reality I can add some metabolites at some point for acids which are usually salts you do not want in your body either
	illegal = TRUE
	nerve_system_accumulations = 85

/datum/reagent/acid/polyacid/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(1 * effect_multiplier) //acidic vapors should fuck lungs especially if its probably just trekkified antimony pentafluoride
	M.adjustFireLoss(3 * effect_multiplier) //burns you up rapidly
	M.take_organ_damage(0.2 * effect_multiplier, 0) //fucks your organs but not as much as dedicated cytotoxins like Lexorin
	if(prob(5))
		to_chat(M, SPAN_DANGER("YOUR INSIDES ARE MELTING!!!")) //last but not least tells somebody they got hit by polytrinic

/datum/reagent/toxin/lexorin
	name = "Lexorin"
	id = "lexorin"
	description = "Lexorin temporarily stops respiration. Causes tissue damage."
	taste_description = "acid"
	reagent_state = LIQUID
	color = "#C8A5DC"
	metabolism = REM * 2.5
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = 30

/datum/reagent/toxin/lexorin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.take_organ_damage(0.3 * effect_multiplier, 0)
	if(M.losebreath < 15)
		M.losebreath++

/datum/reagent/toxin/mutagen
	name = "Unstable mutagen"
	id = "mutagen"
	description = "Causes random, uncontrolled mutations with a chance to mildly irradiate the victim and dealing mild toxin damage."
	taste_description = "slime"
	taste_mult = 0.9
	reagent_state = LIQUID
	color = "#13BC5E"
	nerve_system_accumulations = 70

/datum/reagent/toxin/mutagen/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	if(prob(33))
		affect_blood(M, alien, effect_multiplier)

/datum/reagent/toxin/mutagen/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	if(prob(67))
		affect_blood(M, alien, effect_multiplier)

/datum/reagent/toxin/mutagen/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.flags & NO_SCAN)
			return
	if(M.dna)
		if(prob(effect_multiplier * 0.01)) // Approx. one mutation per 10 injected/20 ingested/30 touching units
			randmuti(M)
			if(prob(98))
				randmutb(M)
			else
				randmutg(M)
			domutcheck(M, null)
			M.UpdateAppearance()
	M.apply_effect(1 * effect_multiplier, IRRADIATE, 0)

/datum/reagent/toxin/slimejelly
	name = "Slime Jelly"
	id = "slimejelly"
	description = "A gooey semi-liquid produced from one of the deadliest lifeforms in existence."
	taste_description = "slime"
	taste_mult = 1.3
	reagent_state = LIQUID
	color = "#801E28"
	illegal = TRUE
	nerve_system_accumulations = 90

/datum/reagent/medicine/slimejelly/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(prob(10))
		to_chat(M, SPAN_DANGER("Your insides are burning!"))
		M.add_chemical_effect(CE_TOXIN, rand(10, 30) * effect_multiplier)
	else if(prob(40))
		M.heal_organ_damage(2.5 * effect_multiplier, 0)

/datum/reagent/medicine/pureslimejelly
	name = "Pure Slime Jelly"
	id = "pureslimejelly"
	description = "A advanced version of slime jelly. Naturally made from certain slimes."
	taste_description = "soft and warm slime"
	taste_mult = 1.3
	reagent_state = LIQUID
	color = "#801E28"
	illegal = TRUE
	nerve_system_accumulations = 0

/datum/reagent/medicine/pureslimejelly/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustToxLoss(rand(15,20) * effect_multiplier)
	to_chat(M, SPAN_DANGER("slime gushes from your mouth."))
	M.vomit()
	var/mob/living/carbon/slime/S = new /mob/living/carbon/slime
	S.loc = M.loc
	holder.remove_reagent("pureslimejelly", 30)

/datum/reagent/medicine/soporific
	name = "Soporific"
	id = "stoxin"
	description = "An effective hypnotic used to treat insomnia. As well as nerve system overstimulation. Not toxic. Combine with a small amount of Chloral Hydrate for increased effect."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#009CA8"
	metabolism = REM * 5
	overdose = REAGENTS_OVERDOSE
	nerve_system_accumulations = -50

/datum/reagent/medicine/soporific/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	var/effective_dose = dose
	if(issmall(M))
		effective_dose *= 2

	if(effective_dose < 1)
		if(effective_dose == metabolism * 2 || prob(5))
			M.emote("yawn")
	else if(effective_dose < 1.5)
		M.eye_blurry = max(M.eye_blurry, 10)
	else if(effective_dose < 5)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/medicine/chloralhydrate
	name = "Chloral Hydrate"
	id = "chloralhydrate"
	description = "A powerful sedative that will quickly knock out an individual. Will cause toxic build-up if left in the system for too long."
	taste_description = "bitterness"
	reagent_state = SOLID
	color = "#000067"
	metabolism = REM * 5
	overdose = REAGENTS_OVERDOSE * 0.5
	illegal = TRUE
	nerve_system_accumulations = -90

/datum/reagent/medicine/chloralhydrate/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	var/effective_dose = dose
	if(issmall(M))
		effective_dose *= 2

	if(effective_dose == metabolism)
		M.confused += 2
		M.drowsyness += 2
	else if(effective_dose < 2)
		M.Weaken(30)
		M.eye_blurry = max(M.eye_blurry, 10)
	else
		M.sleeping = max(M.sleeping, 30)

	if(effective_dose > 1)
		M.add_chemical_effect(CE_TOXIN, effect_multiplier)

/datum/reagent/medicine/chloralhydrate/beer2 //disguised as normal beer for use by emagged brobots
	name = "Beer"
	id = "beer2"
	description = "An alcoholic beverage made from malted grains, hops, yeast, and water. The fermentation appears to be incomplete." //If the players manage to analyze this, they deserve to know something is wrong.
	taste_description = "shitty piss water"
	reagent_state = LIQUID
	color = "#664300"

	glass_icon_state = "beerglass"
	glass_name = "beer"
	glass_desc = "A freezing pint of beer"
	glass_center_of_mass = list("x"=16, "y"=8)
	common = TRUE //So people mistakenly believe it is, in fact, beer.

/* Transformations */
/* With the reimplimentation of slime people as a cogent thing, I'm commenting these out for now. Perhaps later we'll do something with this.
/datum/reagent/toxin/slimetoxin
	name = "Mutation Toxin"
	id = "mutationtoxin"
	description = "A corruptive toxin produced by slimes."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#13BC5E"
	nerve_system_accumulations = 50

/datum/reagent/toxin/slimetoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.name != "Aulvae")
			to_chat(M, SPAN_DANGER("Your flesh rapidly mutates!"))
			H.set_species("Aulvae")

//Erismed 4 ver of this chem. Kept in the event we ever *get* slimepeople, leaving as original for now.
		if(H.species.name != SPECIES_SLIME && !H.isSynthetic()) //cannot transform if already a slime perosn or lack flesh to transform
			if(istype(H.get_core_implant(), /obj/item/implant/core_implant/cruciform))
				H.gib() //Deus saves
			else
				to_chat(M, SPAN_DANGER("Your flesh rapidly mutates!"))
				for(var/obj/item/W in H) //Check all items on the person
					if(istype(W, /obj/item/organ/external/robotic) || istype(W, /obj/item/implant)) //drop prosthetic limbs and implants, you are a slime now.
						W.dropped()
				H.set_species(SPECIES_SLIME)


/datum/reagent/toxin/aslimetoxin
	name = "Advanced Mutation Toxin"
	id = "amutationtoxin"
	description = "An advanced corruptive toxin produced by slimes."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#13BC5E"
	nerve_system_accumulations = 0

/datum/reagent/toxin/aslimetoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier) // TODO: check if there's similar code anywhere else
	var/cruciformed = FALSE
	var/prosthetic = FALSE
	var/mob/living/carbon/human/MH
	if(istype(M, /mob/living/carbon/human)) //If it is human cast to human type for human procs
		MH = M
		prosthetic = MH.isSynthetic()
	if(HAS_TRANSFORMATION_MOVEMENT_HANDLER(M))
		return
	if(!prosthetic) //Check if is not FBP
		to_chat(M, SPAN_DANGER("Your flesh rapidly mutates!"))
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(M)
		M.canmove = 0
		M.icon = null
		M.cut_overlays()
		M.invisibility = 101
		for(var/obj/item/W in M) //for every item in a entity including internal components and inventory
			if(istype(W, /obj/item/implant) || istype(W, /obj/item/organ/external/robotic))  //Check if item is implant or prosthetic
				if(istype(W, /obj/item/implant/core_implant/cruciform)) //If cruciform is present victim is gibbed instead of transformed
					cruciformed = TRUE
				W.dropped() //use the baseline dropped()
				continue
			W.layer = initial(W.layer)
			W.loc = M.loc
			W.dropped(M)
		if(!cruciformed) //If not cruciformed, get slimed
			var/mob/living/carbon/slime/new_mob = new /mob/living/carbon/slime(M.loc)
			new_mob.a_intent = "hurt"
			new_mob.universal_speak = 1
			if(M.mind)
				M.mind.transfer_to(new_mob)
			else
				new_mob.key = M.key
			qdel(M)
		else //if victim was cruciformed, gib the body instead of creating a slime. Deus saves
			M.gib()
	else
		new_mob.key = M.key
	qdel(M)
		MH.vomit() //Otherwise the toxin spams as the body attempts to process it. Gets it out of the system quickly and we can stop trying to process this.

/datum/reagent/other/xenomicrobes
	name = "Xenomicrobes"
	id = "xenomicrobes"
	description = "Microbes with an entirely alien cellular structure."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#535E66"
*/

/datum/reagent/toxin/pararein
	name = "Pararein"
	id = "pararein"
	description = "Venom used by spiders."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#a37d9c"
	overdose = REAGENTS_OVERDOSE/3
	addiction_chance = 0.01 //Will STILL likely always be addicting
	nerve_system_accumulations = 15
	metabolism = REM * 0.2 //back to old
	strength = 3
	heating_point = 523
	heating_products = list("toxin")

/datum/reagent/toxin/pararein/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_BASIC * effect_multiplier, STIM_TIME, "pararein")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC * effect_multiplier, STIM_TIME, "pararein")
	M.stats.addTempStat(STAT_COG, STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "pararein")

/datum/reagent/toxin/aranecolmin
	name = "Aranecolmin"
	id = "aranecolmin"
	description = "Weak antitoxin used by warrior spiders. Speeds up metabolism immensely."
	taste_description = "sludge"
	reagent_state = LIQUID
	color = "#acc107"
	overdose = REAGENTS_OVERDOSE
	addiction_chance = 10
	nerve_system_accumulations = 15
	strength = 1

/datum/reagent/toxin/aranecolmin/on_mob_add(mob/living/L)
	. = ..()
	if(iscarbon(L))
		var/mob/living/carbon/C = L
		if(LAZYLEN(C.internal_organs) && C.bloodstr && C.bloodstr.has_reagent("pararein"))
			var/obj/item/organ/internal/I = pick(C.internal_organs)
			to_chat(C, "Something burns inside your [I.parent.name]...")
			create_overdose_wound(I, C, /datum/component/internal_wound/organic/heavy_poisoning, "rot", TRUE)

/datum/reagent/toxin/aranecolmin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.add_chemical_effect(CE_PAINKILLER, 15)


/datum/reagent/toxin/biomatter
	name = "Biomatter"
	id = "biomatter"
	description = "A goo of unknown to you origin. Its better to stay that way."
	taste_description = "vomit"
	reagent_state = LIQUID
	color = "#527f4f"
	strength = 0.25
	common = TRUE //Church should know if they actually have biomatter or something else.
	nerve_system_accumulations = 50

/datum/reagent/toxin/biomatter/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	M.take_organ_damage(0, effect_multiplier * strength)

/datum/reagent/toxin/biomatter/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(prob(10 - (5 * M.stats.getMult(STAT_TGH))))
		M.vomit()

/datum/reagent/toxin/biomatter/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(prob(5 - (4 * M.stats.getMult(STAT_TGH))))
		M.vomit()

/datum/reagent/toxin/biomatter/touch_turf(turf/T)
	if(volume >= 5)
		if(volume >= 45)
			spill_biomass(T, alldirs)
		else if(volume >= 25)
			spill_biomass(T, cardinal)
		else
			spill_biomass(T)
		remove_self(volume)
		return TRUE

/datum/reagent/toxin/xenotoxin
	name = "Xenomorph Toxin"
	id = "xenotoxin"
	description = "A highly toxic chemical that causes a complete neural weakening of the body in both mind and muscle."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#ffb3b7"
	nerve_system_accumulations = 30
	addiction_chance = 10
	scannable = TRUE
	metabolism = REM/4
	constant_metabolism = TRUE

/datum/reagent/toxin/xenotoxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")
	M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")
	M.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")
	M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_ADEPT * effect_multiplier, STIM_TIME, "xeno_toxin")

/datum/reagent/toxin/xenotoxin/withdrawal_act(mob/living/carbon/M)
	M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	M.stats.addTempStat(STAT_COG, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "xeno_toxin_w")
	if(prob(25 - (5 * M.stats.getMult(STAT_TGH))))
		M.shake_animation(8)

/datum/reagent/toxin/xenotoxin/overdose(mob/living/carbon/M, alien)
	M.adjustBrainLoss(2)
	M.slurring = max(M.slurring, 30)
	if(prob(5))
		M.vomit()

/datum/reagent/toxin/combat
	name = "Tetraricide"
	id = "chemweapon1"
	description = "A powerful chemical weapon, sometimes referred to as \"Sweet Death\". Only absolute psychopaths and REALLY desperate mercenaries utilize this chemical."
	taste_description = "sweetness"
	reagent_state = LIQUID
	strength = 0.8
	overdose = REAGENTS_OVERDOSE/2
	illegal = TRUE
	nerve_system_accumulations = 90

/datum/reagent/toxin/combat/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(M.losebreath < 15)
		M.losebreath++
	M.apply_damages(0,0,0,1.5,0,20)				//Asphyxia and pain
	if(prob(5 - (4 * M.stats.getMult(STAT_TGH))))
		M.vomit()

/datum/reagent/toxin/combat/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(M.losebreath < 15)
		M.losebreath++
	M.apply_damages(0,0,0,0.5,0,20)				//Asphyxia and pain
	if(prob(5 - (5 * M.stats.getMult(STAT_TGH))))
		M.vomit()

/datum/reagent/toxin/combat/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(M.losebreath < 15)
		M.losebreath++
	M.apply_damages(0,0,0,2.5,0,10)				//Asphyxia and pain
	if(prob(5 - (4 * M.stats.getMult(STAT_TGH))))
		M.vomit()

/datum/reagent/toxin/combat/overdose(mob/living/carbon/M, alien)
	..()
	M.adjustHalLoss(20)
	M.adjustOxyLoss(5)

/datum/reagent/toxin/combat/touch_mob(mob/living/L, amount)
	if(istype(L))
		L.adjustHalLoss(50)
		L.adjustToxLoss(20)


//Wasp toxin
/datum/reagent/toxin/wasp_toxin
	name = "Wasp Inflamer"
	id = "wasp_toxin"
	description = "A toxin that paralizes its victims through pain."
	taste_mult = 0.6
	reagent_state = LIQUID
	color = "#CF3600"
	strength = 0.2
	metabolism = REM * 2
	nerve_system_accumulations = 30
	var/agony_amount = 4

/datum/reagent/toxin/wasp_toxin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if((H.species.flags & NO_PAIN) || (PAIN_LESS in H.mutations))
			return

		M.apply_effect(agony_amount, HALLOSS, 0)
		if(prob(5))
			to_chat(M, SPAN_DANGER("You feel like your insides are burning!"))

/datum/reagent/toxin/boron
	name = "Boron"
	id = "boron"
	description = "A toxic metalloid element."
	taste_description = "bitterness"
	reagent_state = SOLID
	color = "#8B4513"
	strength = 2
	metabolism = REM * 0.75
	nerve_system_accumulations = 40

/datum/reagent/toxin/boron/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(prob(10))
		M.adjustBrainLoss(1)

/datum/reagent/toxin/bromide
	name = "Bromide"
	id = "bromide"
	description = "A toxic halogen compound."
	taste_description = "bitter chemical"
	reagent_state = LIQUID
	color = "#8B0000"
	strength = 2
	nerve_system_accumulations = 35

/datum/reagent/toxin/bromide/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(prob(15))
		M.confused = max(M.confused, 3)

/datum/reagent/toxin/methyl_bromide
	name = "Methyl Bromide"
	id = "methyl_bromide"
	description = "A highly toxic pesticide gas."
	taste_description = "acrid chemical"
	reagent_state = GAS
	color = "#FF6347"
	strength = 3
	metabolism = REM * 0.5
	nerve_system_accumulations = 50

/datum/reagent/toxin/methyl_bromide/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	if(prob(20))
		var/datum/gas_mixture/environment = M.loc.return_air()
		if(environment)
			environment.adjust_gas(GAS_METHYL_BROMIDE, volume * 0.1)

/datum/reagent/toxin/chlorine
	name = "Chlorine"
	id = "chlorine"
	description = "A toxic halogen gas that causes severe organ damage throughout the body."
	taste_description = "bleach"
	reagent_state = GAS
	color = "#C5F72D"
	overdose = 5 // really, really bad
	strength = 4 // Increased base toxicity
	metabolism = REM * 0.75
	nerve_system_accumulations = 80 // Increased nerve damage

/datum/reagent/toxin/chlorine/affect_ingest(mob/living/carbon/M, alien, effect_multiplier)
	// When ingested, chlorine still causes severe damage but slightly reduced
	affect_blood(M, alien, effect_multiplier * 0.9) // 90% effectiveness when ingested

/datum/reagent/toxin/chlorine/affect_touch(mob/living/carbon/M, alien, effect_multiplier)
	// When touching skin, chlorine causes chemical burns and absorbs into bloodstream
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		// Direct skin damage from chemical burns
		for(var/obj/item/organ/external/E in H.organs)
			if(E && !BP_IS_ROBOTIC(E))
				E.take_damage(1 * effect_multiplier, BURN) // Chemical burns on skin
				if(prob(15 * effect_multiplier))
					to_chat(H, SPAN_DANGER("Your [E.name] burns from chlorine exposure!"))
	
	// Some chlorine absorbs through skin into bloodstream (reduced effectiveness)
	affect_blood(M, alien, effect_multiplier * 0.3) // 30% absorption through skin

/datum/reagent/toxin/chlorine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	..()
	// Chlorine causes massive organ damage to all organs
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		
		// Damage all internal organs severely
		for(var/obj/item/organ/internal/I in H.internal_organs)
			if(I && !BP_IS_ROBOTIC(I)) // Don't damage robotic organs
				I.take_damage(5 * effect_multiplier)
				if(prob(20 * effect_multiplier))
					to_chat(H, SPAN_DANGER("You feel a burning sensation in your [I.name]!"))
		
		// Also damage external organs (skin, muscle tissue)
		for(var/obj/item/organ/external/E in H.organs)
			if(E && !BP_IS_ROBOTIC(E))
				E.take_damage(2 * effect_multiplier, BRUTE) // Both brute and burn damage
				E.take_damage(1 * effect_multiplier, BURN) // Both brute and burn damage
	
	// Release chlorine gas into environment
	if(prob(15))
		var/datum/gas_mixture/environment = M.loc.return_air()
		if(environment)
			environment.adjust_gas(GAS_CHLORINE, volume * 0.1)
