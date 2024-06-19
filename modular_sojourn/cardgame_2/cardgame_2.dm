/obj/item/card_carp
	name = "Rules Card"
	desc = "To start the game: Place down a scale or tally system, make sure its balance is at 0.<BR>\n\
	Both players may only have 1 non-fodder deck.<BR>\n\
	The field of play is a (recommended) 4 x 5 grid, players may only play cards on their side of the field unless otherwise noted.<BR>\n\
	At the beginning of the game, both players draw 3 cards + 1 fodder card.<BR>\n\
	After drawing their initial cards, players may place any terrian or blocker cards anywhere on the field.<BR>\n\
	At the beginning of each turn, a player may draw 3 cards, eather fodder or from their deck box, may choice to draw from both i.e 1 fodder 2 main deck. Players draw on their very first turn.<BR>\n\

	Playing Cards:<BR>\n\
	Unless stated otherwise, cards may only be played in the back row.\n\
	Some cards have an associated blood cost. This cost is paid by sacrificing a total amount of cards on the players field to equal the amount required. Unless otherwise stated, one card is one blood. \
	Any excess blood disappears after a creature is played. You may not sacrifice additional cards while paying a blood cost i.e. if a wolf requires 2 blood, you cannot sacrifice 3 squirrels. \
	If for example you sacrificed one black goat which gives 3 blood to play a wolf that cost 2 blood, the excess amount may not be used for any other purpose and disappears immediately unless stated otherwise, this applies to bones.<BR>\n\
	Some cards have an associated bones cost. Bones are paid by using the counters in the bone pile. When a card is sacrificed or dies it is added to the player's discard pile, the bone pile then \
	gains 1 tally unless otherwise noted. When paying bones, a player must put an equal number of cards back into the deck box it was drawn from equal to the value of bones paid.<BR>\n\
	Blood costs may NOT be paid using cards not on the field or in the discard pile.<BR>\n\
	Bone costs may ONLY be paid using cards in the discard pile. All players share the same bone pile, allowing for bones to be paid using either player's discard counter/bone pile.<BR>\n\

	Attacking:<BR>\n\
	When a player ends their turn, all cards from left to right act. Left to right is determined by the attacking players position.<BR>\n\
	Any card in the back row capable of moving to the first row does so, moving first and then attacking. Cards in the back row cannot attack.<BR>\n\
	Cards deal damage to cards opposite on the board to them. Damage delt in excess to a cards health carries over to the card behind it but NOT the player unless otherwise stated.<BR>\n\
	Cards in the back row cannot attack or move cards in the front row of their side of the field unless otherwise stated, even if that card is a blocker, obstacle, or pelt.<BR>\n\
	When a card dies, it is placed inside the discard pile of the owner of the card unless otherwise stated.<BR>\n\
	Cards can NOT deal negitive damage unless otherwise stated.<BR>\n\


	Winning/Losing:<BR>\n\
	If a player were to deal winning or more damage on turn one before the other one is able to play, reset the scale.<BR>\n\
	In the defending players calulation the card order is left to right of defending player.\n\
	If the defending player has unblocked, or otherwise attacking cards, that if they were to attack bring the scale below the losing threshhold, adjust scale to be the 1 point away from a loss. \
	Cards in the back row do not move or attack in this calulation unless stated otherwise.<BR>\n\

	Terrain:<BR>\n\
	Terrain - Terrain  cards may be placed on any position on either players board before the game begins. Terrain cards do not move. When a terrain card is \
	destroyed unless stated otherwise it is not placed in the player's discard pile and is instead removed from the game. Each player can only play a maximum of 2 terrain cards during pre-match set up.<BR>\n\
	Terrian Cards that are drawn into hand may only be placed on the side of the player that drew the card this placement is allowed to be on first or second row, unless otherwise stated.\n\
	Terrian Cards that are in the back row on turn start of the player that has the Terrian Card on their backrow may chose to deal 1 damage.\n\
	Terrian Cards well in back row protect the card or empty space in the first row, this interaction overrides all other blocking affects unless stated otherwise.\n\

	Cards:<BR>\n\
	All cards have health, power, and play requirements noted on the card. Some cards have special effects or rules that are also noted on the card or on the rules card.<BR>\n\
	All cards follow the format of Health/Power. A wolf card with 2 health and 3 power is represented as H2/P3 on the card.<BR>\n\
	Cards must be played first in the back row and only move onto the front row at the end of the owner's turn. Only cards moving into or already present in the front row may attack.<BR>\n\
	If a card has no opposing card opposite to it, the card deals damage the other player.<BR>\n\
	When a player takes damage, the scale or tally system gets moved towards the person equal to the total amount of damage taken, when a player has 5 or more damage, they lose."
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	icon_state = "cardblank"
	var/cant_box = FALSE
	var/late_fodder = FALSE
	w_class = ITEM_SIZE_TINY
	var/current_health = 0

/obj/item/card_carp/index
	name = "Index-Effects: CardCarp"
	desc = "Card Effects:<BR>\n\
	Flying - Cards with flying ignore blockers, obstacles, and pelts unless that card is capable of blocking flyers. Having flying does not give a card the ability to block other flyers.<BR>\n\
	Destructive - All cards with destructive kill all cards of the same kin type when dying. I.E. a crab with destructive kills all other crabs. Type is determined by matching words in the name.<BR>\n\
	Deathtouch - On attack, any card it is facing is considered killed unless otherwise stated.<BR>\n\
	Eternal - This card does not die when used as a sacrifice for blood.<BR>\n\
	Thorns - When attacked deal one damage back to the card that attacked them.<BR>\n\
	Stinky - This card reduces any opposing cards power by 1.<BR>\n\
	Defender - This card can block cards with flying.<BR>\n\
	Prong Strike - This card attacks twice, dealing damage and attacking on the left and right side of the card. Prong Strike prevents attacking the card directly opposing this card. If a prong \
	strike creatures attack would go off the grid it deals no damage and is negated.<BR>\n\
	Tri Strike - As prong strike, but also attacks the opposing card.<BR>\n\
	Toxic - On death, all cards attacking it die.<BR>\n\
	Guard - If an unoccupied space would be attacked by an opposing card, this card moves to that space and blocks that attack. This effect may happen mutiple times until all attacks are resolved or \
	the guarding card is dead. May only move and protect against Flying when the same card has the Defender effect.<BR>\n\
	Fortune - As long as this card remains on the field, all players draw an additional card when ever they may draw a card. The additional card may be chosen from the main or fodder deck. Fortune \
	cards do not stack with other fortune cards.<BR>\n\
	Frail - If this card attacks and deals damage to either a player or another card, it dies.<BR>\n\
	Generous - When this card is played, the owner may draw a card of their choice from either deck.<BR>\n\
	Undying - When this card dies, instead of being placed in the owner's discard pile, it is returned to the owner's hand.<BR>\n\
	Chime - When this card dies, the owner of this card draws one card from a deck of their choice.<BR>\n\
	Blood Donor - This card when sacrificed counts as three blood rather then one.<BR>\n\
	Boneless - When this card dies, place it back into the box it was drawn from.<BR>\n\
	Bloodless - This card can not be used for blood in summaning or playing other cards.<BR>\n\
	Pelt - Pelt cards may be placed on any position on either players board when played. Pelt cards do not move but otherwise follow the same rules as other cards. Pelt cards cannot be sacrificed \
	for blood and are added to the discard pile upon death.<BR>\n\
	Cornered - Only attacks if the player that has payed for this card is losing by scale damage or if an posing card can attack.<BR>\n\
	Terrain - For this cards affects see Rules Card.<BR>\n\
	Anti-Avian - If an Flying card attacks over this card, deal 1 damage to the card after its attack.<BR>\n\
	Rivalry - This card loses power equal to the amount of cards sharing the same type currently on the field under that player's control. Each card can only remove 1 power, no matter how many matching \
	types they have, unless otherwise stated. Rivalry cards do not count themselves for the purposes of losing power.<BR>\n\
	Kinship - This card gains power equal to the amount of cards sharing the same type currently on the field under that player's control. Each card can only add 1 power, no matter how many matching \
	types they have, unless otherwise stated. Kinship cards do not count themselves for the purposes of gaining power."

/obj/item/card_carp/index/adved
	name = "Vol II Index-Effects: CardCarp"
	desc = "Card Effects:<BR>\n\
	Mending - After every attacking phase, remove or add one damage to the scale. If scale is already at midway then do not add or remove damage.<BR>\n\
	Fast Ageing - After dealing damage to a player or card, remove one health from this card.<BR>\n\
	Slowish - This card will always attack last, if more then one slowish card is present, they attack from left to right act.<BR>\n\
	Fastish - This card will always attack first, if more then one first card is present, they attack from left to right act.<BR>\n\
	Reflectes - This card only attack if hit first.<BR>\n\
	Opportunistic - This card may attack in any order it pleases regardless of other card modifers.<BR>\n\
	Grace - If this card is not in the second row, the player who played its price, can not lose the game.<BR>\n\
	Cowardly - If attacked, the damage is delt to the player that payed its price rather then card, unless it would be enough to lose from.<BR>\n\
	Bounded - On death deal one damage to player that payed its price.<BR>\n\
	Upheaval - When moving into an the second row and hitting a card, move the card back to the second lane if then deal moved card damage, \
	if a card is behind the striked card, move it back into the player that paid that cards price.<BR>\n\
	Aduit - When this card dies, if the total damage of the every card in any row is even, half the damage on the scale, if odd, both players draw two cards from fodder deck.<BR>\n\
	Hermit - If attacking a player, deal zero damage.<BR>\n\
	Hunter - If attacking a player, deal one damage additional damage.<BR>\n\
	Shreader - If attacking a card with the Pelt Effects, deal two additonal damage.<BR>\n\
	Conqueror - If attacking a card with the Terrian Effects, deal two additonal damage.<BR>\n\
	Sickly - Well not in the grave yard, can be used as bone(s). When used as bone(s) the player that is using the bone(s) of this card take one damage and add it to their deck.<BR>\n\
	Traitor - If in any row on game end, move to the winners deck. Winner may decline this card if they so chose.<BR>\n\
	Fodder - On death move this card directly back into the fodder deck. Failer to do so will result in a unstopable three damage.<BR>\n\
	Starvation - At the start of the players turn that played the price of this card, deal one damage unblockable to any one card of their choice.<BR>\n\
	Confliction - If a card has the same has conflicting effects, then the player may choice what effect to use over one.  \
	If the card has the same effects more then once it only counts as one, unless otherwise stated."

/obj/item/card_carp/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The cards current health is : [current_health]</span>")
	to_chat(user, "<span class='info'>To remove health, AltClick the card, to reset the cards health CtrlShiftClick.</span>")

/obj/item/card_carp/AltClick(mob/user)
	current_health -= 1
	user.visible_message(SPAN_NOTICE("[user] removes a health point form [src] making it [current_health]."), SPAN_NOTICE("You remove a health point form \the [src]."))
	return

/obj/item/card_carp/CtrlShiftClick(mob/user)
	current_health = initial(current_health)
	user.visible_message(SPAN_NOTICE("[user] resets \the [src] health pool."), SPAN_NOTICE("You put a health points to max on \the [src]."))
	return

/////////////////////////////
///    FODDER CARDS      ////
/////////////////////////////

/obj/item/card_carp/squirl
	name = "Squirrel"
	desc = "A squirrel, the rodent lynchpin to most decks. H1/P0."
	icon_state = "card_squirl"
	cant_box = TRUE
	current_health = 1

/obj/item/card_carp/beebox
	name = "Bee Box"
	desc = "A lively nest of stingers and honey. H1/P0. Boneless"
	icon_state = "card_beebox"
	cant_box = TRUE
	current_health = 1

/obj/item/card_carp/rat
	name = "Rat"
	desc = "A rat, a fastidiously clean creature. H1/P1. Bloodless. Cornered."
	icon_state = "card_rat"
	cant_box = TRUE
	current_health = 1

/obj/item/card_carp/rabbit
	name = "Rabbit"
	desc = "A rabbit, a greatly undervalued card. H1/P0. Kinship. Frail."
	icon_state = "card_rabbit"
	cant_box = TRUE
	current_health = 1

/obj/item/card_carp/shell
	name = "Shell"
	desc = "A robotic shell, serves little purpose. H1/P0. Boneless. Boneless. Anti-Avian."
	icon_state = "card_squirls"
	cant_box = TRUE
	current_health = 1

/////////////////////////////
///    SPECIAL CARDS     ////
/////////////////////////////

/obj/item/card_carp/moon
	name = "Moon"
	desc = "The moon, a celestal body unbound by normal means of attacking. H40/P1. Defender. Takes up all rows on the owner's side. Deals 1 damage to all cards on the opposing side. Cannot hit opposing player as long as 1 card is capable of blocking."
	icon_state = "card_moon"
	current_health = 40

/////////////////////////////
///    REGULARD CARDS    ////
/////////////////////////////

/obj/item/card_carp/goat
	name = "Goat"
	desc = "A black goat, perfect for serving your stronger creatures. H2/P0, Requires 1 blood and 1 bone. Blood Donor."
	icon_state = "card_goat"
	current_health = 2

/obj/item/card_carp/crab
	name = "Crab"
	desc = "A crab, the best sea to land raider. H1/P2, Requires 1 blood. Destructive."
	icon_state = "card_crab"
	current_health = 1

/obj/item/card_carp/adder
	name = "Adder"
	desc = "A snake, as venomous as they come. H1/P0, Requires 1 blood. Deathtouch."
	icon_state = "card_adder"
	current_health = 1

/obj/item/card_carp/cat
	name = "Cat"
	desc = "A feline, known for ketching small pray and hunting Avians. H1/P0. Eternal. Anti-Avian."
	icon_state = "card_cat"
	current_health = 1

/obj/item/card_carp/stote
	name = "Stote"
	desc = "A stote, one of the lesser known mustelids. H3/P1. Requires 1 blood."
	icon_state = "card_stote"
	current_health = 3

/obj/item/card_carp/stinkbug
	name = "Stink Bug"
	desc = "A stink bug, a surprisingly durable creature. H2/P1, Requires 2 bones. Stinky."
	icon_state = "card_stinkbug"
	current_health = 2

/obj/item/card_carp/stunted_wolf
	name = "Stunted Wolf"
	desc = "A sad looking wolf, longing for something. H2/P2. Requires 2 bones. Frail"
	icon_state = "card_stuntedwolf"
	current_health = 2

/obj/item/card_carp/croaker_lord
	name = "Bullfrog"
	desc = "A bullfrog, an amphibian with a bulging leathery throat. H3/P1. Requires 1 blood. Defender"
	icon_state = "card_frog"
	current_health = 3

/obj/item/card_carp/wolf
	name = "Wolf"
	desc = "A wolf, a well known and dangerous hunter. H2/P3. Requires 2 blood."
	icon_state = "card_wolf"
	current_health = 2

/obj/item/card_carp/manti
	name = "Mantis"
	desc = "A mantis, an insect born for bloodshed. H1/P1 Requires 1 blood. Prong Strike."
	icon_state = "card_mantis"
	current_health = 1

/obj/item/card_carp/manti_lord
	name = "Mantis God"
	desc = "The gods of the mantis, the deadliest of the insects. H1/P1. Requires 2 blood and 2 bones. Tri Strike. Defender." //Cant play this at turn one you cheater >:T
	icon_state = "card_mantislord"
	current_health = 1

/obj/item/card_carp/mole
	name = "Mole"
	desc = "A mole, the under rated tunneler. H5/P0. Requires 1 blood. Gaurd. Anti-Avian."
	icon_state = "card_mole"
	current_health = 5

/obj/item/card_carp/mole_man
	name = "Mole Man"
	desc = "A mole and a man combined into something more. H6/P0. Requires 2 blood. Gaurd. Defender."
	icon_state = "card_moleman"
	current_health = 6

/obj/item/card_carp/coyote
	name = "Coyote"
	desc = "A coyote, a tricky canine. H1/P2. Requires 4 bones."
	icon_state = "card_coyote"
	current_health = 1

/obj/item/card_carp/elk
	name = "Elk"
	desc = "An elk, a mighty forest stag. H4/P2. Requires 2 blood. Defender."
	icon_state = "card_elk_spawn"
	current_health = 4

/obj/item/card_carp/magpie
	name = "Magpie"
	desc = "A magpie, one of the often forgotten members of the corvid family. H1/P1. Requires 2 blood. Flying. Fortune, Thorns."
	icon_state = "card_magpie"
	current_health = 1

/obj/item/card_carp/river_otter
	name = "River Otter"
	desc = "A river otter, soft and kind. H1/P1. Requires 1 blood. Gaurd, Thorns."
	icon_state = "card_riverotter"
	current_health = 1

/obj/item/card_carp/grizzly
	name = "Grizzly"
	desc = "A grizzly bear, the most dangerous of all predators. H6/P4. Requires 4 blood."
	icon_state = "card_bear"
	current_health = 6

/obj/item/card_carp/great_white
	name = "Great White Carp"
	desc = "A great white carp, adept in water and space. H4/P5. Requires 6 blood. Gaurd."
	icon_state = "card_carp"
	current_health = 4

/obj/item/card_carp/kingfisher
	name = "Kingfisher"
	desc = "A kingfisher, one of the fastest of birds. H2/P2, Requires 1 blood. Gaurd."
	icon_state = "card_kingfisher"
	current_health = 2

/obj/item/card_carp/sparrow
	name = "Sparrow"
	desc = "A sparrow, the quick of wit and wing. H1/P2. Requires 1 blood. Flying. Anti-Avian."
	icon_state = "card_sparrow"
	current_health = 1

/obj/item/card_carp/turkey_vulture
	name = "Turkey Vulture"
	desc = "A turkey vulture, the care taker of the dead. H3/P3, Requires 8 bones. Flying."
	icon_state = "card_turnkyvaulter"
	current_health = 3

/obj/item/card_carp/warren
	name = "Warren"
	desc = "A warren, home to all manner of rabbits and rodents. H3/P0. Requires 1 blood. Undying."
	icon_state = "card_warren"
	current_health = 3

/obj/item/card_carp/bat
	name = "Bat"
	desc = "A bat, blind but not deaf. H1/P2. Requires 1 bone. Flying"
	icon_state = "card_bat"
	current_health = 1

/obj/item/card_carp/daus
	name = "Daus"
	desc = "A daus, an ill tempered and dangerous creature as ornery as they come. H2/P2. Requires 2 blood. Chime. Anti-Avian."
	icon_state = "card_daus"
	current_health = 2

/obj/item/card_carp/geck
	name = "Geck"
	desc = "A geck, a favorite of many. H1/P1."
	icon_state = "card_geck"
	current_health = 1

/obj/item/card_carp/lost_rabbit
	name = "Lost Rabbit"
	desc = "A lost rabbit, far from its warren and its kin. H1/P0. Kinship. Frail. Anti-Avian."
	icon_state = "card_rabbit"
	current_health = 1

/obj/item/card_carp/larva
	name = "Moth Larva"
	desc = "A moth larva, brimming with potential. H1/P0. Requires 1 bone. Gives 2 blood. Kinship. Frail."
	icon_state = "card_larva"
	current_health = 1

/obj/item/card_carp/pupa
	name = "Moth Pupa"
	desc = "A moth pupa, almost all it can be. H2/P1. Requires 2 bones. Blood Donor. Kinship, Frail."
	icon_state = "card_pupa"
	current_health = 2

/obj/item/card_carp/mothman
	name = "Moth Man"
	desc = "A moth man, the last of his mysterious people. H3/P4. Kinship. Requires 4 bones and 2 blood."
	icon_state = "card_mothman"
	current_health = 3

/obj/item/card_carp/beaver
	name = "Beaver"
	desc = "A beaver, the most industrious of rodents. H1/P3. Requires 2 blood. Anti-Avian."
	icon_state = "card_bever"
	current_health = 1

/obj/item/card_carp/wyrm
	name = "Ring Wyrm"
	desc = "A ring wyrm, a circular creature. H1/P0. Requires 1 blood. Toxic. Defender."
	icon_state = "card_ring"
	current_health = 1

/obj/item/card_carp/cockroach
	name = "Roachling"
	desc = "A roachling, a common thing across many ships and world. H1/P1. Requires 2 bones. Undying."
	icon_state = "card_roach"
	current_health = 1

/obj/item/card_carp/ratking
	name = "Rat King"
	desc = "A rat king, bound by things often considered ill of omen. H1/P2. Requires 2 blood. Worth 4 bones."
	icon_state = "card_ratking"
	current_health = 1

/obj/item/card_carp/packrat
	name = "Pack Rat"
	desc = "A pack rat, a humble creature here to offer aid. H2/P2. Requires 2 blood. Generous."
	icon_state = "card_packrat"
	current_health = 2

/obj/item/card_carp/plaguerat
	name = "Plague Rat"
	desc = "A rat with the plague, still welcomed by its kin. H1/P1. Requires 3 bones. Kinship. Cornered."
	icon_state = "card_plaguerat"
	current_health = 1

/obj/item/card_carp/kangaroorat
	name = "Kangaroo Rat"
	desc = "The kangaroo rat, as graceful as it is clumsy. H1/P2. Requires 3 bones. Flying."
	icon_state = "card_kangaroorat"
	current_health = 1

/obj/item/card_carp/chipmunk
	name = "Chipmunk"
	desc = "A chipmunk, smaller and more careful than its larger cousins. H1/P1. Requires 1 blood. When played, both players draw a fodder card."
	icon_state = "card_chipmunk"
	current_health = 1

/obj/item/card_carp/fieldmice
	name = "Field Mice"
	desc = "Field mice, the smaller cousins to the rats and just as tenacious. H2/P2. Requires 2 blood OR 2 bones. Boneless."
	icon_state = "card_fieldmice"
	current_health = 2

/obj/item/card_carp/opossum
	name = "Opossum"
	desc = "An opossum, an ugly but friendly creature. H1/P1. Requires 2 bones."
	icon_state = "card_opossum"
	current_health = 1

/obj/item/card_carp/ant
	name = "Ant"
	desc = "An ant, an industrious bug. H1/P1. Requires 1 blood. Kinship."
	icon_state = "card_workerant"
	current_health = 1

/obj/item/card_carp/antqueen
	name = "Queen Ant"
	desc = "A queen ant, royalty among her kind. H1/P1. Requires 1 bone. Kinship."
	icon_state = "card_queen"
	current_health = 1

/////////////////////////////
///    PELT CARDS     ////
/////////////////////////////

/obj/item/card_carp/rpelt
	name = "Rabbit Pelt"
	desc = "A small pelt of a rabbit. H3/P0. Requires 2 bones. Pelt. Defender."
	icon_state = "card_rabbit_pelt"
	current_health = 3

/obj/item/card_carp/tanningpelt
	name = "Tanning Pelt"
	desc = "A small pelt reaking of tan. H1/P0. Requires 2 bones. Pelt. Defender. Stinky"
	icon_state = "card_rabbit_pelt"
	current_health = 1

/obj/item/card_carp/pinepelt
	name = "Porcupine Pelt"
	desc = "A small pelt of a porcupine still has its quills. H3/P0. Requires 4 bones. Pelt. Defender, Thorns."
	icon_state = "card_wolf_pelt"
	current_health = 3

/obj/item/card_carp/dpelt
	name = "Deer Pelt"
	desc = "A medium pelt of a deer. H5/P0. Requires 4 bones. Pelt. Defender."
	icon_state = "card_wolf_pelt"
	current_health = 5

/obj/item/card_carp/gpelt
	name = "Gilded Pelt"
	desc = "A gilded pelt, layered in fine gold. H10/P0. Requires 6 bones. Pelt. Defender."
	icon_state = "card_pelt"
	current_health = 10

/obj/item/card_carp/peltlice
	name = "Pelt Lice"
	desc = "Place over a pelt, killing the pelt, and removing it from the game H1/P1. Requires 1 Pelt. Pelt."
	icon_state = "card_rabbit_pelt"
	current_health = 1

/////////////////////////////
///    TERRAIN CARDS     ////
/////////////////////////////

/obj/item/card_carp/tree
	name = "Tree"
	desc = "A tree, there to hide behind and obstruct. H10/P0. Terrain. Defender. Bloodless. Boneless."
	icon_state = "card_turf"
	current_health = 10

/obj/item/card_carp/pinetree
	name = "Pine Tree"
	desc = "A tree with sharp needles, there to hide behind and obstruct. H5/P0. Terrain. Defender. Thorn. Bloodless. Boneless"
	icon_state = "card_turf"
	current_health = 5

/obj/item/card_carp/rock
	name = "Rock"
	desc = "A rock, the pioneers favorite, hitting it wouldnt be to good for you. H7/P0. Terrain. Thorn, Bloodless. Boneless, Anti-Avian."
	icon_state = "card_turf"
	current_health = 7

/obj/item/card_carp/bloodrock
	name = "Blood Stone"
	desc = "A refined stone, the blood on it is still useable, hitting it wouldnt be to good for you. H3/P0. Terrain. Thorn. Boneless, Blood Donor"
	icon_state = "card_turf"
	current_health = 3

/////////////////////////////
///    DEATH CARDS       ////
/////////////////////////////

/obj/item/card_carp/death_card
	name = ""
	desc = ""
	icon_state = "cardblank"
	current_health = 0

/obj/item/card_carp/proc/generate(health, meat, attack, ranged, trapped_name)
	//log_debug("running card carp generate!")
	//log_debug("[health] , [meat] , [attack] , [ranged] , [trapped_name]")
	if(health >= 10)
		health *= 0.01

	if(health >= 10)
		health = 10

	attack *= 0.1

	var/point_total = health + meat + attack
	var/director_desc = "A card of [trapped_name], not yet balanced by CardCarpCo."
	var/added_descs
	var/base_descs
	if(ranged)
		point_total *= 2

	point_total = round(point_total)

	name = trapped_name
	var/randomized_health = rand(1,6)

	base_descs += "H[randomized_health]/P[rand(0, 3)]. Requires [rand(0, 2)] Blood, [rand(0, 3)] Bones, [rand(0, 1)] Player Health."
	current_health = randomized_health

	var/list/greatest		= list("Starvation", "Upheaval", "Grace", "Aduit")
	var/list/good			= list("Opportunistic", "Shreader", "Conqueror")
	var/list/speedbased		= list("Slowish", "Fastish", "Reflectes")
	var/list/bad			= list("Fast Ageing", "Cowardly", "Bounded", "Traitor")
	var/list/over_draw		= list("Mending", "Hermit", "Hunter", "Sickly")

	if(!greatest.len)
		greatest = list("Starvation", "Upheaval", "Grace", "Aduit")

	if(!good.len)
		greatest = list("Opportunistic", "Shreader", "Conqueror")

	if(!speedbased.len)
		greatest = list("Slowish", "Fastish", "Reflectes")

	if(!bad.len)
		greatest = list("Fast Ageing", "Cowardly", "Bounded", "Traitor")

	if(!over_draw.len)
		greatest = list("Mending", "Hermit", "Hunter", "Sickly")


	while(point_total >= 0)
		point_total -= 2
		if(prob(50) && point_total >= 10 && greatest.len)
			point_total -= 10
			added_descs += ", [pick_n_take(greatest)]"

		if(prob(20) && good.len)
			point_total -= 4
			added_descs += ", [pick_n_take(good)]"

		if(prob(60) && speedbased.len)
			point_total -= 2
			added_descs += ", [pick_n_take(speedbased)]"

		if(0 > point_total && bad.len)
			added_descs += ", [pick_n_take(bad)]"
			if(prob(15))
				added_descs += ", Fodder"
				late_fodder = TRUE

		if(prob(15) && over_draw.len) //Just goodluck
			added_descs += ", [pick_n_take(over_draw)]"

	director_desc = "[director_desc] [base_descs] [added_descs]"
	desc = director_desc
	//log_debug("finished card carp generation!")
