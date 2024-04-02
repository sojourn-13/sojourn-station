/obj/random/card_carp/pelt_and_normal_cards
	name = "pelt and normal random card carp"

/obj/random/card_carp/item_to_spawn()
	return pickweight(list(
				/obj/random/card_carp = 20,
				/obj/random/card_carp/pelt = 1,
				))

/obj/random/card_carp
	name = "random card carp"
	icon_state = "techloot-grey"

/obj/random/card_carp/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/crab = 2,
				/obj/item/card_carp/cat = 3,
				/obj/item/card_carp/stote = 5,
				/obj/item/card_carp/stinkbug = 5,
				/obj/item/card_carp/stunted_wolf = 6,
				/obj/item/card_carp/croaker_lord = 6,
				/obj/item/card_carp/wolf = 7,
				/obj/item/card_carp/adder = 2,
				/obj/item/card_carp/manti = 5,
				/obj/item/card_carp/mole = 5,
				/obj/item/card_carp/coyote = 7,
				/obj/item/card_carp/elk = 6,
				/obj/item/card_carp/river_otter = 6,
				/obj/item/card_carp/grizzly = 7,
				/obj/item/card_carp/kingfisher = 2,
				/obj/item/card_carp/sparrow = 6,
				/obj/item/card_carp/turkey_vulture = 6,
				/obj/item/card_carp/warren = 6,
				/obj/item/card_carp/bat = 7,
				/obj/item/card_carp/daus = 2,
				/obj/item/card_carp/larva = 4,
				/obj/item/card_carp/pupa = 5,
				/obj/item/card_carp/beaver = 3,
				/obj/item/card_carp/cockroach = 4,
				/obj/item/card_carp/ant = 3,
				/obj/item/card_carp/antqueen = 2,
				/obj/item/card_carp/ratking = 3,
				/obj/item/card_carp/plaguerat = 5,
				/obj/item/card_carp/kangaroorat = 3,
				/obj/random/card_carp/terrain = 4,
				/obj/random/card_carp/rare = 1 //Rare is rare
				))

/obj/random/card_carp/rare
	name = "random rare card carp"
	icon_state = "techloot-grey"


/obj/random/card_carp/rare/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/goat = 1,
				/obj/item/card_carp/manti_lord = 4,
				/obj/item/card_carp/mole_man = 6,
				/obj/item/card_carp/magpie = 7,
				/obj/item/card_carp/great_white = 4,
				/obj/item/card_carp/lost_rabbit = 6,
				/obj/item/card_carp/geck = 1,
				/obj/item/card_carp/mothman = 2,
				/obj/item/card_carp/wyrm = 4,
				/obj/item/card_carp/ratking = 4,
				/obj/item/card_carp/packrat = 6,
				/obj/item/card_carp/chipmunk = 3,
				/obj/item/card_carp/fieldmice = 4
				))

/obj/random/card_carp/terrain
	name = "random terrain card carp"
	icon_state = "techloot-grey"


/obj/random/card_carp/terrain/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/tree = 4,
				/obj/item/card_carp/pinetree = 2,
				/obj/item/card_carp/rock = 3,
				/obj/item/card_carp/bloodrock = 1
				))

/obj/random/card_carp/pelt
	name = "random card carp pelt"
	icon_state = "techloot-grey"

/obj/random/card_carp/pelt/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/rpelt = 20,
				/obj/item/card_carp/dpelt = 10,
				/obj/item/card_carp/pinepelt = 5,
				/obj/item/card_carp/peltlice = 3,
				/obj/item/card_carp/gpelt = 1 //SO RARE
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

