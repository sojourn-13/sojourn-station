/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	layer = TURF_DECAL_LAYER
	anchored = TRUE
	random_rotation = 0
	sanity_damage = 4
	var/is_rune = FALSE

/obj/item/stack/thrown/crayons
	name = "throwing crayons"
	desc = "Sharpened crayons. Used till they have become the perfectly balanced weight for throwing."
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
	var/hp_throwing_damage = ((200 - max(M.maxHealth, 30)) / 5) //the lower our health the more damage we do. At 60 hp we do about 28 damage. Maxes at 34.
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

/obj/effect/decal/cleanable/crayon/mist
	name = "strange rune"
	desc = "A fine mist comes off this rune"
	alpha = 150

/obj/effect/decal/cleanable/crayon/mist/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile/beam))
		return FALSE
	return TRUE

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

//various items and doo-dads
 //the pouch of wonderful single item sharing!
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

/obj/item/storage/pouch/medium_generic/crayon_linker //the special storage pouch that all the crayon pouches link to.

/obj/item/storage/pouch/medium_generic/crayon_linker/storage_depth_turf()
	return -1 //Were always going to be accessable throught dept as this is meant for nested items

/obj/item/storage/pouch/medium_generic/crayon_linker/attack_self(mob/user as mob)
	open(user)

/obj/item/storage/pouch/medium_generic/crayon_linker/Adjacent()
	return TRUE

// used in admin testing so I don't have to constantly var edit myself to be nearsighted
/obj/item/device/camera/crayon_mage
	desc = "why is the light on the back?"
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

 //BLOOD FONT!
/obj/structure/sink/basion/crayon
	name = "blood basion"
	desc = "A deep basin of polished stone that forever fills with gore."
	icon_state = "BaptismFont_Water"
	density = 1
	limited_reagents = FALSE
	refill_rate = 200
	reagent_id = "blood"

/obj/structure/sink/basion/crayon/attack_hand(mob/living/carbon/human/user) //gives us bloody hands for writing spells.
	if (istype(user))
		if (user.gloves)
			return FALSE
		to_chat(user, SPAN_NOTICE("You get some blood on your hands."))
		user.bloody_hands += 5
		user.hand_blood_color = "red"
		user.update_inv_gloves(1)
		user.verbs += /mob/living/carbon/human/proc/bloody_doodle

//scrolls allowing anyone to cast their effects by burning them.
obj/item/scroll
	name = "blank scroll"
	desc = "A blank canvus in which to express yourself."
	icon = 'icons/obj/scroll_bandange.dmi' //icons thanks to Ezoken#5894
	icon_state = "Scrollstended"
	item_state = "crayon_scroll_open"
	w_class = ITEM_SIZE_BULKY
	var/message = ""

//sealed scrolls are much smaller. They take wax to get tho.
obj/item/scroll/sealed
	name = "sealed scroll"
	desc = "A scroll sealed up with something, or nothing. Only one way to find out!"
	icon_state = "Scrollclosed"
	item_state = "crayon_scroll_closed"
	w_class = ITEM_SIZE_SMALL

/obj/item/storage/pouch/scroll //meant to take occult goodies and thats it.
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
		/obj/item/card_carp,
		/obj/item/device/camera_film)

/obj/item/scroll/proc/ScrollBurn()
	var/mob/living/M = loc
	if(istype(M))
		M.drop_from_inventory(src)
	new /obj/effect/decal/cleanable/ash(get_turf(src))
	qdel(src)

//scroll spells
obj/item/scroll/attackby(obj/item/I, mob/living/carbon/human/M)
	..()
	if(istype(I, /obj/item/stack/wax) && !istype(I, /obj/item/scroll/sealed)) //seal the scroll
		var/obj/item/stack/wax/W = I
		if(W.amount < 1) //No you can't use part of the wax to seal the WHOLE scroll.
			return
		W.use(1)
		var/obj/item/scroll/sealed/wax_on = new /obj/item/scroll/sealed (src.loc)
		wax_on.message = src.message
		qdel(src)

	if(QUALITY_WELDING in I.tool_qualities || istype(I, /obj/item/flame)) //casts effects or just burns away if no spell works.
/*		if(src.message == "Example Spell." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			example_spell(M) //I cast proc!
			return */

		if(src.message == "Mist." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			mist_spell(M)
			return

		if(src.message == "Shimmer." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			shimmer_spell(M)
			return

		if(src.message == "Smoke." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			smoke_spell(M)
			return

		if(src.message == "Oil." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			oil_spell(M)
			return

		if(src.message == "Floor Seal." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			floor_seal_spell(M)
			return

		if(src.message == "Light." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			light_spell(M)
			return

		if(src.message == "Mightier." && M.species?.reagent_tag != IS_SYNTHETIC)
			to_chat(M, "<span class='warning'>You ignite the scroll. It burns to ash with a world twisting aura.</span>")
			mightier_spell(M)
			return

//if we don't cast anything then we end up doing a normal burn.
		to_chat(M, "<span class='warning'>You ignite the scroll. It burns for a few moments before becoming ash.</span>")
		ScrollBurn()
		return

//start of book based spells
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
					M.sanity.changeLevel(-5)
					to_chat(M, "<span class='info'>A candle is lit by forces unknown...</span>")
				candle_amount += 1

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) //Dont forget to clear your old work
				/*if(spell.message == "Example Spell." && candle_amount >= 0) //Used for testing mostly.
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

				if(spell.message == "Scribe." && candle_amount >= 7)
					scribe_spell(M)
					continue

				if(spell.message == "Pouch." && candle_amount >= 2)
					pouch_spell(M)
					continue
			return

//start of ritual knife spells
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

			if(spell.message == "Scroll." && candle_amount >= 7)
				scroll_spell(M)
				continue
			return

//start of scroll based spells we use these to assign spells to the blank scroll before finishing it with bees wax.
	if(istype(I, /obj/item/scroll) && !istype(I, /obj/item/scroll/sealed) && M.stats.getPerk(PERK_SCRIBE)) // we have to have the new perk for this.
		if(M.disabilities&BLIND && is_rune && M.species?.reagent_tag != IS_SYNTHETIC) // we are BLIND for this. You wont be able to use normal rituals!

			//Anti-Death check
			if(M.maxHealth <= 30)
				to_chat(M, "<span class='info'>You try to do as the book describes but your frail body condition physically prevents you from even mumbling a single word out of its pages.</span>")
				return

			var/candle_amount = 0
			for(var/obj/item/flame/candle/mage_candle in oview(3)) // we don't light candles but we still do the check.
				candle_amount += 1

			to_chat(M, "<span class='info'>The smell of iron fills the air as the scroll fumbles out of your hands.</span>")

			var/obj/item/scroll/S = new /obj/item/scroll(src.loc) //hard set a new scroll. Cause I don't trust players
			M.drop_from_inventory(I)
			qdel(I)

			for(var/obj/effect/decal/cleanable/blood/writing/spell in oview(3)) //finds writing then consumes it and the rune.
				if(spell.message && candle_amount >= 7)
					S.message = spell.message
					qdel(spell) // we consume the spell
					S.name = "strange scroll"
					if(S.message != "")
						S.icon_state = "Scroll circle"
						S.desc = "A scroll covered in various glyphs and runes."
						qdel(src) //eat the rune, nom nom
						return
					else S.icon_state = "Scroll blood"
					S.desc = "A scroll with a large rune on it."
					qdel(src) // we consume the rune.
					return
				return
			return
		return
	return

//book spell procs
/*/obj/effect/decal/cleanable/crayon/proc/example_spell(mob/living/carbon/human/M) //testing spell
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(1)
	log_and_message_admins("[M] has used the example spell! For testing purposes of course!")*/

/obj/effect/decal/cleanable/crayon/proc/babel_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_CULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.unnatural_mutations.total_instability += 15
	M.sanity.changeLevel(-5)
	return

/obj/effect/decal/cleanable/crayon/proc/ignorance_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.psi_blocking_additive = 50
	to_chat(M, "<span class='warning'>Your mind feels like an impenetrable fortress against psionic assaults. Your heart is beating like a drum, exerting itself to recover the blood paid for your boon.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(50)
	M.sanity.changeLevel(-35)
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

/obj/effect/decal/cleanable/crayon/proc/madness_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>Your blood runs thin as you catch a glimpse of forbidden aeons, shortening your lifespan as you come to terms with your feeble inconsequentiality on the greater scheme of things.</span>")
	M.maxHealth -= 5
	M.health -= 5
	B.remove_self(20)
	M.sanity.breakdown(TRUE)
	M.sanity.changeLevel(30)
	return

/obj/effect/decal/cleanable/crayon/proc/sight_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>Your vision is impaired no more, your heart stresses itself to recover the blood paid for your blinding to the dark arts. The eyes deceive, true perception will be achieved without their hindrance.</span>")
	M.disabilities &= ~NEARSIGHTED
	B.remove_self(150)
	M.sanity.changeLevel(30)
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
	M.sanity.changeLevel(100)
	return

/obj/effect/decal/cleanable/crayon/proc/end_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>The truth of the universe flashes before your eyes at a sickening speed, eldritch knowledge being forcefully vacuumed out of your psyche. The light! It burns! IT BURNS!!!</span>")
	M.maxHealth += 5
	M.health += 5
	M.disabilities &= ~NEARSIGHTED
	B.remove_self(150)
	M.sanity.breakdown(TRUE)
	M.sanity.changeLevel(5)
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
	M.sanity.changeLevel(15)
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

/obj/effect/decal/cleanable/crayon/proc/brew_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(50)
	M.metabolism_effects.nsa_bonus -= 25 //Works to balance out the NSA given from the perk. That way those who get it naturally have a bonus.
	M.stats.addPerk(PERK_ALCHEMY)
	M.sanity.changeLevel(15)
	to_chat(M, "<span class='warning'>Your mind expands with creations lost. Your body feels sick.</span>")
	return


/obj/effect/decal/cleanable/crayon/proc/recipe_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/paper/P in oview(1)) // Must be on the spell circle
		to_chat(M, "<span class='info'>A echoing sound of scribbling fills the air.</span>")
		B.remove_self(20)
		var/obj/item/alchemy/recipe_scroll/S = new /obj/item/alchemy/recipe_scroll
		S.loc = P.loc
		qdel(P)
		M.sanity.changeLevel(-2)
	return

/obj/effect/decal/cleanable/crayon/proc/bees_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 10
	M.health -= 10
	to_chat(M, "<span class='info'>To make life from dyes, takes carbon...</span>")
	for(var/obj/item/reagent_containers/food/snacks/grown/G in oview(5))
		to_chat(M, "<span class='info'>Distant voices call out from everywhere. NOT THE BEES!</span>")
		B.remove_self(70)
		if(G.name == "sunflower")
			new /mob/living/carbon/superior_animal/vox/wasp(G.loc)
			qdel(G)
		M.sanity.changeLevel(4)
	return

/obj/effect/decal/cleanable/crayon/proc/scribe_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.maxHealth -= 25
	M.health -= 25
	B.remove_self(100)
	M.stats.addPerk(PERK_SCRIBE)
	M.sanity.changeLevel(20)
	to_chat(M, "<span class='warning'>In a single moment your vision vanishes. The understanding of scrolls fills your mind.</span>")
	return

/obj/effect/decal/cleanable/crayon/proc/pouch_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/obj/item/storage/pill_bottle/dice/frodo in oview(1))
		B.remove_self(50)
		M.sanity.changeLevel(-50) //not always going to break you. But will tank your sanity.
		to_chat(M, "<span class='warning'>The dice bag gives a loud pop.</span>")
		new /obj/item/crayon_pouch(frodo.loc)
		qdel(frodo)
	return

//ritual knife spell procs
/obj/effect/decal/cleanable/crayon/proc/voice_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	M.add_language(LANGUAGE_OCCULT)
	to_chat(M, "<span class='warning'>Your head throbs like a maddening heartbeat, eldritch knowledge gnawing open the doors of your psyche and crawling inside, granting you a glimpse of languages older than time itself. The heart pounds in synchrony, making up for the price of blood in exchange.</span>")
	M.maxHealth -= 20
	M.health -= 20
	B.remove_self(50)
	M.sanity.changeLevel(-20)
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

/obj/effect/decal/cleanable/crayon/proc/cards_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	to_chat(M, "<span class='warning'>A voice whispers infront you. Any foils?</span>")
	for(var/obj/item/device/camera_film in oview(1)) // Must be on the spell circle
		B.remove_self(15)
		new /obj/random/card_carp(src.loc)
		M.sanity.changeLevel(-3)
	return

/obj/effect/decal/cleanable/crayon/proc/cards_to_life_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var /mob/living/simple_animal/simplemob = /mob/living/simple_animal/hostile/creature
	var /mob/living/carbon/superior_animal/superiormob = null
	for(var/obj/item/card_carp/carpy in oview(1))
		M.sanity.changeLevel(1)
		to_chat(M, "<span class='warning'>The card rotates 90 degrees then begins to fold, twisting till it breaks open with a ripping sound.</span>")
		B.remove_self(50)
		//nonhostile mobs. The pets of the colony.
		if(istype(carpy, /obj/item/card_carp/crab)) simplemob = /mob/living/simple_animal/crab
		if(istype(carpy, /obj/item/card_carp/cat)) simplemob = /mob/living/simple_animal/cat
		if(istype(carpy, /obj/item/card_carp/geck)) simplemob = /mob/living/simple_animal/lizard
		if(istype(carpy, /obj/item/card_carp/goat)) simplemob = /mob/living/simple_animal/hostile/retaliate/goat
		if(istype(carpy, /obj/item/card_carp/larva)) simplemob = /mob/living/simple_animal/light_geist
		//corgi list
		if(istype(carpy, /obj/item/card_carp/stunted_wolf) || istype(carpy, /obj/item/card_carp/coyote) ||istype(carpy, /obj/item/card_carp/wolf)) simplemob = /mob/living/simple_animal/corgi
		//mice spawn below
		if(istype(carpy, /obj/item/card_carp/ratking) || istype(carpy, /obj/item/card_carp/plaguerat) || istype(carpy, /obj/item/card_carp/kangaroorat) || istype(carpy, /obj/item/card_carp/chipmunk) || istype(carpy, /obj/item/card_carp/fieldmice)) simplemob = /mob/living/simple_animal/mouse
		//retaliation and hostile mobs
		if(istype(carpy, /obj/item/card_carp/croaker_lord)) simplemob = /mob/living/simple_animal/hostile/retaliate/croakerlord
		if(istype(carpy, /obj/item/card_carp/lost_rabbit)) simplemob = /mob/living/simple_animal/hostile/diyaab
		if(istype(carpy, /obj/item/card_carp/adder)) simplemob = /mob/living/simple_animal/hostile/snake
		if(istype(carpy, /obj/item/card_carp/grizzly)) simplemob = /mob/living/simple_animal/hostile/bear
		if(istype(carpy, /obj/item/card_carp/bat)) simplemob = /mob/living/simple_animal/hostile/scarybat
		if(istype(carpy, /obj/item/card_carp/great_white)) simplemob = /mob/living/simple_animal/hostile/carp/greatwhite
		//birbs
		if(istype(carpy, /obj/item/card_carp/kingfisher) || istype(carpy, /obj/item/card_carp/sparrow) || istype(carpy, /obj/item/card_carp/turkey_vulture) || istype(carpy, /obj/item/card_carp/magpie)) simplemob = /mob/living/simple_animal/jungle_bird
		//hostile tree
		if(istype(carpy, /obj/item/card_carp/tree) || istype(carpy, /obj/item/card_carp/pinetree)) simplemob = /mob/living/simple_animal/hostile/tree
		//mantis
		if(istype(carpy, /obj/item/card_carp/manti) || istype(carpy, /obj/item/card_carp/manti_lord)) simplemob = /mob/living/simple_animal/tindalos

		//superior mobs below
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

		//nonmobs below this point
		//turned it into a purse
		if(istype(carpy, /obj/item/card_carp/rpelt) || istype(carpy, /obj/item/card_carp/dpelt) || istype(carpy, /obj/item/card_carp/pinepelt) || istype(carpy, /obj/item/card_carp/gpelt))
			new /obj/item/storage/pouch/scroll(carpy.loc)
			qdel(carpy)
			return
		//burrow
		if(istype(carpy, /obj/item/card_carp/warren))
			var/obj/structure/burrow/diggy_hole = new /obj/structure/burrow(carpy.loc)
			diggy_hole.deepmaint_entry_point = TRUE
			diggy_hole.isRevealed = TRUE
			diggy_hole.isSealed = FALSE
			diggy_hole.invisibility = 0
			diggy_hole.collapse()
			qdel(carpy)
			return

		//code that takes monstermob var and spawns whatever it was set too.
		if(superiormob != null)
			var /mob/living/carbon/superior_animal/editme = new superiormob(carpy.loc)
			editme.colony_friend = TRUE
			editme.friendly_to_colony = TRUE
			editme.faction = "Living Dead"
			editme.maxHealth = 5
			editme.health = 5
			qdel(carpy)
			return //we returned out so it shouldn't double up.

		var /mob/living/simple_animal/changemeupinside = new simplemob(carpy.loc)
		changemeupinside.colony_friend = TRUE
		changemeupinside.friendly_to_colony = TRUE
		changemeupinside.faction = "Living Dead"
		changemeupinside.maxHealth = 5
		changemeupinside.health = 5
		qdel(carpy)

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

		M.sanity.changeLevel(-5) //Good deads always get punished
	//caster blood handling below
	to_chat(M, "<span class='warning'>The sound of a heart beat fills the air around you.</span>")
	if(M.get_blood_volume() < bloodpercent)
		M.vessel.add_reagent("blood", (bloodpercent - (M.get_blood_volume() * 0.01)) * M.species.blood_volume)
	else M.vessel.remove_reagent("blood", ((M.get_blood_volume() * 0.01) - bloodpercent) * M.species.blood_volume)
	B.remove_self(min(20 * targets.len, 80))
	return

/obj/effect/decal/cleanable/crayon/proc/scroll_spell(mob/living/carbon/human/M) //able to be cast by all. But only filled out by scribes.
	var/datum/reagent/organic/blood/B = M.get_blood()
	for(var/mob/living/carbon/superior_animal/target in oview(1))
		B.remove_self(50)
		if(target.stat != DEAD) //has to be dead. Use Drain if you want to super kill things.
			return
		new /obj/item/scroll(src.loc)
		qdel(target)
		M.sanity.changeLevel(-5)
	for(var/mob/living/simple_animal/target in oview(1))
		B.remove_self(50)
		if(target.stat != DEAD)
			return
		new /obj/item/scroll(src.loc)
		qdel(target)
		M.sanity.changeLevel(-5)
	return

//start of scroll spells here!
/*obj/item/scroll/proc/example_spell(mob/living/carbon/human/M) //testing spell
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(1)
	log_and_message_admins("[M] has used the example spell! For testing purposes of course!")
	new /obj/item/scroll(M.loc)
	src.ScrollBurn() */

/obj/item/scroll/proc/mist_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(100)
	bluespace_entropy(20, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/crayon/mist(M.loc)
	src.ScrollBurn()

/obj/item/scroll/proc/shimmer_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(100)
	bluespace_entropy(20, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/crayon/shimmer(M.loc)
	src.ScrollBurn()

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
	src.ScrollBurn()

/obj/item/scroll/proc/oil_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	B.remove_self(25)
	bluespace_entropy(10, get_turf(src), TRUE)
	new /obj/effect/decal/cleanable/liquid_fuel(M.loc,300, 1) //considered a trap cause you instant ignite yourself XD
	src.ScrollBurn()

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
	src.ScrollBurn()

/obj/item/scroll/proc/light_spell(mob/living/carbon/human/M)
	var/datum/reagent/organic/blood/B = M.get_blood()
	var/obj/effect/decal/cleanable/crayon/light_rune = new /obj/effect/decal/cleanable/crayon(M.loc)
	light_rune.set_light(5,4,"#FFFFFF")
	light_rune.name = "glowing rune"
	light_rune.desc = "A bright rune giving off vibrant light."
	light_rune.color = "#FFFF00"
	B.remove_self(20)
	bluespace_entropy(20, get_turf(src), TRUE) //high entropy cost. Low blood cost.
	src.ScrollBurn()

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
	src.ScrollBurn()
