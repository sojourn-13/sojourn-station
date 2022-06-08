/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	layer = TURF_DECAL_LAYER
	anchored = TRUE
	random_rotation = 0
	var/is_rune = FALSE

/obj/effect/decal/cleanable/crayon/New(location,main = "#FFFFFF",shade = "#000000",var/type = "rune")
	..()
	loc = location

	name = type
	desc = "A [type] drawn in crayon."

	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
			is_rune = TRUE
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s",2.1)

	mainOverlay.Blend(main,ICON_ADD)
	shadeOverlay.Blend(shade,ICON_ADD)

	add_overlay(mainOverlay)
	add_overlay(shadeOverlay)

	add_hiddenprint(usr)

/obj/effect/decal/cleanable/crayon/attackby(obj/item/I, mob/living/carbon/human/M)
	..()
	if(istype(I, /obj/item/oddity/common/book_unholy) || istype(I, /obj/item/oddity/common/book_omega))
		if(M.disabilities&NEARSIGHTED && is_rune && M.species?.reagent_tag != IS_SYNTHETIC)

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>You try to do as the book wrights but the failing body prevents you form even mubbling a single more word.</span>")
				return

			var/datum/reagent/organic/blood/B = M.get_blood()
			var/candle_amount = 0
			to_chat(M, "<span class='info'>The wrightings inside the book and the rune drawn match up.</span>")
			for(var/obj/item/flame/candle/mage_candle in oview(3))
				if(!mage_candle.lit)
					mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
					mage_candle.endless_burn = TRUE
					B.remove_self(15)
					to_chat(M, "<span class='info'>Something lights a candle.</span>")
				candle_amount += 1

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) //Dont forget to clear your old work
				if(spell.message == "Babel." && candle_amount >= 3)
					babel_spell(M)
					continue

				if(spell.message == "Ignorance." && candle_amount >= 1)
					ignorance_spell(M)
					continue

				if(spell.message == "Flux." && candle_amount >= 1)
					flux_spell(M)
					continue

				if(spell.message == "Negentropy." && candle_amount >= 1)
					negentropy_spell(M)
					continue

				if(spell.message == "Life." && candle_amount >= 5)
					life_spell(M)
					continue

				if((spell.message == "Madness." || spell.message == "Sanity.") && candle_amount >= 3)
					madness_spell(M)
					continue

				if(spell.message == "Sight." && candle_amount >= 3)
					sight_spell(M)
					continue

				if(spell.message == "Paradox." && candle_amount >= 7)
					paradox_spell(M)
					continue

				if((spell.message == "The End." || spell.message == "The Beginning.") && candle_amount >= 1)
					end_spell(M)
					continue
			return

	if(istype(I, /obj/item/tool/knife/ritual) || istype(I, /obj/item/tool/knife/neotritual))
		if(M.disabilities&NEARSIGHTED && is_rune && M.species?.reagent_tag != IS_SYNTHETIC)

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>Your hand shakes to much as your body fails you to do anything of value here.</span>")
				return
		to_chat(M, "<span class='info'>The writings of the rune are correct.</span>")
		var/able_to_cast = FALSE
		for(var/datum/language/L in M.languages)
			if(L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT)
				able_to_cast = TRUE // We can cast

		var/datum/reagent/organic/blood/B = M.get_blood()
		var/candle_amount = 0
		for(var/obj/item/flame/candle/mage_candle in oview(3))
			if(!mage_candle.lit)
				mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
				mage_candle.endless_burn = TRUE
				B.remove_self(15)
				to_chat(M, "<span class='info'>Something lights a candle.</span>")
			candle_amount += 1

		for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) //Dont forget to clear your old work
			if(spell.message == "Voice." && candle_amount >= 3)
				voice_spell(M)
				continue

			if(spell.message == "Drain." && candle_amount >= 5)
				drain_spell(M, able_to_cast)
				continue
			return
		return
	return

/obj/effect/decal/cleanable/crayon/proc/babel_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_CULT)
	to_chat(M, "<span class='info'>Your head feels heavy with unknown knowledge and your heart start to raise with shock of blood loss.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	return

/obj/effect/decal/cleanable/crayon/proc/ignorance_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.psi_blocking_additive = 50
	to_chat(M, "<span class='info'>The top of your head acks in pain and feels heavy as your blood runs thin.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(50)
	return

/obj/effect/decal/cleanable/crayon/proc/life_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1)) // Must be on the spell circle
		if(M.maxHealth > 30)
			to_chat(M, "<span class='info'>To raise the dead one must use the self, and in the self we draw closer to death...</span>")
			greater.revive()
			greater.colony_friend = TRUE
			greater.friendly_to_colony = TRUE
			greater.friends += M
			greater.faction = "Living Dead"
			greater.maxHealth *= 0.5
			greater.health *= 0.5
			M.maxHealth -= 25
			M.health -= 25
			B.remove_self(70)
			return
		return

	for(var/mob/living/simple_animal/lesser in oview(1)) // Must be on the spell circle
		if(M.maxHealth > 30)
			to_chat(M, "<span class='info'>To raise the dead one must use the self, and in the self we draw closer to death...</span>")
			lesser.revive()
			lesser.colony_friend = TRUE
			lesser.friendly_to_colony = TRUE
			lesser.faction = "Living Dead"
			lesser.maxHealth *= 0.5
			lesser.health *= 0.5
			M.maxHealth -= 25
			M.health -= 25
			B.remove_self(50)
			return
		return
	return

/obj/effect/decal/cleanable/crayon/proc/madness_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='info'>Your blood grows thin but your mind expand into unknown wonders?</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(20)
	M.sanity.breakdown(TRUE)
	return

/obj/effect/decal/cleanable/crayon/proc/sight_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='info'>Your book says not to use this...</span>")
	M.disabilities &= ~NEARSIGHTED
	B.remove_self(150)
	return

/obj/effect/decal/cleanable/crayon/proc/paradox_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='info'>The air to you grows hot, your heart races from not only blood-loss but the feeling of dread over you. You hear a whisper in the back of your ear \"What bottom?\"</span>")
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(100)
	M.sanity.breakdown(TRUE)
	sleep(30)
	explosion(loc, 3, 5, 7, 5)
	return

/obj/effect/decal/cleanable/crayon/proc/end_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='info'>The back of your eyes burn. The body feels better. Why?</span>")
	M.maxHealth += 5
	M.health += 5
	M.disabilities &= ~NEARSIGHTED
	B.remove_self(150)
	M.sanity.breakdown(TRUE)
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT)
			M.remove_language(LANGUAGE_CULT)
		if(L.name == LANGUAGE_OCCULT)
			M.remove_language(LANGUAGE_OCCULT)
	return

/obj/effect/decal/cleanable/crayon/proc/flux_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='info'>The echos of smashing glass and splinting wood pound against the mind as the body drys heaving.</span>")
	my_area.bluespace_hazard_threshold -= 1
	GLOB.bluespace_hazard_threshold -= 1
	bluespace_entropy(1, get_turf(src), TRUE)
	B.remove_self(50)
	M.sanity.breakdown(TRUE) //You have to be insain to do this
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT)
			my_area.bluespace_hazard_threshold -= 5
			GLOB.bluespace_hazard_threshold -= 5
			bluespace_entropy(5, get_turf(src), TRUE)
		if(L.name == LANGUAGE_OCCULT)
			my_area.bluespace_hazard_threshold -= 5
			GLOB.bluespace_hazard_threshold -= 5
			bluespace_entropy(5, get_turf(src), TRUE)
	return

/obj/effect/decal/cleanable/crayon/proc/negentropy_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='info'>Soft echos of trees rustle, wind blowing and trickingly of water dance around your ears, a calmness even if only a minor one feels present.</span>")
	my_area.bluespace_hazard_threshold += 1
	GLOB.bluespace_hazard_threshold += 1
	bluespace_entropy(-5, get_turf(src), TRUE)
	B.remove_self(60) //Takes more to heal then harm
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT)
			my_area.bluespace_hazard_threshold += 5
			GLOB.bluespace_hazard_threshold += 5
			bluespace_entropy(-5, get_turf(src), TRUE)
		if(L.name == LANGUAGE_OCCULT)
			my_area.bluespace_hazard_threshold += 5
			GLOB.bluespace_hazard_threshold += 5
			bluespace_entropy(-5, get_turf(src), TRUE)
	return


/obj/effect/decal/cleanable/crayon/proc/voice_spell(var/mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_OCCULT)
	to_chat(M, "<span class='info'>Your head feels heavy with unknown knowlage and your heart strats to rase with shock of blood loss.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	return

/obj/effect/decal/cleanable/crayon/proc/drain_spell(var/mob/living/carbon/human/M, var/able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1))
		to_chat(M, "<span class='info'>The body before you is no more as its code is one with you.</span>")
		if(able_to_cast)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		greater.dust()
		return

	for(var/mob/living/simple_animal/lesser in oview(1))
		to_chat(M, "<span class='info'>The body before you is no more as its code is one with you.</span>")
		if(able_to_cast)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		lesser.dust()
		return
	return
