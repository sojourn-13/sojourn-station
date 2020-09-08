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
	armor = list(
		melee = 5,
		bullet = 5,
		energy = 5,
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
	armor = list(
		melee = 5,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 0,
		rad = 0
	)

//Quartermaster
/obj/item/clothing/suit/storage/rank/qm_coat
	name = "executive officer coat"
	desc = "An ideal choice for a smuggler. This coat seems have good impact resistance, and is made from resistant and expensive materials."
	icon_state = "qm_coat"
	item_state = "qm_coat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 5,
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
		/obj/item/weapon/reagent_containers/glass/fertilizer,
		/obj/item/weedkiller
	)

//Civillian
/obj/item/clothing/suit/storage/toggle/club
	name = "executive officer's jacket"
	desc = "A well tailored and rich jacket of the executive officer."
	icon_state = "cm_coat"
	item_state = "cm_coat"
	icon_open = "cm_coat_open"
	icon_closed = "cm_coat"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

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
	matter = list(MATERIAL_BIOMATTER = 20, MATERIAL_GOLD = 5)
	armor = list(
		melee = 20,
		bullet = 20,
		energy = 10,
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
	armor = list(
		melee = 10,
		bullet = 5,
		energy = 0,
		bomb = 10,
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
	desc = "Brown and armored trenchcoat, designed and created by Security. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon_state = "rangercoat"
	item_state = "rangercoat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor = list(melee = 30, bullet = 25, energy = 25, bomb = 0, bio = 0, rad = 0)
	price_tag = 250

/obj/item/clothing/suit/storage/rank/det_trench
	name = "brown trenchcoat"
	desc = "A rugged canvas trenchcoat, designed and created by TX Fabrication Corp. The coat is externally impact resistant - perfect for your next act of autodefenestration!"
	icon_state = "detective"
	item_state = "det_suit"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor = list(
		melee = 20,
		bullet = 20,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	price_tag = 125

//Engineering
/obj/item/clothing/suit/storage/hazardvest
	name = "hazard vest"
	desc = "A high-visibility vest used in work zones."
	icon_state = "hazard"
	item_state = "hazard"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/weapon/tool)
	body_parts_covered = UPPER_TORSO
	price_tag = 50

/obj/item/clothing/suit/storage/hazardvest_black
	name = "black hazard vest"
	desc = "A high-visibility vest used in work zones. This one is in stylish black."
	icon_state = "hazard_black"
	item_state = "hazard_nlack"
	blood_overlay_type = "armor"
	extra_allowed = list(/obj/item/weapon/tool)
	body_parts_covered = UPPER_TORSO
	price_tag = 50

//Roboticist
/obj/item/clothing/suit/storage/rank/robotech_jacket
	name = "robotech jacket"
	desc = "Jacket for those who like to get dirty in a machine oil."
	icon_state = "robotech_jacket"
	item_state = "robotech_jacket"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	price_tag = 50
	armor = list(
		melee = 10,
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
		/obj/item/weapon/tool/bonesetter,
		/obj/item/weapon/tool/cautery,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/tool/hemostat,
		/obj/item/weapon/tool/retractor,
		/obj/item/weapon/tool/scalpel,
		/obj/item/weapon/tool/surgicaldrill,
		/obj/item/stack/medical/advanced/bruise_pack
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	price_tag = 50
