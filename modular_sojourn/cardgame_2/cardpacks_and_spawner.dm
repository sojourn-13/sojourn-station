/obj/random/card_carp/pelt_and_normal_cards
	name = "pelt and normal random card carp"

/obj/random/card_carp/item_to_spawn()
	return pickweight(list(
				/obj/random/card_carp = 1,
				/obj/random/card_carp/pelt = 1,
				))

/obj/random/card_carp
	name = "random card carp"
	icon_state = "techloot-grey"

/obj/random/card_carp/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/crab = 1,
				/obj/item/card_carp/cat = 1,
				/obj/item/card_carp/stote = 1,
				/obj/item/card_carp/stinkbug = 1,
				/obj/item/card_carp/stunted_wolf = 1,
				/obj/item/card_carp/croaker_lord = 1,
				/obj/item/card_carp/wolf = 1,
				/obj/item/card_carp/adder = 1,
				/obj/item/card_carp/manti = 1,
				/obj/item/card_carp/mole = 1,
				/obj/item/card_carp/coyote = 1,
				/obj/item/card_carp/elk = 1,
				/obj/item/card_carp/river_otter = 1,
				/obj/item/card_carp/grizzly = 1,
				/obj/item/card_carp/kingfisher = 1,
				/obj/item/card_carp/warren = 1,
				/obj/item/card_carp/daus = 1,
				/obj/item/card_carp/larva = 1,
				/obj/item/card_carp/pupa = 1,
				/obj/item/card_carp/beaver = 1,
				/obj/item/card_carp/cockroach = 1,
				/obj/item/card_carp/ant = 1,
				/obj/item/card_carp/antqueen = 1,
				/obj/item/card_carp/ratking = 1,
				/obj/item/card_carp/plaguerat = 1,
				/obj/random/card_carp/flying = 1,
				/obj/random/card_carp/terrain = 1,
				/obj/random/card_carp/rare = 1 //Rare is rare
				))

/obj/random/card_carp/flying
	name = "random rare card carp"
	icon_state = "techloot-grey"


/obj/random/card_carp/flying/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/magpie = 1,
				/obj/item/card_carp/sparrow = 1,
				/obj/item/card_carp/bat = 1,
				/obj/item/card_carp/kangaroorat = 1,
				/obj/item/card_carp/turkey_vulture = 1
				))

/obj/random/card_carp/rare
	name = "random rare card carp"
	icon_state = "techloot-grey"


/obj/random/card_carp/rare/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/goat = 1,
				/obj/item/card_carp/manti_lord = 1,
				/obj/item/card_carp/mole_man = 1,
				/obj/item/card_carp/magpie = 1,
				/obj/item/card_carp/great_white = 1,
				/obj/item/card_carp/lost_rabbit = 1,
				/obj/item/card_carp/geck = 1,
				/obj/item/card_carp/mothman = 1,
				/obj/item/card_carp/wyrm = 1,
				/obj/item/card_carp/ratking = 1,
				/obj/item/card_carp/packrat = 1,
				/obj/item/card_carp/chipmunk = 1,
				/obj/item/card_carp/fieldmice = 1
				))

/obj/random/card_carp/terrain
	name = "random terrain card carp"
	icon_state = "techloot-grey"


/obj/random/card_carp/terrain/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/tree = 1,
				/obj/item/card_carp/pinetree = 1,
				/obj/item/card_carp/rock = 1,
				/obj/item/card_carp/bloodrock = 1
				))

/obj/random/card_carp/pelt
	name = "random card carp pelt"
	icon_state = "techloot-grey"

/obj/random/card_carp/pelt/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/rpelt = 1,
				/obj/item/card_carp/dpelt = 1,
				/obj/item/card_carp/pinepelt = 1,
				/obj/item/card_carp/peltlice = 1,
				/obj/item/card_carp/tanningpelt = 1,
				/obj/item/card_carp/gpelt = 1
				))

/obj/item/pack_card_carp
	name = "CardCarpCo Pack"
	desc = "For those with disposible income. Contains 5 cards and a pelt card."
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	icon_state = "card_pack"
	w_class = ITEM_SIZE_TINY

/obj/item/pack_card_carp/attack_self(var/mob/user as mob)
	user.visible_message("[user] rips open \the [src]!")
	var/turf/T = get_turf(src)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp/pelt(T)

	qdel(src)

/obj/item/pack_card_carp/flyers_booster_pack
	name = "CardCarpCo Flyer Booster Pack"
	desc = "For those with disposible income. Contains 3 cards, 2 are guaranted to be flyers and a pelt card."
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	icon_state = "card_pack"
	w_class = ITEM_SIZE_TINY

/obj/item/pack_card_carp/attack_self(var/mob/user as mob)
	user.visible_message("[user] rips open \the [src]!")
	var/turf/T = get_turf(src)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp/flying(T)
	new /obj/random/card_carp/flying(T)
	new /obj/random/card_carp/pelt(T)

	qdel(src)

/obj/item/pack_card_carp/rare_booster_pack
	name = "CardCarpCo Rare Booster Pack"
	desc = "For those with disposible income. Contains 3 cards, 1 are guaranted to be rare and a pelt card."
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	icon_state = "card_pack"
	w_class = ITEM_SIZE_TINY

/obj/item/pack_card_carp/attack_self(var/mob/user as mob)
	user.visible_message("[user] rips open \the [src]!")
	var/turf/T = get_turf(src)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp(T)
	new /obj/random/card_carp/rare(T)
	new /obj/random/card_carp/pelt(T)

	qdel(src)
