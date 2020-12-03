// Stuff that are used for guns and melee, self defence and weapons
// Should spawn in bag or in hand
/obj/item/weapon/gun/projectile/clarissa/loadout
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_PLASTIC = 3)

/datum/gear/armament
	display_name = "Clarissa .35 Auto pistol (Empty)"
	path = /obj/item/weapon/gun/projectile/clarissa/loadout
	sort_category = "Armament"
	cost = 3

/datum/gear/armament/ammo
	display_name = "Rubber .35 Auto pistol mag"
	path = /obj/item/ammo_magazine/pistol_35/rubber
	cost = 1

/datum/gear/armament/ammo_box
	display_name = "Rubber .35 Auto pistol box"
	path = /obj/item/ammo_magazine/ammobox/pistol_35/rubber
	cost = 2

/datum/gear/armament/flash
	display_name = "flash"
	path = /obj/item/device/flash
	cost = 1

/datum/gear/armament/baton
	display_name = "telescopic baton"
	path = /obj/item/weapon/melee/telebaton
	cost = 5

/datum/gear/armament/holster/armpit
	display_name = "armpit holster"
	path = /obj/item/clothing/accessory/holster/armpit

/datum/gear/armament/holster/waist
	display_name = "waist holster"
	path = /obj/item/clothing/accessory/holster/waist

/datum/gear/armament/holster/hip
	display_name = "hip holster"
	path = /obj/item/clothing/accessory/holster/hip

/datum/gear/armament/holster/leg
	display_name = "leg holster"
	path = /obj/item/clothing/accessory/holster/leg

/datum/gear/armament/holster/baton
	display_name = "baton holster"
	path = /obj/item/weapon/storage/pouch/baton_holster

/datum/gear/armament/holster/saber/cutlass
	display_name = "cutlass holster"
	path = /obj/item/clothing/accessory/holster/saber/cutlass