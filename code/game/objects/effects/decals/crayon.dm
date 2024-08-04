/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	layer = TURF_DECAL_LAYER
	anchored = TRUE
	random_rotation = 0
	sanity_damage = 4
	var/is_rune = FALSE
	var/obj/item/pen/crayon/follow_crayon

/obj/effect/decal/cleanable/crayon/Destroy()
	follow_crayon = null
	..()

// Mist rune, invoked by Scribe scrolls, doesn't allow laser beams to pass through it.
/obj/effect/decal/cleanable/crayon/mist
	name = "strange rune"
	desc = "A fine mist comes off this rune"
	alpha = 150
	is_rune = TRUE //We can infact cast from this rune

/obj/effect/decal/cleanable/crayon/mist/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile/beam))
		return FALSE
	return TRUE

// Shimmer rune, invoked by Scribe scrolls, doesn't allow bullets to pass through. Unless they have penetration.
/obj/effect/decal/cleanable/crayon/shimmer
	name = "strange rune"
	desc = "The air shimmers about this rune."
	alpha = 150
	is_rune = TRUE //We can infact cast from this rune

/obj/effect/decal/cleanable/crayon/shimmer/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile) && !istype(mover, /obj/item/projectile/beam))
		return FALSE
	return TRUE

// Trap rune. Created by deepmaint and naughty mages.
/obj/effect/decal/cleanable/crayon/trap
	name = "dangerous rune"
	desc = "The air shimmers about this rune."
	alpha = 50
	is_rune = TRUE //We can infact cast from this rune
	var/playmate = 0
	var/draw = 1

/obj/effect/decal/cleanable/crayon/trap/Crossed(mob/living/carbon/human/M)
	var/obj/item/scroll/trap_card = null
	if(ishuman(M))
		playmate = 0
		draw = rand(1,2)
		src.set_light(3,2,"#FFFFFF") //so it lights up on crossing.

		//checks on the person crossing. Do we go off for this person?
		if(M.species?.reagent_tag == IS_SYNTHETIC || M.species?.reagent_tag == IS_SLIME)
			return //our runes dont play with synthetic or slimes
		for(var/datum/language/L in M.languages)
			if(L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT)
				return //why would we go off for our friends?
		if(draw == 1) //are we using scroll spells?
			if(!trap_card)
				trap_card = new /obj/item/scroll(M.loc)
			trap_card.loc = M.loc
			trap_card.alpha = 0
			pick(trap_card.smoke_spell(M), trap_card.gaia_spell(M), trap_card.oil_spell(M), trap_card.entangle_spell(M), trap_card.joke_spell(M), trap_card.charger_spell(M))
			do_sparks(3, 0, M.loc)
		if(draw == 2) //are we using rune spells?
			if(M.maxHealth < 80)
				pick(src.flux_spell(M, TRUE), src.equalize_spell(M, TRUE))
			else pick(src.ignorance_spell(M, TRUE), src.madness_spell(M, TRUE), src.flux_spell(M, TRUE), src.equalize_spell(M, TRUE))
			do_sparks(3, 0, M.loc)


	//Everyone else in the Areas checks. Wouldn't be MAGIC if it only effected the yolo solo churchie.
	for(var/mob/living/carbon/human/T in oview(7))
		playmate = 0
		draw = rand(1,2)
		for(var/datum/language/L in T.languages) //check to see if they are our friends!
			if(L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT)
				playmate = 1
		if(!playmate)
			if(T.species?.reagent_tag == IS_SYNTHETIC || T.species?.reagent_tag == IS_SLIME)
				return //we don't interact with synths, borgs, slimes, ect
			if(draw == 1) //are we using scroll spells?
				if(!trap_card)
					trap_card = new /obj/item/scroll(T.loc)
				trap_card.loc = T.loc
				trap_card.alpha = 0
				pick(trap_card.smoke_spell(T), trap_card.gaia_spell(T), trap_card.oil_spell(T), trap_card.entangle_spell(T), trap_card.joke_spell(T), trap_card.charger_spell(T))
				do_sparks(3, 0, T.loc)
			if(draw == 2)//are we using rune spells?
				if(M.maxHealth < 80)
					pick(src.flux_spell(T), src.equalize_spell(T))
				else pick(src.ignorance_spell(T), src.madness_spell(T), src.flux_spell(T), src.equalize_spell(T))
				do_sparks(3, 0, T.loc)


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


// Proc that controls all Book-type spells
/obj/effect/decal/cleanable/crayon/attackby(obj/item/I, mob/living/carbon/human/M)
	..()

	//Run these up here to cut down on repeat code
	var/alchemist = FALSE
	if(M.stats.getPerk(PERK_ALCHEMY))
		alchemist = TRUE // We are an alchemist!

	var/able_to_cast = FALSE
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT)
			able_to_cast = TRUE // We can cast

	if(istype(I, /obj/item/oddity/common/book_unholy) || istype(I, /obj/item/oddity/common/book_omega))
		if(M.get_core_implant(/obj/item/implant/core_implant/cruciform))
			rejected_playmate_faithful(M)
			return
		if(body_checks(M) && is_rune)
			to_chat(M, "<span class='info'>The rune lights up in reaction to the book...</span>")
			if(follow_crayon)
				var/old_desc = "[follow_crayon.desc]"
				follow_crayon.desc = "[old_desc] The strange energies of this planet seem to have infused it with more signicance than before."
				desc = "A rune drawn in empowered crayon wax."
				follow_crayon = null
			var/datum/reagent/organic/blood/B = M.get_blood()
			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3))
				if(!mage_candle.lit && body_checks(M))
					mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
					mage_candle.endless_burn = TRUE
					B.remove_self(15)
					M.sanity.changeLevel(-5)
					to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
				candle_amount += 1

			if(able_to_cast && M.health <= M.maxHealth*0.75)
				//log_debug("Able to cast and health passed")
				for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Don't forget to clear your old work!
					spell_index(M, spell.message, 3, I, able_to_cast, candle_amount, alchemist)
					//log_debug("tea found")
			for(var/obj/item/paper/spell in oview(3)) // Don't forget to clear your old work!
				if(spell.crayon_pen)
					spell_index(M, spell.info, 3, I, able_to_cast, candle_amount, alchemist)
					//log_debug("paperfound")
			return

// Ritual Knife spell procs
	if(istype(I, /obj/item/tool/knife/ritual))

		if(M.get_core_implant(/obj/item/implant/core_implant/cruciform))
			rejected_playmate_faithful(M)
			return

		if(body_checks(M) && is_rune)

			to_chat(M, "<span class='info'>The rune lights up in response to the touch of the ritual weapon...</span>")

			var/datum/reagent/organic/blood/B = M.get_blood()
			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3))
				if(!mage_candle.lit && body_checks(M))
					mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
					mage_candle.endless_burn = TRUE
					B.remove_self(15)
					to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
				candle_amount += 1

			if(able_to_cast && M.health <= M.maxHealth*0.75)
				for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Don't forget to clear your old work!
					spell_index(M, spell.message, 6, I, able_to_cast, candle_amount)

			for(var/obj/item/paper/spell in oview(3)) // Don't forget to clear your old work!
				if(spell.crayon_pen)
					spell_index(M, spell.info, 6, I, able_to_cast, candle_amount)
			return


// Scroll Spell Check to assign spells to the blank scroll by writing in blood the name of the spells we want inscribed on them
// then attacking a rune with the scroll in question (which must NOT be sealed)
	if(istype(I, /obj/item/scroll) && !istype(I, /obj/item/scroll/sealed) && M.stats.getPerk(PERK_SCRIBE)) // we have to have the new perk for this.
		if(body_checks(M, blind = TRUE) && is_rune) // We need to be BLIND for these rituals specifically.
			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3)) // We don't light candles but we still do the check.
				candle_amount += 1

			to_chat(M, "<span class='info'>The smell of iron fills the air as the scroll fumbles out of your hands.</span>")

			if(able_to_cast && M.health <= M.maxHealth*0.75)
				for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Don't forget to clear your old work!
					spell_index(M, spell.message, 2, I, candle_amount, alchemist)

			for(var/obj/item/paper/spell in oview(3)) // Don't forget to clear your old work!
				if(spell.crayon_pen)
					spell_index(M, spell.info, 2, I, candle_amount, alchemist)
			return
		return
	return

/obj/effect/decal/cleanable/crayon/proc/spell_index(mob/living/carbon/human/M, spell, type, obj/I, able_to_cast, candle_amount, alchemist = FALSE)
	//log_debug("running spell index")
	//log_debug("M:[M.name], type [type], spell[spell], obj/I [I.name], able_to_cast [able_to_cast], candle_amount [candle_amount], alchemist [alchemist]")
	if(type == 2)
		//log_debug("type 2 ran")

		var/obj/item/scroll/S = new /obj/item/scroll(src.loc) // Hard set a new scroll. Cause I don't trust players
		M.drop_from_inventory(I)
		qdel(I)

		S.message = spell
		qdel(spell) // We consume the spell
		S.name = "strange scroll"
		if(S.message != "")
			S.icon_state = "Scroll circle"
			S.desc = "A scroll covered in various glyphs and runes."
			qdel(src) //Eat the rune, nom nom
			return

		S.icon_state = "Scroll blood"
		S.desc = "A scroll with a large rune on it."
		qdel(src) // We consume the rune.
		return

	if(type == 3)
		//log_debug("type 3 ran")
		/* Spell example and explination.
		able_to_cast: True or False used to check if they know cult or occult language.
		alchemist: If you have this perk it is true, used in some spells that need to know.
		scribe: Same as Alchemist but for the scribe perk.

		if(findtext(spell, "Example Spell." && candle_amount >= 0)
			example_spell(M, able_to_cast)
			continue*/

		if(findtext(spell, "Babel.") && candle_amount >= 3)
			babel_spell(M)

		if(findtext(spell, "Ignorance.") && candle_amount >= 1)
			ignorance_spell(M, able_to_cast)

		if(findtext(spell, "Flux.") && candle_amount >= 1)
			flux_spell(M)

		if(findtext(spell, "Negentropy.") && candle_amount >= 1)
			negentropy_spell(M)

		if(findtext(spell, "Life.") && candle_amount >= 5)
			life_spell(M, able_to_cast)

		if(findtext(spell, "Madness.") || findtext(spell, "Insanity.") && candle_amount >= 3)
			madness_spell(M, able_to_cast)

		if(findtext(spell, "Sight.") && candle_amount >= 3)
			sight_spell(M, able_to_cast)

		if(findtext(spell, "Paradox.") && candle_amount >= 7)
			paradox_spell(M)

		if(findtext(spell, "The End.") || findtext(spell, "The Beginning.") && candle_amount >= 1)
			end_spell(M, able_to_cast)

		if(findtext(spell, "Brew.") && candle_amount >= 2)
			brew_spell(M, able_to_cast)

		if(findtext(spell, "Recipe.") && candle_amount >= 1)
			recipe_spell(M, alchemist)

		if(findtext(spell, "Bees.") || findtext(spell, "Bees!") && candle_amount >= 4)
			bees_spell(M, able_to_cast)

		if(findtext(spell, "Sky.") || findtext(spell, "Above.") && candle_amount >= 1)
			sun_spell(M, able_to_cast)

		if(findtext(spell, "Scribe.") && candle_amount >= 7)
			scribe_spell(M, able_to_cast)

		if(findtext(spell, "Pouch.") && candle_amount >= 2)
			pouch_spell(M, able_to_cast)

		if(findtext(spell, "Escape.") && candle_amount >= 1)
			escape_spell(M)

		if(findtext(spell, "Awaken.") && candle_amount >= 7)
			awaken_spell(M, able_to_cast)

				// Alchemy-specific rituals below
		if(findtext(spell, "Satchel.") && candle_amount >= 5)
			satchel_spell(M, alchemist)

		//Both book and knife work with this one
		if(findtext(spell, "Cessation.") && candle_amount >= 1)
			cessation_spell(M, candle_amount)

		/* WIP!!!
		if(findtext(spell, "Transmute." && candle_amount >= 6)
			transmutation_spell(M)
			continue
		*/
		return

	if(type == 6)
		//log_debug("type 6 ran")
		if(findtext(spell, "Voice.") && candle_amount >= 3)
			voice_spell(M, able_to_cast)

		if(findtext(spell, "Drain.") && candle_amount >= 5)
			drain_spell(M, able_to_cast)

		if(findtext(spell, "Cards To Life.") && candle_amount >= 3)
			cards_to_life_spell(M, able_to_cast)

		if(findtext(spell, "Life To Cards.") && candle_amount >= 3)
			life_to_cards_spell(M, able_to_cast)

		if(findtext(spell, "Cards.") && candle_amount >= 3)
			cards_spell(M, able_to_cast)

		if(findtext(spell, "Equalize.") && candle_amount >= 6)
			equalize_spell(M, able_to_cast)

		if(findtext(spell, "Scroll.") && candle_amount >= 7)
			scroll_spell(M)

		if(findtext(spell, "Tea Party.") && candle_amount >= 4)
			tea_party_spell(M)

		if(findtext(spell, "Cessation.") && candle_amount >= 1)
			cessation_spell(M, candle_amount)

		if(findtext(spell, "Fountain.") && candle_amount >= 7)
			basin_spell(M, able_to_cast)

		if(findtext(spell, "Ascension.") && candle_amount >= 7)
			ascension_spell(M, able_to_cast)

		if(findtext(spell, "Veil.") && candle_amount >= 5)
			veil_spell(M, able_to_cast)

		if(findtext(spell, "Caprice.") && candle_amount >= 3)
			caprice_spell(M, able_to_cast)

		if(findtext(spell, "Mightier.") && candle_amount >= 3)
			mightier_spell(M, able_to_cast)
		return

	return

//Proc to punish people who are anti-fun.
/obj/effect/decal/cleanable/crayon/proc/rejected_playmate_faithful(mob/living/carbon/human/M)
	var/not_in_good_faith = pick("To late for that, rejecter!",\
	"You already rejected reality!",\
	"That pesky jewelry says otherwise...",\
	"Seems your still not willing to play by my rules.", \
	"Come back after you recalculate your problem...",\
	"Your already commited to your playmate!",\
	"Your friends wouldn't like our playdate.",\
	"Sorry but you seem a little lost in your own rules, let alone mine.",\
	"Did you really come back without an apology?")

	to_chat(M, "<span class='info'>Voices giggles in the air. </span><span class='angelsay'>Now you wish to play? [not_in_good_faith]</span>")
	if(M.allow_spin && src.allow_spin)
		M.SpinAnimation(10,5)
		M.stunned += 1
		M.confused += 2
		if(ishuman(M))
			addtimer(CALLBACK(M, TYPE_PROC_REF(/atom, SpinAnimation), 3, 3), 1)

	//We already would have rejected you, run along now.
	if(M.species?.reagent_tag == IS_SYNTHETIC || M.species?.reagent_tag == IS_SLIME)
		var/in_good_faith = pick("Your a puppet losely strung, no playtime for you!",\
		"Quite a frail wooden doll.",\
		"Tea time is for well played puppets!",\
		"Your strings have been cut, we can't play until your fixed!", \
		"Your not fit for rougher play.",\
		"You were not made to play!",\
		"Did you fall off the shelf? Best to go back to play with more careful friends!",\
		"Come back when your fixed!")

		to_chat(M, "<span class='info'>Some laughter echos. </span><span class='angelsay'>[in_good_faith]</span>")
		return

	var/obj/item/implant/core_implant/cruciform/CI = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
	if(CI)
		if(30 <= CI.power) //cup keeps you safe if it has enough juice.
			CI.power -= 30
			return
		if(CI.power <= 0) //safty set
			CI.power = 0
		if(M.nutrition >= 100)
			M.nutrition -= 100 //hunger is drained from the person to pay the cost of protection.
			return

		//If you cant pay the hunger, is not a synth and dont have 30 cruciform power, we take a lim. When removing you from the playime
		var/obj/item/organ/external/organ = M.get_organ(pick(BP_R_LEG, BP_L_LEG, BP_R_ARM, BP_L_ARM))
		if(!organ)
			//You already suffered enuff of fun
			M.visible_message("<font size=1>\red[M.name] is spun around by [src].</font><\red>", "\red[src] spins you around at high speeds!")
			return
		organ.droplimb(TRUE, DISMEMBER_METHOD_EDGE)
		M.visible_message("<font size=1>\red[M.name] is spun around by [src], a sickening sound coming from a limb being ripped off by vacuum force!.</font><\red>", "\red[src] spins you around, violently ripping one of your limbs off!")
		return

//proc to check that people arn't cheesing and can actually cast.
/obj/effect/decal/cleanable/crayon/proc/body_checks(mob/living/carbon/human/M, blind = FALSE)
	var/pass = FALSE

	//log_debug(" [M.name] is.")


	//If we need to be blind, we dont want to check nearsighted.
	if(M.disabilities&NEARSIGHTED && !blind)
		//log_debug(" [M.name] checking for nearsighted and not blind.")
		pass = TRUE

	//We need to be blind and REQUIRE being blind.
	if(M.disabilities&BLIND && blind)
		//log_debug(" [M.name] checking for blind sighted and  blind.")
		pass = TRUE

	//These two races do not get the full consquences of action, weather it be blood or sanity, making them invailded.
	if(M.species?.reagent_tag == IS_SYNTHETIC || M.species?.reagent_tag == IS_SLIME)
		//log_debug(" [M.name] checking synths and slimes.")
		pass = FALSE

	//We need materal to transmutate, even if it dosnt call for it, we still check for it.
	if(M.get_blood_volume() < 50)
		//log_debug(" [M.name] checking blood amount.")
		pass = FALSE

	if(M.maxHealth <= 30)
		to_chat(M, "<span class='info'>Your hand is shaking, your concentration too shattered. The ritual cannot proceed with your constitution as frail as it is.</span>")
		return FALSE //Faster return with a fancy message why they can

	if(!pass)
		to_chat(M, "<span class='info'>You try to do as the book describes, but something isn't correct.</span>")
		return pass

	return pass

/****************************/
/* BOOK SPELLS PROCS START! */
/****************************/

// Book spell proc example:
/*
/obj/effect/decal/cleanable/crayon/proc/example_spell(mob/living/carbon/human/M, able_to_cast) //testing spell
	var/datum/reagent/organic/blood/B = M.get_blood() //used to get a hook into the casters blood supply.
	B.remove_self(1) //general use cost. We take a small amount of blood for casting.
	log_and_message_admins("[M] has used the example spell! For testing purposes of course!")
*/


// Babel: Grants you knowledge of the Cult language.
// This is a requirement for the ritual spells.
/obj/effect/decal/cleanable/crayon/proc/babel_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_CULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	playsound(M, 'sound/effects/singlebeat.ogg', 100)
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.sanity.changeLevel(-5)
	M.unnatural_mutations.total_instability += 15
	return

// Ignorance: Basically become impervious to telepathic messages from psions. Will stop you from being able to use psionics if you have them.
/obj/effect/decal/cleanable/crayon/proc/ignorance_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	M.psi_blocking_additive = 20
	to_chat(M, "<span class='warning'>Your mind feels like an impenetrable fortress against psionic assaults. Your heart is beating like a drum, exerting itself to recover the blood paid for your boon.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(50)
	M.sanity.changeLevel(-35)
	return

// Life: Revives a dead animal on top of the rune.
/obj/effect/decal/cleanable/crayon/proc/life_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1)) // Must be on the spell circle

		if(!body_checks(M))
			return
		if(!able_to_cast)
			return

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
			M.sanity.changeLevel(-10)
			return
		return

	for(var/mob/living/simple_animal/lesser in oview(1)) // Must be on the spell circle

		if(!body_checks(M))
			return
		if(!able_to_cast)
			return

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
			M.sanity.changeLevel(-10)
			return
		return
	return

// Madness: Become weaker, and cause a sanity breakdown upon yourself.
/obj/effect/decal/cleanable/crayon/proc/madness_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	to_chat(M, "<span class='warning'>Your blood runs thin as you catch a glimpse of forbidden aeons, shortening your lifespan as you come to terms with your feeble inconsequentiality on the greater scheme of things.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(20)
	M.sanity.breakdown(TRUE)
	M.sanity.changeLevel(30)
	return

// Sight: Removes your Nearsighted and blind disabilities, if you have them
// You will be unable to use crayon magic again unless you somehow gain nearsighted back.
/obj/effect/decal/cleanable/crayon/proc/sight_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	if(M.disabilities&NEARSIGHTED)
		M.disabilities &= ~NEARSIGHTED
	if(M.disabilities&BLIND)
		M.disabilities &= ~BLIND
	to_chat(M, "<span class='warning'>Your vision is impaired no more, your heart stresses itself to recover the blood paid for your blinding to the dark arts. The eyes deceive, true perception will be achieved without their hindrance.</span>")
	B.remove_self(150)
	M.sanity.changeLevel(30)
	return

// Paradox: Literally kill yourself. No really, this removes a lot of blood, causes a sanity breakdown upon the character
// And on top of it causes an explosion centered on the rune, most likly totally gibbing them.
/obj/effect/decal/cleanable/crayon/proc/paradox_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>The air around you grows hot, your heart races as a feeling of dread washes over you. You hear a faint whisper in the back of your head, \"Upside, downside... all cardinal directions, an illusion...\"</span>")
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(100)
	M.sanity.breakdown(TRUE)
	sleep(30)
	explosion(loc, 3, 5, 7, 5)
	M.sanity.changeLevel(100)
	// We log this for admins as it can be easily used for griefing and it causes quite the explosion.
	log_and_message_admins("[M] has used the Paradox crayon spell, causing an explosion at \the [jumplink(M)] X:[M.x] Y:[M.y] Z:[M.z].")
	return

// The End: Removes your nearsighted disability, but also your knowledge of cult and occult languages
// Basically wiping yourself clean of everything caused by crayon magic, but making you unable to cast spells again
/obj/effect/decal/cleanable/crayon/proc/end_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	to_chat(M, "<span class='warning'>The truth of the universe flashes before your eyes at a sickening speed, eldritch knowledge being forcefully vacuumed out of your psyche. The light! It burns! IT BURNS!!!</span>")
	M.disabilities &= ~NEARSIGHTED | ~BLIND
	B.remove_self(150)
	M.sanity.breakdown(TRUE)
	M.sanity.changeLevel(5)
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT)
			M.remove_language(LANGUAGE_CULT)
			M.maxHealth += 5 // Give us a small amount of health back too
			M.health += 5
		if(L.name == LANGUAGE_OCCULT)
			M.remove_language(LANGUAGE_OCCULT)
			M.maxHealth += 5
			M.health += 5
	return

// Flux: Causes additional bluespace entropy upon the world. Truly devilish.
// Causes more entropy if you know both Cult and Occult language
/obj/effect/decal/cleanable/crayon/proc/flux_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='warning'>Reality itself fluctuates around you as a canvas of impending doom. The truth behind the heat death of the universe draws ever nearer, thugged by your strings...</span>")
	my_area.bluespace_hazard_threshold -= 1
	GLOB.bluespace_hazard_threshold -= 1
	bluespace_entropy(1, get_turf(src), TRUE)
	B.remove_self(50)
	M.sanity.changeLevel(15)
	playsound(loc, 'sound/effects/cascade.ogg') // Fitting.
	log_and_message_admins("[M] has used the Flux spell, increasing the world's bluespace entropy")
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

// Negentropy: Increases the threshold at which bluespace related incidents ocurr, and reduces bluespace entropy slightly
// Those with knowledge of Occult and Cult languages give it an extra bonus
/obj/effect/decal/cleanable/crayon/proc/negentropy_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/area/my_area = get_area(src)
	to_chat(M, "<span class='info'>The threads of creation itself are spun anew, a feeling of inextricable tranquility permeates your thoughts. For reasons perhaps unbeknownst to you, the death heat of the universe strays further away...</span>")
	my_area.bluespace_hazard_threshold += 1
	GLOB.bluespace_hazard_threshold += 1
	bluespace_entropy(-5, get_turf(src))
	B.remove_self(60) //Takes more to heal then harm
	M.sanity.changeLevel(-15)
	for(var/datum/language/L in M.languages)
		if(L.name == LANGUAGE_CULT)
			my_area.bluespace_hazard_threshold += 5
			GLOB.bluespace_hazard_threshold += 5
			bluespace_entropy(-5, get_turf(src))
		if(L.name == LANGUAGE_OCCULT)
			my_area.bluespace_hazard_threshold += 5
			GLOB.bluespace_hazard_threshold += 5
			bluespace_entropy(-5, get_turf(src))
	return

// Brew: Grants you the Alchemist perk, and access to all the recipes required by it
/obj/effect/decal/cleanable/crayon/proc/brew_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	if(M.stats.getPerk(PERK_SCRIBE))
		to_chat(M, SPAN_WARNING("The paths of the Alchemist and the Scribe are mutually exclusive."))
		return
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(50)
	M.stats.addPerk(PERK_ALCHEMY)
	M.sanity.changeLevel(15)
	to_chat(M, "<span class='warning'>Your mind expands with knowledge of alchemical components, recipes for crafts lost to time, forbidden transmutations. Your body feels extremely weak...</span>")
	return

// Bees: NOT THE BEES!! Invokes a gigantic bee per sunflower on a five-tiles radius around the spell circle
/obj/effect/decal/cleanable/crayon/proc/bees_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	M.maxHealth -= 10
	M.health -= 10
	for(var/obj/item/reagent_containers/food/snacks/grown/G in oview(5))

		if(!body_checks(M))
			return

		if(G.name == "sunflower") // Apply all costs ONLY if the plant is the correct one!!!
			to_chat(M, "<span class='info'>Distant voices scream in agony from every direction: NOT THE BEES!</span>")
			new /mob/living/carbon/superior_animal/vox/wasp(G.loc)
			B.remove_self(70)
			M.sanity.changeLevel(4)
			qdel(G)
	return

// Sky: / Above:
// Converts a open omega book into a drawing of the sun, a oddity with a perk that exspands the skill cap by 30 points.
/obj/effect/decal/cleanable/crayon/proc/sun_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	M.maxHealth -= 5
	M.health -= 5
	for(var/obj/item/oddity/common/book_omega/opened/BOOK in oview(3))

		to_chat(M, "<span class='info'>A cold voice creeks. </span><span class='angelsay'> With this messy canvas, I can only provide you a glance of that.</span>")

		if(!body_checks(M))
			to_chat(M, "<span class='info'>A cold voice sighs. </span><span class='angelsay'> You will not do. Waste the others time.</span>")
			bluespace_entropy(3, get_turf(src)) //Wasting an artists time is rather rude
			return

		to_chat(M, "<span class='info'>The pages of [BOOK.name] slowly turn into paint.</span>")
		new /obj/item/oddity/rare/drawing_of_sun(BOOK.loc)
		B.remove_self(140) //Base is 540
		qdel(BOOK)
	return

// Pouch: Spawns a pouch with a dimensional-linked shared storage. Every person holding one of these can access the same storage from anywhere.
// Works only if the pouch is opened, and accessed while being held in-hand
/obj/effect/decal/cleanable/crayon/proc/pouch_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	for(var/obj/item/storage/pill_bottle/dice/frodo in oview(1))
		if(!body_checks(M)) //inside cause we have a reocuring blood cost inside.
			return
		B.remove_self(50)
		M.sanity.changeLevel(-50) //not always going to break you. But will tank your sanity.
		to_chat(M, "<span class='warning'>The dice bag gives a loud pop.</span>")
		new /obj/item/crayon_pouch(frodo.loc)
		qdel(frodo)
	return

// Escape: Deletes and kicks you out of the game
/obj/effect/decal/cleanable/crayon/proc/escape_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/obj/item/oddity/common/mirror/doodle/ocm = new /obj/item/oddity/common/mirror/doodle(src.loc)
	B.remove_self(35) //We still take some blood for this
	to_chat(M, "<span class='warning'>[M.real_name] stepped into a fragment of a mirror.</span>")
	ocm.name = "[M.real_name]'s fragments."
	ocm.desc = "A thousand doodles of [M.real_name] in crayon stare back at you as you examine the trinket."

	var/job = M.mind.assigned_role
	log_and_message_admins("[key_name(M)]" + "[M.mind ? " ([M.mind.assigned_role])" : ""]" + " entered a colouring book.")


	SSjob.FreeRole(job)
	clear_antagonist(M.mind)

	// Delete them from datacore.

	if(PDA_Manifest.len)
		PDA_Manifest.Cut()
	for(var/datum/data/record/R in data_core.medical)
		if ((R.fields["name"] == M.real_name))
			qdel(R)
	for(var/datum/data/record/T in data_core.security)
		if ((T.fields["name"] == M.real_name))
			qdel(T)
	for(var/datum/data/record/G in data_core.general)
		if ((G.fields["name"] == M.real_name))
			qdel(G)
	// Remove the mob's record.
	var/datum/computer_file/report/crew_record/record
	for(var/datum/computer_file/report/crew_record/CR in GLOB.all_crew_records) // loop through the records
		if(M.mind.name == CR.get_name()) // Check the mind's name to the record's name
			record = CR
			break

	record?.Destroy() // Delete the crew record

	//Update any existing objectives involving this mob.
	for(var/datum/objective/O in all_objectives)
		// Were in a colouring book now...
		if(O.target == M.mind)
			if(O.owner && O.owner.current)
				to_chat(O.owner.current, "<span class='warning'>You get the feeling your target is no longer within your reach...</span>")
			qdel(O)

	//Same for contract-based objectives.
	for(var/datum/antag_contract/contract in GLOB.excel_antag_contracts)
		contract.on_mob_despawned(M.mind)


	SSjob.FreeRole(job)
	M.client.ckey = null
	M.dust(anim = FALSE, remains = /obj/effect/overlay/pulse)
	return

// Scribe: Gives you the Scribe perk. This is a requirement for inscribing scrolls with the spells below.
/obj/effect/decal/cleanable/crayon/proc/scribe_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	var/mob/living/carbon/human/H = M
	for(var/obj/item/paper/P in oview(1)) // Requires a paper
		if(!body_checks(M))
			return
		if(H.stats.getPerk(PERK_ALCHEMY))
			to_chat(M, SPAN_WARNING("The paths of the Scribe and the Alchemist are mutually exclusive."))
			return
		if(H.stats.getPerk(PERK_SCRIBE))
			to_chat(M, SPAN_WARNING("You already are a scribe."))
			return
		M.stats.addPerk(PERK_SCRIBE)
		M.sanity.changeLevel(20)
		B.remove_self(100)
		M.maxHealth -= 25
		M.health -= 25
		to_chat(M, "<span class='warning'>Your head throbs like a heartbeat, the sudden insight of knowledge on how to pen down your dissasociated thoughts into scrolls fogs your eyes, until you can see no more.</span>")
		qdel(P)
	return

// Awaken: Evolve our Ritual Knife into a greater form.
// It can be used once more upon the harvester for it to become a blade
/obj/effect/decal/cleanable/crayon/proc/awaken_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	for(var/obj/item/tool/knife/ritual/knifey in oview(1)) // No ascending church knives

		if(!body_checks(M))
			return

		if(istype(knifey, /obj/item/tool/knife/ritual) && !istype(knifey, /obj/item/tool/knife/ritual/sickle) && !istype(knifey, /obj/item/tool/knife/ritual/blade))
			to_chat(M, "<span class='warning'>Your weapon twists its form, metal bending as if it were flesh with a sickening crunch!</span>")
			playsound(loc, 'sound/items/biotransform.ogg', 50)
			new /obj/item/tool/knife/ritual/sickle(knifey.loc)
			B.remove_self(100)
			M.maxHealth -= 5
			M.health -= 5
			M.sanity.changeLevel(-5)
			qdel(knifey)
		if(istype(knifey, /obj/item/tool/knife/ritual/sickle) && !istype(knifey, /obj/item/tool/knife/ritual/blade))
			to_chat(M, "<span class='warning'>Your weapon twists its form, metal bending as if it were flesh with a sickening crunch as is ascends into its final form!</span>")
			playsound(loc, 'sound/items/biotransform.ogg', 50)
			new /obj/item/tool/knife/ritual/blade(knifey.loc)
			B.remove_self(100)
			M.maxHealth -= 5
			M.health -= 5
			M.sanity.changeLevel(-10)
			qdel(knifey)
	return

/****************************/
/*ALCHEMY SPELLS PROCS START*/
/****************************/

// Recipe: Uses a piece of paper on the rune to invoke writings of alchemical reactions written on it.
/obj/effect/decal/cleanable/crayon/proc/recipe_spell(mob/living/carbon/human/M, alchemist = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/paper/P in oview(1)) // Must be on the spell circle

		if(!body_checks(M))
			return

		if(alchemist)
			to_chat(M, "<span class='info'>The echoing sound of scribbling fills the air.</span>")
			playsound(loc, 'sound/bureaucracy/pen1.ogg')
			B.remove_self(20)
			M.sanity.changeLevel(-2)
			var/obj/item/paper/alchemy_recipes/S = new /obj/item/paper/alchemy_recipes
			S.loc = P.loc
			qdel(P)
		else
			to_chat(M, SPAN_WARNING("You lack the alchemical inspiration to write a revelation in paper."))
			return
	return

// Satchel: Inovokes a satchel that holds only specific alchemical flasks
/obj/effect/decal/cleanable/crayon/proc/satchel_spell(mob/living/carbon/human/M, alchemist = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/storage/pouch/poumch in oview(1))

		if(!body_checks(M))
			return

		if(alchemist)
			if(istype(poumch, /obj/item/storage/pouch) && !istype(poumch, /obj/item/storage/pouch/alchemy)) // Don't transmute your own satchel
				to_chat(M, "<span class='warning'>The pouch bends and twists its form, becoming a portable flask holder!</span>")
				new /obj/item/storage/pouch/alchemy(poumch.loc)
				B.remove_self(20)
				M.sanity.changeLevel(-5)
				qdel(poumch)
			else
				to_chat(M, "<span class='warning'>Alchemy is non-recursive.</span>")
				return
	return

/*

// Transmute: Allows grounds for exchanging different items into other different stuff
// Be warned not to attempt human transmutation like those two brothers did, or the results will be horrible!
/obj/effect/decal/cleanable/crayon/proc/transmutation_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/reagent_containers/catalyst in oview(5)) // Get every single reagent container nearby


*/

/****************************/
/* KNIFE SPELL PROCS START! */
/****************************/


// Voice: Grants us the Occult language, a global hive-like language
// to communicate long-range with other crayon cultists
/obj/effect/decal/cleanable/crayon/proc/voice_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_OCCULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	playsound(M, 'sound/effects/singlebeat.ogg', 80)
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	M.sanity.changeLevel(-20)
	return

// Drain: Consume a superior animal or simple animal's corpse in sight to get your health and max health back
// Increases your total mutation instability so that you can't spam it
/obj/effect/decal/cleanable/crayon/proc/drain_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/greater in oview(1))

		if(!body_checks(M))
			return

		to_chat(M, "<span class='warning'>The sacrifice vanishes to dust before you. You feel an ominous warm wind envelop your form as you absorb its lifeforce unto your own.</span>")
		if(able_to_cast && M.maxHealth < 200)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		greater.dust()
		M.sanity.changeLevel(-20)
		return

	for(var/mob/living/simple_animal/lesser in oview(1))

		if(!body_checks(M))
			return

		to_chat(M, "<span class='warning'>The sacrifice vanishes to dust before you. You feel an ominous warm wind envelop your form as you absorb its lifeforce unto your own.</span>")
		if(able_to_cast && M.maxHealth < 200)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		lesser.dust()
		M.sanity.changeLevel(-20)
		return
	return

// Cards: Invokes a random carp card, to use with other spells
/obj/effect/decal/cleanable/crayon/proc/cards_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	to_chat(M, "<span class='warning'>A voice whispers in front of you: Any foils?</span>")
	for(var/obj/item/device/camera_film in oview(1)) // Must be on the spell circle

		if(!body_checks(M))
			return

		B.remove_self(10)
		new /obj/random/card_carp(src.loc)
		M.sanity.changeLevel(-3)
	return

// Cards to Life: Consumes a Carp card of a certain type to summon an animal accordingly.
// The animal in question is tamed, friendly to the colony, but are incredibly frail and weak.
// Pelt cards can be turned into scroll pouches, Warren turns into a burrow
/obj/effect/decal/cleanable/crayon/proc/cards_to_life_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	var /mob/living/simple_animal/simplemob = /mob/living/simple_animal/hostile/creature
	var /mob/living/carbon/superior_animal/superiormob = null
	for(var/obj/item/card_carp/carpy in oview(1))

		if(!body_checks(M))
			return

		to_chat(M, "<span class='warning'>The card rotates 90 degrees then begins to fold, twisting untill it breaks open with a reality-ripping sound. Something crawls out of its interior!</span>")

		// Nonhostile simplemobs. The pets of the colony.
		if(istype(carpy, /obj/item/card_carp/crab)) simplemob = /mob/living/simple_animal/crab
		if(istype(carpy, /obj/item/card_carp/cat)) simplemob = /mob/living/simple_animal/cat
		if(istype(carpy, /obj/item/card_carp/geck)) simplemob = /mob/living/simple_animal/lizard
		if(istype(carpy, /obj/item/card_carp/goat)) simplemob = /mob/living/simple_animal/hostile/retaliate/goat
		if(istype(carpy, /obj/item/card_carp/larva)) simplemob = /mob/living/simple_animal/light_geist
		// Corgi
		if(istype(carpy, /obj/item/card_carp/stunted_wolf) || istype(carpy, /obj/item/card_carp/coyote) ||istype(carpy, /obj/item/card_carp/wolf)) simplemob = /mob/living/simple_animal/corgi
		// RATS, RATS, WE'RE THE RATS
		if(istype(carpy, /obj/item/card_carp/ratking) || istype(carpy, /obj/item/card_carp/plaguerat) || istype(carpy, /obj/item/card_carp/kangaroorat) || istype(carpy, /obj/item/card_carp/chipmunk) || istype(carpy, /obj/item/card_carp/fieldmice)) simplemob = /mob/living/simple_animal/mouse
		// Retaliation and hostile mobs
		if(istype(carpy, /obj/item/card_carp/croaker_lord)) simplemob = /mob/living/simple_animal/hostile/retaliate/croakerlord
		if(istype(carpy, /obj/item/card_carp/lost_rabbit)) simplemob = /mob/living/simple_animal/hostile/diyaab
		if(istype(carpy, /obj/item/card_carp/adder)) simplemob = /mob/living/simple_animal/hostile/snake
		if(istype(carpy, /obj/item/card_carp/grizzly)) simplemob = /mob/living/simple_animal/hostile/bear
		if(istype(carpy, /obj/item/card_carp/bat)) simplemob = /mob/living/simple_animal/hostile/scarybat
		if(istype(carpy, /obj/item/card_carp/great_white)) simplemob = /mob/living/simple_animal/hostile/carp/greatwhite
		// Birbs
		if(istype(carpy, /obj/item/card_carp/kingfisher) || istype(carpy, /obj/item/card_carp/sparrow) || istype(carpy, /obj/item/card_carp/turkey_vulture) || istype(carpy, /obj/item/card_carp/magpie)) simplemob = /mob/living/simple_animal/jungle_bird
		// Sentient tree
		if(istype(carpy, /obj/item/card_carp/tree) || istype(carpy, /obj/item/card_carp/pinetree)) simplemob = /mob/living/simple_animal/hostile/tree
		// Tindalos
		if(istype(carpy, /obj/item/card_carp/manti) || istype(carpy, /obj/item/card_carp/manti_lord)) simplemob = /mob/living/simple_animal/tindalos

		// Superior mobs below

		//roaches
		if(istype(carpy, /obj/item/card_carp/pupa)) superiormob =  /mob/living/carbon/superior_animal/roach/roachling
		if(istype(carpy, /obj/item/card_carp/cockroach)) superiormob = /mob/living/carbon/superior_animal/roach
		if(istype(carpy, /obj/item/card_carp/stinkbug)) superiormob = /mob/living/carbon/superior_animal/roach/toxic
		//termites for ants
		if(istype(carpy, /obj/item/card_carp/ant) || istype(carpy, /obj/item/card_carp/peltlice)) superiormob = /mob/living/carbon/superior_animal/termite_no_despawn/iron
		if(istype(carpy, /obj/item/card_carp/antqueen)) superiormob = /mob/living/carbon/superior_animal/termite_no_despawn/diamond
		//superior beasties
		if(istype(carpy, /obj/item/card_carp/wyrm)) superiormob = /mob/living/carbon/superior_animal/wurm/diamond
		//golem
		if(istype(carpy, /obj/item/card_carp/rock) || istype(carpy, /obj/item/card_carp/bloodrock)) superiormob = /mob/living/carbon/superior_animal/ameridian_golem

		// End of mob spawns

		// Turned it into a carrying bag
		if(istype(carpy, /obj/item/card_carp/rpelt) || istype(carpy, /obj/item/card_carp/dpelt) || istype(carpy, /obj/item/card_carp/pinepelt) || istype(carpy, /obj/item/card_carp/gpelt))
			new /obj/item/storage/pouch/scroll(carpy.loc)
			qdel(carpy)
			B.remove_self(50)
			M.sanity.changeLevel(1)
			return

		// Burrow
		if(istype(carpy, /obj/item/card_carp/warren))
			var/obj/structure/burrow/diggy_hole = new /obj/structure/burrow(carpy.loc)
			diggy_hole.deepmaint_entry_point = TRUE
			diggy_hole.isRevealed = TRUE
			diggy_hole.isSealed = FALSE
			diggy_hole.invisibility = 0
			diggy_hole.collapse()
			qdel(carpy)
			B.remove_self(50)
			M.sanity.changeLevel(1)
			return

		if(istype(carpy, /obj/item/card_carp/daus))
			to_chat(M, "<span class='warning'>A claw swipes and bites at the caster for stealing a bell!</span>")

/*
			Z:/FloppyDisk/TRILBYMOD: //Somethings can not be handled by the common players
			Z:/FloppyDisk/TRILBYMOD: superiormob = /mob/living/carbon/superior_animal/genetics/fratellis //genetics beastie
			Z:/FloppyDisk/TRILBYMOD: DEPLOY DAUS NERF
*/

			new /obj/random/cloth/bells(carpy.loc)
			M.sanity.changeLevel(1)
			M.adjustBruteLoss(10)
			B.remove_self(50)
			qdel(carpy)
			return


		// Code that takes superiormob var and spawns whatever it was set too.
		if(superiormob != null)
			var /mob/living/carbon/superior_animal/editme = new superiormob(carpy.loc)
			editme.colony_friend = TRUE
			editme.friendly_to_colony = TRUE
			editme.faction = "Living Dead"
			editme.maxHealth = 5
			editme.health = 5
			qdel(carpy)
			B.remove_self(50)
			M.sanity.changeLevel(1)
			return //we returned out so it shouldn't double up.

		var /mob/living/simple_animal/changemeupinside = new simplemob(carpy.loc)
		changemeupinside.colony_friend = TRUE
		changemeupinside.friendly_to_colony = TRUE
		changemeupinside.faction = "Living Dead"
		changemeupinside.maxHealth = 5
		changemeupinside.health = 5
		B.remove_self(50)
		M.sanity.changeLevel(1)
		qdel(carpy)

// Life to Cards: Consumes a mob to turn into a uniquic card
/obj/effect/decal/cleanable/crayon/proc/life_to_cards_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	var/success = FALSE
	for(var/mob/living/carbon/superior_animal/target in oview(1))

		if(!body_checks(M))
			return
		B.remove_self(50) //pay da cost BEFORE we do the living check
		if(!able_to_cast) //punishment for not being able to cast
			M.maxHealth -= 1
			M.health -= 1
			M.unnatural_mutations.total_instability += 1 //A soft cap

		success = TRUE
		var/obj/item/card_carp/death_card/death_card = new /obj/item/card_carp/death_card(src.loc)
		death_card.generate(target.maxHealth, target.meat_amount, target.melee_damage_lower, target.ranged, target.name)
		to_chat(M, "<span class='warning'>\The [target] sinks down into the rune leaving behind... a small card?!</span>")
		target.dust()

	for(var/mob/living/simple_animal/simplemtarget in oview(1))

		if(!body_checks(M))
			return
		B.remove_self(50)
		if(!able_to_cast)
			M.maxHealth -= 1
			M.health -= 1
			M.unnatural_mutations.total_instability += 1

		success = TRUE
		var/obj/item/card_carp/death_card/death_card = new /obj/item/card_carp/death_card(src.loc)
		death_card.generate(simplemtarget.maxHealth, simplemtarget.meat_amount, simplemtarget.melee_damage_lower, 0, simplemtarget.name)
		to_chat(M, "<span class='warning'>\The [simplemtarget] sinks down into the rune leaving behind... a small card?!</span>")
		simplemtarget.dust()


	if(!success)
		B.remove_self(15)
		new /obj/item/card_carp/index/adved(src.loc)

// Equalize: This spell pools together the entire average percentage of blood from all mobs in sight
// and distributes it equally among the number of mobs, "equalizing" it.
// e.g: If a person has 100% blood and another has 50%, both have 75% blood now
// and then the caster incurrs the blood cost for the spell equal to 20 per person affected, up to a cap of 80 cost.
/obj/effect/decal/cleanable/crayon/proc/equalize_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	//get percent of blood. Then pass it back into people. Thats total blood between all / by number of people.
	var/bloodpercent = 0
	var/bloodtotal = 0
	var/list/targets = list()
	//add the caster in first. They don't get included in the for loops.
	targets += M
	bloodtotal = M.get_blood_volume()

	//We go thru all possible targets and set them to the list and gather our blood amount
	for(var/mob/living/carbon/human/T in oview(3))
		if(T.species?.reagent_tag != IS_SYNTHETIC && T.species?.reagent_tag != IS_SLIME)
			targets += T
			bloodtotal += T.get_blood_volume()
	bloodpercent = ((bloodtotal / targets.len) * 0.01) // turn it into a decimal for later maths.

	//emergency catch in case somehow we don't have vars we need.
	if(!targets || !bloodpercent)
		return

	//Blood alteration of targets
	for(var/mob/living/carbon/human/T in oview(3))
		if(T.species?.reagent_tag != IS_SYNTHETIC && T.species?.reagent_tag != IS_SLIME)
			if(T.get_blood_volume() >= (bloodpercent * T.species.blood_volume))
				T.vessel.remove_reagent("blood", ((T.get_blood_volume() * 0.01) - bloodpercent) * T.species.blood_volume)
			else T.vessel.add_reagent("blood", (bloodpercent - (T.get_blood_volume() * 0.01)) * T.species.blood_volume)
			to_chat(T, "<span class='warning'>You feel extremly woozy and light headed for a second. It partially recovers.</span>")
			M.sanity.changeLevel(-5) //Good deads always get punished (but only if we successfully cast the spell!)

	//caster blood handling below
	to_chat(M, "<span class='warning'>The sound of a heart beat fills the air around you.</span>")
	playsound(loc, 'sound/effects/singlebeat.ogg', 80)
	if(M.get_blood_volume() < bloodpercent)
		M.vessel.add_reagent("blood", (bloodpercent - (M.get_blood_volume() * 0.01)) * M.species.blood_volume)
	else M.vessel.remove_reagent("blood", ((M.get_blood_volume() * 0.01) - bloodpercent) * M.species.blood_volume)
	B.remove_self(min(20 * targets.len, 80))
	return

// Fountain: High blood cost, to invoke a bloody basin in which to soak one's hands for writing in blood
// This makes it so that you don't need to gib additional creatures to write each time
// TODO: MORE CRAYON CULT BASED FURNITURE, CHANDELIERS?
/obj/effect/decal/cleanable/crayon/proc/basin_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	for(var/obj/structure/reagent_dispensers/watertank/W in oview(1)) // Must be on the spell circle

		if(!body_checks(M))
			return

		to_chat(M, "<span class='info'>Thunder crackles as a miniature cloud of nothingness manifests itself. Otherworldy tea begins pouring down, forming an omnious black crayon basin beneath it...</span>")
		B.remove_self(100) // Basically pouring your blood into a container, insane
		M.sanity.breakdown(FALSE) // If your blood got sucked and poured into a container you too would freak out
		M.sanity.changeLevel(-50)
		var/obj/structure/sink/basion/crayon/N = new /obj/structure/sink/basion/crayon
		N.loc = W.loc
		qdel(W)
	return

// Ascension: "Opens" your current book (Occult or Unholy) and "transforms" it into an improved version
// They have slightly better stats than their stock counterparts and can be used for rituals
// They also look cool as hell being held on your hands!!!

/obj/effect/decal/cleanable/crayon/proc/ascension_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	for(var/obj/item/oddity/common/O in oview(1))

		if(!body_checks(M))
			return

		if(istype(O, /obj/item/oddity/common/book_omega/closed))
			to_chat(M, "<span class='info'>The book floats before you and opens, new information within being written as your eyes pour over it!</span>")
			B.remove_self(80)
			M.sanity.breakdown() // You are driven insane
			M.sanity.changeLevel(-30)
			playsound(loc, 'sound/bureaucracy/bookopen.ogg')
			new /obj/item/oddity/common/book_omega/opened(O.loc)
			qdel(O)
		if(istype(O, /obj/item/oddity/common/book_unholy/closed))
			to_chat(M, "<span class='info'>The book floats before you and opens, new information within being written as your eyes pour over it!</span>")
			B.remove_self(80)
			M.sanity.breakdown() // You are driven insane
			M.sanity.changeLevel(-30)
			playsound(loc, 'sound/bureaucracy/bookopen.ogg')
			new /obj/item/oddity/common/book_unholy/opened(O.loc)
			qdel(O)
		else
			to_chat(M, "<span class='info'>This oddity is not a book, knowledge on how to improve it is beyond your grasp.</span>")
	return

// Veil: Invoke a blindfold that works as prescription goggles with one extra tile of visibility in the dark
// These work as normal blindfolds for people who do not have the Cult language learned.
/obj/effect/decal/cleanable/crayon/proc/veil_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	for(var/obj/item/clothing/glasses/blindfold/G in oview(1))

		if(!body_checks(M))
			return

		to_chat(M, "<span class='info'>The blindfold glows for a moment before falling silent, forces unknown apparently strengthened its properties...</span>")
		B.remove_self(80)
		M.sanity.changeLevel(-10)
		var/obj/item/clothing/glasses/crayon_blindfold/N = new /obj/item/clothing/glasses/crayon_blindfold
		N.loc = G.loc
		qdel(G)
	return

// Caprice: Converts the rune to a trap rune, if having bable or voice will send it randomly to maints or deepmaints.
/obj/effect/decal/cleanable/crayon/proc/caprice_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/turf/simulated/floor/target	//this is where we are teleporting
	var/list/validtargets = list()

	for(var/area/A in world)						//Clumbsy, but less intensive than iterating every tile
		if(istype(A, /area/deepmaint))				//First find our deepmaint areas
			for(var/turf/simulated/floor/T in A)		//Pull a list of valid floor tiles from deepmaint
				validtargets += T					//Add them to the list

		if(istype(A, /area/nadezhda/maintenance))			//First find our maints areas
			if(A.is_maintenance)					//Just in case were a subtype of maintenance and NOT maintenanced
				for(var/turf/simulated/floor/T in A)
					if(A.is_maintenance)			//Pull a list of valid floor tiles from deepmaint
						validtargets += T			//Add them to the list

	//We act differently if a human is doing this
	if(M)
		var/datum/reagent/organic/blood/B = M.get_blood()
		for(var/obj/effect/decal/cleanable/crayon/G in oview(3))
			if(!body_checks(M))
				return

			if(able_to_cast)
				var/obj/effect/decal/cleanable/crayon/trap/trap_teleport_placement = new /obj/effect/decal/cleanable/crayon/trap(src.loc,main=RANDOM_RGB,shade=RANDOM_RGB)
				B.remove_self(20)
				bluespace_entropy(1, get_turf(src))
				trap_teleport_placement.forceMove(target)
				qdel(G)
			else
				//We just convert to traps, not move them around in deepmaints or maints normal
				B.remove_self(10)
				new /obj/effect/decal/cleanable/crayon/trap(G.loc,main=RANDOM_RGB,shade=RANDOM_RGB)
				qdel(G)
			return
	else
		//This one is done by a higher power with a more stable connection. No entropy
		var/obj/effect/decal/cleanable/crayon/trap/trap_teleport_placement = new /obj/effect/decal/cleanable/crayon/trap(main=RANDOM_RGB,shade=RANDOM_RGB)
		trap_teleport_placement.forceMove(target)

	return

// Mightier: Invokes throwing crayons whose strength gets higher the lower our max HP is.
/obj/effect/decal/cleanable/crayon/proc/mightier_spell(mob/living/carbon/human/M, able_to_cast = FALSE)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(!able_to_cast)
		return

	bluespace_entropy(10, get_turf(src))
	B.remove_self(50) //roughly 10 percent for each crayon.
	var/obj/item/stack/thrown/crayons/needles = new /obj/item/stack/thrown/crayons(src.loc)
	needles.icon_state = pickweight(list("crayonred" = 2,\
				"crayonorange" = 2,\
				"crayonyellow" = 2,\
				"crayongreen" = 2,\
				"crayonblue" = 2,\
				"crayonpurple" = 2))
	needles.item_state = needles.icon_state
	if(M.get_inactive_hand() == src)
		M.drop_from_inventory(src)
		M.put_in_inactive_hand(needles)
	return

//Scroll: Massive blood cost spell that requires a dead animal to invoke a scroll.
// Scrolls can only be used by casters with the Scribe perk!
/obj/effect/decal/cleanable/crayon/proc/scroll_spell(mob/living/carbon/human/M) // Able to be casted by all. But only filled out by scribes.
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/target in oview(1))

		if(!body_checks(M))
			return

		if(target.stat != DEAD) // Has to be dead. Use Drain if you want to super kill things.
			return
		B.remove_self(50) // Consume the blood cost only if it succeeds!!
		M.sanity.changeLevel(-5)
		new /obj/item/scroll(src.loc)
		qdel(target)
	for(var/mob/living/simple_animal/target in oview(1))

		if(!body_checks(M))
			return

		if(target.stat != DEAD)
			return
		B.remove_self(50)
		M.sanity.changeLevel(-5)
		new /obj/item/scroll(src.loc)
		qdel(target)
	return


// Tea Party: Converts plushies into stats, at a cost of course
/obj/effect/decal/cleanable/crayon/proc/tea_party_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/stat_amount = 0
	for(var/obj/structure/plushie/LP in oview(2)) // Must be on the spell circle
		if(M.max_nutrition > 20 && body_checks(M))
			to_chat(M, "<span class='info'>You poor tea into [LP.name]'s cup.</span>")
			B.remove_self(20) //Your tea
			stat_amount += 2  //We give quite a bit for
			M.max_nutrition -= 20
			M.maxHealth -= 5
			M.health -= 5
		else
			to_chat(M, "<span class='info'>Your kettle has run dry.</span>")
			B.remove_self(10) //Still cost ya to mannifest tea time

	for(var/obj/item/toy/plushie/P in oview(2)) // Must be on the spell circle
		if(M.max_nutrition > 20 && body_checks(M))
			to_chat(M, "<span class='info'>You poor tea into [P.name]'s cup.</span>")
			B.remove_self(25) //Your tea
			stat_amount += 1  //We give quite a bit for
			M.max_nutrition -= 5
		else
			to_chat(M, "<span class='info'>Your kettle has run dry.</span>")
			B.remove_self(1) //Still cost ya to mannifest tea time

	for(var/stat in ALL_STATS_FOR_LEVEL_UP)
		if(M.stats && body_checks(M)) //Make sure to not overburnen yourself in this tea party
			M.stats.addTempStat(stat, stat_amount, stat_amount MINUTES, "Tea Party")
	return

// Cessation: Baba is gone? - Removes you from player from the world for an equal amount of candles
/obj/effect/decal/cleanable/crayon/proc/cessation_spell(mob/living/carbon/human/M, candle_number)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/cn
	//Dont change the top lines they are real letters BYOND DM cant see normally
	var/list/hmm = list("༒", "༎༐།", "‽", "⸘", "༑", \
	"Sipping sounds echo in you.", "Nothing is around you.", "Nothing is still.", "Sounds are felt here, not heard.", "Where are you?")

	B.remove_self(candle_number)

	for(cn=0, cn<candle_number, cn++)
		var/huh = pick(hmm)
		to_chat(M, "<span class='info'>[huh]</span>") //Spammy!
	M.loc = null

	if(prob(candle_number))
		to_chat(M, "<span class='info'>A secondary voice of a canvus being painted on fittles \"You wanted me to paint a slow path back for you? Don't blame me for what you dont hear!\".</span>")
		candle_number *= 60
	else
		to_chat(M, "<span class='info'>A primary chipper voice of musical notes drips \"You wish to get away from here quickly? I'll lead the way! Te Te Te. Don't blame me for what you dont see!\".</span>")

	//Surely nothing bad will happen
	var/cn_s = candle_number SECONDS
	sleep(cn_s)
	var/turf/source = get_turf(src)
	if(source)
		M.loc = source
		to_chat(M, "<span class='info'>In a instance you find yourself back at the rune...</span>")
	else
		to_chat(M, "<span class='info'>The path back is no longer, as the planet no longer can find you.</span>")

/******************************/
/* SCROLL SPELLS PROCS START! */
/******************************/

/*
Scroll spells consume the scroll upon being cast, they're meant to be portable spells that require no rune

obj/item/scroll/proc/example_spell(mob/living/carbon/human/M) //testing spell
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(1)
	log_and_message_admins("[M] has used the example spell! For testing purposes of course!")
	new /obj/item/scroll(M.loc)
	ScrollBurn()
*/

// Mist: Invokes a crayon mark that blocks laser projectiles, dissipating them.
/obj/item/scroll/proc/mist_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(100)
	bluespace_entropy(20, get_turf(src))
	new /obj/effect/decal/cleanable/crayon/mist(M.loc,main=RANDOM_RGB,shade=RANDOM_RGB)
	ScrollBurn()

// Shimmer: Invokes a crayon mark that blocks both bullets, penetration weapons and rounds will still pierce.
/obj/item/scroll/proc/shimmer_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(100)
	bluespace_entropy(20, get_turf(src))
	new /obj/effect/decal/cleanable/crayon/shimmer(M.loc,main=RANDOM_RGB,shade=RANDOM_RGB)
	ScrollBurn()

// Smoke: Creates a smoke cloud centered around the caster
/obj/item/scroll/proc/smoke_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(50) //decently high just to protect server performance.
	var/datum/effect/effect/system/smoke_spread/chem/smoke = new
	var/datum/reagents/gas_storage = new /datum/reagents(100, src)
	gas_storage.add_reagent("crayon_dust_random", 100) //CRAYON MAGIC
	smoke.attach(src.loc)
	smoke.set_up(gas_storage, 12, 0, M.loc)
	spawn(0)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		qdel(smoke)
		qdel(gas_storage)
	ScrollBurn()

// Oil: Creates a pool of liquid fuel that can be burned to start a fire, or used with Floor Seal.
/obj/item/scroll/proc/oil_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(25)
	bluespace_entropy(10, get_turf(src))
	new /obj/effect/decal/cleanable/liquid_fuel(M.loc,300, 1) //considered a trap cause you instant ignite yourself XD
	ScrollBurn()

// Floor Seal: For every floor tile in sight that is covered by liquid fuel, this spell fixes them all.
/obj/item/scroll/proc/floor_seal_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(50)
	for(var/obj/effect/decal/cleanable/liquid_fuel/fixy_juice in oview(7))
		bluespace_entropy(1, get_turf(src)) //on a per juice basis
		for(var/obj/structure/multiz/ladder/burrow_hole/scary_hole in view(0, fixy_juice.loc))
			qdel(scary_hole)
		for(var/turf/simulated/floor/pot_hole in view(0, fixy_juice.loc))
			pot_hole.health = pot_hole.maxHealth
			pot_hole.broken = FALSE
			pot_hole.burnt = FALSE
			pot_hole.update_icon()
		qdel(fixy_juice)
	ScrollBurn()

// Light: Creates a rune on the floor that gives off light.
/obj/item/scroll/proc/light_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/obj/effect/decal/cleanable/crayon/light_rune = new /obj/effect/decal/cleanable/crayon(M.loc,main=RANDOM_RGB,shade=RANDOM_RGB)
	light_rune.set_light(5,4,"#FFFFFF")
	light_rune.name = "glowing rune"
	light_rune.desc = "A bright rune giving off vibrant light."
	light_rune.color = "#FFFF00"
	B.remove_self(20)
	bluespace_entropy(20, get_turf(src)) //high entropy cost. Low blood cost.
	ScrollBurn()

// Gaia: Every Mob seeable via the scroll when burned must past a language checks or be weaken 5:3, multiple crayon mages nearby will flip the effect.
/obj/item/scroll/proc/gaia_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	bluespace_entropy(5, get_turf(src))
	B.remove_self(30)
	var/gaia_pulls = 5
	for(var/mob/T in oview(7))
		for(var/datum/language/L in T.languages)
			if(L.name == LANGUAGE_CULT)
				gaia_pulls -= 3
			if(L.name == LANGUAGE_OCCULT)
				gaia_pulls -= 2
		if(gaia_pulls)
			T.Weaken(gaia_pulls)

	if(M.get_inactive_hand() == src)
		M.drop_from_inventory(src)
	ScrollBurn()

// Eta: Every Mob seeable via the scroll when burned must past a language checks or be thrown backwards 8 to 12 spaces
/obj/item/scroll/proc/eta_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	bluespace_entropy(5, get_turf(src))
	B.remove_self(30)
	var/iron_mind = FALSE
	for(var/mob/T in oview(7))
		iron_mind = FALSE //So 1 crayon mage dosnt block the whole thing
		for(var/datum/language/L in T.languages)
			if(L.name == LANGUAGE_CULT || L.name == LANGUAGE_OCCULT)
				iron_mind = TRUE
		if(!iron_mind)
			T.throw_at(get_step(T,reverse_direction(T.dir)),rand(8,12),30)

	if(M.get_inactive_hand() == src)
		M.drop_from_inventory(src)
	ScrollBurn()

// Reveal: Gives everyone in a 5x5 thermal vision for a few seconds then ends. Used for a quick reveal thru walls.
/obj/item/scroll/proc/reveal_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	bluespace_entropy(5, get_turf(src))
	B.remove_self(20) //low cost but for everyone effected.
	M.stats.addPerk(PERK_REVEAL) //removes self after a short amount of time.
	for(var/mob/living/carbon/human/T in oview(5))
		B = T.get_blood()
		bluespace_entropy(5, get_turf(src))
		B.remove_self(20) //low cost but for everyone effected.
		T.stats.addPerk(PERK_REVEAL) //removes self after a short amount of time.
	ScrollBurn()

// Entangle: Creates a ring of fairy light anomalies around the player to entangle mobs.
/obj/item/scroll/proc/entangle_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(20)
	var/turf/T = M.loc
	if(!T || T.is_space()) //do we have a turf? If not we make one! Land mass formed in spaaaaaaace!
		new /turf/simulated/floor/fixed/fgrass(M.loc)
		bluespace_entropy(50, M.loc)
		B.remove_self(20)
	for(var/turf/surround in oview(3))
		if(!surround.is_space())
			var/obj/structure/annomlies_diet/spidersilk/non_spreader/weave = new /obj/structure/annomlies_diet/spidersilk/non_spreader(surround)
			bluespace_entropy(5, M.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel),weave), 3 MINUTES)
	ScrollBurn()

// Joke: Makes people in the radius of effect ether giggle, laugh or groan from the bad joke. Chance to be any of the 3 but everyone should match the type.
// This would go great in the trap rune.
/obj/item/scroll/proc/joke_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/outcome = pick("giggle", "laugh", "groan")
	M.say("*[outcome]")
	switch(outcome)
		if("giggle")
			B.remove_self(10)
			to_chat(M, SPAN_WARNING("This joke is alright."))
		if("laugh")
			to_chat(M, SPAN_WARNING("This joke is amazing! To bad the scroll went up in smoke."))
			M.sanity.changeLevel(25)
		if("groan")
			B.remove_self(30)
			to_chat(M, SPAN_WARNING("What a horrible joke. This scroll can't burn fast enough."))
			M.sanity.changeLevel(-25)

	for(var/mob/living/carbon/human/T in oview(7))
		//to_chat for target
		T.say("*[outcome]")
		switch(outcome)
			if("giggle")
				to_chat(T, SPAN_WARNING("You hear a joke from [M], it fades from memory faster then you can remember it."))
			if("laugh")
				T.sanity.changeLevel(20)
				to_chat(T, SPAN_WARNING("You hear a good joke from [M], it fades from memory faster then you can remember it."))
			if("groan")
				T.sanity.changeLevel(-20)
				to_chat(T, SPAN_WARNING("You hear a horrible joke from [M], it fades from memory faster then you can remember it."))
	ScrollBurn()


// Charger: Releases the wonderful electric anomalys that roam around.
/obj/item/scroll/proc/charger_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(20)
	var/list/turf_list = list()
	var/again = TRUE

	for(var/turf/T in oview(5, get_turf(M)))
		if(T.Enter(src)) // If we can "enter" on the tile then we store it for potential spawning.
			turf_list += T
	if(!turf_list.len)
		//something went wrong!
		ScrollBurn()
	while(again == TRUE)
		var/obj/structure/annomlies_diet/ball_lightning/zappy = new /obj/structure/annomlies_diet/ball_lightning(pick(turf_list))
		to_chat(M, SPAN_WARNING("A loud crackling fills the air as something forms."))
		again = pick(TRUE, FALSE) //It will spawn more and more till it gets a bad flip on a 50/50 chance. How bad is your luck?
		//creates a callback, global_proc is a mystery to me. But the GLOBAL_PROC_REF() is actually required. As is the , between qdel and zappy. This fucking voodoo proc.
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel),zappy), 3 MINUTES)
	ScrollBurn()


/****************************/
/* CRAYON ITEMS AND DOODADS */
/****************************/

 // The pouch of wonderful single item sharing!
/obj/item/crayon_pouch
	name = "crayon pouch"
	desc = "What seems to be a dice bag has turned into something far more strange."
	icon = 'icons/obj/dice.dmi'
	icon_state = "magicdicebag"
	price_tag = 100
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_BIOMATTER = 12)
	attack_verb = list("pouched")

	var/obj/item/storage/heldbag = null
	var/master_bag = FALSE

/obj/item/crayon_pouch/Initialize(mapload)
	for(var/obj/item/crayon_pouch/linker in world)
		heldbag = linker.heldbag
	if(!heldbag && !master_bag)
		heldbag = new /obj/item/storage/pouch/medium_generic/crayon_linker(src)
		master_bag = TRUE

/obj/item/crayon_pouch/attackby(obj/item/W as obj, mob/user as mob)
	if(heldbag)
		heldbag.refresh_all()
		heldbag.close_all()
		return heldbag.attackby(W, user)
	else
		to_chat(user, SPAN_WARNING("The crayon pouch refuses to open."))
		return

/obj/item/crayon_pouch/AltClick(mob/user)
	if(!heldbag)
		to_chat(user, SPAN_WARNING("The crayon pouch refuses to open."))
		return
	return heldbag.AltClick(user)

/obj/item/crayon_pouch/attack_self(mob/user as mob)
	if(!heldbag)
		to_chat(user, SPAN_WARNING("The crayon box refuses to open."))
		return
	return heldbag.attack_self(user)

/obj/item/crayon_pouch/throw_at(mob/user)
	if(heldbag)
		heldbag.close_all()
	..()

/obj/item/crayon_pouch/Destroy()
	heldbag.close_all()
	if(master_bag)
		for(var/obj/item/crayon_pouch/linker in world)
			linker.heldbag = null
		master_bag = FALSE
		qdel(heldbag)
	else
		heldbag = null
	contents = null
	. = ..()

/obj/item/storage/pouch/medium_generic/crayon_linker // The special storage pouch that all the crayon pouches link to.

/obj/item/storage/pouch/medium_generic/crayon_linker/storage_depth_turf()
	return -1 // We're always going to be accessable throught dept as this is meant for nested items

/obj/item/storage/pouch/medium_generic/crayon_linker/attack_self(mob/user as mob)
	open(user)

/obj/item/storage/pouch/medium_generic/crayon_linker/Adjacent()
	return TRUE

// Throwing crayons, a ranged throwing type weapon that deals more damage the lower your max HP is, up to a cap.
/obj/item/stack/thrown/crayons
	name = "throwing crayons"
	desc = "Sharpened crayons. Used until they have become the perfectly balanced weight for throwing."
	icon = 'icons/obj/crayons.dmi'
	icon_state = "crayonred"
	item_state = "crayonred"
	singular_name = "throwing crayon"
	plural_name = "throwing crayons"
	tool_qualities = list()
	attack_verb = list("slashed", "stabbed", "marked", "cut")
	matter = list()
	max_amount = 6

/obj/item/stack/thrown/crayons/launchAt(atom/target, mob/living/carbon/M)
	var/hp_throwing_damage = ((200 - max(M.maxHealth, 30)) / 5) // At 60 hp we do about 28 damage. Caps at 34 damage.
	throwforce = hp_throwing_damage
	..()

/obj/item/stack/thrown/crayons/update_icon()
	if (icon_state == null)
		icon_state = pickweight(list("crayonred" = 2,\
				"crayonorange" = 2,\
				"crayonyellow" = 2,\
				"crayongreen" = 2,\
				"crayonblue" = 2,\
				"crayonpurple" = 2))

// Used in admin testing so I don't have to constantly var edit myself to be nearsighted
/obj/item/device/camera/crayon_mage
	desc = "Why is the flash on the back...?"
	name = "camera"
	pictures_left = 0

/obj/item/device/camera/crayon_mage/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/device/camera_film))
		to_chat(user, "<span class='warning'>Strange. The film seems to keep popping out.</span>")

/obj/item/device/camera/crayon_mage/attack_self(mob/user)
	if(user)
		to_chat(user, "The camera goes off in your face!")
		playsound(loc, pick('sound/items/polaroid1.ogg', 'sound/items/polaroid2.ogg'), 75, 1, -3)
		user.disabilities|=NEARSIGHTED

// TEA FONT!!!
/obj/structure/sink/basion/crayon
	name = "crayon basin"
	desc = "A deep basin of polished black crayon that forever fills with tea for a most splended party. \
			An inkwell of tea in which to dip your fingers to write in tea."
	icon_state = "blood_basin"
	density = 1
	limited_reagents = FALSE
	refill_rate = 200
	reagent_id = "blood"

/obj/structure/sink/basion/crayon/attack_hand(mob/living/carbon/human/user) //gives us bloody hands for writing spells.
	if(istype(user))
		if(user.gloves)
			to_chat(user, SPAN_NOTICE("You must take off your gloves to dip your fingers into the kettle."))
			return FALSE
		if(user.sanity.insight && user.sanity.insight < 25)
			to_chat(user, SPAN_NOTICE("You dip your fingers in the basin, a bellow of voices echo in your head, A price for a pour of tea."))
			user.sanity.insight = 0
			user.bloody_hands += 5
			user.hand_blood_color = "#A10808"
			user.update_inv_gloves(1)
		else
			to_chat(user, SPAN_NOTICE("Voices boom in your thoughts. TAKE NOT! INEXPERIENCED PUPPET!"))
		add_verb(user, /mob/living/carbon/human/proc/bloody_doodle)

/obj/structure/sink/basion/crayon/attackby(obj/item/I, mob/user)
	if(I.has_quality(QUALITY_BOLT_TURNING))
		anchored = !anchored
		to_chat(user, SPAN_NOTICE("You [anchored? "" : "un"]secured \the [src]!"))
		playsound(loc, 'sound/items/Ratchet.ogg', 75, 1)
		return

// Scrolls allowing anyone to cast their effects by burning them.
/obj/item/scroll
	name = "blank scroll"
	desc = "A blank canvas in which to express your own insanity."
	icon = 'icons/obj/scroll_bandange.dmi' //icons thanks to Ezoken#5894
	icon_state = "Scrollstended"
	item_state = "crayon_scroll_open"
	w_class = ITEM_SIZE_BULKY
	var/message = ""

// Sealed scrolls are much smaller. They are obtained by using a stack of Bee wax on a normal scroll.
obj/item/scroll/sealed
	name = "sealed scroll"
	desc = "A scroll sealed up with something, or nothing. Only one way to find out!"
	icon_state = "Scrollclosed"
	item_state = "crayon_scroll_closed"
	w_class = ITEM_SIZE_SMALL

// Meant to take occult goodies and that's it.
// TODO: Give it a snowflake sprite instead of a placeholder.
/obj/item/storage/pouch/scroll
	name = "scroll bag"
	desc = "Can hold various scrolls and books."
	icon_state = "large_leather"
	item_state = "large_leather"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	max_w_class = ITEM_SIZE_SMALL
	storage_slots = 7
	max_storage_space = DEFAULT_NORMAL_STORAGE
	can_hold = list(
		/obj/item/scroll,
		/obj/item/oddity/common/book_unholy,
		/obj/item/oddity/common/book_omega,
		/obj/item/tool/knife/ritual, // This means both the knife and sickle...
		/obj/item/paper/alchemy_recipes,
		/obj/item/card_carp,
		/obj/item/device/camera_film)
	cant_hold = list(/obj/item/tool/knife/ritual/blade) // ...but not the sword. No cheating!

/obj/item/scroll/proc/ScrollBurn()
	var/mob/living/M = loc
	if(istype(M))
		M.drop_from_inventory(src)
	new /obj/effect/decal/cleanable/ash(get_turf(src))
	qdel(src)

// Scroll spells proc.
// Burning a scroll with a welding tool or lighter invokes a spell depending on the words written in them.
/obj/item/scroll/attackby(obj/item/I, mob/living/carbon/human/M)
	..()
	if(istype(I, /obj/item/stack/wax) && !istype(I, /obj/item/scroll/sealed)) //seal the scroll
		var/obj/item/stack/wax/W = I
		if(W.amount < 1) //No you can't use part of the wax to seal the WHOLE scroll.
			return
		W.use(1)
		var/obj/item/scroll/sealed/wax_on = new /obj/item/scroll/sealed (src.loc)
		wax_on.message = message
		qdel(src)

	if(isflamesource(I)) //casts effects or just burns away if no spell works.

		if(M.species?.reagent_tag == IS_SYNTHETIC || M.species?.reagent_tag == IS_SLIME)
			to_chat(M, "<span class='warning'>You ignite the scroll. But nothing happens.</span>")
			ScrollBurn()
			return


/*
		if(message == "Example Spell.")
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			example_spell(M) //I cast proc!
			return
*/


		if(findtext(message, "Mist."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			mist_spell(M)
			return

		if(findtext(message, "Shimmer."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			shimmer_spell(M)
			return

		if(findtext(message, "Smoke."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			smoke_spell(M)
			return

		if(findtext(message, "Oil."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			oil_spell(M)
			return

		if(findtext(message, "Floor Seal."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			floor_seal_spell(M)
			return

		if(findtext(message, "Light."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			light_spell(M)
			return

		if(findtext(message, "Gaia."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns the ashes sharply move downwards as the world's twisting aura straightens.</span>")
			gaia_spell(M)
			return

		if(findtext(message, "Eta."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash flying every direction away with a world pushing force.</span>")
			eta_spell(M)
			return

		if(findtext(message, "Reveal."))
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash, the smoke from the scroll pressing into peoples eyes.</span>")
			reveal_spell(M)
			return

		if(findtext(message, "Entangle."))
			to_chat(M, "<span class='warning'>You ignite the scroll. Soft bright silk weaves its way thru the air around you.</span>")
			entangle_spell(M)
			return

		if(findtext(message, "Joke."))
			to_chat(M, "<span class='warning'>You ignite the scroll. Words fill the page and you quickly read them off before suddenly forgetting them.</span>")
			joke_spell(M)
			return

		if(findtext(message, "Charger."))
			to_chat(M, "<span class='warning'>You ignite the scroll. Crackling fills the air. Static clings to everything.</span>")
			charger_spell(M)
			return

// If we don't cast anything then we end up doing a normal burn.
		to_chat(M, "<span class='warning'>You ignite the scroll. It burns for a few moments before becoming ash.</span>")
		ScrollBurn()
		return
