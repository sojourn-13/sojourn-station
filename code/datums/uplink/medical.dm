/**********
* Medical *
**********/
/datum/uplink_item/item/medical
	category = /datum/uplink_category/medical

/datum/uplink_item/item/medical/sinpockets
	name = "Box of Sin-Pockets"
	item_cost = 2
	path = /obj/item/storage/box/sinpockets

/datum/uplink_item/item/medical/surgery
	name = "Surgery kit"
	item_cost = 5
	path = /obj/item/storage/firstaid/surgery/traitor

/datum/uplink_item/item/medical/combat
	name = "Combat medical kit"
	item_cost = 5
	path = /obj/item/storage/firstaid/combat

/datum/uplink_item/item/medical/advanced
	name = "Advanced medical kit"
	item_cost = 4
	path = /obj/item/storage/firstaid/adv

/datum/uplink_item/item/medical/toxin
	name = "Toxin medical kit"
	item_cost = 2
	path = /obj/item/storage/firstaid/toxin

/datum/uplink_item/item/medical/nanites
	name = "Raw nanite vial"
	item_cost = 2
	path = /obj/item/reagent_containers/glass/beaker/vial/nanites

/datum/uplink_item/item/medical/uncapnanites
	name = "Raw uncapped nanite vial"
	item_cost = 5
	path = /obj/item/reagent_containers/glass/beaker/vial/uncapnanites

/datum/uplink_item/item/medical/gene_vial
	name = "Genetic material vial"
	item_cost = 5
	path = /obj/item/gene_vial
	antag_roles = list(ROLE_CARRION)
