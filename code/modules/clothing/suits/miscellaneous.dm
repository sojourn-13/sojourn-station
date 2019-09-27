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

/obj/item/clothing/suit/cyborg_suit
	name = "cyborg suit"
	desc = "Suit for a cyborg costume."
	icon_state = "death"
	item_state = "death"
	flags = CONDUCT
	fire_resist = T0C+5200
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/wcoat
	name = "waistcoat"
	desc = "A classy waistcoat in a traditional black design."
	icon_state = "vest"
	item_state = "wcoat"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

obj/item/clothing/suit/kimono
	name = "kimono"
	desc = "A traditional Japanese kimono."
	icon_state = "kimono"

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

/*Swimsuit*/

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

/*Poncho*/

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

/obj/item/clothing/suit/poncho/pink
	name = "pink poncho"
	desc = "A comfortable sleeveless poncho with a pink design."
	icon_state = "pinkponcho"
	item_state = "pinkponcho"

/obj/item/clothing/suit/poncho/blue
	name = "blue poncho"
	desc = "A comfortable sleeveless poncho with a blue design."
	icon_state = "blueponcho"
	item_state = "blueponcho"

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

/*Varsity Jackets*/

/obj/item/clothing/suit/storage/leather_jacket
	name = "grey leather jacket"
	desc = "A sturdy grey jacket made out of synthetic leather."
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	armor = list(melee = 20, bullet = 5, energy = 20, bomb = 10, bio = 0, rad = 0)
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

/obj/item/clothing/suit/varsity/pink
	name = "pink varsity jacket"
	desc = "A sporty letterman jacket with a pink design."
	icon_state = "varsity_pink"
	item_state = "varsity_pink"

/*Military Jackets*/

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

/*Track Jackets*/

/obj/item/clothing/suit/storage/toggle/track
	name = "black track jacket"
	desc = "A track jacket, for the athletic."
	icon_state = "trackjacket"

/obj/item/clothing/suit/storage/toggle/track/blue
	name = "blue track jacket"
	icon_state = "trackjacketblue"

/obj/item/clothing/suit/storage/toggle/track/green
	name = "green track jacket"
	icon_state = "trackjacketgreen"

/obj/item/clothing/suit/storage/toggle/track/red
	name = "red track jacket"
	icon_state = "trackjacketred"

/obj/item/clothing/suit/storage/toggle/track/white
	name = "white track jacket"
	icon_state = "trackjacketwhite"

/*Suit Jackets*/
/obj/item/clothing/suit/storage/toggle/lawyer
	name = "blue suit jacket"
	desc = "A snappy blue suit jacket."
	icon_state = "suitjacket_blue"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/purple
	name = "purple suit jacket"
	desc = "A snappy purple suit jacket."
	icon_state = "suitjacket_purp"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/black
	name = "black suit jacket"
	desc = "A snappy black suit jacket."
	icon_state = "ia_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/green
	name = "green suit jacket"
	desc = "A snappy green suit jacket."
	icon_state = "suitjacket_green"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/tan
	name = "tan suit jacket"
	desc = "A snappy tan suit jacket."
	icon_state = "tan_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/charcoal
	name = "charcoal suit jacket"
	desc = "A snappy charcoal suit jacket."
	icon_state = "charcoal_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/navy
	name = "navy suit jacket"
	desc = "A snappy navy suit jacket."
	icon_state = "navy_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/burgundy
	name = "burgundy suit jacket"
	desc = "A snappy burgundy suit jacket."
	icon_state = "burgundy_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/lawyer/checkered
	name = "checkered suit jacket"
	desc = "A snappy checkered suit jacket."
	icon_state = "checkered_jacket"
	body_parts_covered = UPPER_TORSO|ARMS