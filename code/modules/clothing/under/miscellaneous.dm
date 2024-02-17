/*Pyjamas*/

/obj/item/clothing/under/pj
	name = "red pyjamas"
	desc = "A set of white sleepwear with a red stripe pattern."
	icon_state = "red_pyjamas"
	item_state = "w_suit"

/obj/item/clothing/under/pj/blue
	name = "blue pyjamas"
	desc = "A set of white sleepwear with a blue stripe pattern."
	icon_state = "blue_pyjamas"
	item_state = "w_suit"


/obj/item/clothing/under/dodgeball_red
	name = "red dodgeball uniform"
	desc = "A red threaded uniform for gym dodgeball activities."
	icon_state = "gym_red"
	item_state = "gym_red"

// Proc for gender change deleted as it's no longer necessary - Seb
/obj/item/clothing/under/dodgeball_blue
	name = "blue dodgeball uniform"
	desc = "A blue threaded uniform for gym dodgeball activities."
	icon_state = "gym_blue"
	item_state = "gym_blue"

/*Gowns and stuff*/

/obj/item/clothing/under/bathrobe
	name = "bathrobe"
	desc = "A fluffy robe to keep you from showing off to the world."
	icon_state = "bathrobe"
	item_state = "bathrobe"

/obj/item/clothing/under/medigown
	name = "medical gown"
	desc = "A medical examination gown, usually worn in operations."
	icon_state = "medicalgown"
	item_state = "medicalgown"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/bride_white
	name = "wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	item_state = "nursesuit"
	flags_inv = HIDESHOES
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/burial
	name = "burial garments"
	desc = "Traditional burial garments used to clothe the deceased."
	icon_state = "burial"
	item_state = "burial"

/*Misc*/

/obj/item/clothing/under/space
	name = "NASA jumpsuit"
	desc = "A jumpsuit with an old NASA logo on it. It's made out of space-proof materials."
	icon_state = "black"
	item_state = "bl_suit"
	w_class = ITEM_SIZE_BULKY//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/admin/acj
	name = "cybernetic jumpsuit"
	icon_state = "syndicate"
	item_state = "bl_suit"
	desc = "A cybernetically enhanced jumpsuit of incredible durability. Who could have made this?"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(melee = 100, bullet = 100, energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/*Xenowear*/

/obj/item/clothing/under/loincloth
	name = "loincloth"
	desc = "A sturdy cloth that covers just the groin."
	icon_state = "loincloth"

/obj/item/clothing/under/chestwrap
	name = "rag wraps"
	desc = "A sturdy cloth that covers the private areas of the body."
	icon_state = "chestwrap"

/obj/item/clothing/under/gharness
	name = "gear harness"
	desc = "A series of belts and straps to hold your equipment. Originally designed for simple drones and synths, this is hardly a modest option for organics."
	icon_state = "gear_harness"

/obj/item/clothing/under/monomial_belt
	name = "monomial belt"
	desc = "A simple black loin cloth with a dark gold trim favored by monomials for its monk-like aesthetic. For when you need to show off your muscles in the name of god."
	icon_state = "mono_belt"
	item_state = "mono_belt"

/*Antagonist Spawn Gear*/

/obj/item/clothing/under/rank/mercenary
	name = "green tactical turtleneck"
	desc = "Military style turtleneck, for operating in cold environments. Typically worn underneath armour."
	icon_state = "greenturtle"
	item_state = "bl_suit"
	has_sensor = 0
	siemens_coefficient = 0.9
	price_tag = 50

/obj/item/clothing/under/rank/mercenary/New()
	if (prob(50))
		name = "black tactical turtleneck"
		icon_state = "blackturtle"

/obj/item/clothing/under/syndicate
	name = "tactical turtleneck"
	desc = "It's some non-descript, slightly suspicious looking, civilian clothing."
	icon_state = "syndicate"
	item_state = "bl_suit"

	has_sensor = 0
	siemens_coefficient = 0.9
	price_tag = 50

/obj/item/clothing/under/syndicate/combat
	name = "combat turtleneck"

/obj/item/clothing/under/serbiansuit
	name = "green battle dress"
	desc = "A tough, wear-resistant battle dress uniform in forest colors. Typically worn underneath armor."
	icon_state = "serbiansuit"
	item_state = "bl_suit"
	has_sensor = 0
	price_tag = 100

/obj/item/clothing/under/serbiansuit/brown
	name = "brown battle dress"
	desc = "A tough, wear-resistant battle dress uniform in desert colors. Typically worn underneath armor."
	icon_state = "serbiansuit_brown"

/obj/item/clothing/under/serbiansuit/black
	name = "black battle dress"
	desc = "A tough, wear-resistant battle dress uniform in urban colors. Typically worn underneath armor."
	icon_state = "serbiansuit_black"

/*Gorkas*/

/obj/item/clothing/under/gorka/camo
	name = "camo gorka"
	desc = "A rugged set of two-tone military style clothes."
	icon_state = "gorka_ss"
	item_state = "gorka_ss"

/obj/item/clothing/under/gorka/crew
	name = "crew gorka"
	desc = "A rugged set of vaguely militant two-tone grey utility wear."
	icon_state = "gorka_crew"
	item_state = "gorka_crew"

/obj/item/clothing/under/gorka/crewblue
	name = "blue crew gorka"
	desc = "A rugged set of vaguely militant two-tone grey utility wear with blue patches and markings."
	icon_state = "gorka_crew_b"
	item_state = "gorka_crew_b"

/obj/item/clothing/under/gorka/crewgreen
	name = "green crew gorka"
	desc = "A rugged set of vaguely militant two-tone grey utility wear with green patches and markings."
	icon_state = "gorka_crew_g"
	item_state = "gorka_crew_g"

/obj/item/clothing/under/gorka/crewlight
	name = "light crew gorka"
	desc = "A fashionable set of vaguely militant two-tone clothes."
	icon_state = "gorka_crew_light"
	item_state = "gorka_crew_light"

/obj/item/clothing/under/gorka/crewlightblue
	name = "light blue crew gorka"
	desc = "A fashionable set of vaguely militant two-tone clothes with a sporty blue-on-white scheme."
	icon_state = "gorka_crew_light_b"
	item_state = "gorka_crew_light_b"

/obj/item/clothing/under/gorka/creworange
	name = "orange crew gorka"
	desc = "A rugged set of vaguely militant two-tone grey utility wear with orange patches and markings."
	icon_state = "gorka_crew_o"
	item_state = "gorka_crew_o"

/obj/item/clothing/under/gorka/crewyellow
	name = "yellow crew gorka"
	desc = "A rugged set of vaguely militant two-tone grey utility wear with yellow patches and markings."
	icon_state = "gorka_crew_y"
	item_state = "gorka_crew_y"

/obj/item/clothing/under/gorka/standard
	name = "standard gorka"
	desc = "A rugged set of vaguely militant and quite slavic two-tone clothes."
	icon_state = "gorka"
	item_state = "gorka"

/obj/item/clothing/under/gorka/dark
	name = "dark gorka"
	desc = "A rugged set of vaguely militant two-tone dark utility wear with dark patches and markings."
	icon_state = "gorka_ih"
	item_state = "gorka_ih"

/obj/item/clothing/under/gorka
	name = "tan gorka"
	desc = "A rugged set of vaguely militant and quite slavic two-tone clothes, this time coyote brown on tan."
	icon_state = "gorka_tan"
	item_state = "gorka_tan"

/*Gorka Ranks*/
/obj/item/clothing/under/rank/security/gorka_ih
	name = "security gorka suit"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/medspec/gorka_ih_med_b
	name = "medical specialist gorka"
	desc = "A durable, baggy uniform featuring blue medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_b"
	item_state = "gorka_ih_med_b"
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medspec/gorka_ih_med_g
	name = "medical specialist gorka"
	desc = "A durable, baggy uniform featuring green medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_g"
	item_state = "gorka_ih_med_g"
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medical/gorka_crew_med
	name = "medical crew gorka"
	desc = "A durable, baggy grey uniform sporting EMS patches, high vis strips, and stain resistant coating."
	icon_state = "gorka_crew_med"
	item_state = "gorka_crew_med"

/obj/item/clothing/under/rank/scientist/gorka_crew_sci
	name = "science crew gorka"
	desc = "A durable, baggy grey uniform sporting research and development patches, and antiseptic coating."
	icon_state = "gorka_crew_sci"
	item_state = "gorka_crew_sci"

/obj/item/clothing/under/genericb
	name = "blue generic outfit"
	desc = "A simple blue shirt with brown pants."
	icon_state = "genericb"
	item_state = "genericb"

/obj/item/clothing/under/netrunner
	name = "cybersuit"
	desc = "Jumpsuit favored by surveillance officers and VR gamers alike. Ugly as sin. Luckily, in cyberspace no one can see your realspace clothing."
	icon_state = "jensen"
	item_state = "jensen"


/obj/item/clothing/under/genericw
	name = "white generic outfit"
	desc = "A simple white shirt with grey pants."
	icon_state = "genericw"
	item_state = "genericw"

/obj/item/clothing/under/genericr
	name = "red generic outfit"
	desc = "A simple red shirt with black pants."
	icon_state = "genericr"
	item_state = "genericr"

/obj/item/clothing/under/iron_lock_security
	name = "Iron Lock Security Uniform"
	desc = "An outdated uniform of a now extinct corporation \"Iron Lock Security\". A private security firm that got its start centuries ago subcontracted by Greyson Positronics before being phased out."
	icon_state = "northtech"
	has_sensor = 0

/obj/item/clothing/under/os_jumpsuit
	name = "Greyson Positronic jumpsuit"
	desc = "An uniform that was produced by Greyson Positronics, cleaning to enginering this over engineered suit was used. Surprisingly the suit senors still work."
	icon_state = "os_jumpsuit"

/obj/item/clothing/under/os_jumpsuit/bdu
	name = "Greyson Positronic jumpsuit"
	desc = "A Battle Dress Uniform produced by Greyson Positronics for their more style oriented personnel"
	icon_state = "bdugreyson"

/obj/item/clothing/under/os_jumpsuit/bdu/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/under/os_jumpsuit/bdu/nova
	name = "Greyson Star Traders Battle Dress Uniform"
	desc = "A Battle Dress Uniform produced by Greyson Star Traders based of the actual Greyson Positronics, for their more style oriented personnel"
	icon_state = "bdugreyson"

/obj/item/clothing/under/os_jumpsuit/nova
	name = "Greyson Star Traders jumpsuit"
	desc = "An uniform that was produced by Greyson Star Traders, cleaning to enginering this over engineered suit was used. Surprisingly the suit senors still work. Perfect for a dangerous colony in middle of fucking nowhere!"
	icon_state = "os_jumpsuit"

//Excelsior
/obj/item/clothing/under/excelsior
	name = "white excelsior jumpsuit"
	desc = "An Excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_white"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/mixed
	name = "mixed excelsior jumpsuit"
	desc = "An Excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_mixed"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/orange
	name = "orange excelsior jumpsuit"
	desc = "An Excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_orange"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/officer
	name = "officer excelsior jumpsuit"
	desc = "An Excelsior jumpsuit designed to boost morale and spread the revolution; made specifically for commissars."
	icon_state = "excelsior_officer"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/bdu
	name = "excelsior BDU"
	desc = "A somewhat dated Excelsior styled Battle Dress Uniform, spread the revolution in style!"
	icon_state = "bduexcel"
	item_state = "bduexcel"
	has_sensor = 0
/obj/item/clothing/under/excelsior/bdu/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(usr, SPAN_NOTICE("You roll your [choice]."))
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//*BDUs*//

/obj/item/clothing/under/bdu
	name = "standard BDU"
	desc = "A baggy, dated Battle Dress Uniform in slavic tow tone."
	icon_state = "bdustandard"
	item_state = "bdustandard"

/obj/item/clothing/under/bdu/tan
	name = "tan BDU"
	desc = "A baggy, dated Battle Dress Uniform in desert shades."
	icon_state = "bdutan"
	item_state = "bdutan"

/obj/item/clothing/under/bdu/black
	name = "black BDU"
	desc = "A baggy, dated Battle Dress Uniform in dark colours."
	icon_state = "bdublack"
	item_state = "bdublack"

/obj/item/clothing/under/bdu/grey
	name = "grey BDU"
	desc = "A baggy, dated Battle Dress Uniform in station-grey."
	icon_state = "bdugrey"
	item_state = "bdugrey"

/obj/item/clothing/under/bdu/camo
	name = "camo BDU"
	desc = "A baggy, dated Battle Dress Uniform in classic camo pattern."
	icon_state = "bducamo"
	item_state = "bducamo"

/obj/item/clothing/under/bdu/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


//Dresses
/obj/item/clothing/under/dress
	name = "gray summerdress"
	desc = "Gray summerdress only worn by the bravest individuals in the cold of space."
	icon_state = "summerdress"
	item_state = "summerdress"

/obj/item/clothing/under/dress/blue
	name = "blue summerdress"
	desc = "a blue dress worn by mostly those of east asian descendance"
	icon_state = "summerdress2"
	item_state = "summerdress2"

/obj/item/clothing/under/dress/red
	name = "red summerdress"
	desc = "A red dress worn mostly by those of east asian descendance."
	icon_state = "summerdress3"
	item_state = "summerdress3"

/obj/item/clothing/under/leisure
	name = "leisure outfit"
	desc = "A leisure outfit with brown jacket. Sometimes you just want to wear what is comfortable."
	icon_state = "leisureoutfit"
	item_state = "leisureoutfit"

/obj/item/clothing/under/leisure/white
	name = "white blouse"
	desc = "A white blouse with a red shirt underneath. You look like a hallway ornament with this."
	icon_state = "shirtsuit"
	item_state = "shirtsuit"

/obj/item/clothing/under/leisure/pullover
	name = "patterned pullover"
	desc = "Brown pullover with indeterminable pattern."
	icon_state = "pullover"
	item_state = "pullover"

/obj/item/clothing/under/jersey
	name = "church overalls"
	desc = "For showing your devotion to god through labor or the opposite for that matter if you forgot an undershirt."
	icon_state = "jersey"
	item_state = "jersey"

/obj/item/clothing/under/cyber
	name = "augmented jumpsuit"
	desc = "I wanted a jumpsuit. It gave me THIS."
	icon_state = "cyber"
	item_state = "cyber"

/obj/item/clothing/under/jamrock_suit
	name = "brown comfortable clothing"
	desc = "A suit and pants that are basic in colour but comfortable to wear."
	icon_state = "jamrock_suit"
	item_state = "jamrock_suit"

/obj/item/clothing/under/aerostatic_suit
	name = "dark comfortable clothing"
	desc = "A suit and pants that are basic in colour but comfortable to wear."
	icon_state = "aerostatic_suit"
	item_state = "aerostatic_suit"

/obj/item/clothing/under/track_suit
	name = "striped tracksuit"
	desc = "A tracksuit lined with white stripes on its side."
	icon_state = "tracksuit_black"
	item_state = "tracksuit_black"

/obj/item/clothing/under/neon
	name = "green neon tracksuit"
	desc = "A tracksuit lined with green neon fibers. Slightly luminescent."
	icon_state = "neon"
	item_state = "bl_suit"

/obj/item/clothing/under/neon/yellow
	name = "yellow neon tracksuit"
	desc = "A tracksuit lined with yellow neon fibers. Slightly luminescent."
	icon_state = "neony"
	item_state = "bl_suit"

/obj/item/clothing/under/neon/blue
	name = "blue neon tracksuit"
	desc = "A tracksuit lined with blue neon fibers. Slightly luminescent."
	icon_state = "neonb"
	item_state = "bl_suit"

/obj/item/clothing/under/neon/red
	name = "red neon tracksuit"
	desc = "A tracksuit lined with red neon fibers. Slightly luminescent."
	icon_state = "neonr"
	item_state = "bl_suit"

/obj/item/clothing/under/white
	name = "ivory white outfit"
	desc = "White suit, white pants and a white tie. Very stylish."
	icon_state = "suit_white"
	item_state = "suit_white"
	price_tag = 45

/obj/item/clothing/under/red
	name = "blood red outfit"
	desc = "Red suit, red pants and a red tie. Very stylish."
	icon_state = "suit_red"
	item_state = "suit_red"
	price_tag = 45

/obj/item/clothing/under/green
	name = "questionable outfit"//Riddler reference, you probably knew that
	desc = "Green suit, green pants and a green tie. Quite a riddle to solve."
	icon_state = "riddler"
	item_state = "riddler"
	price_tag = 45

/obj/item/clothing/under/grey
	name = "ash grey outfit"
	desc = "Grey suit, grey pants and a grey tie. Very stylish."
	icon_state = "suit_grey"
	item_state = "suit_grey"
	price_tag = 45

/obj/item/clothing/under/black
	name = "charcoal black outfit"
	desc = "Black suit, black pants and a black tie. Very stylish."
	icon_state = "suit_black"
	item_state = "suit_black"
	price_tag = 45

/obj/item/clothing/under/dress/black
	name = "black and purple dress"
	desc = "A black and purple dress, quite stylish"
	icon_state = "black_purple"
	item_state = "black_purple"
	price_tag = 45

/obj/item/clothing/under/dress/white
	name = "white and yellow dress"
	desc = "A white and yellow dress, quite stylish"
	icon_state = "white_yellow"
	item_state = "white_yellow"
	price_tag = 45

/obj/item/clothing/under/dress/saloon
	name = "saloon dress"
	desc = "The classic saloon girls attire, perfect for serving schnitzengruben"
	icon_state = "dress_saloon"
	item_state = "dress_saloon"
	price_tag = 45
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/dress/blackdress
	name = "cocktail dress"
	desc = "A flattering black cocktail dress."
	icon_state = "blackdress"
	item_state = "blackdress"
	price_tag = 45

/obj/item/clothing/under/dress/blackdressalt
	name = "skater dress"
	desc = "A lovely black skater dress"
	icon_state = "blackdress2"
	item_state = "blackdress2"
	price_tag = 45

/obj/item/clothing/under/dress/flowerdress
	name = "flower pattern dress"
	desc = "A rather loud, flower patterned dress. Aloha!"
	icon_state = "flower_dress"
	item_state = "flower_dress"
	price_tag = 45

/obj/item/clothing/under/dress/sweptdress
	name = "red swept dress"
	desc = "A simple, asymmetrical red dress and belt. Perfect for a night on the town!"
	icon_state = "red_swept_dress"
	item_state = "red_swept_dress"
	price_tag = 45

/obj/item/clothing/under/dress/sevillanadress
	name = "Sevillana dress"
	desc = "A traditional garb from an ancient nation of old terra."
	icon_state = "flamenco"
	item_state = "flamenco"
	price_tag = 45

/obj/item/clothing/under/dress/westernbustle
	name = "western barmaids dress"
	desc = "For those saloon workers who spend more time behind the counters than under them"
	icon_state = "westernbustle"
	item_state = "westernbustle"
	price_tag = 45

/obj/item/clothing/under/dress/lilac
	name = "lilac dress"
	desc = "A simple, lilac dress."
	icon_state = "lilacdress"
	item_state = "lilacdress"
	price_tag = 45
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/dress/bluedress
	name = "blue dress"
	desc = "A comfortable, breezy blue summer dress."
	icon_state = "bluedress"
	item_state = "bluedress"
	price_tag = 45

/obj/item/clothing/under/dress/rattydress
	name = "skimpy black dress"
	desc = "A short black dress, skimpy enough to qualify as a tank-top for many"
	icon_state = "rattydress"
	item_state = "rattydress"
	price_tag = 45

/obj/item/clothing/under/dress/littleblackdress
	name = "little black dress"
	desc = "A short cut, black cocktail dress. Considered a must have by the out of touch for at least 500 years!"
	icon_state = "littleblackdress"
	item_state = "littleblackdress"
	price_tag = 45

/obj/item/clothing/under/dress/pinkdress
	name = "pink skirt"
	desc = "A simple pink skirt."
	icon_state = "pinktutu"
	item_state = "pinktutu"
	price_tag = 45

/obj/item/clothing/under/dress/barmaid
	name = "fantasy bartender outfit"
	desc = "The bar standard for a thousand years!"
	icon_state = "bartender"
	item_state = "bartender"
	price_tag = 45
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/dress/barmaid/alt
	name = "fantasy barmaids outfit"
	desc = "The bar standard for a thousand years! Yarr"
	icon_state = "barmaid_but_better"
	item_state = "barmaid_but_better"

/obj/item/clothing/under/dress/jill
	name = "cyberpunk bartender outfit"
	desc = "Time to mix drinks and change lives."
	icon_state = "cba" // Cyberpunk Bartender Action
	item_state = "cba"
	price_tag = 50

/obj/item/clothing/under/fancy_redish_suit
	name = "expensive brown suit"
	desc = "A brown suit with a white undershirt and tie, its higher value comes form its likeness to being worn by many movie stars form Sol movies. Its also just well made."
	icon_state = "apsuit"
	item_state = "apsuit"
	price_tag = 50

/obj/item/clothing/under/helltaker
	name = "black charming outfit" // Helltaker reference
	desc = "A red suit shirt with a black bottom and optional tie. Stylish enough to impress the devil." // Accomodating description for the alt sprites - Seb
	icon_state = "helltaker"
	item_state = "helltaker"
	price_tag = 45

/obj/item/clothing/under/helltaker/verb/toggle_style() // Alt styles to impersonate the most unique ones, made by me. - Seb
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default"] = "helltaker" // Lucy and Cerberus are both this one, no need for more alts. - Seb
	options["sour gamer"] = "malina"
	options["tired sadist"] = "pandemonica"
	options["bratty masochist"] = "zdrada"
	options["the cool one"] = "justice"
	options["the lustful one"] = "modeus"

	var/choice = input(M,"What kind of demon do you want to be?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/helltaker_m
	name = "white charming outfit"
	desc = "A collared, loose red shirt with white pants and a stout belt. Go get your own demon harem, now."
	icon_state = "helltaker_m" // The Helltaker dude himself - Seb
	item_state = "helltaker_m"
	price_tag = 45

/obj/item/clothing/under/colony
	name = "cheap charming outfit"//Sprite by INFRARED_BARON
	desc = "A cheap outfit to that goes well with any actor's career."
	icon_state = "colony"
	item_state = "colony"
	price_tag = 40

/obj/item/clothing/under/johnny
	name = "rockerboy outfit"//Cyberpunk 2077, Johnny Silverhand's outfit
	desc = "A padded vest with brown leather pants. Never stop fightin'"
	icon_state = "johnny"
	item_state = "johnny"
	price_tag = 60
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/under/raider
	name = "leather outfit"
	desc = "A rather resistant, generic leather outfit. Smells like waste"
	icon_state = "raider"
	item_state = "raider"
	price_tag = 60
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)
/obj/item/clothing/under/tribalhide
	name = "Tribal Hides"
	desc = "Leather and fur stitched together, for your inner unga. You feel like thumping your chest."
	icon_state = "tribalm"
	item_state = "tribalm"
	price_tag = 50
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/under/tribalhide/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Exposed Chest"] = "tribalm"
	options["Covered Chest"] = "tribalf"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your hides into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/ashigaru
	name = "Ashigaru"
	desc = "A lightly armored apron designed as a homage to jana foot soldiers."
	icon_state = "ashigaru"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)

/*Swimsuit*/

/obj/item/clothing/under/swimsuit
	name = "white swimsuit"
	desc = "A white swimsuit perfect for the pool."
	icon_state = "swim_white"
	siemens_coefficient = 1
	body_parts_covered = 0

/obj/item/clothing/under/swimsuit/black
	name = "black swimsuit"
	desc = "A black swimsuit perfect for the pool."
	icon_state = "swim_black"

/obj/item/clothing/under/swimsuit/blue
	name = "blue swimsuit"
	desc = "A blue swimsuit perfect for the pool."
	icon_state = "swim_blue"

/obj/item/clothing/under/swimsuit/earth
	name = "earth swimsuit"
	desc = "A earth swimsuit perfect for the pool."
	icon_state = "swim_earth"

/obj/item/clothing/under/swimsuit/green
	name = "green swimsuit"
	desc = "A green swimsuit perfect for the pool."
	icon_state = "swim_green"

/obj/item/clothing/under/swimsuit/purple
	name = "purple swimsuit"
	desc = "A purple swimsuit perfect for the pool."
	icon_state = "swim_purp"

/obj/item/clothing/under/swimsuit/red
	name = "red swimsuit"
	desc = "A red swimsuit perfect for the pool."
	icon_state = "swim_red"

/obj/item/clothing/under/swimsuit/striped
	name = "striped swimsuit"
	desc = "A striped swimsuit perfect for the pool."
	icon_state = "swim_striped"

/obj/item/clothing/under/swimsuit/ntswimsuit
	name = "Absolutist swimsuit"
	desc = "A fine, white and gold trim swimsuit produced and often worn by those of the faith"
	icon_state = "swim_nt"

/obj/item/clothing/under/swimsuit_c
	name = "Skimpy swimsuit"
	desc = "An absolutely scandalous swimsuit that scarcely covers anything. Fit for only the bravest beach-goers."
	icon_state = "swim_risque"
