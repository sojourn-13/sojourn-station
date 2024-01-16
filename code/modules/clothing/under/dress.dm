/*Plaid*/

/obj/item/clothing/under/dress/green
	name = "green dress"
	desc = "A simple and snug green dress."
	icon_state = "dress_green"
	item_state = "dress_green"

/obj/item/clothing/under/dress/flame
	name = "flame dress"
	desc = "A small black dress with a distinctive blue flame design."
	icon_state = "dress_fire"
	item_state = "dress_fire"

/obj/item/clothing/under/dress/maid
	name = "maid dress"
	desc = "A comfortable outfit for cleaning! Or perhaps performing other activities, too."
	icon_state = "maid"
	item_state = "maid"

/obj/item/clothing/under/dress/maid/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Maid"] = "maid"
	options["Alt Maid"] = "maid_alt" //Sprite by Tori

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your clothing into [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/dress/orange
	name = "orange dress"
	desc = "A fancy orange gown with some leg reveal."
	icon_state = "dress_orange"
	item_state = "dress_orange"

/obj/item/clothing/under/dress/pink
	name = "pink dress"
	desc = "A simple and snug pink dress."
	icon_state = "dress_pink"
	item_state = "dress_pink"

/obj/item/clothing/under/dress/red
	name = "red dress"
	desc = "A short, red dress with a black belt."
	icon_state = "darkreddress"
	item_state = "darkreddress"

/obj/item/clothing/under/dress/sailor
	name = "sailor dress"
	desc = "A formal blue skirt under a red blazer."
	icon_state = "sailor_dress"
	item_state = "sailor_dress"

/obj/item/clothing/under/dress/striped
	name = "striped dress"
	desc = "A striped monochrome skirt underneath a blue blazer."
	icon_state = "striped_dress"
	item_state = "striped_dress"

/obj/item/clothing/under/dress/blacktango
	name = "tango dress"
	desc = "A black tango dress with red decor."
	icon_state = "black_tango"
	item_state = "black_tango"

/obj/item/clothing/under/dress/whiteflared
	name = "white flared dress"
	desc = "A long plain white dress that flares out at the bottom."
	icon_state = "whitedress4"
	item_state = "whitedress4"

/obj/item/clothing/under/dress/whitelong
	name = "white long dress"
	desc = "A rather long plain white dress."
	icon_state = "whitedress2"
	item_state = "whitedress2"

/obj/item/clothing/under/dress/whiteshort
	name = "white short dress"
	desc = "A short plain white dress."
	icon_state = "whitedress3"
	item_state = "whitedress3"

/obj/item/clothing/under/dress/yellow
	name = "yellow dress"
	desc = "A flirty, little yellow dress."
	icon_state = "dress_yellow"
	item_state = "dress_yellow"

/obj/item/clothing/under/dress/kilt
	name = "plaid kilt"
	desc = "A plaid kilt complete with a matching green shirt."
	icon_state = "kilt"
	item_state = "kilt"

/obj/item/clothing/under/dress/plaidblue
	name = "plaid blue dress"
	desc = "A preppy blue skirt with a white blouse."
	icon_state = "plaid_blue"
	item_state = "plaid_blue"

/obj/item/clothing/under/dress/plaidgreen
	name = "plaid green dress"
	desc = "A preppy green skirt with a white blouse."
	icon_state = "plaid_green"
	item_state = "plaid_green"

/obj/item/clothing/under/dress/plaidpurple
	name = "plaid purple dress"
	desc = "A preppy purple skirt with a white blouse."
	icon_state = "plaid_purple"
	item_state = "plaid_purple"

/obj/item/clothing/under/dress/plaidred
	name = "plaid red dress"
	desc = "A preppy red skirt with a white blouse."
	icon_state = "plaid_red"
	item_state = "plaid_red"

/obj/item/clothing/under/dress/properblue
	name = "proper blue dress"
	desc = "A rather tidy dress in a blue design."
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/dress/properred
	name = "proper red dress"
	desc = "A rather tidy dress in a red design."
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/dress/properorange
	name = "proper orange dress"
	desc = "A rather tidy dress in a orange design."
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/dress/propergreen
	name = "proper green dress"
	desc = "A rather tidy dress in a green design."
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/dress/sundressdark
	name = "dark sundress"
	desc = "A dark blue sundress decorated with white flowers."
	icon_state = "sundress"
	icon_state = "sundress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/plaid
	name = "light sundress"
	desc = "A white sundress decorated with purple lilies."
	icon_state = "sundress_white"
	item_state = "sundress_white"

/*Cheongsam*/

/obj/item/clothing/under/cheongsam/black
	name = "black cheongsam"
	desc = "A black cheongsam dress."
	icon_state = "cheongsam-black"
	item_state = "cheongsam-black"

/obj/item/clothing/under/cheongsam/blue
	name = "blue cheongsam"
	desc = "A blue cheongsam dress."
	icon_state = "cheongsam-blue"
	item_state = "cheongsam-blue"

/obj/item/clothing/under/cheongsam/darkblue
	name = "dark blue cheongsam"
	desc = "A dark blue cheongsam dress."
	icon_state = "cheongsam-darkblue"
	item_state = "cheongsam-darkblue"

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

/obj/item/clothing/under/cheongsam/red
	name = "red cheongsam"
	desc = "A red cheongsam dress."
	icon_state = "cheongsam-red"
	item_state = "cheongsam-red"

/obj/item/clothing/under/cheongsam
	name = "white cheongsam"
	desc = "A white cheongsam dress."
	icon_state = "cheongsam-white"
	item_state = "cheongsam-white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/sexymaid
	name = "Skimpy maid dress"
	desc = "More practical than a latex one, but still too short to be of much use cleaning anything other than spears..."
	icon_state = "sexymaid"
	item_state = "sexymaid"
	price_tag = 45

/*Skirts*/

/obj/item/clothing/under/skirt/khaki
	name = "khaki skirt"
	desc = "An exotic skirt with a khaki design."
	icon_state = "skirt_khaki"

/obj/item/clothing/under/skirt/shortblack
	name = "short black skirt"
	desc = "A short skirt with a black design."
	icon_state = "skirt_short_black"
	body_parts_covered = LOWER_TORSO

/obj/item/clothing/under/skirt/shortblue
	name = "short blue skirt"
	desc = "A short skirt with a shiny blue design."
	icon_state = "skirt_short_blue"

/obj/item/clothing/under/skirt/shortdenim
	name = "short denim skirt"
	desc = "A short skirt composed of fine denim."
	icon_state = "skirt_short_denim"

/obj/item/clothing/under/skirt/shortred
	name = "short red skirt"
	desc = "A short skirt with a shiny red design."
	icon_state = "skirt_short_red"

/obj/item/clothing/under/skirt/pleated
	name = "pleated skirt"
	desc = "A short, grey pleated skirt"
	icon_state = "pleated"

/obj/item/clothing/under/skirt/blackpleated
	name = "black pleated skirt"
	desc = "A short, black pleated skirt"
	icon_state = "blackpleated"

/obj/item/clothing/under/skirt
	name = "swept skirt"
	desc = "A black skirt elegantly swept to one side."
	icon_state = "skirt_swept"
