/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/rig/combat
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor = list(
		melee = 50,
		bullet = 45,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/combat


/obj/item/rig/combat/equipped
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

/obj/item/rig/combat/ironhammer
	name = "security hardsuit control module"
	desc = "Standard operative suit issued to blackshield and marshal operatives alike. Provides balanced overall protection against various threats and widely used on planets surface, space stations or in open space."
	icon_state = "ihs_rig"
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	suit_type = "ironhammer hardsuit"

/obj/item/rig/combat/ironhammer/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/storage
		)
//blacksheild
/obj/item/rig/combat/blackshield
	name = "Blackshield Ops control module"
	desc = "A Blackshield RIG module that has been tailored for CQC. Due to its plating, it's slightly bulkier than normal standard security hardsuits."
	icon_state = "blackshield_rig"
	suit_type = "light suit"
	armor = list(
		melee = 60,
		bullet = 55,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	slowdown = 0.5 //So we have a reason to not use it
	drain = 25
	offline_slowdown = 3
	offline_vision_restriction = 1

	chest_type = /obj/item/clothing/suit/space/rig/combat/blackshield
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/blackshield
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/blackshield
	glove_type = /obj/item/clothing/gloves/rig/combat/blackshield

/obj/item/rig/combat/blackshield/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/clothing/suit/space/rig/combat/blackshield
	name = "blackshield hazard suit"

/obj/item/clothing/gloves/rig/combat/blackshield
	name = "blackshield hazard gloves"

/obj/item/clothing/shoes/magboots/rig/combat/blackshield
	name = "blackshield hazard shoes"

/obj/item/clothing/head/helmet/space/rig/combat/blackshield
	name = "blackshield hazard hood"
	desc = "A hazard hood modded to help against CQC combat."
	armor = list(
		melee = 65,
		bullet = 55,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
