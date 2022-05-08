/*Animal*/

/obj/item/clothing/suit/costume/animal/carp
	name = "carp suit"
	desc = "A costume made from synthetic carp scale."
	icon_state = "carp"
	item_state = "carp"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

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
	desc = "A suit resembling the famous space corgi."
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

/*History*/

/obj/item/clothing/suit/costume/history/plaguedoctor
	name = "plague doctor suit"
	desc = "A large dark robe worn by medieval apothecaries. Spooky."
	icon_state = "plaguedoctor"
	item_state = "plaguedoctor"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/costume/history/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	body_parts_covered = UPPER_TORSO|ARMS

/*Job*/

/obj/item/clothing/suit/costume/job/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon_state = "nun"
	item_state = "nun"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/costume/job/sumo
	name = "sumo wrestler costume"
	desc = "An inflated sumo wrestler costume. It's quite hot."
	icon_state = "sumo"
	body_parts_covered = LOWER_TORSO|UPPER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	item_state_slots = list(slot_r_hand_str = "classicponcho", slot_l_hand_str = "classicponcho")
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/costume/job/judge
	name = "judge's robe"
	desc = "This robe commands authority."
	icon_state = "judge"
	item_state = "judge"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	allowed = list(/obj/item/storage/fancy/cigarettes,/obj/item/spacecash)
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/costume/job/imperium_monk
	name = "imperium monk robe"
	desc = "A robe resembling that worn by xeno-killing monks."
	icon_state = "imperium_monk"
	body_parts_covered = HEAD|UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDESHOES|HIDEJUMPSUIT

/*Halloween*/

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

/obj/item/clothing/suit/costume/halloween/vampire
	name = "vampire coat"
	desc = "A gothic black and red coat worn by vampires."
	icon_state = "draculacoat"
	item_state = "draculacoat"

/obj/item/clothing/suit/costume/halloween/madscientist
	name = "mad scientist labcoat"
	desc = "A green labcoat that only a truly insane genius would wear."
	icon_state = "madscientist"
	item_state = "madscientist" //Is this even used for anything?
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/suit/costume/halloween/syndicate
	name = "red space suit replica"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A plastic replica of the syndicate space suit, you'll look just like a real murderous syndicate agent in this! This is a toy, it is not made for use in space!"
	w_class = ITEM_SIZE_NORMAL
	allowed = list(/obj/item/device/lighting/toggleable/flashlight,/obj/item/tank/emergency_oxygen,/obj/item/toy)
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

/obj/item/clothing/suit/costume/halloween/cardborg
	name = "cardborg suit"
	desc = "An ordinary cardboard box with holes cut in the sides."
	icon_state = "cardborg"
	item_state = "cardborg"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/costume/halloween/xenos
	name = "xenomorph suit"
	desc = "A suit made out of chitinous alien hide, resembling a xenomorph body."
	icon_state = "xenos"
	item_state = "xenos_helm"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2.0

/obj/item/clothing/suit/costume/halloween/scream
	name = "Ghastly robes"
	desc = "A set of loose fitting black robes, something about them inspires unease "
	icon_state = "ghostrobes"
	item_state = "ghostrobes"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT

/*Kinky*/

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

/obj/item/clothing/suit/costume/kinky/alyson
	name = "bunny suit"
	desc = "The most famous appeal on every side of the universe, a bunny suit complete with pantyhoses, cuffs, and a puffy tail. Ears not included!"
	icon_state = "lewdbunny"
	flags_inv = HIDEJUMPSUIT|HIDEGLOVES
	item_state_slots = list(slot_r_hand_str = "suit_black", slot_l_hand_str = "suit_black")

/*Misc*/

/obj/item/clothing/suit/mage_suit
	name = "mage robe"
	desc = "A rather dark silky robe with bits of blue ribbon to add a bit of contrast, used for people doing magic tricks or slight of hand in style."
	icon_state = "mage_outfit"
	item_state = "mage_outfit"

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

/obj/item/clothing/suit/costume/misc/hacker
	name = "classic hacker costume"
	desc = "You would feel insanely cool wearing this."
	icon_state = "hackercost"
	body_parts_covered = LOWER_TORSO|UPPER_TORSO|LEGS|ARMS|EYES
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	item_state_slots = list(slot_r_hand_str = "leather_coat", slot_l_hand_str = "leather_coat")
