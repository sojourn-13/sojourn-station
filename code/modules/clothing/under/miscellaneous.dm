/obj/item/clothing/under/pj
	name = "red pyjamas"
	desc = "White sleepwear with a red stripe pattern."
	icon_state = "red_pyjamas"

	item_state = "w_suit"

/obj/item/clothing/under/pj/blue
	name = "blue pyjamas"
	desc = "White sleepwear with a blue stripe pattern."
	icon_state = "blue_pyjamas"

	item_state = "w_suit"




/obj/item/clothing/under/waiter
	name = "waiter's outfit"
	desc = "It's a very smart uniform with a special pocket for tip."
	icon_state = "waiter"
	item_state = "waiter"


/obj/item/clothing/under/sexyclown
	name = "sexy-clown suit"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	item_state = "clown"

	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/space
	name = "\improper NASA jumpsuit"
	desc = "It has a NASA logo on it and is made of space-proofed materials."
	icon_state = "black"
	item_state = "bl_suit"

	w_class = ITEM_SIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/acj
	name = "administrative cybernetic jumpsuit"
	icon_state = "syndicate"
	item_state = "bl_suit"

	desc = "it's a cybernetically enhanced jumpsuit used for administrative duties."
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 100, bullet = 100, laser = 100,energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/under/owl
	name = "owl uniform"
	desc = "A jumpsuit with owl wings. Photorealistic owl feathers! Twooooo!"
	icon_state = "owl"

	item_state = "owl"

/obj/item/clothing/under/rank/fo_suit
	name = "First Officer's suit"
	desc = "A teal suit and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit"
	item_state = "g_suit"


/obj/item/clothing/under/suit_jacket
	name = "black suit"
	desc = "A black suit complete with a white shirt and red tie."
	icon_state = "black_suit"
	item_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/blackskirt
	name = "black suit skirt"
	desc = "A skirted black suit complete with a white shirt and red tie."
	icon_state = "blackskirt"
	item_state = "bl_suit"

/obj/item/clothing/under/suit_jacket/red
	name = "red suit"
	desc = "A red suit complete with a white shirt and blue tie."
	icon_state = "red_suit"
	item_state = "r_suit"

/obj/item/clothing/under/suit_jacket/red/skirt
	name = "red suit skirt"
	desc = "A skirted red suit complete with a white shirt and blue tie."
	icon_state = "red_suit_skirt"
	item_state = "red_suit_skirt"

/obj/item/clothing/under/suit_jacket/scratch
	name = "white suit"
	desc = "A distinctive white suit complete with a blue shirt."
	icon_state = "scratch"
	item_state = "scratch"

/obj/item/clothing/under/suit_jacket/scratch/skirt
	name = "white suit skirt"
	desc = "A distinctive skirted white suit complete with a blue shirt."
	icon_state = "scratch_skirt"
	item_state_slots = list(slot_r_hand_str = "scratch", slot_l_hand_str = "scratch")

/obj/item/clothing/under/suit_jacket/really_black
	name = "executive suit"
	desc = "A formal black suit complete with a white shirt and blue tie."
	icon_state = "really_black_suit"
	item_state = "really_black_suit"

/obj/item/clothing/under/suit_jacket/really_black/skirt
	name = "executive suit skirt"
	desc = "A formal black skirted suit complete with a white and shirt and blue tie."
	icon_state = "really_black_suit_skirt"
	item_state = "really_black_suit_skirt"

/obj/item/clothing/under/suit_jacket/green
	name = "green suit"
	desc = "A green suit complete with a white shirt and yellow tie."
	icon_state = "green_suit"
	item_state = "green_suit"

/obj/item/clothing/under/suit_jacket/green/skirt
	name = "green suit skirt"
	desc = "A skirted green suit complete with a white shirt and yellow tie."
	icon_state = "green_suit_skirt"
	item_state = "green_suit_skirt"

/obj/item/clothing/under/suit_jacket/smoky
	name = "smoky suit jacket"
	desc = "A silk black shirt with a jacket and matching grey slacks."
	icon_state = "gentlesuitjacket"
	item_state = "gentlesuitjacket"

/obj/item/clothing/under/suit_jacket/teal
	name = "teal suit"
	desc = "A teal suit complete with a white shirt and orange tie."
	icon_state = "tealsuit"
	item_state = "tealsuit"

/obj/item/clothing/under/suit_jacket/teal/skirt
	name = "teal suit skirt"
	desc = "A skirted teal suit complete with a white shirt and orange tie."
	icon_state = "tealsuitskirt"
	item_state = "tealsuitskirt"

/obj/item/clothing/under/suit_jacket/blazer
	name = "blue blazer"
	desc = "A bold suit consisting of red corduroys, a navy blazer and a tie."
	icon_state = "blue_blazer"
	item_state = "blue_blazer"

/obj/item/clothing/under/suit_jacket/blazer/skirt
	name = "blue blazer skirt"
	desc = "A bold skirted suit consisting of red corduroys, a navy blazer and a tie."
	icon_state = "blue_blazer_skirt"
	item_state = "blue_blazer_skirt"

/obj/item/clothing/under/suit_jacket/brown
	name = "brown suit"
	desc = "A brown suit complete with a white shirt and green tie."
	icon_state = "brownsuit"
	item_state = "brownsuit"

/obj/item/clothing/under/suit_jacket/brown/skirt
	name = "brown skirt"
	desc = "A brown skirted suit complete with a white shirt and green tie."
	icon_state = "brownsuitskirt"
	item_state = "brownsuitskirt"

/obj/item/clothing/under/suit_jacket/pinstripe
	name = "classic suit"
	desc = " black suit complete with a white shirt and black tie."
	icon_state = "pinstripesuit"
	item_state = "pinstripesuit"

/obj/item/clothing/under/suit_jacket/pinstripe/skirt
	name = "classic skirt"
	desc = "A black skirted suit complete with a white shirt and black tie."
	icon_state = "pinstripesuitskirt"
	item_state = "pinstripesuitskirt"

/obj/item/clothing/under/suit_jacket/pink
	name = "pink suit"
	desc = "A pink suit complete with a yellow shirt and red necktie."
	icon_state = "pinksuit"
	item_state = "pinksuit"

/obj/item/clothing/under/suit_jacket/pink/skirt
	name = "pink suit skirt"
	desc = "A pink skirted suit complete with a yellow shirt and red necktie."
	icon_state = "pinksuitskirt"
	item_state = "pinksuitskirt"

/obj/item/clothing/under/suit_jacket/redblack
	name = "cinnabar suit"
	desc = "A suit with an outspoken red and black design."
	icon_state = "redblacksuit"
	item_state = "redblacksuit"

/obj/item/clothing/under/suit_jacket/redblack/skirt
	name = "cinnabar suit skirt"
	desc = "A skirted suit with an outspoken red and black design."
	icon_state = "redblacksuitskirt"
	item_state = "redblacksuitskirt"

/obj/item/clothing/under/suit_jacket/lawyerblue
	name = "blue business suit"
	desc = "A blue suit complete with a white shirt and red tie."
	icon_state = "lawyerbluesuit"
	item_state = "lawyerbluesuit"

/obj/item/clothing/under/suit_jacket/lawyerblue/skirt
	name = "blue business suit skirt"
	desc = "A blue skirted suit complete with a white shirt and red tie."
	icon_state = "lawyerbluesuitskirt"
	item_state = "lawyerbluesuitskirt"

/obj/item/clothing/under/suit_jacket/lawyerred
	name = "red business suit"
	desc = "A red suit complete with a white shirt and black tie."
	icon_state = "lawyerredsuit"
	item_state = "lawyerredsuit"

/obj/item/clothing/under/suit_jacket/lawyerred/skirt
	name = "red business suit skirt"
	desc = "A red skirted suit complete with a white shirt and black tie."
	icon_state = "lawyerredsuitskirt"
	item_state = "lawyerredsuitskirt"

/obj/item/clothing/under/suit_jacket/executivedress
	name = "executive dress"
	desc = "A formal black dress suit with a feminine design."
	icon_state = "executivedress"
	item_state = "executivedress"

/obj/item/clothing/under/suit_jacket/executivedress/skirt
	name = "executive dress skirt"
	desc = "A formal black dress skirted suit with a feminine design."
	icon_state = "executivedressskirt"
	item_state = "executivedress"

/obj/item/clothing/under/suit_jacket/chestnut
	name = "chestnut suit"
	desc = "A chestnut suit complete with a white shirt and black bowtie."
	icon_state = "oldman"
	item_state = "oldman"

/obj/item/clothing/under/suit_jacket/chestnut/skirt
	name = "chestnut suit skirt"
	desc = "A skirted chestnut suit complete with a white shirt."
	icon_state = "oldwoman"
	item_state = "oldwoman"

/obj/item/clothing/under/modular/smoky
	name = "smoky suit"
	desc = "Dark suit leggings complemented by a silky black shirt."
	icon_state = "gentlesuit"
	item_state = "gentlesuit"

/obj/item/clothing/under/modular/smoky/skirt
	name = "smoky suit skirt"
	desc = "Dark suit skirt complemented by a silky black shirt."
	icon_state = "gentlesuitskirt"
	item_state = "gentlesuitskirt"

/obj/item/clothing/under/modular
	name = "black suit"
	desc = "Black suit leggings complemented by a buttoned white shirt."
	icon_state = "blacksuitbuttoned"
	item_state = "blacksuitbuttoned"

/obj/item/clothing/under/modular/skirt
	name = "black suit skirt"
	desc = "Black suit skirt complemented by a buttoned white shirt."
	icon_state = "blacksuitskirtbuttoned"
	item_state = "blacksuitskirtbuttoned"

/obj/item/clothing/under/modular/blue
	name = "blue suit"
	desc = "Blue suit leggings complemented by a buttoned white shirt."
	icon_state = "bluesuitbuttoned"
	item_state = "bluesuitbuttoned"

/obj/item/clothing/under/modular/blue/skirt
	name = "blue suit skirt"
	desc = "Blue suit skirt complemented by a buttoned white shirt."
	icon_state = "bluesuitskirtbuttoned"
	item_state = "bluesuitskirtbuttoned"

/obj/item/clothing/under/modular/burgundy
	name = "burgundy suit"
	desc = "Burgundy suit leggings complemented by a buttoned white shirt."
	icon_state = "burgundysuitbuttoned"
	item_state = "burgundysuitbuttoned"

/obj/item/clothing/under/modular/burgundy/skirt
	name = "burgundy suit skirt"
	desc = "Burgundy suit skirt complemented by a buttoned white shirt."
	icon_state = "burgundysuitskirtbuttoned"
	item_state = "burgundysuitskirtbuttoned"

/obj/item/clothing/under/modular/charcoal
	name = "charcoal suit"
	desc = "Charcoal suit leggings complemented by a buttoned white shirt."
	icon_state = "charcoalsuitbuttoned"
	item_state = "charcoalsuitbuttoned"

/obj/item/clothing/under/modular/charcoal/skirt
	name = "charcoal suit skirt"
	desc = "Charcoal suit skirt complemented by a buttoned white shirt."
	icon_state = "charcoalsuitskirtbuttoned"
	item_state = "charcoalsuitskirtbuttoned"

/obj/item/clothing/under/modular/checkered
	name = "checkered suit"
	desc = "Checkered suit leggings complemented by a buttoned white shirt."
	icon_state = "checkeredsuitbuttoned"
	item_state = "checkeredsuitbuttoned"

/obj/item/clothing/under/modular/checkered/skirt
	name = "checkered suit skirt"
	desc = "Checkered suit skirt complemented by a buttoned white shirt."
	icon_state = "checkeredsuitskirtbuttoned"
	item_state = "checkeredsuitskirtbuttoned"

/obj/item/clothing/under/modular/green
	name = "green suit"
	desc = "Green suit leggings complemented by a buttoned white shirt."
	icon_state = "greensuitbuttoned"
	item_state = "greensuitbuttoned"

/obj/item/clothing/under/modular/green/skirt
	name = "green suit skirt"
	desc = "Green suit skirt complemented by a buttoned white shirt."
	icon_state = "greensuitskirtbuttoned"
	item_state = "greensuitskirtbuttoned"

/obj/item/clothing/under/modular/navy
	name = "navy suit"
	desc = "Navy suit leggings complemented by a buttoned white shirt."
	icon_state = "navysuitbuttoned"
	item_state = "navysuitbuttoned"

/obj/item/clothing/under/modular/navy/skirt
	name = "navy suit skirt"
	desc = "Navy suit skirt complemented by a buttoned white shirt."
	icon_state = "navysuitskirtbuttoned"
	item_state = "navysuitskirtbuttoned"

/obj/item/clothing/under/modular/tan
	name = "tan suit"
	desc = "Tan suit leggings complemented by a buttoned white shirt."
	icon_state = "tansuitbuttoned"
	item_state = "tansuitbuttoned"

/obj/item/clothing/under/modular/tan/skirt
	name = "tan suit skirt"
	desc = "Tan suit skirt complemented by a buttoned white shirt."
	icon_state = "tansuitskirtbuttoned"
	item_state = "tansuitskirtbuttoned"

/obj/item/clothing/under/modular/purple
	name = "purple suit"
	desc = "Purple suit leggings complemented by a white shirt and waistcoat."
	icon_state = "lawyerpurplesuit"
	item_state = "lawyerpurplesuit"

/obj/item/clothing/under/modular/purple/skirt
	name = "purple suit skirt"
	desc = "Purple suit skirt complemented by a white shirt and waistcoat."
	icon_state = "lawyerpurplesuitskirt"
	item_state = "lawyerpurplesuitskirt"


	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/plaid/schoolgirlblue
	name = "proper blue dress"
	desc = "A rather tidy dress in a blue design."
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/schoolgirlred
	name = "proper red dress"
	desc = "A rather tidy dress in a red design."
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/schoolgirlorange
	name = "proper orange dress"
	desc = "A rather tidy dress in a orange design."
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/schoolgirlgreen
	name = "proper green dress"
	desc = "A rather tidy dress in a green design."
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/sundress
	name = "dark sundress"
	desc = "A dark blue sundress decorated with white flowers."
	icon_state = "sundress"
	icon_state = "sundress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/sundress/white
	name = "light sundress"
	desc = "A white sundress decorated with purple lilies."
	icon_state = "sundress_white"
	item_state = "sundress_white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid/white2
	name = "white long dress"
	desc = "A rather long plain white dress."
	icon_state = "whitedress2"
	item_state = "whitedress2"

/obj/item/clothing/under/plaid/white3
	name = "white short dress"
	desc = "A short plain white dress."
	icon_state = "whitedress3"
	item_state = "whitedress3"

/obj/item/clothing/under/plaid/white4
	name = "white flared dress"
	desc = "A long plain white dress that flares out at the bottom."
	icon_state = "whitedress4"
	item_state = "whitedress4"

/obj/item/clothing/under/plaid/blacktango
	name = "black tango dress"
	desc = "A black tango dress with red decor."
	icon_state = "black_tango"
	item_state = "black_tango"

/obj/item/clothing/under/plaid/darkred
	name = "red dress"
	desc = "A short, red dress with a black belt."
	icon_state = "darkreddress"
	item_state = "darkreddress"

/obj/item/clothing/under/plaid/dress_yellow
	name = "yellow dress"
	desc = "A flirty, little yellow dress."
	icon_state = "dress_yellow"
	item_state = "dress_yellow"

/obj/item/clothing/under/plaid/stripeddress
	name = "striped dress"
	desc = "A striped monochrome skirt underneath a blue blazer."
	icon_state = "striped_dress"
	item_state = "striped_dress"

/obj/item/clothing/under/plaid/sailordress
	name = "sailor dress"
	desc = "A formal blue skirt under a red blazer."
	icon_state = "sailor_dress"
	item_state = "sailor_dress"

/obj/item/clothing/under/plaid/dress_fire
	name = "flame dress"
	desc = "A small black dress with a distinctive blue flame design."
	icon_state = "dress_fire"
	item_state = "dress_fire"

/obj/item/clothing/under/plaid/dress_orange
	name = "orange dress"
	desc = "A fancy orange gown with some leg reveal."
	icon_state = "dress_orange"
	item_state = "dress_orange"

/obj/item/clothing/under/plaid/dress_green
	name = "green dress"
	desc = "A simple and snug green dress."
	icon_state = "dress_green"
	item_state = "dress_green"

/obj/item/clothing/under/plaid/dress_pink
	name = "pink dress"
	desc = "A simple and snug pink dress."
	icon_state = "dress_pink"
	item_state = "dress_pink"

/obj/item/clothing/under/overalls
	name = "yellow overalls"
	desc = "A set of durable yellow overalls with a blue shirt underneath."
	icon_state = "overalls"
	item_state = "lb_suit"

/obj/item/clothing/under/overalls/brown
	name = "brown overalls"
	desc = "A set of rugged brown overalls with a grey shirt underneath."
	icon_state = "mechanic"
	item_state = "mechanic"

/obj/item/clothing/under/overalls/checkered
	name = "checkered overalls"
	desc = "A set of tough blue overalls with a checkered red shirt underneath."
	icon_state = "frontier"
	item_state = "frontier"

/obj/item/clothing/under/top/
	name = "grey crop top"
	desc = "A grey crop top complete with a pair of jeans."
	icon_state = "croptop_grey"
	item_state = "croptop_grey"

/obj/item/clothing/under/top/croptropred
	name = "red crop top"
	desc = "A red crop top complete with a pair of jeans."
	icon_state = "croptop_red"
	item_state = "croptop_red"

/obj/item/clothing/under/top/cuttop
	name = "grey cut top"
	desc = "A grey cut top complete with a pair of jeans."
	icon_state = "cuttop"
	item_state = "cuttop"

/obj/item/clothing/under/top/cuttopred
	name = "red cut top"
	desc = "A red cut top complete with a pair of jeans."
	icon_state = "cuttop_red"
	item_state = "cuttop_red"

/obj/item/clothing/under/pirate
	name = "pirate outfit"
	desc = "Yarr."
	icon_state = "pirate"
	//item_state = "sl_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/soviet
	name = "soviet uniform"
	desc = "For the Motherland!"
	icon_state = "soviet"
	item_state = "gy_suit"

/obj/item/clothing/under/plaid/kilt
	name = "plaid kilt"
	desc = "A plaid kilt complete with a matching green shirt."
	icon_state = "kilt"
	item_state = "kilt"

/obj/item/clothing/under/plaid
	name = "plaid blue dress"
	desc = "A preppy blue skirt with a white blouse."
	icon_state = "plaid_blue"
	item_state = "plaid_blue"

/obj/item/clothing/under/plaid/purple
	name = "plaid purple dress"
	desc = "A preppy purple skirt with a white blouse."
	icon_state = "plaid_purple"
	item_state = "plaid_purple"

/obj/item/clothing/under/plaid/red
	name = "plaid red dress"
	desc = "A preppy red skirt with a white blouse."
	icon_state = "plaid_red"
	item_state = "plaid_red"

/obj/item/clothing/under/cheongsam
	name = "white cheongsam"
	desc = "A white cheongsam dress."
	icon_state = "cheongsam-white"
	item_state = "cheongsam-white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/cheongsam/red
	name = "red cheongsam"
	desc = "A red cheongsam dress."
	icon_state = "cheongsam-red"
	item_state = "cheongsam-red"

/obj/item/clothing/under/cheongsam/blue
	name = "blue cheongsam"
	desc = "A blue cheongsam dress."
	icon_state = "cheongsam-blue"
	item_state = "cheongsam-blue"

/obj/item/clothing/under/cheongsam/black
	name = "black cheongsam"
	desc = "A black cheongsam dress."
	icon_state = "cheongsam-black"
	item_state = "cheongsam-black"

/obj/item/clothing/under/cheongsam/darkred
	name = "dark red cheongsam"
	desc = "A dark red cheongsam dress."
	icon_state = "cheongsam-darkred"
	item_state = "cheongsam-darkred"

/obj/item/clothing/under/cheongsam/green
	name = "green cheongsam"
	desc = "A green cheongsam dress."
	icon_state = "cheongsam-green"
	item_state = "cheongsam-green"

/obj/item/clothing/under/cheongsam/purple
	name = "purple cheongsam"
	desc = "A purple cheongsam dress."
	icon_state = "cheongsam-purple"
	item_state = "cheongsam-purple"

/obj/item/clothing/under/cheongsam/darkblue
	name = "dark blue cheongsam"
	desc = "A dark blue cheongsam dress."
	icon_state = "cheongsam-darkblue"
	item_state = "cheongsam-darkblue"

/obj/item/clothing/under/turtleneck
	name = "grey turtleneck"
	desc = "A grey turtleneck complete with dark blue slacks."
	icon_state = "turtleneckgrey"
	item_state = "turtleneck"

/obj/item/clothing/under/turtleneck/green
	desc = "A turquoise turtleneck complete with dark blue slacks."
	name = "green turtleneck"
	icon_state = "psychturtle"
	item_state = "b_suit"

/obj/item/clothing/under/turtleneck/tacticalgreen
	desc = "A compact green turtleneck complete with tan combat pants."
	name = "green tactical turtleneck"
	icon_state = "greenturtle"
	item_state = "greenturtle"

/obj/item/clothing/under/turtleneck/tacticalgrey
	desc = "A compact grey turtleneck complete with tan combat pants."
	name = "grey tactical turtleneck"
	icon_state = "blackturtle"
	item_state = "blackturtle"

/obj/item/clothing/under/turtleneck/tacticalblack
	name = "black tactical turtleneck"
	desc = "A compact black turtleneck complete with dark combat pants."
	icon_state = "blackutility"
	item_state = "blackutility"

	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/gladiator
	name = "gladiator uniform"
	desc = "Are you not entertained? Is that not why you are here?"
	icon_state = "gladiator"
	item_state = "o_suit"

	body_parts_covered = LOWER_TORSO

/obj/item/clothing/under/bride_white
	name = "silky wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	item_state = "nursesuit"
	flags_inv = HIDESHOES
	body_parts_covered = UPPER_TORSO|LOWER_TORSO


/obj/item/clothing/under/captainformal
	name = "captain's formal uniform"
	desc = "A captain's formal-wear, for special occasions."
	icon_state = "captain_formal"
	item_state = "b_suit"


/obj/item/clothing/under/assistantformal
	name = "assistant's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	item_state = "gy_suit"

/obj/item/clothing/under/overalls/utility
	name = "grey utility jumpsuit"
	desc = "A rugged grey jumpsuit designed for maintenance work."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/under/overalls/utility/tan
	name = "tan utility jumpsuit"
	desc = "A rugged tan jumpsuit designed for maintenance work."
	icon_state = "tanutility"
	item_state = "tanutility"

/obj/item/clothing/under/overalls/utility/navy
	name = "navy utility jumpsuit"
	desc = "A rugged navy jumpsuit designed for maintenance work."
	icon_state = "navyutility"
	item_state = "navyutility"

/obj/item/clothing/under/overalls/utility/green
	name = "green utility jumpsuit"
	desc = "A rugged jumpsuit for utility work with a green design."
	icon_state = "greenutility"
	item_state = "greenutility"


/obj/item/clothing/under/shorts/white
	name = "white shorts"
	icon_state = "whiteshorts"

/obj/item/clothing/under/shorts/white/female
	name = "white slim shorts"
	icon_state = "whiteshorts_f"

/obj/item/clothing/under/shorts/jeans
	name = "standard jeans shorts"
	desc = "Some jeans! Just in short form!"
	icon_state = "jeans_shorts"

/obj/item/clothing/under/shorts/jeans/female
	name = "standard jeans slim shorts"
	icon_state = "jeans_shorts_f"

/obj/item/clothing/under/shorts/jeans/classic
	name = "classic jeans shorts"
	icon_state = "jeansclassic_shorts"

/obj/item/clothing/under/shorts/jeans/classic/female
	name = "classic jeans slim shorts"
	icon_state = "jeansclassic_shorts_f"

/obj/item/clothing/under/shorts/jeans/mustang
	name = "mustang jeans shorts"
	icon_state = "jeansmustang_shorts"

/obj/item/clothing/under/shorts/jeans/mustang/female
	name = "mustang jeans slim shorts"
	icon_state = "jeansmustang_shorts_f"

/obj/item/clothing/under/shorts/jeans/youngfolks
	name = "trendy jeans shorts"
	icon_state = "jeansyoungfolks_shorts"

/obj/item/clothing/under/shorts/jeans/youngfolks/female
	name = "trendy jeans slim shorts"
	icon_state = "jeansyoungfolks_shorts_f"

/obj/item/clothing/under/shorts/jeans/black
	name = "black jeans shorts"
	icon_state = "blackpants_shorts"

/obj/item/clothing/under/shorts/jeans/black/female
	name = "black jeans slim shorts"
	icon_state = "black_shorts_f"

/obj/item/clothing/under/shorts/jeans/grey
	name = "grey jeans shorts"
	icon_state = "greypants_shorts"

/obj/item/clothing/under/shorts/jeans/grey/female
	name = "grey jeans slim shorts"
	icon_state = "grey_shorts_f"

/obj/item/clothing/under/shorts/khaki
	name = "khaki shorts"
	desc = "For that island getaway. It's five o'clock somewhere, right?"
	icon_state = "tanpants_shorts"

/obj/item/clothing/under/shorts/khaki/female
	name = "khaki slim shorts"
	icon_state = "khaki_shorts_f"

/obj/item/clothing/under/pants
	name = "standard jeans"
	desc = "A nondescript pair of tough blue jeans."
	icon_state = "jeans"
	gender = PLURAL
	body_parts_covered = LOWER_TORSO|LEGS

/obj/item/clothing/under/pants/ripped
	name = "standard ripped jeans"
	desc = "A nondescript pair of tough blue jeans with holes in them."
	icon_state = "jeansripped"

/obj/item/clothing/under/pants/classicjeans
	name = "classic jeans"
	desc = "You feel cooler already."
	icon_state = "jeansclassic"

/obj/item/clothing/under/pants/classicjeans/ripped
	name = "classic ripped jeans"
	desc = "You feel cooler already. These have holes in them."
	icon_state = "jeansclassicripped"

/obj/item/clothing/under/pants/mustangjeans
	name = "mustang jeans"
	desc = "Made in the finest space jeans factory this side of Alpha Centauri."
	icon_state = "jeansmustang"

/obj/item/clothing/under/pants/mustangjeans/ripped
	name = "mustang ripped jeans"
	desc = "Made in the finest space jeans factory this side of Alpha Centauri. These have holes in them."
	icon_state = "jeansmustangripped"

/obj/item/clothing/under/pants/blackjeans
	name = "black jeans"
	desc = "Only for those who can pull it off."
	icon_state = "jeansblack"

/obj/item/clothing/under/pants/blackjeans/ripped
	name = "black ripped jeans"
	desc = "Only for those who can pull it off. These have holes in them."
	icon_state = "jeansblackripped"

/obj/item/clothing/under/pants/greyjeans
	name = "grey jeans"
	desc = "Only for those who can pull it off."
	icon_state = "jeansgrey"

/obj/item/clothing/under/pants/greyjeans/ripped
	name = "grey ripped jeans"
	desc = "Only for those who can pull it off. These have holes in them."
	icon_state = "jeansgreyripped"

/obj/item/clothing/under/pants/youngfolksjeans
	name = "trendy jeans"
	desc = "For those tired of boring old jeans. Relive the passion of your youth!"
	icon_state = "jeansyoungfolks"

/obj/item/clothing/under/pants/white
	name = "white pants"
	desc = "Plain white pants. Boring."
	icon_state = "whitepants"

/obj/item/clothing/under/pants/red
	name = "red pants"
	desc = "Bright red pants. Overflowing with personality."
	icon_state = "redpants"

/obj/item/clothing/under/pants/black
	name = "black pants"
	desc = "These pants are dark, like your soul."
	icon_state = "blackpants"

/obj/item/clothing/under/pants/tan
	name = "tan pants"
	desc = "Some tan pants. You look like a white collar worker with these on."
	icon_state = "tanpants"

/obj/item/clothing/under/pants/track
	name = "track pants"
	desc = "A pair of track pants, for the athletic."
	icon_state = "trackpants"

/obj/item/clothing/under/pants/track/blue
	name = "blue track pants"
	icon_state = "trackpantsblue"

/obj/item/clothing/under/pants/track/green
	name = "green track pants"
	icon_state = "trackpantsgreen"

/obj/item/clothing/under/pants/track/white
	name = "white track pants"
	icon_state = "trackpantswhite"

/obj/item/clothing/under/pants/track/red
	name = "red track pants"
	icon_state = "trackpantsred"

/obj/item/clothing/under/pants/khaki
	name = "khaki pants"
	desc = "A pair of dust beige khaki pants."
	icon_state = "khaki"

/obj/item/clothing/under/pants/camo
	name = "camo pants"
	desc = "A pair of woodland camouflage pants. Probably not the best choice for a space station."
	icon_state = "camopants"

/obj/item/clothing/under/pants/chaps
	name = "brown chaps"
	desc = "A pair of tight brown leather chaps."
	icon_state = "chapsb"

/obj/item/clothing/under/pants/chaps/black
	name = "black chaps"
	desc = "A pair of tight black leather chaps."
	icon_state = "chapsbl"

/obj/item/clothing/under/pants/yogapants
	name = "yoga pants"
	desc = "A pair of tight-fitting yoga pants for those lazy days."
	icon_state = "yogapants"

/*
 * Baggy Pants
 */
/obj/item/clothing/under/pants/baggy
	name = "standard baggy jeans"
	desc = "A nondescript pair of tough baggy blue jeans."
	icon_state = "baggy_jeans"

/obj/item/clothing/under/pants/baggy/classicjeans
	name = "classic baggy jeans"
	desc = "You feel cooler already."
	icon_state = "baggy_jeansclassic"

/obj/item/clothing/under/pants/baggy/mustangjeans
	name = "mustang baggy jeans"
	desc = "Made in the finest space jeans factory this side of Alpha Centauri."
	icon_state = "baggy_jeansmustang"

/obj/item/clothing/under/pants/baggy/blackjeans
	name = "black baggy jeans"
	desc = "Only for those who can pull it off."
	icon_state = "baggy_jeansblack"

/obj/item/clothing/under/pants/baggy/greyjeans
	name = "grey baggy jeans"
	desc = "Only for those who can pull it off."
	icon_state = "baggy_jeansgrey"

/obj/item/clothing/under/pants/baggy/youngfolksjeans
	name = "trendy baggy jeans"
	desc = "For those tired of boring old jeans. Relive the passion of your youth!"
	icon_state = "baggy_jeansyoungfolks"

/obj/item/clothing/under/pants/baggy/white
	name = "white baggy pants"
	desc = "Plain white pants. Boring."
	icon_state = "baggy_whitepants"

/obj/item/clothing/under/pants/baggy/red
	name = "red baggy pants"
	desc = "Bright red pants. Overflowing with personality."
	icon_state = "baggy_redpants"

/obj/item/clothing/under/pants/baggy/black
	name = "black baggy pants"
	desc = "These pants are dark, like your soul."
	icon_state = "baggy_blackpants"

/obj/item/clothing/under/pants/baggy/tan
	name = "tan baggy pants"
	desc = "Some tan pants. You look like a white collar worker with these on."
	icon_state = "baggy_tanpants"

/obj/item/clothing/under/pants/baggy/track
	name = "track baggy pants"
	desc = "A pair of track pants, for the athletic."
	icon_state = "baggy_trackpants"

/obj/item/clothing/under/pants/baggy/khaki
	name = "khaki baggy pants"
	desc = "A pair of dust beige khaki pants."
	icon_state = "baggy_khaki"

/obj/item/clothing/under/pants/baggy/camo
	name = "camo baggy pants"
	desc = "A pair of woodland camouflage pants. Probably not the best choice for a space station."
	icon_state = "baggy_camopants"

/obj/item/clothing/under/skirt
	name = "short black skirt"
	desc = "A short skirt with a black design."
	icon_state = "skirt_short_black"
	body_parts_covered = LOWER_TORSO

/obj/item/clothing/under/skirt/khaki
	name = "khaki skirt"
	desc = "An exotic skirt with a khaki design."
	icon_state = "skirt_khaki"

/obj/item/clothing/under/skirt/blue
	name = "short blue skirt"
	desc = "A short skirt with a shiny blue design."
	icon_state = "skirt_short_blue"

/obj/item/clothing/under/skirt/red
	name = "short red skirt"
	desc = "A short skirt with a shiny red design."
	icon_state = "skirt_short_red"

/obj/item/clothing/under/skirt/denim
	name = "short denim skirt"
	desc = "A short skirt composed of fine denim."
	icon_state = "skirt_short_denim"

/obj/item/clothing/under/skirt/swept
	name = "swept skirt"
	desc = "A black skirt elegantly swept to one side."
	icon_state = "skirt_swept"