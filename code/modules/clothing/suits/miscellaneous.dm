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
/obj/item/clothing/suit/costume/history/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/costume/halloween/mummy
	name = "pharaoh tunic"
	desc = "A dusty tunic covered in sandy residue. Feels royal."
	icon_state = "pharoah"
	item_state = "pharoah"

/obj/item/clothing/suit/costume/halloween/flash
	name = "flash costume"
	desc = "A giant flash outfit. It's unlikely anything is scarier than this."
	icon_state = "flashsuit"
	body_parts_covered = HEAD
	flags_inv = HIDEEARS|HIDEFACE|HIDEMASK

/obj/item/clothing/suit/costume/job/sumo
	name = "sumo wrestler costume"
	desc = "An inflated sumo wrestler costume. It's quite hot."
	icon_state = "sumo"
	body_parts_covered = LOWER_TORSO|UPPER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	item_state_slots = list(slot_r_hand_str = "classicponcho", slot_l_hand_str = "classicponcho")
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/costume/kinky/sexy_miner
	name = "sexy miner costume"
	desc = "A costume for the most macho of miners."
	icon_state = "sexyminer"
	body_parts_covered = LOWER_TORSO|HEAD
	flags_inv = HIDEJUMPSUIT|HIDESHOES
	item_state_slots = list(slot_r_hand_str = "miner", slot_l_hand_str = "miner")

/obj/item/clothing/suit/costume/kinky/sexy_engineer
	name = "sexy engineer costume"
	desc = "A fake voidsuit that looks more for show than practicality."
	icon_state = "engicost"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT|HIDESHOES
	item_state_slots = list(slot_r_hand_str = "eng_voidsuit", slot_l_hand_str = "eng_voidsuit")

/obj/item/clothing/suit/costume/kinky/sexy_scientist
	name = "sexy scientist costume"
	desc = "A costume befitting a rather sleazy scientist."
	icon_state = "maxman"
	body_parts_covered = LOWER_TORSO|LEGS|HEAD
	flags_inv = HIDEJUMPSUIT|HIDESHOES
	item_state_slots = list(slot_r_hand_str = "leather_jacket", slot_l_hand_str = "leather_jacket")

/obj/item/clothing/suit/costume/kinky/sexy_lumberjack
	name = "sexy lumberjack costume"
	desc = "A lumberjack costume that smells of dusky pine."
	icon_state = "sexylumber"
	body_parts_covered = LOWER_TORSO
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	item_state_slots = list(slot_r_hand_str = "red_labcoat", slot_l_hand_str = "red_labcoat")

/obj/item/clothing/suit/costume/kinky/sexy_internalaffairs
	name = "sexy internal affairs suit"
	desc = "A suit that takes internal affairs too literally."
	icon_state = "iacost"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|EYES
	flags_inv = HIDEJUMPSUIT|HIDESHOES
	item_state_slots = list(slot_r_hand_str = "suit_black", slot_l_hand_str = "suit_black")

/obj/item/clothing/suit/costume/halloween/skeleton
	name = "skeleton costume"
	desc = "A body-tight costume with the human skeleton lined out on it."
	icon_state = "skelecost"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|EYES|HEAD|FACE
	flags_inv = HIDEJUMPSUIT|HIDESHOES|HIDEGLOVES
	item_state_slots = list(slot_r_hand_str = "judge", slot_l_hand_str = "judge")

/obj/item/clothing/suit/costume/halloween/madscientist
	name = "mad scientist labcoat"
	desc = "A green labcoat that only a truly insane genius would wear."
	icon_state = "madscientist"
	item_state = "madscientist" //Is this even used for anything?
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/suit/costume/job/imperium_monk
	name = "imperium monk robe"
	desc = "A robe resembling that worn by xeno-killing monks."
	icon_state = "imperium_monk"
	body_parts_covered = HEAD|UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/costume/misc/santa
	name = "santa suit"
	desc = "A festive red suit great for handing out presents in."
	icon_state = "santa"
	item_state = "santa"
	allowed = list(/obj/item) //for stuffing exta special presents

/obj/item/clothing/suit/costume/misc/hastur
	name = "hastur robes"
	desc = "A strange set of stylish yellow robes."
	icon_state = "hastur"
	item_state_slots = list(slot_r_hand_str = "rad", slot_l_hand_str = "rad")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/costume/misc/snowman
	name = "snowman suit"
	desc = "Two white spheres covered in white glitter. 'Tis the season."
	icon_state = "snowman"
	item_state = "snowman"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/costume/halloween/vampire
	name = "vampire coat"
	desc = "A gothic black and red coat worn by vampires."
	icon_state = "draculacoat"
	item_state = "draculacoat"

/obj/item/clothing/suit/costume/misc/hacker
	name = "classic hacker costume"
	desc = "You would feel insanely cool wearing this."
	icon_state = "hackercost"
	body_parts_covered = LOWER_TORSO|UPPER_TORSO|LEGS|ARMS|EYES
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	item_state_slots = list(slot_r_hand_str = "leather_coat", slot_l_hand_str = "leather_coat")

/obj/item/clothing/suit/cyborg_suit
	name = "cyborg suit"
	desc = "Suit for a cyborg costume."
	icon_state = "death"
	item_state = "death"
	flags = CONDUCT
	fire_resist = T0C+5200
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/costume/job/judge
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

obj/item/clothing/suit/kimono
	name = "kimono"
	desc = "A traditional Japanese kimono."
	icon_state = "kimono"

/obj/item/clothing/suit/costume/halloween/syndicate
	name = "red space suit replica"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A plastic replica of the syndicate space suit, you'll look just like a real murderous syndicate agent in this! This is a toy, it is not made for use in space!"
	w_class = ITEM_SIZE_NORMAL
	allowed = list(/obj/item/device/lighting/toggleable/flashlight,/obj/item/weapon/tank/emergency_oxygen,/obj/item/toy)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	item_flags = COVER_PREVENT_MANIPULATION

obj/item/clothing/suit/costume/halloween/web_bindings
	name = "web bindings"
	desc = "A webbed cocoon that completely restrains the wearer."
	icon_state = "web_bindings"
	item_state = "web_bindings"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL


/obj/item/clothing/suit/costume/animal/chicken
	name = "chicken suit"
	desc = "A suit that makes you look like a giant chicken."
	icon_state = "chickensuit"
	item_state = "chickensuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0

/obj/item/clothing/suit/costume/animal/bunny
	name = "bunny suit"
	desc = "Hop Hop Hop!"
	icon_state = "bunnysuit"
	item_state = "bunnysuit"
	body_parts_covered = LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/costume/animal/ian
	name = "ian suit"
	desc = "A suit resembling the famous space corgi.."
	icon_state = "ian"
	item_state = ""
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0


/obj/item/clothing/suit/costume/animal/monkey
	name = "monkey suit"
	desc = "A suit perfect for some monkey business."
	icon_state = "monkeysuit"
	item_state = "monkeysuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0


/obj/item/clothing/suit/costume/halloween/cardborg
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

/obj/item/clothing/suit/costume/halloween/xenos
	name = "xenomorph suit"
	desc = "A suit made out of chitinous alien hide, resembling a xenomorph body."
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