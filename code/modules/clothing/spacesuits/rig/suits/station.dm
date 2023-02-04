/obj/item/clothing/head/helmet/space/rig/industrial
	camera_networks = list(NETWORK_MINE)

/obj/item/clothing/head/helmet/space/rig/ce
	camera_networks = list(NETWORK_ENGINEERING)

/obj/item/clothing/head/helmet/space/rig/eva
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_ENGINEERING)

/obj/item/clothing/head/helmet/space/rig/hazmat
	light_overlay = "hardhat_light"
	camera_networks = list(NETWORK_RESEARCH)

/obj/item/clothing/head/helmet/space/rig/medical
	camera_networks = list(NETWORK_MEDICAL)

/obj/item/clothing/head/helmet/space/rig/hazard
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_SECURITY)

/obj/item/clothing/head/helmet/space/rig/techno
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_ENGINEERING)

/***************************************
	Industrial Suit: For Mining
****************************************/
/obj/item/rig/industrial
	name = "industrial suit control module"
	suit_type = "industrial hardsuit"
	desc = "A heavy, powerful rig used by construction crews and mining corporations."
	icon_state = "engineering_rig"
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	slowdown = 0.3
	drain = 3
	offline_slowdown = 10
	offline_vision_restriction = 2
	emp_protection = -20

	helm_type = /obj/item/clothing/head/helmet/space/rig/industrial

	extra_allowed = list(
		/obj/item/device/t_scanner,
		/obj/item/storage/bag/ore,
		/obj/item/tool/pickaxe,
		/obj/item/rcd
	)

	req_access = list()
	req_one_access = list()
	max_upgrades = 1

/obj/item/rig/industrial/equipped

	initial_modules = list(
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/cargo_clamp/large,
		/obj/item/rig_module/vision/meson
		)


/***************************************
	EVA Suit
****************************************/
/obj/item/rig/eva
	name = "EVA suit control module"
	suit_type = "EVA hardsuit"
	desc = "A light RIG for performing minute repairs and maintenance on low-pressure environments."
	icon_state = "eva_rig"
	armor_list = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	offline_slowdown = 1
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/eva

	extra_allowed = list(
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/rcd
	)

	max_upgrades = 1

	req_access = list()
	req_one_access = list()

/obj/item/rig/eva/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/cargo_clamp,
		/obj/item/rig_module/vision/meson
		)


/***************************************
Advanced Voidsuit: Guild Master
****************************************/
/obj/item/rig/ce
	name = "advanced hardsuit control module"
	suit_type = "advanced hardsuit"
	desc = "An advanced hardsuit that protects against hazardous, low pressure environments. Shines with a high polish."
	icon_state = "ce_rig"
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	stiffness = 0
	obscuration = 0
	drain = 2
	offline_slowdown = 0
	offline_vision_restriction = 0

	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

	helm_type = /obj/item/clothing/head/helmet/space/rig/ce
	glove_type = /obj/item/clothing/gloves/rig/ce
	boot_type = /obj/item/clothing/shoes/magboots/rig/ce

	extra_allowed = list(
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/rcd
	)

	max_upgrades = 1

	req_access = list(access_ce)
	req_one_access = list()

/obj/item/rig/ce/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/cargo_clamp,
		/obj/item/rig_module/storage
		)

/obj/item/clothing/gloves/rig/ce
	name = "insulated gloves"
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/ce
	name = "advanced magboots"
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	mag_slow = 1

/***************************************
Technomancer RIG
***************************************/
/obj/item/rig/techno
	name = "technomancer suit control module"
	suit_type = "technomancer RIG suit"
	desc = "An advanced RIG suit that protects against hazardous, low pressure and high temperature environments."
	icon_state = "techno_rig"
	armor_list = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 3
	offline_slowdown = 3
	offline_vision_restriction = 0

	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

	helm_type = /obj/item/clothing/head/helmet/space/rig/techno
	glove_type = /obj/item/clothing/gloves/rig/techno
	boot_type = /obj/item/clothing/shoes/magboots/rig/techno

	extra_allowed = list(
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/rcd
	)

	max_upgrades = 1

/obj/item/rig/techno/equipped
	initial_modules = list(
		/obj/item/rig_module/storage,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/cargo_clamp,
		)

/obj/item/clothing/gloves/rig/techno
	name = "insulated gloves"
	siemens_coefficient = 0


/obj/item/clothing/shoes/magboots/rig/techno
	name = "advanced magboots"
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	mag_slow = 1

/***************************************
	Hazmat: Chief Research Overseer
****************************************/
/obj/item/rig/hazmat
	name = "AMI control module"
	suit_type = "hazmat hardsuit"
	desc = "An Anomalous Material Interaction hardsuit that protects against the strangest energies the universe can throw at it."
	icon_state = "science_rig"
	armor_list = list(
		melee = 30,
		bullet = 20,
		energy = 40,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazmat

	extra_allowed = list(
		/obj/item/stack/flag,
		/obj/item/tool,
		/obj/item/device/scanner/health,
		/obj/item/device/measuring_tape,
		/obj/item/device/ano_scanner,
		/obj/item/device/depth_scanner,
		/obj/item/device/core_sampler,
		/obj/item/device/gps,
		/obj/item/device/beacon_locator,
		/obj/item/device/radio/beacon,
		/obj/item/storage/bag/fossils
	)
	max_upgrades = 1

	req_access = list()
	req_one_access = list()

/obj/item/rig/hazmat/equipped

	req_access = list(access_rd)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/storage
		)

/***************************************
	Adv Hazmat: Rnd/CRO
****************************************/
/obj/item/rig/advhazmat
	name = "Advanced AMI control module"
	suit_type = "advanced hazmat hardsuit"
	desc = "An Anomalous Material Interaction hardsuit that protects against the strangest energies the universe can throw at it. \
	This advanced verson is made with speed in mind as well better armor plates at the cost of power."
	icon_state = "science_ami_rig"
	armor_list = list(
		melee = 35,
		bullet = 30,
		energy = 40,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 0 //were light!
	drain = 35 //Costs in power
	offline_slowdown = 3 //You better be on
	offline_vision_restriction = 1
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTIC = 30, MATERIAL_GLASS = 10, MATERIAL_GOLD = 5, MATERIAL_SILVER = 5, MATERIAL_PLASMA = 10) //Costly!
	chest_type = /obj/item/clothing/suit/space/rig/advhazmat
	helm_type =  /obj/item/clothing/head/helmet/space/rig/advhazmat
	boot_type =  /obj/item/clothing/shoes/magboots/rig/advhazmat
	glove_type = /obj/item/clothing/gloves/rig/advhazmat

	extra_allowed = list(
		/obj/item/stack/flag,
		/obj/item/tool,
		/obj/item/device/scanner/health,
		/obj/item/device/measuring_tape,
		/obj/item/device/ano_scanner,
		/obj/item/device/depth_scanner,
		/obj/item/device/core_sampler,
		/obj/item/device/gps,
		/obj/item/device/beacon_locator,
		/obj/item/device/radio/beacon,
		/obj/item/storage/bag/fossils
	)
	max_upgrades = 1
	req_access = list()

/obj/item/clothing/suit/space/rig/advhazmat
	name = "Advanced AMI suit"

/obj/item/clothing/gloves/rig/advhazmat
	name = "Advanced AMI gloves"
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/advhazmat
	name = "Advanced AMI shoes"

/obj/item/clothing/head/helmet/space/rig/advhazmat
	name = "Advanced AMI void helm"

/***************************************
	Medical
****************************************/
/obj/item/rig/medical
	name = "rescue suit control module"
	suit_type = "rescue hardsuit"
	desc = "A relatively lightweight and durable RIG suit designed for medical rescue in hazardous locations."
	icon_state = "medical_rig"
	armor_list = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	offline_vision_restriction = 1
	stiffness = MEDIUM_STIFFNESS
	helm_type = /obj/item/clothing/head/helmet/space/rig/medical
	max_upgrades = 1
	extra_allowed = list(
		/obj/item/storage/firstaid,
		/obj/item/device/scanner/health,
		/obj/item/stack/medical,
		/obj/item/roller
	)

/obj/item/rig/medical/equipped
	req_access = list()
	req_one_access = list()

	initial_modules = list(
		/obj/item/rig_module/modular_injector/medical,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/storage
		)

/obj/item/rig/recovery_suit
	name = "recovery team suit control module"
	suit_type = "Recovery Team hardsuit"
	desc = "An upgraded hardsuit designed by the Soteria for their Recovery Team division. While not as heavily armored as a proper hardsuit, the inbuilt medical systems make it highly prized. \
	It is best suited for surviving and combating wild life, but has reasonably decent kevlar plating and impact pads to absorb bullets and energy blasts."
	icon_state = "response_team"
	armor_list = list(
		melee = 60,
		bullet = 35,
		energy = 25,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	stiffness = MEDIUM_STIFFNESS
	helm_type = /obj/item/clothing/head/helmet/space/rig/medical

	extra_allowed = list(
		/obj/item/storage/firstaid,
		/obj/item/device/scanner/health,
		/obj/item/stack/medical,
		/obj/item/roller
	)


/obj/item/rig/recovery_suit/equipped
	req_access = list()
	req_one_access = list()

	initial_modules = list(
		/obj/item/rig_module/modular_injector/combat,
		/obj/item/rig_module/modular_injector/medical,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/storage/expanded/tt
		)

/***************************************
	Hazard Suit
****************************************/
/obj/item/rig/hazard
	name = "hazard hardsuit control module"
	suit_type = "hazard hardsuit"
	desc = "A security hardsuit designed for prolonged EVA in dangerous environments."
	icon_state = "hazard_rig"
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 3.5
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazard
	max_upgrades = 1
	req_access = list()
	req_one_access = list()


/obj/item/rig/hazard/equipped
	initial_modules = list(
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/mounted/taser
		)
/obj/item/rig/hazard/steward
	name = "hazard hardsuit control module"
	suit_type = "hazard hardsuit"
	desc = "A modification of the traditional hazard rig built for equal parts utility and defense. Marked with a seal of two Armstrong rifles crossing each other in a X at the base of the neck."
	icon_state = "hazard_rig"
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 3.5
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazard
	max_upgrades = 1
	req_access = list(access_hop)
	req_one_access = list()


	initial_modules = list(
		/obj/item/rig_module/mounted/taser,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/modular_injector/medical,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/storage
		)
