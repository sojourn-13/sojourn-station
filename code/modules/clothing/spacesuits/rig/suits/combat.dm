/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/weapon/rig/combat
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor = list(
		melee = 60,
		bullet = 55,
		energy = 50,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	slowdown = 1.35
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/combat


/obj/item/weapon/rig/combat/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat
		)


//Ironhammer rig suit
/obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	light_overlay = "sec_light"

/obj/item/weapon/rig/combat/ironhammer
	name = "security hardsuit control module"
	desc = "Andvanced by Soteris and Guild operative suit issued to blackshield and marshal operatives alike. Provides balanced overall protection against various threats and widely used on planets surface, space stations or in open space."
	icon_state = "ihs_rig"
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	suit_type = "ironhammer hardsuit"
	armor = list(
		melee = 65,
		bullet = 70,
		energy = 65,
		bomb = 75,
		bio = 100,
		rad = 100
	)
	slowdown = 0.75
	drain = 4
	offline_slowdown = 1
	offline_vision_restriction = 1

	glove_type = /obj/item/clothing/gloves/rig/combat

/obj/item/weapon/rig/combat/ironhammer/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/mounted/taser,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/autodoc,
		/obj/item/rig_module/voice
		)

/obj/item/clothing/gloves/rig/combat
	name = "combat insulated gloves"
	siemens_coefficient = 0