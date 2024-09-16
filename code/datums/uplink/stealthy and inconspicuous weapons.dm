/*************************************
* Stealthy and Inconspicuous Weapons *
*************************************/
/datum/uplink_item/item/stealthy_weapons
	category = /datum/uplink_category/stealthy_weapons

/datum/uplink_item/item/stealthy_weapons/soap
	name = "Subversive Soap"
	item_cost = 1
	path = /obj/item/soap/syndie

/datum/uplink_item/item/stealthy_weapons/cigarette_kit
	name = "Cigarette Kit"
	item_cost = 2
	path = /obj/item/storage/box/syndie_kit/cigarette

/datum/uplink_item/item/stealthy_weapons/concealed_cane
	name = "Concealed Cane Sword"
	item_cost = 2
	path = /obj/item/cane/concealed

/datum/uplink_item/item/stealthy_weapons/random_toxin
	name = "Random Toxin - Beaker"
	item_cost = 2
	path = /obj/item/storage/box/syndie_kit/toxin

/datum/uplink_item/item/stealthy_weapons/parapen
	name = "Paralysis Pen"
	item_cost = 6
	path = /obj/item/pen/reagent/paralysis
	antag_roles = ROLES_UPLINK_BASE

/datum/uplink_item/item/stealthy_weapons/infuser
	name = "\"Glass Widow\" radiation infuser"
	item_cost = 2
	path = /obj/item/gun_upgrade/mechanism/glass_widow
	antag_roles = ROLES_UPLINK_BASE

/datum/uplink_item/item/stealthy_weapons/silencer
	name = "Silencer"
	item_cost = 1
	path = /obj/item/gun_upgrade/muzzle/silencer

/datum/uplink_item/item/stealthy_weapons/pain_maker
	name = "SA \"PainMaker\" muzzle"
	item_cost = 2
	path = /obj/item/gun_upgrade/muzzle/pain_maker

/datum/uplink_item/item/stealthy_weapons/dna_trigger
	name = "SI \"DNA lock\" trigger"
	item_cost = 2 //low do to like being really really unuseful
	path = /obj/item/gun_upgrade/trigger/dnalock


/*
//Remove Lens from premisis -Hex
/datum/uplink_item/item/stealthy_weapons/eye_banger
	name = "\"Mortality\" explosive lenses"
	item_cost = 5
	path = /obj/item/clothing/glasses/attachable_lenses/explosive
*/

/datum/uplink_item/item/stealthy_weapons/boot_knife
	name = "Boot Knife"
	item_cost = 1
	path = /obj/item/tool/knife/boot

/datum/uplink_item/item/stealthy_weapons/assassin_dagger
	name = "Assassin's Dagger"
	item_cost = 2
	path = /obj/item/tool/knife/dagger/assassin