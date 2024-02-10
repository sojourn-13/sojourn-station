//Wizard Rig
/obj/item/clothing/head/helmet/space/void/wizard
	name = "gem-encrusted voidsuit helmet"
	desc = "A bizarre gem-encrusted helmet that radiates anomalous energies."
	icon_state = "rig0-wiz"
	item_state_slots = list(
		slot_l_hand_str = "wiz_helm",
		slot_r_hand_str = "wiz_helm",
		)
	unacidable = 1 //No longer shall our kind be foiled by lone chemists with spray bottles!
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 5,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	siemens_coefficient = 0.7
	price_tag = 3000

/obj/item/clothing/suit/space/void/wizard
	icon_state = "rig-wiz"
	name = "gem-encrusted voidsuit"
	desc = "A bizarre gem-encrusted suit that radiates strange energy readings."
	item_state = "wiz_voidsuit"
	slowdown = 1
	unacidable = 1
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 5,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	siemens_coefficient = 0.7
	price_tag = 500
	helmet = /obj/item/clothing/head/helmet/space/void/wizard
