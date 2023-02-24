// Stuff that are
// Should spawn in bag or in hand

/datum/gear/armament
	display_name = "Loaded Clarissa .35 Auto pistol (Rubber)"
	path = /obj/item/gun/projectile/clarissa/preloaded
	sort_category = "Armament"
	slot = slot_in_backpack
	cost = 1

/datum/gear/armament/ammo
	display_name = "Rubber .35 Auto pistol mag"
	path = /obj/item/ammo_magazine/pistol_35/rubber
	cost = 1

/datum/gear/armament/ammo_h
	display_name = "High Cap Rubber .35 Auto pistol mag"
	path = /obj/item/ammo_magazine/highcap_pistol_35/rubber
	cost = 2

/datum/gear/armament/ammo_speed
	display_name = "Rubber .35 Auto pistol speed loader"
	path = /obj/item/ammo_magazine/speed_loader_pistol_35/rubber
	cost = 1

/datum/gear/armament/ammo_box
	display_name = "Rubber .35 Auto pistol ammo box"
	path = /obj/item/ammo_magazine/ammobox/pistol_35/rubber
	cost = 2

/datum/gear/armament/detective
	display_name = "Unloaded Havelock .35 Auto pistol"
	path = /obj/item/gun/projectile/revolver/detective
	cost = 2

/datum/gear/armament/guncase
	display_name = "Gun Case"
	path = /obj/item/storage/backpack/guncase
	cost = 1

/datum/gear/armament/flash
	display_name = "flash"
	path = /obj/item/device/flash
	cost = 1

/datum/gear/armament/tacboot_knife
	display_name = "tactical knife"
	path = /obj/item/tool/knife/tacknife
	cost = 2

/datum/gear/armament/ritual_knife
	display_name = "ritual knife"
	path = /obj/item/tool/knife/ritual
	cost = 3

/datum/gear/armament/dagger/family
	display_name = "heirloom dagger"
	path = /obj/item/tool/knife/dagger/heirloom_knife
	cost = 1

/datum/gear/armament/baton
	display_name = "telescopic baton"
	path = /obj/item/melee/telebaton
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
	path = /obj/item/storage/pouch/baton_holster

/datum/gear/armament/holster/saber/cutlass
	display_name = "cutlass holster"
	path = /obj/item/clothing/accessory/holster/saber/cutlass

/datum/gear/armament/holster/saber/katana
	display_name = "katana \"Saya\" sheath"
	path = /obj/item/clothing/accessory/holster/saber/saya

/datum/gear/armament/holster/church
	display_name = "Absolutist Sword Scabbard"
	path = /obj/item/clothing/accessory/holster/saber/greatsword/churchprint
	allowed_roles = list("Prime","Vector")

/datum/gear/armament/saber
	display_name = "Decorative Saber"
	path = /obj/item/tool/sword/saber
	cost = 2
	allowed_roles = list("Premier","Steward","Blackshield Commander","Warrant Officer")

/datum/gear/armament/cheap_melee
	display_name = "cheap melee selection"
	path = /obj/item/tool/cheap
	cost = 3
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/armament/cheap_sheath
	display_name = "generic scabbard"
	path = /obj/item/clothing/accessory/holster/saber/machete/cheap
	cost = 1

/datum/gear/armament/holster/nt
	display_name = "short sword"
	path = /obj/item/tool/sword/nt/shortsword
	allowed_roles = list("Prime","Vector")
	cost = 1
