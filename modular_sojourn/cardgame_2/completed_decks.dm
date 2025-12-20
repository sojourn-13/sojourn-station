/obj/item/cardholder/precon
	name = "preconstructed cardcarp deck"
	desc = "A box of crappy cardcarp cards usually provided to new players. Intented to be played with the squirrel side deck."
	var/list/deckocards = list(
	/obj/item/card_carp/cat,
	/obj/item/card_carp/manti,
	/obj/item/card_carp/adder,
	/obj/item/card_carp/crab,
	/obj/item/card_carp/chipmunk,
	/obj/item/card_carp/ant,
	/obj/item/card_carp/geck,
	/obj/item/card_carp/bat,
	/obj/item/card_carp/wolf,
	/obj/item/card_carp/elk,
	/obj/item/card_carp/stinkbug,
	/obj/item/card_carp/stunted_wolf,
	/obj/item/card_carp/fieldmice,
	/obj/item/card_carp/packrat,
	/obj/item/card_carp/mole,
	/obj/item/card_carp/coyote,
	/obj/item/card_carp/grizzly,
	/obj/item/card_carp/mothman,
	/obj/item/card_carp/ratking,
	/obj/item/card_carp/magpie)

/obj/item/cardholder/precon/refresh_upgrades()
	..()
	//Ensures we are not snitching that we are a filthy precon builder
	name = "randomizer card box"
	desc = "A small box that self shuffles every time a card is added or drawn, making it always random. This only fits and works with CardCarpCo Cards. Alt Click to draw a card."


/obj/item/cardholder/precon/Initialize()
	. = ..()
	//Make sure to set are name and desc back to correct values
	name = "randomizer card box"
	desc = "A small box that self shuffles every time a card is added or drawn, making it always random. This only fits and works with CardCarpCo Cards. Alt Click to draw a card."
	for(var/path in deckocards)
		new path(src)

/obj/item/cardholder/precon/woodlands
	name = "\"Woodlands\" CardCarp deck"
	desc = "A box of CardCarp cards usually provided to intermediate players. Intended to be played with the squirrel side deck. This one is focused on stalling the game."
	deckocards = list(
		/obj/item/card_carp/tree,
		/obj/item/card_carp/tree,
		/obj/item/card_carp/pinetree,
		/obj/item/card_carp/pinetree,
		/obj/item/card_carp/rock,
		/obj/item/card_carp/rock,
		/obj/item/card_carp/river_otter,
		/obj/item/card_carp/river_otter,
		/obj/item/card_carp/magpie,
		/obj/item/card_carp/pinepelt,
		/obj/item/card_carp/bloodrock,
		/obj/item/card_carp/wyrm,
		/obj/item/card_carp/croaker_lord,
		/obj/item/card_carp/croaker_lord,
		/obj/item/card_carp/mole,
		/obj/item/card_carp/mole_man,
		/obj/item/card_carp/warren,
		/obj/item/card_carp/packrat,
		/obj/item/card_carp/great_white,
		/obj/item/card_carp/daus)

/obj/item/cardholder/precon/skeleton_appreciation
	name = "\"Aristoc(rats)\" CardCarp deck"
	desc = "A box of CardCarp cards usually provided to intermediate players. Intended to be played with the rat side deck. This one is focused on using a LOT of bones and not much else!"
	deckocards = list(
		/obj/item/card_carp/antqueen,
		/obj/item/card_carp/antqueen,
		/obj/item/card_carp/geck,
		/obj/item/card_carp/geck,
		/obj/item/card_carp/bat,
		/obj/item/card_carp/bat,
		/obj/item/card_carp/fieldmice,
		/obj/item/card_carp/ratking,
		/obj/item/card_carp/ratking,
		/obj/item/card_carp/cat,
		/obj/item/card_carp/cat,
		/obj/item/card_carp/cat,
		/obj/item/card_carp/cat,
		/obj/item/card_carp/stinkbug,
		/obj/item/card_carp/stinkbug,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/gpelt)

/obj/item/cardholder/precon/skinner
	name = "\"Skinner\" CardCarp deck"
	desc = "A box of CardCarp cards usually provided to advanced players. Intended to be played with the rare rabbit side deck. This one is focused on using a lot of pelts!"
	deckocards = list(
		/obj/item/card_carp/rpelt,
		/obj/item/card_carp/rpelt,
		/obj/item/card_carp/rpelt,
		/obj/item/card_carp/rpelt,
		/obj/item/card_carp/tanningpelt,
		/obj/item/card_carp/tanningpelt,
		/obj/item/card_carp/pinepelt,
		/obj/item/card_carp/pinepelt,
		/obj/item/card_carp/dpelt,
		/obj/item/card_carp/peltlice,
		/obj/item/card_carp/peltlice,
		/obj/item/card_carp/peltlice,
		/obj/item/card_carp/peltlice,
		/obj/item/card_carp/flees,
		/obj/item/card_carp/flees,
		/obj/item/card_carp/silverfish,
		/obj/item/card_carp/silverfish,
		/obj/item/card_carp/silverfish,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/coyote,
		/obj/item/card_carp/gpelt)


