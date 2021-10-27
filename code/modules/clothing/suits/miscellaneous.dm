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

/obj/item/clothing/suit/fluff/customs
	name = "customs jacket"
	desc = "A standard SolFed Customs formal jacket."
	icon_state = "customs_jacket"
	item_state_slots = list(slot_r_hand_str = "suit_blue", slot_l_hand_str = "suit_blue")

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

/*Swimsuit*/

/obj/item/clothing/under/swimsuit/
	siemens_coefficient = 1
	body_parts_covered = 0

/obj/item/clothing/under/swimsuit/black
	name = "black swimsuit"
	desc = "A black swimsuit perfect for the pool."
	icon_state = "swim_black"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/blue
	name = "blue swimsuit"
	desc = "A blue swimsuit perfect for the pool."
	icon_state = "swim_blue"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/earth
	name = "earth swimsuit"
	desc = "A earth swimsuit perfect for the pool."
	icon_state = "swim_earth"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/green
	name = "green swimsuit"
	desc = "A green swimsuit perfect for the pool."
	icon_state = "swim_green"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/purple
	name = "purple swimsuit"
	desc = "A purple swimsuit perfect for the pool."
	icon_state = "swim_purp"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/red
	name = "red swimsuit"
	desc = "A red swimsuit perfect for the pool."
	icon_state = "swim_red"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/striped
	name = "striped swimsuit"
	desc = "A striped swimsuit perfect for the pool."
	icon_state = "swim_striped"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit
	name = "white swimsuit"
	desc = "A white swimsuit perfect for the pool."
	icon_state = "swim_white"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/ntswimsuit
	name = "Absolutist swimsuit"
	desc = "A fine, white and gold trim swimsuit produced and often worn by those of the faith"
	icon_state = "swim_nt"
	siemens_coefficient = 1

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
	desc = "A generic universal equipment sling for whatever you could need on your back."
	icon_state = "universal_sling"
	allowed = list (/obj/item/gun,
	/obj/item/device,
	/obj/item/material,
	/obj/item/storage/pouch,
	/obj/item/storage/box,
	/obj/item/storage/firstaid,
	/obj/item/storage/lockbox,
	/obj/item/storage/part_replacer,
	/obj/item/storage/secure,
	/obj/item/storage/toolbox,
	/obj/item/storage/briefcase,
	/obj/item/tank,
	/obj/item/ammo_magazine,
	/obj/item/ammo_magazine/ammobox/
	)

/obj/item/clothing/suit/storage/punkvest
	name = "punk vest"
	desc = "Sleek grey vest with pockets in it. You feel absolutely punk wearing this sturdy leather coat."
	icon_state = "punk_vest"
	item_state = "punk_vest"
	armor = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	min_cold_protection_temperature = T0C - 20

/obj/item/clothing/suit/ivory
	name = "ivory tabard"
	desc = "A somewhat revealing ivory tabard favored by older orders for ceremony, used often for funerals and coupled with dark under clothes."
	icon_state = "white_tabard"
	item_state = "white_tabard"

/obj/item/clothing/suit/blacksilk
	name = "blacksilk tabard"
	desc = "A somewhat revealing black and gold tabard favored by older orders for ceremony, used often for funerals and coupled with light under clothes."
	icon_state = "church_blacksilk_suit"
	item_state = "church_blacksilk_suit"

/obj/item/clothing/suit/punkvest
	name = "punk vest"
	desc = "A dark vest made out of light, breathable fabric. Feeling lucky, punk?"
	icon_state = "punkvest"
	item_state = "punkvest"
	armor = list(
		melee = 5,
		bullet = 5,
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
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 0,
		bomb = 0,
		bio = 30,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/punkvest/cyber
	name = "cyberpunk vest"
	desc = "A red vest with golden streaks. It's made out of tough materials, and can protect fairly well against bullets. Wake the fuck up, Samurai."
	icon_state = "cyberpunk"
	item_state = "cyberpunk"
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/scavengerarmor
	name = "scavenger armor"
	desc = "A rigged yet sturdy scavenger armor. Strong and protective as most vests, it is made entirely from reclaimed materials. It even has pockets!"
	icon_state = "scav_armor"
	item_state = "scav_armor"
	armor = list(
		melee = 35, //Not the best armor, but easily crafted and adds some utility with decent protection all round.
		bullet = 35,
		energy = 35,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_GLASS = 10, MATERIAL_STEEL = 10)
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

/obj/item/clothing/suit/storage/triad
	name = "triad jacket"//RUINER reference
	desc = "A well armoured trench coat. The label on the inside claims it comes from somewhere dangerous."
	icon_state = "triadkillers"
	item_state = "triadkillers"
	armor = list(
		melee = 10,
		bullet = 5,
		energy = 5,
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
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 10,
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
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 20, //Decent starting armor but intentionally shitty because outsiders are hard mode. Scavenge better. Triumph or die! -Kaz
		bomb = 10,
		bio = 5,
		rad = 5
		)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = T0C - 20
	price_tag = 50

