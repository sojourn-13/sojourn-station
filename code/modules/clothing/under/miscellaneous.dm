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
	desc = "Traditional burial garments used to clothe the deceased.."
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
	armor = list(melee = 100, bullet = 100, energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/*Xenowear*/

/obj/item/clothing/under/loincloth
	name = "loincloth"
	desc = "A sturdy cloth that covers the private areas."
	icon_state = "loincloth"

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
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medspec/gorka_ih_med_g
	name = "medical specialist gorka"
	desc = "A durable, baggy uniform featuring green medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_g"
	item_state = "gorka_ih_med_g"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

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

obj/item/clothing/under/genericb
	name = "blue generic outfit"
	desc = "A simple blue shirt with brown pants."
	icon_state = "genericb"
	item_state = "genericb"

obj/item/clothing/under/genericw
	name = "white generic outfit"
	desc = "A simple white shirt with grey pants."
	icon_state = "genericw"
	item_state = "genericw"

obj/item/clothing/under/genericr
	name = "red generic outfit"
	desc = "A simple red shirt with black pants."
	icon_state = "genericr"
	item_state = "genericr"

//Excelsior
/obj/item/clothing/under/excelsior
	name = "white excelsior jumpsuit"
	desc = "An excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_white"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/mixed
	name = "mixed excelsior jumpsuit"
	desc = "An excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_mixed"
	item_state = "bl_suit"
	has_sensor = 0

/obj/item/clothing/under/excelsior/orange
	name = "orange excelsior jumpsuit"
	desc = "An excelsior jumpsuit designed to boost morale and spread the revolution"
	icon_state = "excelsior_orange"
	item_state = "bl_suit"
	has_sensor = 0

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
	icon_state = "leisuroutfit"
	item_state = "leisuroutfit"

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

obj/item/clothing/under/neon
	name = "green neon tracksuit"
	desc = "A tracksuit lined with green neon fibers. Slightly luminescent."
	icon_state = "neon"
	item_state = "bl_suit"

obj/item/clothing/under/neon/yellow
	name = "yellow neon tracksuit"
	desc = "A tracksuit lined with yellow neon fibers. Slightly luminescent."
	icon_state = "neony"
	item_state = "bl_suit"

obj/item/clothing/under/neon/blue
	name = "blue neon tracksuit"
	desc = "A tracksuit lined with blue neon fibers. Slightly luminescent."
	icon_state = "neonb"
	item_state = "bl_suit"

obj/item/clothing/under/neon/red
	name = "red neon tracksuit"
	desc = "A tracksuit lined with red neon fibers. Slightly luminescent."
	icon_state = "neonr"
	item_state = "bl_suit"
