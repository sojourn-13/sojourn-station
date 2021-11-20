
//This is fancy! We want to have THIS be used to draw and deal everything
/obj/item/cardholder
	w_class = ITEM_SIZE_SMALL
	name = "randomizer card box"
	desc = "A small box that self shuffles every time a card is added or drawn, making it always random. This only works with and fits CardCarpCo Cards. Alt Click to draw a card."
	icon = 'modular_sojourn/cardgame_sprites.dmi'
	icon_state = "card_holder"
	var/obj/item/card_carp/card_target = null //What card were going to get
	var/endless = FALSE //Are we going to give endless cards?

/obj/item/cardholder/AltClick(mob/user)
	draw_card()
	return

/obj/item/cardholder/proc/draw_card(mob/user)
	..()
	if(endless)
		new card_target(src.loc)
	if(!contents)
		to_chat(user, SPAN_NOTICE("The [src] has no cards."))
	else
		card_target = pick(contents)
		card_target.forceMove(src.loc)
		card_target = /obj/item/card_carp //so we have vars

/obj/item/cardholder/attackby(obj/item/card_carp/CARD as obj, mob/user as mob)
	..()
	if(istype(CARD, /obj/item/card_carp))
		var/obj/item/card_carp/CH
		if(CH.cant_box || endless)
			to_chat(user, SPAN_NOTICE("The [src] rejects [CH]."))
			return
		else
			CH.forceMove(src.loc)
			user.visible_message(SPAN_NOTICE("[user] puts [CH] into \the [src]."), SPAN_NOTICE("You put [CH] into \the [src]."))
			return


/obj/item/cardholder/squirl
	name = "squirrel card box"
	desc = "A box of cards that only have Squirrel CarpCarpCo Cards."
	card_target =  /obj/item/card_carp/squirl
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/shell
	name = "shell card box"
	desc = "A box of cards that only have Shell CarpCarpCo Cards."
	card_target =  /obj/item/card_carp/shell
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/card_carp
	name = "Rules Card"
	desc = "To start the game: Place down a scale or tally system, make sure its balance is at 0.<BR>\n\
	The field is a 4 x 5, both sides are not allowed to place any card on one a others 2x5 that is declared at game start.<BR>\n\
	Both players draw 3 cards + 1 Squirrel or Shell card.<BR>\n\
	Players at the start of the game are allowed to place any obstacle cards they wish on any side of the field.<BR>\n\
	At the start of a Players turn draw, one Shell|Squirrel card OR one card in your deck<BR>\n\
	<BR>\n\
	Playing Cards:<BR>\n\
	When playing a card that has a blood cost, the blood comes form played cards on the field, unless a card states otherwise, a drained blood card must be discarded into a discard pile.<BR>\n\
	When a Card requires bodies, they use the discard pile, replacing the used cards back in the deck.<BR>\n\
	Flying:<BR>\n\
	Flying cards will be stated.<BR>\n\
	A card that flies will attack the player directly, unless a card opposing it blocks such fliers attack.<BR>\n\
	<BR>\n\
	Cards:<BR>\n\
	Each card has a play requirement, Health, Damage, and cards can have modifers that will be noted.<BR>\n\
	When a player must place their card in the first land their side, and when a turn ends they move 1 lane. A card can only ever move 1 lane before, then every turn past that will results in an a attack.<BR>\n\
	A card that attacks, if it over kills the card it is facing, attacks the card behind it, which takes the remaining damage.<BR>\n\
	If a card has no opposing card, then the card attacks the other player.<BR>\n\
	When a player takes damage, the scale or tally system gets moved one towards the person, when the a player has 5 damage, they lose."
	var/real_desc = ""
	icon = 'modular_sojourn/cardgame_sprites.dmi'
	icon_state = "cardblank"
	var/cant_box = FALSE
	w_class = ITEM_SIZE_SMALL

/obj/item/card_carp/squirl
	name = "Squirrel"
	desc = "A Squirrel, Health is 1, Damage is 0, No spawn requirements."
	icon_state = "card_squirl"

/obj/item/card_carp/shell
	name = "Shell"
	desc = "A Robotic Shell, Health is 1, Damage is 0, On death gives 1 power."
	icon_state = "card_squirls"

/obj/item/card_carp/moon
	name = "Moon"
	desc = "The Moon, Health is 40, Damage is 1. Fills up all slots. Stops Flying attacks. Attacks all opposing slots."
	icon_state = "card_moon"

/obj/item/card_carp/goat
	name = "Goat"
	desc = "A Goat, Health is 2, Damage is 0, No spawn requirements. Gives 3 blood."
	icon_state = "card_goat"

/obj/item/card_carp/adder
	name = "Adder"
	desc = "A Goat, Health is 1, Damage is 0, Requires 1 blood. On attack, removes any card it hits."
	icon_state = "card_adder"

/obj/item/card_carp/cat
	name = "Cat"
	desc = "A Feline, Health is 1, Damage is 0, No spawn requirements. Can give blood without removing itself."
	icon_state = "card_cat"

/obj/item/card_carp/stote
	name = "Stote"
	desc = "A Stote, Health is 3, Damage is 1, Requires 1 blood."
	icon_state = "card_stote"

/obj/item/card_carp/stinkbug
	name = "Stink Bug"
	desc = "A Stink Bug, Health is 2, Damage is 1, Requires 2 bodies. Rebuffs opposing card by 1 damage."
	icon_state = "card_stinkbug"

/obj/item/card_carp/stunted_wolf
	name = "Stunted Wolf"
	desc = "Sad looking Wolf, Health is 2, Damage is 2, Requires 1 bodies."
	icon_state = "card_stuntedwolf"

/obj/item/card_carp/croaker_lord
	name = "Bullfrog"
	desc = "A Bullfrog, Health is 1, Damage is 3, Requires 1 blood."
	icon_state = "card_frog"

/obj/item/card_carp/wolf
	name = "Wolf"
	desc = "A Wolf, Health is 2, Damage is 3, Requires 2 blood."
	icon_state = "card_wolf"

/obj/item/card_carp/manti
	name = "Mantis"
	desc = "A Mantis, Health is 1, Damage is 1, Requires 1 blood. Bifurcated Strikes."
	icon_state = "card_mantis"

/obj/item/card_carp/manti_lord
	name = "Mantis Lord"
	desc = "A Mantis, Health is 1, Damage is 1, Requires 2 blood, 2 bodies. Trifurcated Strike." //Cant play this at turn one you cheater >:T
	icon_state = "card_mantislord"

/obj/item/card_carp/mole
	name = "Mole"
	desc = "A Mole, Health is 5, Damage is 0, Requires 1 blood. If a card unopposed attacks a player, move to block."
	icon_state = "card_mole"

/obj/item/card_carp/mole_man
	name = "Mole Man"
	desc = "A Mole, Health is 12, Damage is 0, Requires 2 blood. If a card unopposed attacks a player, move to block."
	icon_state = "card_moleman"

/obj/item/card_carp/coyote
	name = "Coyote"
	desc = "A Coyote, Health is 1, Damage is 2, Requires 4 bodies."
	icon_state = "card_coyote"

/obj/item/card_carp/elk
	name = "Elk"
	desc = "A Elk, Health is 4, Damage is 2, Requires 2 blood."
	icon_state = "card_elk_spawn"

/obj/item/card_carp/magpie
	name = "Magpie"
	desc = "A Magpie, Health is 1, Damage is 1, Requires 1 blood. Flying."
	icon_state = "card_magpie"

/obj/item/card_carp/river_otter
	name = "River Otter"
	desc = "A River Otter, Health is 1, Damage is 1, Requires 1 blood. If a card unopposed attacks a player, move to block."
	icon_state = "card_riverotter"

/obj/item/card_carp/grizzly
	name = "Grizzly"
	desc = "A Grizzly, Health is 6, Damage is 4, Requires 3 blood."
	icon_state = "card_bear"

/obj/item/card_carp/great_white
	name = "Great White Carp"
	desc = "A Great White Carp, Health is 4, Damage is 5, Requires 3 blood. If a card unopposed attacks a player, move to block."
	icon_state = "card_carp"

/obj/item/card_carp/kingfisher
	name = "Kingfisher"
	desc = "A Kingfisher, Health is 12, Damage is 2, Requires 1 blood. If a card unopposed attacks a player, move to block."
	icon_state = "card_kingfisher"

/obj/item/card_carp/sparrow
	name = "Sparrow"
	desc = "A Sparrow, Health is 1, Damage is 2, Requires 1 blood. Flying."
	icon_state = "card_sparrow"

/obj/item/card_carp/turkey_vulture
	name = "Turkey Vulture"
	desc = "A Turkey Vulture, Health is 3, Damage is 3, Requires 8 bodies. Flying."
	icon_state = "card_turnkyvaulter"

/obj/item/card_carp/warren
	name = "Warren"
	desc = "A Warren, Health is 3, Damage is 0, Requires 1 blood. On death return to hand."
	icon_state = "card_warren"

/obj/item/card_carp/rabbit
	name = "Rabbit"
	desc = "A Rabbit, Health is 1, Damage is 0, No Requirements."
	icon_state = "card_rabbit"

/obj/item/card_carp/bat
	name = "Bat"
	desc = "A Bat, Health is 1, Damage is 2, Requires 1 body. Flying"
	icon_state = "card_bat"

/obj/item/card_carp/daus
	name = "Daus"
	desc = "A Daus, Health is 2, Damage is 2, Requires 2 blood. On death, draw an extra card."
	icon_state = "card_daus"

/obj/item/card_carp/geck
	name = "Geck"
	desc = "A Geck, Health is 1, Damage is 1, No Requirements."
	icon_state = "card_aplha"

/obj/item/card_carp/larva
	name = "Larva"
	desc = "A Larva, Health is 3, Damage is 0, Requires 1 body. Gives 2 blood."
	icon_state = "card_larva"

/obj/item/card_carp/pupa
	name = "Pupa"
	desc = "A Pupa, Health is 3, Damage is 1, Requires 3 body. Gives 1 blood per larva in hand."
	icon_state = "card_pupa"

/obj/item/card_carp/mothman
	name = "Mothman"
	desc = "A Mothman, Health is 1 Per larva In hand, Damage is 1 per Pupa in hand, No Requirement. Gives 1 blood per corps."
	icon_state = "card_mothman"

/obj/item/card_carp/beaver
	name = "Beaver"
	desc = "A Beaver, Health is 1, Damage is 3, Requires 2 blood."
	icon_state = "card_bever"

/obj/item/card_carp/wyrm
	name = "Ring Wyrm"
	desc = "A Wyrm, Health is 1, Damage is 0, Requires 1 blood. On death, kills attaking card."
	icon_state = "card_ring"

/obj/item/card_carp/cockroach
	name = "Roachling"
	desc = "A Roachling, Health is 1, Damage is 1, Requires 2 bodies. On death, return to hand."
	icon_state = "card_roach"

/obj/item/card_carp/ant
	name = "Ant"
	desc = "An Ant, Health is 1, Damage is 1 per Ant on field, Requires 1 blood."
	icon_state = "card_workerant"

/obj/item/card_carp/antqueen
	name = "Queen Ant"
	desc = "A Queen Ant, Health is 1 per Ant on field, Damage is 1, Requires 1 body."
	icon_state = "card_queen"

/obj/item/card_carp/rpelt
	name = "Rabbet Pelt"
	desc = "A small pelt, Health is 3, Damage is 0, Requires 2 bodies. Can be placed on any open field slot. Does not move."
	icon_state = "card_rabbit_pelt"

/obj/item/card_carp/dpelt
	name = "Deer Pelt"
	desc = "A medium pelt, Health is 5, Damage is 0, Requires 4 bodies. Can be placed on any open field slot. Does not move."
	icon_state = "card_wolf_pelt"

/obj/item/card_carp/gpelt
	name = "Gilded Pelt"
	desc = "A gilded pelt, Health is 10, Damage is 0, Requires 6 bodies. Can be placed on any open field slot. Does not move."
	icon_state = "card_pelt"

/obj/item/card_carp/tree
	name = "Tree"
	desc = "A Tree, Health is 10, Damage is 0, Cant be placed. Does not move. Blocks Flying."
	icon_state = "card_13"

/obj/item/card_carp/rock
	name = "Rock"
	desc = "A Rock, Health is 7, Damage is 0, Cant be placed. Does not move."
	icon_state = "card_child"

/obj/random/card_carp
	name = "random card carp"
	icon_state = "techloot-grey"

/obj/random/card_carp/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/goat = 1,
				/obj/item/card_carp/cat = 7,
				/obj/item/card_carp/stote = 12,
				/obj/item/card_carp/stinkbug = 10,
				/obj/item/card_carp/stunted_wolf = 13,
				/obj/item/card_carp/croaker_lord = 15,
				/obj/item/card_carp/wolf = 17,
				/obj/item/card_carp/adder = 5,
				/obj/item/card_carp/manti = 10,
				/obj/item/card_carp/manti_lord = 8,
				/obj/item/card_carp/mole = 10,
				/obj/item/card_carp/mole_man = 7,
				/obj/item/card_carp/coyote = 14,
				/obj/item/card_carp/elk = 12,
				/obj/item/card_carp/magpie = 16,
				/obj/item/card_carp/river_otter = 15,
				/obj/item/card_carp/grizzly = 14,
				/obj/item/card_carp/great_white = 2,
				/obj/item/card_carp/kingfisher = 2,
				/obj/item/card_carp/sparrow = 12,
				/obj/item/card_carp/turkey_vulture = 12,
				/obj/item/card_carp/warren = 15,
				/obj/item/card_carp/rabbit = 10,
				/obj/item/card_carp/bat = 17,
				/obj/item/card_carp/daus = 4,
				/obj/item/card_carp/geck = 12,
				/obj/item/card_carp/larva = 16,
				/obj/item/card_carp/pupa = 12,
				/obj/item/card_carp/mothman = 3,
				/obj/item/card_carp/beaver = 5,
				/obj/item/card_carp/wyrm = 2,
				/obj/item/card_carp/cockroach = 7,
				/obj/item/card_carp/ant = 6,
				/obj/item/card_carp/antqueen = 4,
				/obj/item/card_carp/tree = 4,
				/obj/item/card_carp/rock = 6,
				))

/obj/random/card_carp/pelt
	name = "random card carp pelt"
	icon_state = "techloot-grey"

/obj/random/card_carp/pelt/item_to_spawn()
	return pickweight(list(
				/obj/item/card_carp/rpelt = 20,
				/obj/item/card_carp/dpelt = 10,
				/obj/item/card_carp/gpelt = 1 //SO RARE
				))

/obj/item/pack_card_carp
	name = "CardCarpCo Pack"
	desc = "For those with disposible income. Contains 10 cards, and a pelt card."
	icon = 'modular_sojourn/cardgame_sprites.dmi'
	icon_state = "card_pack"
	w_class = ITEM_SIZE_TINY

/obj/item/pack_card_carp/attack_self(var/mob/user as mob)
	user.visible_message("[user] rips open \the [src]!")

	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp(src.loc)
	new /obj/random/card_carp/pelt(src.loc)

	qdel(src)


/obj/item/scale
	name = "Scale"
	desc = "10 Point Scale, used when talling marks. AltClick to remove a tally, CtrlShiftClick to add a tally"
	icon_state = "scale"
	var/tally = 0 //Number
	w_class = ITEM_SIZE_SMALL

/obj/item/scale/New()
	..()
	update_icon()

/obj/item/scale/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The : [tally]</span>")

/obj/item/scale/update_icon()
	if(tally >= 5 || -5 >= tally)
		return
	icon_state = "scale_[tally]"

/obj/item/scale/AltClick(mob/user)
	if(-5 >= tally)
		to_chat(user, SPAN_NOTICE("You cant tip the scale any more this way."))
		return
	tally -= 1
	user.visible_message(SPAN_NOTICE("[user] removes a tally form [src] making it [tally]."), SPAN_NOTICE("You remove a tally form \the [src]."))
	update_icon()
	return

/obj/item/scale/CtrlShiftClick(mob/user)
	if(tally >= 5)
		to_chat(user, SPAN_NOTICE("You cant tip the scale any more this way."))
		return
	tally += 1
	user.visible_message(SPAN_NOTICE("[user] adds a tally to into \the [src]."), SPAN_NOTICE("You put a tally into \the [src]."))
	update_icon()
	return





