/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	layer = TURF_DECAL_LAYER
	anchored = TRUE
	random_rotation = 0
	var/is_rune = FALSE

/obj/effect/decal/cleanable/crayon/New(location,main = "#FFFFFF",shade = "#000000",type = "rune")
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
				to_chat(M, "<span class='info'>You try to do as the book describes but your frail body condition physically prevents you from even mumbling a single word out of its pages.</span>")
				return

			var/datum/reagent/organic/blood/B = M.get_blood()
			var/candle_amount = 0
			to_chat(M, "<span class='info'>The writings on the book and the drawn rune coincide, their dissociated knowledge piecing themselves together.</span>")
			for(var/obj/item/flame/candle/mage_candle in oview(3))
				if(!mage_candle.lit)
					mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
					mage_candle.endless_burn = TRUE
					B.remove_self(15)
					to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
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

				if(spell.message == "Brew." && candle_amount >= 2)
					brew_spell(M)
					continue

				if(spell.message == "Recipe." && candle_amount >= 1)
					recipe_spell(M)
					continue

				if((spell.message == "Bees." || spell.message == "Bees!") && candle_amount >= 4)
					bees_spell(M)
					continue
			return

	if(istype(I, /obj/item/tool/knife/ritual) || istype(I, /obj/item/tool/knife/neotritual))
		if(M.disabilities&NEARSIGHTED && is_rune && M.species?.reagent_tag != IS_SYNTHETIC)

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>Your hand is shaking, your concentration too shattered. The ritual cannot proceed with your constitution as frail as it is.</span>")
				return
		to_chat(M, "<span class='info'>The writings on the rune are as right as the stars.</span>")
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
				to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
			candle_amount += 1

		for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) //Dont forget to clear your old work
			if(spell.message == "Voice." && candle_amount >= 3)
				voice_spell(M)
				continue

			if(spell.message == "Drain." && candle_amount >= 5)
				drain_spell(M, able_to_cast)
				continue

			if(spell.message == "Cards To Life." && candle_amount >= 3)
				cards_to_life_spell(M)
				continue

			if(spell.message == "Cards." && candle_amount >= 3)
				cards_spell(M)
				continue

			if(spell.message == "Equalize." && candle_amount >= 6)
				equalize_spell(M)
				continue
			return
		return
	return

/obj/effect/decal/cleanable/crayon/proc/babel_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_CULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	return

/obj/effect/decal/cleanable/crayon/proc/recipe_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/paper/P in oview(1)) // Must be on the spell circle
		to_chat(M, "<span class='info'>A echoing sound of scribbling fills the air.</span>")
		B.remove_self(20)
		var/obj/item/alchemy/recipe_scroll/S = new /obj/item/alchemy/recipe_scroll
		S.loc = P.loc
		qdel(P)
	return

/obj/effect/decal/cleanable/crayon/proc/brew_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(50)
	M.metabolism_effects.nsa_bonus -= 25 //Works to balance out the NSA given from the perk. That way those who get it naturally have a bonus.
	M.stats.addPerk(PERK_ALCHEMY)
	to_chat(M, "<span class='warning'>Your mind expands with creations lost. Your body feels sick.</span>")
	return

/obj/effect/decal/cleanable/crayon/proc/ignorance_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.psi_blocking_additive = 50
	to_chat(M, "<span class='warning'>Your mind feels like an impenetrable fortress against psionic assaults. Your heart is beating like a drum, exerting itself to recover the blood paid for your boon.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(50)
	return

/obj/effect/decal/cleanable/crayon/proc/life_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1)) // Must be on the spell circle
		if(M.maxHealth > 30)
			to_chat(M, "<span class='warning'>Gung vf abg qrnq juvpu pna rgreany yvr, naq jvgu fgenatr nrbaf rira qrngu znl qvr.</span>") // Guess the language and the phrase.
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
			to_chat(M, "<span class='info'>Gung vf abg qrnq juvpu pna rgreany yvr, naq jvgu fgenatr nrbaf rira qrngu znl qvr.</span>")
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

/obj/effect/decal/cleanable/crayon/proc/madness_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>Your blood runs thin as you catch a glimpse of forbidden aeons, shortening your lifespan as you come to terms with your feeble inconsequentiality on the greater scheme of things.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(20)
	M.sanity.breakdown(TRUE)
	return

/obj/effect/decal/cleanable/crayon/proc/sight_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>Your vision is impaired no more, your heart stresses itself to recover the blood paid for your blinding to the dark arts. The eyes deceive, true perception will be achieved without their hindrance.</span>")
	M.disabilities &= ~NEARSIGHTED
	B.remove_self(150)
	return

/obj/effect/decal/cleanable/crayon/proc/paradox_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>The air around you grows hot, your heart races as a feeling of dread washes over you. You hear a faint whisper in the back of your head, \"Upside, downside... all cardinal directions, an illusion...\"</span>")
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(100)
	M.sanity.breakdown(TRUE)
	sleep(30)
	explosion(loc, 3, 5, 7, 5)
	return

/obj/effect/decal/cleanable/crayon/proc/end_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>The truth of the universe flashes before your eyes at a sickening speed, eldritch knowledge being forcefully vacuumed out of your psyche. The light! It burns! IT BURNS!!!</span>")
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

/obj/effect/decal/cleanable/crayon/proc/flux_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='warning'>Reality itself fluctuates around you as a canvas of impending doom. The truth behind the heat death of the universe draws ever nearer, thugged by your strings...</span>")
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

/obj/effect/decal/cleanable/crayon/proc/negentropy_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='info'>The threads of creation itself are spun anew, a feeling of inextricable tranquility permeates your thoughts. For reasons perhaps unbeknownst to you, the death heat of the universe strays further away...</span>")
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

/obj/effect/decal/cleanable/crayon/proc/bees_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 10
	M.health -= 10
	to_chat(M, "<span class='info'>To make life from dyes, takes carbon...</span>")
	for(var/obj/item/reagent_containers/food/snacks/grown/G in oview(5)) // Must be on the spell circle
		to_chat(M, "<span class='info'>Distant voices call out from everywhere. NOT THE BEES!</span>")
		B.remove_self(70)
		if(G.name == "sunflower")
			new /mob/living/carbon/superior_animal/vox/wasp(G.loc)
			qdel(G)
	return

/obj/effect/decal/cleanable/crayon/proc/voice_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_OCCULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	return

/obj/effect/decal/cleanable/crayon/proc/drain_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1))
		to_chat(M, "<span class='warning'>The sacrifice vanishes to dust before you. You feel an ominous warm wind envelop your form as you absorb its lifeforce unto your own.</span>")
		if(able_to_cast)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		greater.dust()
		return

	for(var/mob/living/simple_animal/lesser in oview(1))
		to_chat(M, "<span class='warning'>The sacrifice vanishes to dust before you. You feel an ominous warm wind envelop your form as you absorb its lifeforce unto your own.</span>")
		if(able_to_cast)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		lesser.dust()
		return
	return

/obj/effect/decal/cleanable/crayon/proc/cards_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>A voice whispers infront you. Any foils?</span>")
	for(var/obj/item/device/camera_film in oview(1)) // Must be on the spell circle
		B.remove_self(15)
		new /obj/random/card_carp(src.loc)
	return

/obj/effect/decal/cleanable/crayon/proc/cards_to_life_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/card_carp/carpy in oview(1)) // would be broken if wider effect. Could activate thru walls.
		to_chat(M, "<span class='warning'>The card rotates 90 degrees then begins to fold, twisting till it breaks open with a ripping sound.</span>")
		B.remove_self(50)
		var /monstermob = /mob/living/simple_animal/hostile/creature

		//nonhostile mobs. The pets of the colony.
		if(istype(carpy, /obj/item/card_carp/crab)) monstermob = /mob/living/simple_animal/crab
		if(istype(carpy, /obj/item/card_carp/cat)) monstermob = /mob/living/simple_animal/cat
		if(istype(carpy, /obj/item/card_carp/geck)) monstermob = /mob/living/simple_animal/lizard
		if(istype(carpy, /obj/item/card_carp/goat)) monstermob = /mob/living/simple_animal/hostile/retaliate/goat
		if(istype(carpy, /obj/item/card_carp/larva)) monstermob = /mob/living/simple_animal/light_geist
		//corgi list
		if(istype(carpy, /obj/item/card_carp/stunted_wolf) || istype(carpy, /obj/item/card_carp/coyote) ||istype(carpy, /obj/item/card_carp/wolf)) monstermob = /mob/living/simple_animal/corgi
		//mice spawn below
		if(istype(carpy, /obj/item/card_carp/ratking) || istype(carpy, /obj/item/card_carp/plaguerat) || istype(carpy, /obj/item/card_carp/kangaroorat) || istype(carpy, /obj/item/card_carp/chipmunk) || istype(carpy, /obj/item/card_carp/fieldmice)) monstermob = /mob/living/simple_animal/mouse
		//retaliation and hostile mobs
		if(istype(carpy, /obj/item/card_carp/croaker_lord)) monstermob = /mob/living/simple_animal/hostile/retaliate/croakerlord
		if(istype(carpy, /obj/item/card_carp/lost_rabbit)) monstermob = /mob/living/simple_animal/hostile/diyaab
		if(istype(carpy, /obj/item/card_carp/adder)) monstermob = /mob/living/simple_animal/hostile/snake
		if(istype(carpy, /obj/item/card_carp/grizzly)) monstermob = /mob/living/simple_animal/hostile/bear
		if(istype(carpy, /obj/item/card_carp/bat)) monstermob = /mob/living/simple_animal/hostile/scarybat
		if(istype(carpy, /obj/item/card_carp/great_white)) monstermob = /mob/living/simple_animal/hostile/carp/greatwhite
		//birbs
		if(istype(carpy, /obj/item/card_carp/kingfisher) || istype(carpy, /obj/item/card_carp/sparrow) || istype(carpy, /obj/item/card_carp/turkey_vulture) || istype(carpy, /obj/item/card_carp/magpie)) monstermob = /mob/living/simple_animal/jungle_bird
		//hostile tree
		if(istype(carpy, /obj/item/card_carp/tree) || istype(carpy, /obj/item/card_carp/pinetree)) monstermob = /mob/living/simple_animal/hostile/tree
		//mantis
		if(istype(carpy, /obj/item/card_carp/manti) || istype(carpy, /obj/item/card_carp/manti_lord)) monstermob = /mob/living/simple_animal/tindalos

		//superior mobs below
		//roaches
		if(istype(carpy, /obj/item/card_carp/pupa)) monstermob =  /mob/living/carbon/superior_animal/roach/roachling
		if(istype(carpy, /obj/item/card_carp/cockroach)) monstermob = /mob/living/carbon/superior_animal/roach
		if(istype(carpy, /obj/item/card_carp/stinkbug)) monstermob = /mob/living/carbon/superior_animal/roach/toxic
		//termites for ants
		if(istype(carpy, /obj/item/card_carp/ant)) monstermob = /mob/living/carbon/superior_animal/termite_no_despawn/iron
		if(istype(carpy, /obj/item/card_carp/antqueen)) monstermob = /mob/living/carbon/superior_animal/termite_no_despawn/diamond
		//superior beasties
		if(istype(carpy, /obj/item/card_carp/wyrm)) monstermob = /mob/living/carbon/superior_animal/wurm/diamond
		if(istype(carpy, /obj/item/card_carp/daus)) monstermob = /mob/living/carbon/superior_animal/genetics/fratellis //genetics beastie
		//golem
		if(istype(carpy, /obj/item/card_carp/rock) || istype(carpy, /obj/item/card_carp/bloodrock)) monstermob = /mob/living/carbon/superior_animal/ameridian_golem

		//nonmobs below this point
		//turned it into a purse
		if(istype(carpy, /obj/item/card_carp/rpelt) || istype(carpy, /obj/item/card_carp/dpelt) || istype(carpy, /obj/item/card_carp/pinepelt) || istype(carpy, /obj/item/card_carp/gpelt))
			new /obj/item/storage/backpack/leather
			qdel(carpy)
			return
		//burrow
		if(istype(carpy, /obj/item/card_carp/warren))
			new /obj/structure/burrow(carpy.loc)
			qdel(carpy)
			return

		//code that takes monstermob var and spawns whatever it was set too.
		new monstermob(carpy.loc)
		qdel(carpy)

	//take whatever we spawned and tone it WAAAAY back then make it friendly.
	for(var/mob/living/carbon/superior_animal/target in oview(1))
		target.colony_friend = TRUE
		target.friendly_to_colony = TRUE
		target.faction = "Living Dead"
		target.maxHealth *= 0.2
		target.health *= 0.2
	for(var/mob/living/simple_animal/target in oview(1))
		target.colony_friend = TRUE
		target.friendly_to_colony = TRUE
		target.faction = "Living Dead"
		target.maxHealth *= 0.2
		target.health *= 0.2
	return
/obj/effect/decal/cleanable/crayon/proc/equalize_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()

	//get percent of blood. Then pass it back into people. Thats total blood between all / by number of people.
	var/bloodpercent = 0
	var/bloodtotal = 0
	var/list/targets = list()
	//add the caster in first. They don't get included in the for loops.
	targets += M
	bloodtotal = M.get_blood_volume()

	//We go thru all possible targets and set them to the list and gather our blood amount
	for(var/mob/living/carbon/human/T in oview(3))
		if(T.species?.reagent_tag != IS_SYNTHETIC)
			targets += T
			bloodtotal += T.get_blood_volume()
	bloodpercent = ((bloodtotal / targets.len) * 0.01) // turn it into a decimal for later maths.

	//emergency catch in case somehow we don't have vars we need.
	if(!targets || !bloodpercent)
		return

	//Blood alteration of targets
	for(var/mob/living/carbon/human/T in oview(3))
		if(T.species?.reagent_tag != IS_SYNTHETIC)
			if(T.get_blood_volume() >= (bloodpercent * T.species.blood_volume))
				T.vessel.remove_reagent("blood", ((T.get_blood_volume() * 0.01) - bloodpercent) * T.species.blood_volume)
			else T.vessel.add_reagent("blood", (bloodpercent - (T.get_blood_volume() * 0.01)) * T.species.blood_volume)
			to_chat(T, "<span class='warning'>You feel extremly woozy and light headed for a second. It partially recovers.</span>")

	//caster blood handling below
	to_chat(M, "<span class='warning'>The sound of a heart beat fills the air around you.</span>")
	if(M.get_blood_volume() < bloodpercent)
		M.vessel.add_reagent("blood", (bloodpercent - (M.get_blood_volume() * 0.01)) * M.species.blood_volume)
	else M.vessel.remove_reagent("blood", ((M.get_blood_volume() * 0.01) - bloodpercent) * M.species.blood_volume)
	B.remove_self(min(20 * targets.len, 80))
	return
