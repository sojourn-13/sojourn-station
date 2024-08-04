/*History*/

obj/item/clothing/under/costume/history/pirate
	name = "pirate garments"
	desc = "A set of scurvy-ridden pirate clothing."
	icon_state = "pirate"
	//item_state = "sl_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/costume/history/sailor
	name = "sailor garments"
	desc = "A set of sea-faring sailor clothing."
	icon_state = "sailor"
	item_state = "sailor"

/obj/item/clothing/under/costume/history/soviet
	name = "soviet uniform"
	desc = "An imposing grey military uniform. For The Motherland!"
	icon_state = "soviet"
	item_state = "gy_suit"

/obj/item/clothing/under/costume/history/geisha
	name = "geisha dress"
	desc = "An eye-catching oriental hostess outfit."
	icon_state = "geisha"
	item_state = "geisha"

/obj/item/clothing/under/costume/history/gladiator
	name = "gladiator armor"
	desc = "A set of costume gladiator armor. Are you not entertained?"
	icon_state = "gladiator"
	item_state = "o_suit"

/obj/item/clothing/under/costume/history/napoleonic
	name = "napoleonic uniform"
	desc = "An ancient military outfit with a distinguished style."
	icon_state = "napoleonic"
	item_state = "napoleonic"

/obj/item/clothing/under/costume/history/centurion
	name = "centurion armor"
	desc = "A set of costume centurion gladiator. Ave!"
	icon_state = "roman"
	item_state = "roman"

/obj/item/clothing/under/costume/history/jester
	name = "street jester suit"
	desc = "The merry outfit of a medieval street jester."
	icon_state = "jester"
	item_state = "jester"

/obj/item/clothing/under/costume/history/jester/court
	name = "court jester suit"
	desc = "The extravagant outfit of a medieval court jester."
	icon_state = "jester2"
	item_state = "jester2"

/obj/item/clothing/under/costume/maid
	name = "maid dress"
	desc = "A neat and orderly maid dress, for when you plan to actually clean."
	icon_state = "janimaid"
	item_state = "janimaid"

/obj/item/clothing/under/costume/maid/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Maid"] = "janimaid"
	options["Victorian alt"] = "janimaid_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your clothing into [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/costume/propermaid
	name = "formal maid dress"
	desc = "A proper black dress with a frilly white apron."
	icon_state = "propermaid"
	item_state = "propermaid"

/*Kinky*/

/obj/item/clothing/under/costume/kinky/latex_maid
	name = "latex maid dress"
	desc = "A shiny and squeaky outfit for cleaning and other matters."
	icon_state = "latexmaid"
	item_state = "latexmaid"

/obj/item/clothing/under/costume/kinky/latex_maid/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Maid"] = "latexmaid"
	options["Alt Maid"] = "maid_alt" //Sprite by Tori

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your clothing into [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/costume/kinky/leather
	name = "leather gear"
	desc = "A very revealing leather outfit. Kinky."
	icon_state = "darkholme"
	item_state = "darkholme"
	has_sensor = 0

/obj/item/clothing/under/costume/kinky/sexy_clown
	name = "sexy clown suit"
	desc = "A very honkable outfit for honkable clowns."
	icon_state = "sexyclown"
	item_state = "sexyclown"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/costume/kinky/sexy_mime
	name = "sexy mime suit"
	desc = "A silent but sexy outfit worn by alluring mimes."
	icon_state = "sexymime"
	item_state = "sexymime"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/costume/kinky/stripper_pink
	name = "pink stripper outfit"
	desc = "You already know what this is."
	icon_state = "stripper_p"
	item_state = "stripper_p"
	has_sensor = 0

/obj/item/clothing/under/costume/kinky/stripper_green
	name = "green stripper outfit"
	desc = "You already know what this is."
	icon_state = "stripper_g"
	item_state = "stripper_g"
	has_sensor = 0

/obj/item/clothing/under/costume/kinky/hadakapron
	name = "naked apron"
	desc = "A very impractical yet very revealing apron meant to leave very little to the imagination."
	icon_state = "hadakapron"
	item_state = "hadakapron"
	has_sensor = 0

/*Animal*/

/obj/item/clothing/under/costume/animal/owl
	name = "owl suit"
	desc = "An orange-brown jumpsuit with giant owl wings."
	icon_state = "owl"
	item_state = "owl"

/obj/item/clothing/under/costume/animal/lobster
	name = "lobster suit"
	desc = "An oversized lobster suit made out of foam."
	icon_state = "lobster"
	item_state = "lobster"

/obj/item/clothing/under/costume/animal/griffin
	name = "griffon suit"
	desc = "A soft brown jumpsuit with a synthetic white feather collar."
	icon_state = "griffin"
	item_state = "griffin"

/*Jobs*/

/obj/item/clothing/under/costume/job/police
	name = "police uniform"
	desc = "A blue uniform traditionally worn by city police."
	icon_state = "retropolice"
	item_state = "retropolice"

/obj/item/clothing/under/costume/job/mailman
	name = "mail uniform"
	desc = "A blue uniform worn by the long-defunct local mail service."
	icon_state = "mailman"
	item_state = "mailman"

/obj/item/clothing/under/costume/job/clown
	name = "red clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "clown"
	item_state = "clown"

/obj/item/clothing/under/gnome
	name = "gnome outfit"
	desc = "Against the gnome there is no reception, if there is no other gnomes."
	icon_state = "gnome"
	item_state = "gnome"

/obj/item/clothing/under/gnome/fat
	name = "fat gnome outfit"
	icon_state = "gnome_suit_fat"
	item_state = "gnome_suit_fat"

/obj/item/clothing/under/costume/job/clown/orange
	name = "orange clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "orangeclown"
	item_state = "orangeclown"

/obj/item/clothing/under/costume/job/clown/blue
	name = "blue clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "blueclown"
	item_state = "blueclown"

/obj/item/clothing/under/costume/job/clown/green
	name = "green clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "greenclown"
	item_state = "greenclown"

/obj/item/clothing/under/costume/job/clown/yellow
	name = "yellow clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "yellowclown"
	item_state = "yellowclown"

/obj/item/clothing/under/costume/job/clown/purple
	name = "purple clown suit"
	desc = "A colorful and comedic outfit perfect for some clowning around."
	icon_state = "purpleclown"
	item_state = "purpleclown"

/obj/item/clothing/under/costume/job/mime
	name = "mime suit"
	desc = "The outfit of a mime. It's not very colorful."
	icon_state = "mime"
	item_state = "ba_suit"

/obj/item/clothing/under/costume/job/mime/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["mime default"] = "mime"
	options["mime default down"] = "mime_d"
	options["mime skirt"] = "mime_skirt"
	options["mime skirt down"] = "mime_skirt_d"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/costume/job/nurse
	name = "nurse dress"
	desc = "A white medical dress worn by a nurse."
	icon_state = "nurse"
	item_state = "nurse"

/obj/item/clothing/under/costume/job/waiter
	name = "waiter's outfit"
	desc = "An elegant waiter's suit, complete with a pocket for tips."
	icon_state = "waiter"
	item_state = "waiter"

/obj/item/clothing/under/costume/job/waiter/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default"] = "waiter"
	options["blue alt"] = "waiter_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your outfit's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*Halloween*/

/obj/item/clothing/under/costume/halloween/scarecrow
	name = "scarecrow rags"
	desc = "A ragged old cornfield outfit."
	icon_state = "scarecrow"
	item_state = "scarecrow"

/obj/item/clothing/under/costume/halloween/skeleton
	name = "skeleton costume"
	desc = "A black jumpsuit with a white bone pattern. Spooky."
	icon_state = "skeleton"
	item_state = "skeleton"
	body_parts_covered = ARMS|LEGS

/obj/item/clothing/under/costume/halloween/villain
	name = "villain suit"
	desc = "A costume that feels and looks absolutely nefarious."
	icon_state = "villain"
	item_state = "villain"

/obj/item/clothing/under/costume/halloween/mummy
	name = "mummy wrappings"
	desc = "A near-endless wrapping of rustic bandages."
	icon_state = "mummy"
	item_state = "mummy"
	body_parts_covered = ARMS|LEGS

/obj/item/clothing/under/costume/halloween/apocalypse
	name = "nuclear survivor jumpsuit"
	desc = "An outlandish blue jumpsuit with a retro apocalyptic theme."
	icon_state = "vault"
	item_state = "vault"

/obj/item/clothing/under/costume/halloween/ragged
	name = "ragged pants"
	desc = "A pair of shredded and decayed legwear. Ominous."
	icon_state = "ghoul"
	item_state = "ghoul"

/obj/item/clothing/under/costume/halloween/femvampire
	name = "vampire dress"
	desc = "An ominous black and red dress worn by vampires."
	icon_state = "femdracula"
	item_state = "femdracula"

/obj/item/clothing/under/costume/halloween/deathofficer
	name = "death officer uniform"
	desc = "A sinister military uniform that emits a dramatically imposing vibe."
	icon_state = "enclave"
	item_state = "enclave"
	body_parts_covered = ARMS|LEGS

/*Misc*/

/obj/item/clothing/under/costume/misc/rainbowjumpsuit
	name = "rainbow jumpsuit"
	desc = "A fabulously colorful jumpsuit."
	icon_state = "rainbow"
	item_state = "rainbow"

/obj/item/clothing/under/costume/misc/rainbowskirt
	name = "rainbow jumpsuit"
	desc = "A fabulously colorful jumpskirt."
	icon_state = "rainbow_skirt"
	item_state = "rainbow_skirt"

/*
/obj/item/clothing/under/costume/misc/rainbowundercloak
	name = "rainbow undercloak"
	initial_name = "rainbow undercloak"
	desc = "A teshari undercloak in a multitude of colors."
	icon_state = "tesh_uniform_rainbow"
	item_state = "rainbow"
*/

/obj/item/clothing/under/costume/misc/rainbowclown
	name = "rainbow clown suit"
	initial_name = "rainbow clown suit"
	desc = "A dazzlingly colorful clown suit."
	icon_state = "rainbowclown"
	item_state = "rainbowclown"

/obj/item/clothing/under/costume/misc/psyche
	name = "psychedelic jumpsuit"
	desc = "A groovy jumpsuit only worn by the coolest crew members."
	icon_state = "psyche"
	item_state = "psyche"

/obj/item/clothing/under/costume/misc/gondola
	name = "gondola suit"
	desc = "A suit resembling the body of some strange creature."
	icon_state = "gondola"
	item_state = "gondola"

/obj/item/clothing/under/costume/misc/hunterformal
	name = "Hunting Lodge Formal Attire"
	desc = "A fancier piece of clothing for when members of the Hunter's Lodge needs to dress up. \
			It consists of a red overshirt, silver shoulder pads, golden buttons, and a black cummerbund and trousers."
	icon_state = "hunter_formal"
	item_state = "hunter_formal"

/obj/item/clothing/under/costume/misc/jersey
	name = "tacky sports jersey"
	desc = "A gaudy looking jersey for some godforsaken team, while the tag on the back boasts about it bringing out infinate potential in a player it seems more like a relic. One of a time filled with mystics of trash and violence."
	icon_state = "tackyjersey"
	item_state = "tackyjersey"

