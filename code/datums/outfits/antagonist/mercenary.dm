/decl/hierarchy/outfit/antagonist/mercenary

	hierarchy_type = /decl/hierarchy/outfit/antagonist/mercenary

	uniform = /obj/item/clothing/under/turtleneck
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/magboots/merc
	suit = /obj/item/clothing/suit/armor/flakvest
	pda_slot = slot_belt
	pda_type = /obj/item/modular_computer/pda

//The outfit that mercs spawn in. They get their armor and weapons from the merc base
/decl/hierarchy/outfit/antagonist/mercenary/casual
	name = "Serbian Mercenary fatigues"


//He gets a snazzy beret
/decl/hierarchy/outfit/antagonist/mercenary/commander
	name = "Serbian Mercenary Commander"
	head = /obj/item/clothing/head/rank/commander

//This outfit is just for admin fun. Spawns them fully equipped
//Actual mercs equip themselves by picking up their armor from their base
/decl/hierarchy/outfit/antagonist/mercenary/equipped
	name = "Serbian Mercenary combat gear"

	suit = /obj/item/clothing/suit/space/void/SCAF
	suit_store = /obj/item/tank/jetpack/oxygen
	back = /obj/item/storage/backpack/military

/decl/hierarchy/outfit/antagonist/mercenary/excelsior
	name = "excelsior fatigues"
	uniform = /obj/item/clothing/under/excelsior/mixed
	suit = /obj/item/clothing/suit/sling
	back = /obj/item/gun/projectile/boltgun
	r_pocket = /obj/item/ammo_magazine/speed_loader_rifle_75

/decl/hierarchy/outfit/antagonist/mercenary/excelsior/equipped
	name = "excelsior combat gear"
	uniform = /obj/item/clothing/under/excelsior
	suit = /obj/item/clothing/suit/space/void/excelsior
	back = /obj/item/storage/backpack/military

/decl/hierarchy/outfit/antagonist/mercenary/void_wolf
	name = "Void Wolf"
	uniform = /obj/item/clothing/under/genericb
	head = /obj/item/clothing/head/helmet/space
	shoes = /obj/item/clothing/shoes/color/black
	suit = /obj/item/clothing/suit/space
	suit_store = /obj/item/gun/energy/cog
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/utility/full
	r_pocket = /obj/item/cell/medium/high
	l_pocket = /obj/item/cell/medium/high
	id_slot = slot_wear_id
	id_type = /obj/item/card/id

/obj/item/clothing/under/kriosansuit
	name = "kriosan fatigues"
	desc = "A tough, wear-resistant fatigues in brown colors. Typically worn underneath armor."
	icon_state = "germansuit_brown"
	item_state = "germansuit_brown"
