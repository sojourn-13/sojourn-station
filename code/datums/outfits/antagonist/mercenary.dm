/decl/hierarchy/outfit/antagonist/mercenary

	hierarchy_type = /decl/hierarchy/outfit/antagonist/mercenary

	uniform = /obj/item/clothing/under/turtleneck
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/magboots/merc
	pda_slot = slot_belt
	pda_type = /obj/item/modular_computer/pda

//The outfit that mercs spawn in. They get their armor and weapons from the merc base
/decl/hierarchy/outfit/antagonist/mercenary/casual
	name = "Serbian Mercenary fatigues"


//He gets a snazzy beret
/decl/hierarchy/outfit/antagonist/mercenary/commander
	name = "Serbian Mercenary Commander"
	head = /obj/item/clothing/head/rank/commander/beret

//This outfit is just for admin fun. Spawns them fully equipped
//Actual mercs equip themselves by picking up their armor from their base
/decl/hierarchy/outfit/antagonist/mercenary/equipped
	name = "Serbian Mercenary combat gear"

	suit = /obj/item/clothing/suit/space/void/SCAF
	suit_store = /obj/item/weapon/tank/jetpack/oxygen
	back = /obj/item/weapon/storage/backpack/military

/decl/hierarchy/outfit/antagonist/mercenary/excelsior
	name = "excelsior fatigues"
	uniform = /obj/item/clothing/under/excelsior/mixed

/decl/hierarchy/outfit/antagonist/mercenary/excelsior/equipped
	name = "excelsior combat gear"
	uniform = /obj/item/clothing/under/excelsior
	suit = /obj/item/clothing/suit/space/void/excelsior
	back = /obj/item/weapon/storage/backpack/military

/obj/item/clothing/under/kriosansuit
	name = "kriosan fatigues"
	desc = "A tough, wear-resistant fatigues in brown colors. Typically worn underneath armor."
	icon_state = "germansuit_brown"
	item_state = "germansuit_brown"
