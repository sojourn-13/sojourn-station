/*
 * Contains:
 *		Lasertag
 *		Costume
 *		Misc
 */

/*
 * Lasertag
 */
/obj/item/clothing/suit/bluetag
	name = "blue laser tag armour"
	desc = "Blue Pride, Station Wide."
	icon_state = "bluetag"
	item_state = "bluetag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/weapon/gun/energy/lasertag/blue)
	siemens_coefficient = 3.0

/obj/item/clothing/suit/redtag
	name = "red laser tag armour"
	desc = "Reputed to go faster."
	icon_state = "redtag"
	item_state = "redtag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/weapon/gun/energy/lasertag/red)
	siemens_coefficient = 3.0

/*
 * Costume
 */
/obj/item/clothing/suit/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	body_parts_covered = UPPER_TORSO|ARMS


/obj/item/clothing/suit/cyborg_suit
	name = "cyborg suit"
	desc = "Suit for a cyborg costume."
	icon_state = "death"
	item_state = "death"
	flags = CONDUCT
	fire_resist = T0C+5200
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT


/obj/item/clothing/suit/judgerobe
	name = "judge's robe"
	desc = "This robe commands authority."
	icon_state = "judge"
	item_state = "judge"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	allowed = list(/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/spacecash)
	flags_inv = HIDEJUMPSUIT


/obj/item/clothing/suit/wcoat
	name = "waistcoat"
	desc = "A classy waistcoat in a traditional black design."
	icon_state = "vest"
	item_state = "wcoat"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO


/obj/item/clothing/suit/syndicatefake
	name = "red space suit replica"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A plastic replica of the syndicate space suit, you'll look just like a real murderous syndicate agent in this! This is a toy, it is not made for use in space!"
	w_class = ITEM_SIZE_NORMAL
	allowed = list(/obj/item/device/lighting/toggleable/flashlight,/obj/item/weapon/tank/emergency_oxygen,/obj/item/toy)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	item_flags = COVER_PREVENT_MANIPULATION


/obj/item/clothing/suit/chickensuit
	name = "Chicken Suit"
	desc = "A suit made long ago by the ancient empire KFC."
	icon_state = "chickensuit"
	item_state = "chickensuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0


/obj/item/clothing/suit/monkeysuit
	name = "Monkey Suit"
	desc = "A suit that looks like a primate"
	icon_state = "monkeysuit"
	item_state = "monkeysuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0


/obj/item/clothing/suit/cardborg
	name = "cardborg suit"
	desc = "An ordinary cardboard box with holes cut in the sides."
	icon_state = "cardborg"
	item_state = "cardborg"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT

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
	allowed = list(/obj/item/weapon/tank)


//pyjamas
//originally intended to be pinstripes >.>

/obj/item/clothing/suit/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide."
	icon_state = "xenos"
	item_state = "xenos_helm"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0


//swimsuit
/obj/item/clothing/under/swimsuit/
	siemens_coefficient = 1
	body_parts_covered = 0

/obj/item/clothing/under/swimsuit
	name = "black swimsuit"
	desc = "A black swimsuit perfect for the pool."
	icon_state = "swim_black"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/blue
	name = "blue swimsuit"
	desc = "A blue swimsuit perfect for the pool."
	icon_state = "swim_blue"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/purple
	name = "purple swimsuit"
	desc = "A purple swimsuit perfect for the pool."
	icon_state = "swim_purp"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/green
	name = "green swimsuit"
	desc = "A green swimsuit perfect for the pool."
	icon_state = "swim_green"
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

/obj/item/clothing/under/swimsuit/earth
	name = "earth swimsuit"
	desc = "A earth swimsuit perfect for the pool."
	icon_state = "swim_earth"
	siemens_coefficient = 1

/obj/item/clothing/under/swimsuit/white
	name = "white swimsuit"
	desc = "A white swimsuit perfect for the pool."
	icon_state = "swim_white"
	siemens_coefficient = 1

/obj/item/clothing/suit/poncho
	name = "brown poncho"
	desc = "A comfortable sleeveless poncho with a brown design."
	icon_state = "classicponcho"
	item_state = "classicponcho"

/obj/item/clothing/suit/poncho/green
	name = "green poncho"
	desc = "A comfortable sleeveless poncho with a green design."
	icon_state = "greenponcho"
	item_state = "greenponcho"

/obj/item/clothing/suit/poncho/red
	name = "red poncho"
	desc = "A comfortable sleeveless poncho with a red design."
	icon_state = "redponcho"
	item_state = "redponcho"

/obj/item/clothing/suit/poncho/purple
	name = "purple poncho"
	desc = "A comfortable sleeveless poncho with a purple design."
	icon_state = "purpleponcho"
	item_state = "purpleponcho"

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A comfortable sleeveless poncho with a blue design."
	icon_state = "blueponcho"
	item_state = "blueponcho"

/obj/item/clothing/suit/storage/toggle/bomber
	name = "bomber jacket"
	desc = "A thick, well-worn leather bomber jacket."
	icon_state = "bomber"
	item_state = "bomber"
	icon_open = "bomber_open"
	icon_closed = "bomber"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/leather_jacket
	name = "grey leather jacket"
	desc = "A sturdy grey jacket made out of synthetic leather."
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	armor = list(melee = 20, bullet = 5, laser = 10, energy = 20, bomb = 10, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/leather_jacket/vest
	name = "black leather vest"
	desc = "A sturdy black leather vest made out of synthetic leather."
	icon_state = "leather_jacket_sleeveless"
	item_state = "leather_jacket_sleeveless"

/obj/item/clothing/suit/storage/leather_jacket/black
	name = "black leather jacket"
	desc = "A sturdy black jacket made out of synthetic leather."
	icon_state = "leather_jacket2"
	item_state = "leather_jacket2"

/obj/item/clothing/suit/storage/puffer
	name = "puffer jacket"
	desc = "A comfortable grey puffer jacket."
	icon_state = "pufferjacket"
	item_state = "pufferjacket"

/obj/item/clothing/suit/storage/puffer/vest
	name = "puffer vest"
	desc = "A comfortable grey puffer vest."
	icon_state = "puffervest"
	item_state = "puffervest"

/obj/item/clothing/suit/storage/flannel
	name = "grey flannel shirt"
	desc = "A comfy flannel shirt with a grey design."
	icon_state = "flannel"
	item_state = "flannel"

/obj/item/clothing/suit/storage/flannel/aqua
	name = "aqua flannel shirt"
	desc = "A comfy flannel shirt with a aqua design."
	icon_state = "flannel_aqua"
	item_state = "flannel_aqua"

/obj/item/clothing/suit/storage/flannel/brown
	name = "brown flannel shirt"
	desc = "A comfy flannel shirt with a brown design."
	icon_state = "flannel_brown"
	item_state = "flannel_brown"

/obj/item/clothing/suit/storage/flannel/red
	name = "red flannel shirt"
	desc = "A comfy flannel shirt with a red design."
	icon_state = "flannel_red"
	item_state = "flannel_red"

/obj/item/clothing/suit/varsity
	name = "black varsity jacket"
	desc = "A sporty letterman jacket with a black design."
	icon_state = "varsity"
	item_state = "varsity"

/obj/item/clothing/suit/varsity/red
	name = "red varsity jacket"
	desc = "A sporty letterman jacket with a red design."
	icon_state = "varsity_red"
	item_state = "varsity_red"

/obj/item/clothing/suit/varsity/purple
	name = "purple varsity jacket"
	desc = "A sporty letterman jacket with a purple design."
	icon_state = "varsity_purple"
	item_state = "varsity_purple"

/obj/item/clothing/suit/varsity/green
	name = "green varsity jacket"
	desc = "A sporty letterman jacket with a green design."
	icon_state = "varsity_green"
	item_state = "varsity_green"

/obj/item/clothing/suit/varsity/blue
	name = "blue varsity jacket"
	desc = "A sporty letterman jacket with a blue design."
	icon_state = "varsity_blue"
	item_state = "varsity_blue"

/obj/item/clothing/suit/varsity/brown
	name = "brown varsity jacket"
	desc = "A sporty letterman jacket with a brown design."
	icon_state = "varsity_brown"
	item_state = "varsity_brown"

/obj/item/clothing/suit/storage/miljacket
	name = "drab military jacket"
	desc = "A military canvas jacket in an olive drab design."
	icon_state = "militaryjacket_nobadge"
	item_state = "militaryjacket_nobadge"

/obj/item/clothing/suit/storage/miljacket/tan
	name = "tan military jacket"
	desc = "A military canvas jacket in a sandy tan design."
	icon_state = "militaryjacket_tan"
	item_state = "militaryjacket_tan"

/obj/item/clothing/suit/storage/miljacket/grey
	name = "grey military jacket"
	desc = "A military canvas jacket in a urban grey design."
	icon_state = "militaryjacket_grey"
	item_state = "militaryjacket_grey"

/obj/item/clothing/suit/storage/miljacket/navy
	name = "navy military jacket"
	desc = "A military canvas jacket in a dark navy design."
	icon_state = "militaryjacket_navy"
	item_state = "militaryjacket_navy"

/obj/item/clothing/suit/storage/miljacket/black
	name = "black military jacket"
	desc = "A military canvas jacket in a tactical black design."
	icon_state = "militaryjacket_black"
	item_state = "militaryjacket_black"

/obj/item/clothing/suit/storage/miljacket/green
	name = "green military jacket"
	desc = "A military canvas jacket in a jungle green design."
	icon_state = "militaryjacket_green"
	item_state = "militaryjacket_green"

/obj/item/clothing/suit/storage/miljacket/white
	name = "white military jacket"
	desc = "A military canvas jacket in a white snow design."
	icon_state = "militaryjacket_white"
	item_state = "militaryjacket_white"

/obj/item/clothing/suit/storage/toggle/hoodie
	name = "grey hoodie"
	desc = "A warm, grey sweatshirt."
	icon_state = "grey_hoodie"
	item_state = "grey_hoodie"
	icon_open = "grey_hoodie_open"
	icon_closed = "grey_hoodie"
	min_cold_protection_temperature = T0C - 20
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/hoodie/black
	name = "black hoodie"
	desc = "A warm, black sweatshirt."
	icon_state = "black_hoodie"
	item_state = "black_hoodie"
	icon_open = "black_hoodie_open"
	icon_closed = "black_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/orange
	name = "orange hoodie"
	desc = "A warm, orange sweatshirt."
	icon_state = "orange_hoodie"
	item_state = "orange_hoodie"
	icon_open = "orange_hoodie_open"
	icon_closed = "orange_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/blue
	name = "blue hoodie"
	desc = "A warm, blue sweatshirt."
	icon_state = "blue_hoodie"
	item_state = "blue_hoodie"
	icon_open = "blue_hoodie_open"
	icon_closed = "blue_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/green
	name = "green hoodie"
	desc = "A warm, green sweatshirt."
	icon_state = "green_hoodie"
	item_state = "green_hoodie"
	icon_open = "green_hoodie_open"
	icon_closed = "green_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/yellow
	name = "yellow hoodie"
	desc = "A warm, yellow sweatshirt."
	icon_state = "yellow_hoodie"
	item_state = "yellow_hoodie"
	icon_open = "yellow_hoodie_open"
	icon_closed = "yellow_hoodie"

/obj/item/clothing/suit/storage/toggle/hoodie/red
	name = "red hoodie"
	desc = "A warm, red sweatshirt."
	icon_state = "red_hoodie"
	item_state = "red_hoodie"
	icon_open = "red_hoodie_open"
	icon_closed = "red_hoodie"