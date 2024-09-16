/*************
* Ammunition *
*************/
/datum/uplink_item/item/ammo
	item_cost = 4
	category = /datum/uplink_category/ammunition

/datum/uplink_item/item/ammo/pistol
	name = "9mm HV box"
	item_cost = 1
	path = /obj/item/ammo_magazine/ammobox/pistol_35/hv

/datum/uplink_item/item/ammo/hpistol
	name = "9mm HV high-capacity mag"
	item_cost = 1
	path = /obj/item/ammo_magazine/highcap_pistol_35/highvelocity

/datum/uplink_item/item/ammo/smg
	name = "9mm HV SMG mag"
	item_cost = 2
	path = /obj/item/ammo_magazine/smg_35/hv

/datum/uplink_item/item/ammo/darts
	name = "Darts"
	item_cost = 1
	path = /obj/item/ammo_magazine/chemdart

/datum/uplink_item/item/ammo/magnum
	name = "10mm HV Magnum Mag"
	item_cost = 1
	path = /obj/item/ammo_magazine/magnum_40/hv

/datum/uplink_item/item/ammo/slmagnum
	name = "10mm HV Magnum Speed Loader"
	item_cost = 1
	path = /obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity

/datum/uplink_item/item/ammo/lrifle
	name = "6.5x39mm HV Carbine Clip"
	item_cost = 3
	path = /obj/item/ammo_magazine/light_rifle_257/highvelocity

/datum/uplink_item/item/ammo/rifle
	name = "7.62x39mm HV Rifle Clip"
	item_cost = 3
	path = /obj/item/ammo_magazine/rifle_75/highvelocity

/datum/uplink_item/item/ammo/hrifle
	name = "8.6mm Heavy Rifle SLAP Mag"
	item_cost = 3
	path = /obj/item/ammo_magazine/heavy_rifle_408/hv

/datum/uplink_item/item/ammo/m12
	name = "M12 shotgun mag with slugs"
	item_cost = 2
	path = /obj/item/ammo_magazine/m12

/datum/uplink_item/item/ammo/m12/beanbag
	name = "M12 shotgun mag with beanbag"
	item_cost = 2
	path = /obj/item/ammo_magazine/m12/beanbag

/datum/uplink_item/item/ammo/m12/pellet
	name = "M12 shotgun mag with buckshot"
	item_cost = 2
	path = /obj/item/ammo_magazine/m12/pellet

/datum/uplink_item/item/ammo/m12
	name = "M12 shotgun mag with slugs"
	item_cost = 2
	path = /obj/item/ammo_magazine/m12

/datum/uplink_item/item/ammo/m12/empty
	name = "empty M12 shotgun mag"
	item_cost = 1
	path = /obj/item/ammo_magazine/m12/empty

/datum/uplink_item/item/ammo/sniperammo
	name = "14.5x114mm AP"
	item_cost = 3
	path = /obj/item/ammo_magazine/ammobox/antim_small

/datum/uplink_item/item/ammo/sniperammo_lethal
	name = "1 \"Red-Nose\" shell casing"
	item_cost = 2
	path = /obj/item/ammo_casing/antim/lethal

/datum/uplink_item/item/ammo/sniperammo_ion
	name = "1 \"Off-Switch\" shell casing"
	item_cost = 2
	path = /obj/item/ammo_casing/antim/ion

//Super-class cells, better than what you'll find in a vendor,
//but not as good as the best maint loot, so scavenging is still encouraged
/datum/uplink_item/item/ammo/cell/small
	name = "Lonestar \"Robustcell 300S\""
	item_cost = 2
	path = /obj/item/cell/small/super

/datum/uplink_item/item/ammo/cell/medium
	name = "Lonestar \"Robustcell 1000M\""
	item_cost = 3
	path = /obj/item/cell/medium/super

/datum/uplink_item/item/ammo/cell/large
	name = "Lonestar \"Robustcell 16000L\""
	item_cost = 4
	path = /obj/item/cell/large/super
