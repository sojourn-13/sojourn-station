/*
 * Lasertag
 */
/obj/item/clothing/suit/fluff/bluetag
	name = "blue plasma tag armour"
	desc = "Blue Pride, Station Wide."
	icon_state = "bluetag"
	item_state = "bluetag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/gun/energy/lasertag)
	siemens_coefficient = 3.0

/obj/item/clothing/suit/fluff/redtag
	name = "red plasma tag armour"
	desc = "Reputed to go faster."
	icon_state = "redtag"
	item_state = "redtag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/gun/energy/lasertag)
	siemens_coefficient = 3.0

/obj/item/clothing/suit/fluff/greentag
	name = "green plasma tag armour"
	desc = "Started green, ended a legend."
	icon_state = "greentag"
	item_state = "greentag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/gun/energy/lasertag)
	siemens_coefficient = 3.0

/obj/item/clothing/suit/fluff/yellowtag
	name = "yellow plasma tag armour"
	desc = "The only thing yellow about you is your armor."
	icon_state = "yellowtag"
	item_state = "yellowtag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/gun/energy/lasertag)
	siemens_coefficient = 3.0

/obj/item/clothing/suit/cyborg_suit
	name = "cyborg suit"
	desc = "Suit for a cyborg costume."
	icon_state = "death"
	item_state = "death"
	flags = CONDUCT
	fire_resist = T0C+5200
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

obj/item/clothing/suit/fluff/kimono
	name = "kimono"
	desc = "A traditional Japanese kimono."
	icon_state = "kimono"

obj/item/clothing/suit/fluff/kimono/stylish
	name = "stylish kimono"
	desc = "A modern Japanese kimono, stylish. Colorable too."
	icon_state = "stylish_kimono"

obj/item/clothing/suit/fluff/kimono/stylish/alt
	name = "elegant kimono"
	desc = "A modern Japanese kimono, stylish. Short-sleeved and a little form-fitting. Also colorable."
	icon_state = "elegant_kimono"

obj/item/clothing/suit/fluff/miko
	name = "miko dress"
	desc = "A traditional purple Japanese miko dress."
	icon_state = "miko"

/obj/item/clothing/suit/fluff/customs
	name = "customs jacket"
	desc = "A standard SolFed Customs formal jacket."
	icon_state = "customs_jacket"
	item_state_slots = list(slot_r_hand_str = "suit_blue", slot_l_hand_str = "suit_blue")

obj/item/clothing/suit/gownrisque
	name = "delicate gown"
	desc = "A particularly daring gown. Suited for only the bravest colonists."
	icon_state = "gown_risque"

obj/item/clothing/suit/gownrisque/alt
	name = "fine gown"
	desc = "A particularly daring gown. Suited for only the bravest colonists."
	icon_state = "gown_risque_alt"

/*
 * Misc
 */

/obj/item/clothing/suit/straight_jacket
	name = "straight jacket"
	desc = "A suit that completely restrains the wearer."
	icon_state = "straight_jacket"
	item_state = "straight_jacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	allowed = list(/obj/item/tank)

/*Poncho*/

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A comfortable sleeveless poncho with a blue design."
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/suit/poncho/brown
	name = "brown poncho"
	desc = "A comfortable sleeveless poncho with a brown design."
	icon_state = "classicponcho"
	item_state = "classicponcho"

/obj/item/clothing/suit/poncho/green
	name = "green poncho"
	desc = "A comfortable sleeveless poncho with a green design."
	icon_state = "greenponcho"
	item_state = "greenponcho"

/obj/item/clothing/suit/poncho/pink
	name = "pink poncho"
	desc = "A comfortable sleeveless poncho with a pink design."
	icon_state = "pinkponcho"
	item_state = "pinkponcho"

/obj/item/clothing/suit/poncho/purple
	name = "purple poncho"
	desc = "A comfortable sleeveless poncho with a purple design."
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/suit/poncho
	name = "red poncho"
	desc = "A comfortable sleeveless poncho with a red design."
	icon_state = "redponcho"
	item_state = "redponcho"

/obj/item/clothing/suit/poncho/tactical
	name = "blue poncho"
	desc = "A simple, comfortable poncho in blue colors."
	icon_state = "tacticalponcho"
	item_state = "tacticalponcho"

// Umi_Cloak
/obj/item/clothing/suit/orsicoat
	name = "Red Winter Cape"
	desc = "A soft red cape with synthetic white fur trim."
	icon_state = "orsicoat"
	item_state = "orsicoat"

/*Shirts*/

/obj/item/clothing/suit/shirt
	name = "corgi shirt"
	desc = "A curiously comfortable shirt covered with a picture of a corgi."
	icon_state = "ianshirt"
	item_state = "ianshirt"

/obj/item/clothing/suit/shirt/nerd
	name = "gamer shirt"
	desc = "A baggy shirt with vintage game character Phanic the Weasel. "
	icon_state = "nerdshirt"
	item_state = "nerdshirt"

/obj/item/clothing/suit/shirt/vape //wearing this is asking to get beat.
	name = "vape naysh shirt"
	desc = "A cheap shirt with a tacky VN logo on the front."
	icon_state = "vapeshirt"
	item_state = "vapeshirt"

/*Lizard*/

/obj/item/clothing/suit/lizard/robe
	name = "roughspun robes"
	desc = "A traditional roughspun garment."
	icon_state = "robe-unathi"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/suit/lizard/mantle
	name = "hide mantle"
	desc = "A rather grisly selection of cured hides and skin, sewn together to form a ragged mantle."
	icon_state = "mantle-unathi"
	body_parts_covered = UPPER_TORSO

/*Feline*/

/obj/item/clothing/suit/feline/furs
	name = "heavy furs"
	desc = "A traditional heavy fur garment."
	icon_state = "zhan_furs"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/sling
	name = "universal sling"
	desc = "A generic universal equipment sling for whatever you could need on your back. More versatile then other choices just don't expect it to protect you from anything."
	icon_state = "universal_sling"
	extra_allowed = list(
	/obj/item/storage/firstaid,
	/obj/item/storage/lockbox,
	/obj/item/storage/part_replacer,
	/obj/item/storage/secure,
	/obj/item/storage/toolbox,
	/obj/item/storage/briefcase,
	/obj/item/material,
	/obj/item/device)

/obj/item/clothing/suit/storage/punkvest
	name = "punk vest"
	desc = "Sleek grey vest with pockets in it. You feel absolutely punk wearing this sturdy leather coat."
	icon_state = "punk_vest"
	item_state = "punk_vest"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO


/obj/item/clothing/suit/tabard
	name = "ivory tabard"
	desc = "A somewhat revealing ivory tabard favored by older orders for ceremony, used often for funerals and coupled with dark under clothes."
	icon_state = "white_tabard"
	item_state = "white_tabard"

/obj/item/clothing/suit/tabard/blacksilk
	name = "blacksilk tabard"
	desc = "A somewhat revealing black and gold tabard favored by older orders for ceremony, used often for funerals and coupled with light under clothes."
	icon_state = "church_blacksilk_suit"
	item_state = "church_blacksilk_suit"

/obj/item/clothing/suit/punkvest
	name = "punk vest"
	desc = "A dark vest made out of light, breathable fabric. Feeling lucky, punk?"
	icon_state = "punkvest"
	item_state = "punkvest"
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/storage/toggle/windbreaker
	name = "windbreaker"
	desc = "A dark blue jacket with black highlights. As an added bonus, it looks fairly resistant to stains and caustic chemicals."
	icon_state = "windbreaker_open"
	item_state = "windbreaker" //Is this even used for anything?
	icon_open = "windbreaker_open"
	icon_closed = "windbreaker"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 1,
		bomb = 0,
		bio = 30,
		rad = 10
	)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/punkvest/cyber
	name = "cyberpunk vest"
	desc = "A red vest with golden streaks. It's made out of tough materials, and can protect fairly well against bullets. Wake the fuck up, Samurai."
	icon_state = "cyberpunk"
	item_state = "cyberpunk"
	armor_list = list(
		melee = 2,
		bullet = 2,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/scavengerarmor
	name = "scavenger armor"
	desc = "A rigged yet sturdy scavenger armor. Strong and protective as most vests, it is made entirely from reclaimed materials. It even has pockets as well as room for additional plates of armor to be added."
	icon_state = "scav_armor"
	item_state = "scav_armor"
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 2
	stiffness = MEDIUM_STIFFNESS
	equip_delay = 2 SECONDS
	armor_list = list(
		melee = 7, //Not the best armor, but easily crafted and adds some utility with decent protection all round.
		bullet = 5,
		energy = 6,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_STEEL = 10, MATERIAL_PLATINUM = 2)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/scavengerarmor/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger armor"] = "scav_armor"
	options["alt scavenger armor"] = "alt_scavenger"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/scav_heavy
	name = "scavenger plate armor"
	desc = "A set of scavenger armor with additional armour plating installed. Though the haphazardly-made plates are heavy and don't exactly excel against projectiles, they shrug off melee attacks nicely."
	icon_state = "scav_heavy"
	item_state = "scav_heavy"
	armor_list = list(
		melee = 12, //A bit worse than riot armour
		bullet = 6,
		energy = 6,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	slowdown = 0.9

/obj/item/clothing/suit/storage/scav_heavy/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger plate"] = "scav_heavy"
	options["alt scavenger plate"] = "scav_heavy_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/storage/triad
	name = "triad jacket"//RUINER reference
	desc = "A well armoured trench coat. The label on the inside claims it comes from somewhere dangerous."
	icon_state = "triadkillers"
	item_state = "triadkillers"
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	price_tag = 105


/obj/item/clothing/suit/storage/akira
	name = "red jacket"//Akira, preety obvious
	desc = "A red jacket designed for riding on a bike. Has a pill icon on the back."
	icon_state = "akira"
	item_state = "akira"
	armor_list = list(
		melee = 2,
		bullet = 2,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS
	price_tag = 60

/obj/item/clothing/suit/storage/raggedcape
	name = "outcast's cloak"
	desc = "A haphazardly-made cloak made of reclaimed leather and other fiber materials, it's all you have for protection... for now."
	icon_state = "outcast_cloak"
	item_state = "outcast_cloak"
	armor_list = list(
		melee = 5,
		bullet = 2,
		energy = 5,
		bomb = 10,
		bio = 5,
		rad = 5
		)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = T0C - 20
	price_tag = 50

/obj/item/clothing/suit/storage/surtout
	name = "Absolute surtout"
	desc = "A padded surtout, made to be biomatter resistant. The surtout is reversible, with its switchable colors being red and purple."
	icon_state = "field_numerical"
	item_state = "field_numerical"
	armor_list = list(
		melee = 2,
		bullet = 0, //well armored its not going to help a bullet
		energy = 2,
		bomb = 5,
		bio = 100,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS
	price_tag = 60

/obj/item/clothing/suit/storage/surtout/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Red Garb"] = "field_numerical"
	options["Purple Garb"] = "field_numerical_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


// Miscs

/obj/item/clothing/suit/storage/omni_robes
	name = "religious robe"
	desc = "A robe made of cloth that can be colored."
	icon_state = "general_priest_cloth"
	item_state = "general_priest_cloth"
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
		)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = T0C - 20
	price_tag = 50

/obj/item/clothing/suit/hev

	name = "Hazardous Enviroment Protection suit" //funny reference suit. stronk rare and includes some degree of fire and hazard protection just not a space suit.
	desc = "An advanced suit designed to protect you from the harshest of enviroments as long as that enviroment is not space. A shame most of it's systems seem broken down..."
	icon_state = "rad"
	item_state = "rad_suit"
	w_class = ITEM_SIZE_BULKY
	stiffness = LIGHT_STIFFNESS
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.4
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor_list = list(
		melee = 16,
		bullet = 15,
		energy = 13,
		bomb = 75,
		bio = 100,
		rad = 100
	)
	equip_delay = 2 SECONDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	item_flags = COVER_PREVENT_MANIPULATION
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	min_cold_protection_temperature= SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	unacidable = TRUE
	price_tag = 2000
