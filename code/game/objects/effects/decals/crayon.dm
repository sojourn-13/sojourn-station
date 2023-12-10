/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	layer = TURF_DECAL_LAYER
	anchored = TRUE
	random_rotation = 0
	sanity_damage = 4
	var/obj/item/pen/crayon/follow_crayon
	var/is_rune = FALSE

/obj/effect/decal/cleanable/crayon/Destroy()
	follow_crayon = null
	..()

// Mist rune, invoked by Scribe scrolls, doesn't allow laser beams to pass through it.
/obj/effect/decal/cleanable/crayon/mist
	name = "strange rune"
	desc = "A fine mist comes off this rune"
	alpha = 150

/obj/effect/decal/cleanable/crayon/mist/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile/beam))
		return FALSE
	return TRUE

// Shimmer rune, invoked by Scribe scrolls, doesn't allow neither lasers nor projectiles to pass through.
/obj/effect/decal/cleanable/crayon/shimmer
	name = "strange rune"
	desc = "The air shimmers about this rune."
	alpha = 150

/obj/effect/decal/cleanable/crayon/shimmer/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile) && !istype(mover, /obj/item/projectile/beam))
		return FALSE
	return TRUE

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

/****************************/
/* CRAYON ITEMS AND DOODADS */
/****************************/

 // The pouch of wonderful single item sharing!
/obj/item/crayon_pouch
	name = "crayon pouch"
	desc = "What seems to be a normal crayon box has turned into something far more strange."
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
	desc = "Sharpened crayons. Used untill they have become the perfectly balanced weight for throwing."
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

// BLOOD FONT!!!
/obj/structure/sink/basion/crayon
	name = "blood basin"
	desc = "A deep basin of polished obsidian that forever fills with gore. \
			An inkwell of blood in which to dip your fingers to write in blood."
	icon_state = "blood_basin"
	density = 1
	limited_reagents = FALSE
	refill_rate = 200
	reagent_id = "blood"

/obj/structure/sink/basion/crayon/attack_hand(mob/living/carbon/human/user) //gives us bloody hands for writing spells.
	if(istype(user))
		if(user.gloves)
			to_chat(user, SPAN_NOTICE("You must take off your gloves to dip your fingers in blood."))
			return FALSE
		to_chat(user, SPAN_NOTICE("You dip your fingers on the basin, covering them in blood."))
		user.bloody_hands += 5
		user.hand_blood_color = "#A10808"
		user.update_inv_gloves(1)
		user.verbs += /mob/living/carbon/human/proc/bloody_doodle

/obj/structure/sink/basion/crayon/attackby(obj/item/I, mob/user)
	if(I.has_quality(QUALITY_BOLT_TURNING))
		anchored = !anchored
		to_chat(user, SPAN_NOTICE("You [anchored? "" : "un"]secured \the [src]!"))
		playsound(loc, 'sound/items/Ratchet.ogg', 75, 1)
		return

// Scrolls allowing anyone to cast their effects by burning them.
obj/item/scroll
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
obj/item/scroll/attackby(obj/item/I, mob/living/carbon/human/M)
	..()
	if(istype(I, /obj/item/stack/wax) && !istype(I, /obj/item/scroll/sealed)) //seal the scroll
		var/obj/item/stack/wax/W = I
		if(W.amount < 1) //No you can't use part of the wax to seal the WHOLE scroll.
			return
		W.use(1)
		var/obj/item/scroll/sealed/wax_on = new /obj/item/scroll/sealed (src.loc)
		wax_on.message = message
		qdel(src)

	if(QUALITY_WELDING in I.tool_qualities || istype(I, /obj/item/flame)) //casts effects or just burns away if no spell works.

		/*
		if(message == "Example Spell." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			example_spell(M) //I cast proc!
			return
		*/

		if(message == "Mist." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			mist_spell(M)
			return

		if(message == "Shimmer." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			shimmer_spell(M)
			return

		if(message == "Smoke." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			smoke_spell(M)
			return

		if(message == "Oil." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			oil_spell(M)
			return

		if(message == "Floor Seal." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			floor_seal_spell(M)
			return

		if(message == "Light." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			light_spell(M)
			return

		if(message == "Mightier." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			mightier_spell(M)
			return

// If we don't cast anything then we end up doing a normal burn.
		to_chat(M, "<span class='warning'>You ignite the scroll. It burns for a few moments before becoming ash.</span>")
		ScrollBurn()
		return

// Proc that controls all Book-type spells
/obj/effect/decal/cleanable/crayon/attackby(obj/item/I, mob/living/carbon/human/M)
	..()
	if(istype(I, /obj/item/oddity/common/book_unholy) || istype(I, /obj/item/oddity/common/book_omega))
		if(M.disabilities&NEARSIGHTED && is_rune && M.species?.reagent_tag != IS_SYNTHETIC)
			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>You try to do as the book describes but your frail body condition physically prevents you from even mumbling a single word out of its pages.</span>")
				return
			to_chat(M, "<span class='info'>The rune lights up in reaction to the book...</span>")
			if(follow_crayon)
				var/old_desc = "[I.desc]"
				follow_crayon.desc = "[old_desc] The strange energies of this planet seem to have infused it with more signicance than before."
				desc = "A rune drawn in empowered crayon wax."
				follow_crayon = null
			var/alchemist = FALSE
			if(M.stats.getPerk(PERK_ALCHEMY))
				alchemist = TRUE // We are an alchemist!
			var/datum/reagent/organic/blood/B = M.get_blood()
			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3))
				if(!mage_candle.lit)
					mage_candle.light(flavor_text = SPAN_NOTICE("\The [name] lights up."))
					mage_candle.endless_burn = TRUE
					B.remove_self(15)
					M.sanity.changeLevel(-5)
					to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
				candle_amount += 1

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Don't forget to clear your old work!

				// Spell example

				/*if(spell.message == "Example Spell." && candle_amount >= 0)
					example_spell(M)
					continue*/

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

				if((spell.message == "Madness." || spell.message == "Insanity.") && candle_amount >= 3)
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
					recipe_spell(M, alchemist)
					continue

				if((spell.message == "Bees." || spell.message == "Bees!") && candle_amount >= 4)
					bees_spell(M)
					continue

				if(spell.message == "Scribe." && candle_amount >= 7)
					scribe_spell(M)
					continue

				if(spell.message == "Pouch." && candle_amount >= 2)
					pouch_spell(M)
					continue

				if(spell.message == "Awaken." && candle_amount >= 7)
					awaken_spell(M)
					continue
				// Alchemy-specific rituals below
				if(spell.message == "Satchel." && candle_amount >= 5)
					satchel_spell(M, alchemist)
					continue
				/* WIP!!!
				if(spell.message == "Transmute." && candle_amount >= 6)
					transmutation_spell(M)
					continue */
			return

// Ritual Knife spell procs
	if(istype(I, /obj/item/tool/knife/ritual) || istype(I, /obj/item/tool/knife/neotritual))
		if(M.disabilities&NEARSIGHTED && is_rune && M.species?.reagent_tag != IS_SYNTHETIC)

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>Your hand is shaking, your concentration too shattered. The ritual cannot proceed with your constitution as frail as it is.</span>")
				return
			to_chat(M, "<span class='info'>The rune lights up in response to the touch of the ritual weapon...</span>")
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

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Don't forget to clear your old work!
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

				if(spell.message == "Scroll." && candle_amount >= 7)
					scroll_spell(M)
					continue

				if(spell.message == "Fountain." && candle_amount >= 7)
					basin_spell(M)
					continue

				if(spell.message == "Ascension." && candle_amount >= 7)
					ascension_spell(M)
					continue

				if(spell.message == "Veil." && candle_amount >= 5)
					veil_spell(M)
					continue
				return

// Start of scroll based spells.
// We use this proc to assign spells to the blank scroll by writing in blood the name of the spells we want inscribed on them
// then attacking a rune with the scroll in question (which must NOT be sealed)
	if(istype(I, /obj/item/scroll) && !istype(I, /obj/item/scroll/sealed) && M.stats.getPerk(PERK_SCRIBE)) // we have to have the new perk for this.
		if(M.disabilities&BLIND && is_rune && M.species?.reagent_tag != IS_SYNTHETIC) // We need to be BLIND for these rituals specifically.

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>Your frail body condition physically prevents you from performing any further rituals with scrolls.</span>")
				return

			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3)) // We don't light candles but we still do the check.
				candle_amount += 1

			to_chat(M, "<span class='info'>The smell of iron fills the air as the scroll fumbles out of your hands.</span>")

			var/obj/item/scroll/S = new /obj/item/scroll(src.loc) // Hard set a new scroll. Cause I don't trust players
			M.drop_from_inventory(I)
			qdel(I)

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) // Finds writing then consumes it and the rune.
				if(spell.message && candle_amount >= 7)
					S.message = spell.message
					qdel(spell) // We consume the spell
					S.name = "strange scroll"
					if(S.message != "")
						S.icon_state = "Scroll circle"
						S.desc = "A scroll covered in various glyphs and runes."
						qdel(src) //Eat the rune, nom nom
						return
					else S.icon_state = "Scroll blood"
					S.desc = "A scroll with a large rune on it."
					qdel(src) // We consume the rune.
					return
				return
			return
		return
	return


/****************************/
/* BOOK SPELLS PROCS START! */
/****************************/

// Book spell proc example:
/*
/obj/effect/decal/cleanable/crayon/proc/example_spell(mob/living/carbon/human/M) //testing spell
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(1)
	log_and_message_admins("[M] has used the example spell! For testing purposes of course!")
*/


// Babel: Grants you knowledge of the Cult language.
// This is a requirement for the ritual knife spells, perhaps for more complex spells in future too
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

// Ignorance: Basically become impervious to telepathic messages from psions.
/obj/effect/decal/cleanable/crayon/proc/ignorance_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.psi_blocking_additive = 50
	to_chat(M, "<span class='warning'>Your mind feels like an impenetrable fortress against psionic assaults. Your heart is beating like a drum, exerting itself to recover the blood paid for your boon.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(50)
	M.sanity.changeLevel(-35)
	return

// Life: Revives a dead animal on top of the rune.
// FIXME: For some reason this sometimes revives mobs in sight as well
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
			M.sanity.changeLevel(-10)
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
			M.sanity.changeLevel(-10)
			return
		return
	return

// Madness: Become weaker, and cause a sanity breakdown upon yourself.
/obj/effect/decal/cleanable/crayon/proc/madness_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>Your blood runs thin as you catch a glimpse of forbidden aeons, shortening your lifespan as you come to terms with your feeble inconsequentiality on the greater scheme of things.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(20)
	M.sanity.breakdown(TRUE)
	M.sanity.changeLevel(30)
	return

// Sight: Removes your Nearsighted and blind disabilities, if you have them
// You will be unable to use crayon magic again unless you somehow gain it through mutations/genetics
/obj/effect/decal/cleanable/crayon/proc/sight_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	if(M.disabilities&NEARSIGHTED)
		M.disabilities &= ~NEARSIGHTED
	if(M.disabilities&BLIND)
		M.disabilities &= ~BLIND
	else // Sanity check
		to_chat(M, "<span class='warning'>Something is wrong. Only people with lacking vision are supposed to cast this.</span>")
	to_chat(M, "<span class='warning'>Your vision is impaired no more, your heart stresses itself to recover the blood paid for your blinding to the dark arts. The eyes deceive, true perception will be achieved without their hindrance.</span>")
	B.remove_self(150)
	M.sanity.changeLevel(30)
	return

// Paradox: Literally kill yourself. No really, this removes a lot of blood, causes a sanity breakdown upon the character
// And on top of it causes an explosion centered on the caster, most totally gibbing them.
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
/obj/effect/decal/cleanable/crayon/proc/end_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
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
	bluespace_entropy(-5, get_turf(src), TRUE)
	B.remove_self(60) //Takes more to heal then harm
	M.sanity.changeLevel(-15)
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

// Brew: Grants you the Alchemist perk, and access to all the recipes required by it
/obj/effect/decal/cleanable/crayon/proc/brew_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
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

// Bees: NOT THE BEES!! Invokes a gigantic bee per funflower on a five-tiles radius around the spell circle
/obj/effect/decal/cleanable/crayon/proc/bees_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 10
	M.health -= 10
	for(var/obj/item/reagent_containers/food/snacks/grown/G in oview(5))
		if(G.name == "sunflower") // Apply all costs ONLY if the plant is the correct one!!!
			to_chat(M, "<span class='info'>Distant voices scream in agony from every direction: NOT THE BEES!</span>")
			new /mob/living/carbon/superior_animal/vox/wasp(G.loc)
			B.remove_self(70)
			M.sanity.changeLevel(4)
			qdel(G)
	return

// Pouch: Spawns a pouch with a dimensional-linked shared storage. Every person holding one of these can access the same storage from anywhere.
// Works only if the pouch is opened, and accessed while being held in-hand
/obj/effect/decal/cleanable/crayon/proc/pouch_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/storage/pill_bottle/dice/frodo in oview(1))
		B.remove_self(50)
		M.sanity.changeLevel(-50) //not always going to break you. But will tank your sanity.
		to_chat(M, "<span class='warning'>The dice bag gives a loud pop.</span>")
		new /obj/item/crayon_pouch(frodo.loc)
		qdel(frodo)
	return

// Scribe: Gives you the Scribe perk. This is a requirement for inscribing scrolls with the spells below.
/obj/effect/decal/cleanable/crayon/proc/scribe_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/mob/living/carbon/human/H = M
	for(var/obj/item/paper/P in oview(1)) // Requires a paper
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
/obj/effect/decal/cleanable/crayon/proc/awaken_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/tool/knife/ritual/knifey in oview(1)) // No ascending church knives
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

/* STILL A WIP !!! A DRAFT!! Will be HEAVILY expanded upon

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
// Beware, lest you turn yourself into a was once through this!
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
		M.sanity.changeLevel(-20)
		return

	for(var/mob/living/simple_animal/lesser in oview(1))
		to_chat(M, "<span class='warning'>The sacrifice vanishes to dust before you. You feel an ominous warm wind envelop your form as you absorb its lifeforce unto your own.</span>")
		if(able_to_cast)
			M.maxHealth += 1
			M.health += 1
			M.unnatural_mutations.total_instability += 1 //A soft cap
		B.remove_self(70)
		lesser.dust()
		M.sanity.changeLevel(-20)
		return
	return

// Cards: Invokes a random carp card, to use with other spells
/obj/effect/decal/cleanable/crayon/proc/cards_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>A voice whispers in front of you: Any foils?</span>")
	for(var/obj/item/device/camera_film in oview(1)) // Must be on the spell circle
		B.remove_self(10)
		new /obj/random/card_carp(src.loc)
		M.sanity.changeLevel(-3)
	return

// Cards to Life: Consumes a Carp card of a certain type to summon an animal accordingly.
// The animal in question is tamed, friendly to the colony, but are incredibly frail and weak.
// Pelt cards can be turned into scroll pouches, Warren turns into a burrow
/obj/effect/decal/cleanable/crayon/proc/cards_to_life_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var /mob/living/simple_animal/simplemob = /mob/living/simple_animal/hostile/creature
	var /mob/living/carbon/superior_animal/superiormob = null
	for(var/obj/item/card_carp/carpy in oview(1))
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
		if(istype(carpy, /obj/item/card_carp/ant)) superiormob = /mob/living/carbon/superior_animal/termite_no_despawn/iron
		if(istype(carpy, /obj/item/card_carp/antqueen)) superiormob = /mob/living/carbon/superior_animal/termite_no_despawn/diamond
		//superior beasties
		if(istype(carpy, /obj/item/card_carp/wyrm)) superiormob = /mob/living/carbon/superior_animal/wurm/diamond
		if(istype(carpy, /obj/item/card_carp/daus)) superiormob = /mob/living/carbon/superior_animal/genetics/fratellis //genetics beastie
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

// Equalize: This spell pools together the entire average percentage of blood from all mobs in sight
// and distributes it equally among the number of mobs, "equalizing" it.
// e.g: If a person has 100% blood and another has 50%, both have 75% blood now
// and then the caster incurrs the blood cost for the spell equal to 20 per person affected, up to a cap of 80 cost.
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
/obj/effect/decal/cleanable/crayon/proc/basin_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/structure/reagent_dispensers/watertank/W in oview(1)) // Must be on the spell circle
		to_chat(M, "<span class='info'>Thunder crackles as a miniature cloud of nothingness manifests itself. Blood begins pouring down, forming an omnious obsidian basin beneath it...</span>")
		B.remove_self(100) // Basically pouring your blood into a container, insane
		M.sanity.breakdown(TRUE) // If your blood got sucked and poured into a container you too would freak out
		M.sanity.changeLevel(-50)
		var/obj/structure/sink/basion/crayon/N = new /obj/structure/sink/basion/crayon
		N.loc = W.loc
		qdel(W)
	return

// Ascension: "Opens" your current book (Occult or Unholy) and "transforms" it into an improved version
// Occult always has the Alchemist perk, Unholy has the Scribe perk
// They have slightly better stats than their stock counterparts and can be used for rituals
/obj/effect/decal/cleanable/crayon/proc/ascension_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/oddity/common/O in oview(1))
		if(istype(O, /obj/item/oddity/common/book_omega/closed))
			to_chat(M, "<span class='info'>The book floats before you and opens, new information within being written as your eyes pour over it!</span>")
			B.remove_self(80)
			M.sanity.breakdown(TRUE) // You are driven insane
			M.sanity.changeLevel(-30)
			playsound(loc, 'sound/bureaucracy/bookopen.ogg')
			new /obj/item/oddity/common/book_omega/opened(O.loc)
			qdel(O)
		if(istype(O, /obj/item/oddity/common/book_unholy/closed))
			to_chat(M, "<span class='info'>The book floats before you and opens, new information within being written as your eyes pour over it!</span>")
			B.remove_self(80)
			M.sanity.breakdown(TRUE) // You are driven insane
			M.sanity.changeLevel(-30)
			playsound(loc, 'sound/bureaucracy/bookopen.ogg')
			new /obj/item/oddity/common/book_unholy/opened(O.loc)
			qdel(O)
		else
			to_chat(M, "<span class='info'>This oddity is not a book, knowledge on how to improve it is beyond your grasp.</span>")

// Veil: Invoke a blindfold that works as prescription goggles with one extra tile of visibility in the dark
// These work as normal blindfolds for people who do not have the Cult language learned.
/obj/effect/decal/cleanable/crayon/proc/veil_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/clothing/glasses/blindfold/G in oview(1))
		to_chat(M, "<span class='info'>The blindfold glows for a moment before falling silent, forces unknown apparently strengthened its properties...</span>")
		B.remove_self(80)
		M.sanity.changeLevel(-10)
		var/obj/item/clothing/glasses/crayon_blindfold/N = new /obj/item/clothing/glasses/crayon_blindfold
		N.loc = G.loc
		qdel(G)

//Scroll: Massive blood cost spell that requires a dead animal to invoke a scroll.
// Scrolls can only be used by casters with the Scribe perk!
/obj/effect/decal/cleanable/crayon/proc/scroll_spell(mob/living/carbon/human/M) // Able to be casted by all. But only filled out by scribes.
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/target in oview(1))
		if(target.stat != DEAD) // Has to be dead. Use Drain if you want to super kill things.
			return
		B.remove_self(50) // Consume the blood cost only if it succeeds!!
		M.sanity.changeLevel(-5)
		new /obj/item/scroll(src.loc)
		qdel(target)
	for(var/mob/living/simple_animal/target in oview(1))
		if(target.stat != DEAD)
			return
		B.remove_self(50)
		M.sanity.changeLevel(-5)
		new /obj/item/scroll(src.loc)
		qdel(target)
	return

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
	bluespace_entropy(20, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/crayon/mist(M.loc)
	ScrollBurn()

// Shimmer: Invokes a crayon mark that blocks both bullets and laser projectiles.
/obj/item/scroll/proc/shimmer_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(100)
	bluespace_entropy(20, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/crayon/shimmer(M.loc)
	ScrollBurn()

// Smoke: Creates a smoke cloud centered around the caster
/obj/item/scroll/proc/smoke_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(50) //decently high just to protect server performance.
	var/datum/effect/effect/system/smoke_spread/chem/smoke = new
	var/datum/reagents/gas_storage = new /datum/reagents(100, src)
	gas_storage.add_reagent("crayon_dust_red", 100) //CRAYON MAGIC
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
	bluespace_entropy(10, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/liquid_fuel(M.loc,300, 1) //considered a trap cause you instant ignite yourself XD
	ScrollBurn()

// Floor Seal: For every floor tile in sight that is covered by liquid fuel, this spell fixes them all.
/obj/item/scroll/proc/floor_seal_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(50)
	for(var/obj/effect/decal/cleanable/liquid_fuel/fixy_juice in oview(7))
		bluespace_entropy(1, get_turf(src), TRUE) //on a per juice basis
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
	var/obj/effect/decal/cleanable/crayon/light_rune = new /obj/effect/decal/cleanable/crayon(M.loc)
	light_rune.set_light(5,4,"#FFFFFF")
	light_rune.name = "glowing rune"
	light_rune.desc = "A bright rune giving off vibrant light."
	light_rune.color = "#FFFF00"
	B.remove_self(20)
	bluespace_entropy(20, get_turf(src), TRUE) //high entropy cost. Low blood cost.
	ScrollBurn()

// Mightier: Invokes throwing crayons whose strength gets higher the lower our max HP is.
/obj/item/scroll/proc/mightier_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	bluespace_entropy(10, get_turf(src), TRUE)
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
	ScrollBurn()
