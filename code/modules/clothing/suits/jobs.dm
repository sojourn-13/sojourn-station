/*
 * Job related
 */

//Assistant
/obj/item/clothing/suit/storage/rank/ass_jacket
	name = "colonist jacket"
	desc = "Practical and comfortable jacket. It seems have a little protection from physical harm."
	icon_state = "ass_jacket"
	item_state = "ass_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)

//Guild Technician
/obj/item/clothing/suit/storage/rank/cargo_jacket
	name = "lonestar jacket"
	desc = "Stylish jacket lined with pockets. It seems have a little protection from physical harm."
	icon_state = "cargo_jacket"
	item_state = "cargo_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/rank/cargoclerk_jacket
	name = "lonestar office jacket"
	desc = "Stylish jacket lined for lonestar office workers. It seems have a little protection from physical harm."
	icon_state = "cargoclerk_jacket"
	item_state = "cargo_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 1,
		bullet = 1,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/cargovest
	name = "lonestar hazard vest"
	desc = "A Lonestar hazard vest in grey and orange to be used in work zones."
	icon_state = "cargovest"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/tool)
	body_parts_covered = UPPER_TORSO
	armor_list = list(
		melee = 2,
		bullet = 2,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
)

/obj/item/clothing/suit/storage/cargovest/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["alt style"] = "_color"

	var/choice = input(M,"How would you like to wear your vest?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You alter your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Quartermaster
/obj/item/clothing/suit/storage/rank/qm_coat
	name = "surface manager coat"
	desc = "An ideal choice for a smuggler. This coat seems have good impact resistance, and is made from resistant and expensive materials."
	icon_state = "qm_coat"
	item_state = "qm_coat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor_list = list(
		melee = 5,
		bullet = 2,
		energy = 1,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8

//Botonist
/obj/item/clothing/suit/rank/botanist
	name = "apron"
	desc = "A basic yellow apron."
	icon_state = "apron"
	item_state = "apron"
	blood_overlay_type = "armor"
	body_parts_covered = 0
	extra_allowed = list(
		/obj/item/seeds,
		/obj/item/reagent_containers/glass/fertilizer,
		/obj/item/weedkiller
	)

//Civillian
/obj/item/clothing/suit/storage/toggle/club
	name = "surface operations manager's jacket"
	desc = "A well tailored and rich jacket for the Surface Operations Manager."
	icon_state = "cm_coat"
	item_state = "cm_coat"
	icon_open = "cm_coat_open"
	icon_closed = "cm_coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

//Artist
/obj/item/clothing/suit/artist
	name = "Complicated Vest"
	desc = "The tubes don't even do anything."
	icon_state = "artist"
	item_state = "artist_armor"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

//Chaplain
/obj/item/clothing/suit/storage/chaplain
	name = "prime longcoat"
	desc = "A long, lightly armoured jacket. Dark, stylish and authoritarian."
	icon_state = "chaplain_hoodie"
	item_state = "chaplain_hoodie"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	permeability_coefficient = 0.50
	siemens_coefficient = 0.7
	matter = list(MATERIAL_BIOMATTER = 20, MATERIAL_GOLD = 2)
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 2,
		bomb = 30,
		bio = 100,
		rad = 100
	)

/obj/item/clothing/suit/storage/neotheosports
	name = "church sports jacket"
	desc = "Absolutism styled sports jacket to keep the faithful always on their feet."
	icon_state = "nt_sportsjacket"
	item_state = "nt_sportsjacket"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 3,
		bullet = 2,
		energy = 1,
		bomb = 0,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/storage/chaplain/holiday
	name = "holiday priest"
	desc = "A garment worn seasonally by chaplains."
	icon_state = "holidaypriest"
	item_state_slots = list(slot_r_hand_str = "labcoat", slot_l_hand_str = "labcoat")

/obj/item/clothing/suit/storage/chaplain/coat
	name = "preacher coat"
	desc = "A snugly fitting, lightly armoured brown coat."
	icon_state = "church_coat"
	item_state = "church_coat"

/obj/item/clothing/suit/storage/chaplain/coat/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Primes coat"] = "church_coat"
	options["Primes vestments"] = "nt_minister"//credit to Près de l'oiseau on Eris for all of these!
	options["Primes dark vestmentts"] = "nt_minister_dark"
	options["Primes robes"] = "nt_robe_down"
	options["Primes mantled robes"] = "nt_robe"
	options["Primes habit"] = "nt_habit"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Chef
/obj/item/clothing/suit/rank/chef
	name = "chef's apron"
	desc = "An apron used by a high class chef."
	icon_state = "chef"
	item_state = "chef"
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/rank/chef/classic
	name = "classic chef's apron"
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"
	item_state = "apronchef"
	blood_overlay_type = "armor"
	body_parts_covered = 0

//Detective
/obj/item/clothing/suit/storage/rank/insp_trench
	name = "ranger's armored trenchcoat"
	desc = "Brown and armored trenchcoat, designed and created by the Marshals. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon_state = "rangercoat"
	item_state = "rangercoat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(melee =7, bullet = 6, energy = 6, bomb = 0, bio = 0, rad = 0)
	price_tag = 250

/obj/item/clothing/suit/storage/rank/insp_trench/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Rangercoat Default"] = "rangercoat"
	options["Brown Trenchcoat"] = "detective"
	options["Grey Trenchcoat"] = "detective_grey"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Engineering
/obj/item/clothing/suit/storage/hazardvest
	name = "hazard vest"
	desc = "A high-visibility vest used in work zones."
	icon_state = "hazard"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/tool)
	body_parts_covered = UPPER_TORSO
	price_tag = 50

/obj/item/clothing/suit/storage/hazardvest/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Orange"] = "hazard"
	options["Black"] =  "hazard_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Roboticist
/obj/item/clothing/suit/storage/rank/robotech_jacket
	name = "robotech jacket"
	desc = "Jacket for those who like to get dirty in a machine oil."
	icon_state = "robotech_jacket"
	item_state = "robotech_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	price_tag = 50
	armor_list = list(
		melee = 2,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/surgical_apron
	name = "surgical apron"
	desc = "Excellent blood collector."
	icon_state = "surgeon"
	item_state = "surgeon"
	blood_overlay_type = "armor"
	extra_allowed = list(
		/obj/item/tool/bonesetter,
		/obj/item/tool/cautery,
		/obj/item/tool/saw/circular,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/scalpel,
		/obj/item/tool/tape_roll/bonegel,
		/obj/item/stack/medical/bruise_pack/advanced
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	price_tag = 50
