//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/assistant
	desc = "A standard-issue black and orange colonist uniform."
	name = "colonist's uniform"
	icon_state = "assistant"
	item_state = "assistant"

/obj/item/clothing/under/rank/assistant/formal
	name = "colonist's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	item_state = "gy_suit"

/obj/item/clothing/under/rank/bartender
	desc = "An expensive shirt and tie with tailored pants."
	name = "bartender's uniform"
	icon_state = "ba_suit"
	item_state = "ba_suit"

/obj/item/clothing/under/rank/bartender/skirt
	desc = "Expensive shirt and tie with a tailored skirt."
	name = "bartender's skirtsuit"
	icon_state = "ba_skirt"
	item_state = "ba_skirt"

/obj/item/clothing/under/waiter/skirt
	name = "waiter's skirtsuit"
	desc = "It's a very smart uniform with a special pocket for tips and a skirt for female waiters."
	icon_state = "waiter_skirt"
	item_state = "waiter_skirt"

/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "An authoritative green uniform with gold flair denoting the rank of Premier."
	name = "premier's uniform"
	icon_state = "captain"
	item_state = "b_suit"

/obj/item/clothing/under/rank/captain/formal
	name = "premier's formal uniform"
	desc = "A premier's formal-wear, saved for special occasions."
	icon_state = "captain_formal"
	item_state = "b_suit"

/obj/item/clothing/under/rank/cargotech
	name = "lonestar cargo uniform"
	desc = "A dull Lonestar turtleneck complete with sturdy work jeans."
	icon_state = "cargotech"
	item_state = "lb_suit"

	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/preacher
	desc = "A dark ceremonial robe tailored for Primes."
	name = "prime's robe"
	icon_state = "preacher"
	item_state = "w_suit"

/obj/item/clothing/under/rank/acolyte
	desc = "Ceremonial garb of the Absolute's vectors."
	name = "vector's vestments"
	icon_state = "acolyte"
	item_state = "acolyte"

/obj/item/clothing/under/rank/church/sport
	desc = "Smells like lilac."
	name = "church sports vestment"
	icon_state = "nt_sports"
	item_state = "nt_sports"

/obj/item/clothing/under/rank/church
	desc = "Smells like incense."
	name = "church vestments"
	icon_state = "church"
	item_state = "church"

/obj/item/clothing/under/rank/church/toga
	desc = "Smells like laurel wreath."
	name = "church toga"
	icon_state = "numerical_garbs_red"

/obj/item/clothing/under/rank/church/toga/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Red"] = "numerical_garbs_red"
	options["Red Pauldronless"] = "churchtoga_alt"
	options["Black"] = "churchtoga_black"
	options["Black Pauldronless"] = "churchtoga_blackalt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/chef
	desc = "A pleasant yet practical suit for professional kitchen staff."
	name = "chef's uniform"
	icon_state = "chef"
	item_state = "w_suit"

/obj/item/clothing/under/rank/first_officer
	desc = "A tan shirt with a Steward's badge, worn alongside some black leggings."
	name = "steward's uniform"
	icon_state = "hop"
	item_state = "b_suit"

/obj/item/clothing/under/rank/first_officer/skirt
	desc = "A tan shirt with a Steward's badge, worn alongside a black skirt."
	name = "steward's skirt"
	icon_state = "hop_skirt"
	item_state = "b_suit"

/obj/item/clothing/under/rank/first_officer/suit
	name = "steward's suit"
	desc = "A teal suit complete with a white shirt and orange tie. This one has a Steward's badge."
	icon_state = "teal_suit"
	item_state = "g_suit"

/obj/item/clothing/under/rank/botanist
	desc = "A hardy dark green jumpsuit, designed to provide protection from botanic dangers."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"
	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/janitor
	desc = "A sturdy janitorial jumpsuit, designed to provide minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	item_state = "janitor"
	permeability_coefficient = 0.50
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 10,
		rad = 0
	)

/obj/item/clothing/under/rank/artist
	name = "Jester's Garments"
	desc = "The bright colors are almost distracting."
	icon_state = "artist"
	item_state = "artist"

/obj/item/clothing/under/rank/miner
	desc = "A snappy Lonestar jumpsuit complete with sturdy mining overalls."
	name = "lonestar miner's jumpsuit"
	icon_state = "miner"
	item_state = "miner"

/obj/item/clothing/under/outcast
	name = "tactical baggy rags"
	desc = "A jury rugged set of baggy pants with leather reinforcement paddings and other fibers, as comfortable as clothes can get when made by whatever you scavenged off the land."
	icon_state = "tactical_rags"
	item_state = "tactical_rags"
	armor_list = list(melee = 5, bullet = 0, energy = 10, bomb = 0, bio = 0, rad = 5)

/obj/item/clothing/under/rank/lonestar_gorka
	name = "lonestar gorka jumpsuit"
	desc = "A gorka suit painted over with Lonestar orange and black."
	icon_state = "ls_gorka"
	item_state = "ls_gorka"
