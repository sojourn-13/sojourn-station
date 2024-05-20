/obj/item/clothing/head/helmet/space/void/excelsior
	name = "Excelsior helmet"
	desc = "A deceptively well armored space helmet. Ancient design, but advanced manufacturing."
	icon_state = "cosmo"
	item_state = "cosmo"
	psi_blocking = 10

	//The excelsior armors cost small amounts of rare materials that they can teleport in.
	//This means they can either build up materials over time, or make it go faster by scavenging rare mats
	//The general focus of the low ish armor stat is that they should rely more on their tools than strait up combat. They got the toys(shields/turrets/traps) to take the hits for 'em afterall
	matter = list(
		MATERIAL_PLASTIC = 5,
		MATERIAL_GLASS = 10,
		MATERIAL_PLASTEEL = 25,
		MATERIAL_GOLD = 10,
		MATERIAL_SILVER = 10
	)

	armor_list = list(
		melee = 11, // Excel Not made for Close range combat, Melee armor reflects this
		bullet = 13,
		energy = 17,
		bomb = 80,
		bio = 90,
		rad = 25
	)
	siemens_coefficient = 0 //Shockproof!
	species_restricted = list("Human")
	//camera_networks = list(NETWORK_EXCELSIOR) //Todo future: Excelsior camera network and monitoring console
	light_overlay = "helmet_light_green"

/obj/item/clothing/suit/space/void/excelsior
	name = "Excelsior armor"
	desc = "An ancient space suit design, remade with advanced materials. Provides good protection, especially against energy discharges."
	icon_state = "soviet_skaf"
	item_state = "soviet_skaf"
	slowdown = 0.8
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL
	w_class = ITEM_SIZE_NORMAL
	//Decent all around, but less ballistic resistance
	stiffness = MEDIUM_STIFFNESS
	armor_list = list(
		melee = 11, // Excel Not made for Close range combat, Melee armor reflects this
		bullet = 13,
		energy = 17,
		bomb = 80,
		bio = 90,
		rad = 25
	)
	siemens_coefficient = 0 //Shockproof!
	matter = list(
		MATERIAL_PLASTIC = 10,
		MATERIAL_STEEL = 20,
		MATERIAL_PLASTEEL = 50,
		MATERIAL_GOLD = 20,
		MATERIAL_SILVER = 20
	)
	helmet = /obj/item/clothing/head/helmet/space/void/excelsior


/obj/item/clothing/suit/space/void/excelsior/progenitor //non excelsior branded and slightly lower armor, but less slowdown. A decent suit of armor, BUT you still look like a commie so be careful!
	name = "Cosmonaught armor"
	desc = "An ancient space suit design. Provides good protection, especially against energy discharges. This one appears to be an older, less advanced model that is notably free of techno-communist corruption."
	slowdown = 0.6 //slightly less slowdown, slightly less armor.
	armor_list = list(
		melee = 10,
		bullet = 12,
		energy = 15,
		bomb = 70,
		bio = 90,
		rad = 25
	)
	matter = list(
		MATERIAL_PLASTIC = 20,
		MATERIAL_STEEL = 20,
		MATERIAL_PLASTEEL = 10,
		MATERIAL_GOLD = 5,
		MATERIAL_SILVER = 5
	)
	helmet = /obj/item/clothing/head/helmet/space/void/excelsior/progenitor

/obj/item/clothing/head/helmet/space/void/excelsior/progenitor
	name = "Cosmonaught helmet"
	desc = "A deceptively well armored space helmet. An ancient design and the likely progenitor to the Excelsior brand."
	matter = list(
		MATERIAL_PLASTIC = 10,
		MATERIAL_GLASS = 10,
		MATERIAL_PLASTEEL = 5,
		MATERIAL_GOLD = 3,
		MATERIAL_SILVER = 3
	)

	armor_list = list(
		melee = 10,
		bullet = 12,
		energy = 15,
		bomb = 70,
		bio = 90,
		rad = 25
	)
