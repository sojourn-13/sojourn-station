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

/obj/item/clothing/head/helmet/space/rig/cmo
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
	suit_type = "industrial hardsuit" //Credit for sprites go to Près de l'oiseau over at Eris
	desc = "A heavy, powerful rig used by construction crews and mining corporations. The soft plating can protect the wearer from unexpected hazards, but is not reliable in prolonged combat."
	icon_state = "engineering_rig"
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 2,
		bomb = 25,
		bio = 100,
		rad = 100
	)
	ablative_max = 14 //heavy ass suit, big ass armor.
	ablation = ABLATION_STANDARD
	slowdown = 0.3
	drain = 3
	offline_slowdown = 10
	offline_vision_restriction = 2
	emp_protection = -20
	price_tag = 1500

	helm_type = /obj/item/clothing/head/helmet/space/rig/industrial

	extra_allowed = list(
		/obj/item/device/t_scanner,
		/obj/item/storage/bag/ore,
		/obj/item/tool/pickaxe,
		/obj/item/rcd
	)

	req_access = null
	req_one_access = null
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
		melee = 5,
		bullet = 2,
		energy = 2,
		bomb = 10,
		bio = 100,
		rad = 100
	)
	seal_delay = 20
	ablative_max = 5 //common suit, not really much in the way of room for armor.
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

	req_access = null
	req_one_access = null

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
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	ablative_max = 10
	ablation = ABLATION_STANDARD
	seal_delay = 15
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
	req_one_access = null

/obj/item/rig/ce/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/cargo_clamp,
		/obj/item/rig_module/storage/large
		)

/obj/item/clothing/gloves/rig/ce
	name = "insulated gloves"
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/ce
	name = "magboots"
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	mag_slow = 0

/***************************************
Technomancer RIG
***************************************/
/obj/item/rig/techno
	name = "Artificers suit control module"
	suit_type = "Artificers RIG suit"
	desc = "An advanced RIG suit that protects against hazardous, low pressure and high temperature environments."
	icon_state = "techno_rig"
	armor_list = list(
		melee = 7,
		bullet = 7,
		energy = 7,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	ablative_max = 10
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
		/obj/item/rig_module/storage/engi,
		/obj/item/rig_module/power_sink,
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
	Hazmat: Anomalous
****************************************/
/obj/item/rig/hazmat
	name = "AMI control module"
	suit_type = "hazmat hardsuit"
	desc = "An Anomalous Material Interaction hardsuit that protects against the strangest energies the universe can throw at it."
	icon_state = "science_rig"
	armor_list = list(
		melee = 7,
		bullet = 5,
		energy = 10,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	ablative_max = 12
	ablation = ABLATION_DURABLE
	slowdown = 0.3
	drain = 3
	offline_vision_restriction = 1
	price_tag = 3000 //same as hazard suit, it is arguably better than that one because it has hella bomb armor.
	emp_protection = 50 // Good EMP resistance for anomaly work

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

	req_access = null
	req_one_access = null

/obj/item/rig/hazmat/equipped

	req_access = list(access_xenoarch)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/anomaly_scanner,
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
		melee = 8,
		bullet = 7,
		energy = 10,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 0 //were light!
	drain = 35 //Costs in power
	offline_slowdown = 3 //You better be on
	offline_vision_restriction = 1
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTIC = 30, MATERIAL_GLASS = 10, MATERIAL_GOLD = 5, MATERIAL_SILVER = 5, MATERIAL_PLASMA = 10) //Costly!
	emp_protection = 100 // Complete immunity to EMPs for advanced suit
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
	req_access = null

/obj/item/clothing/suit/space/rig/advhazmat

/obj/item/clothing/gloves/rig/advhazmat
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/advhazmat

/obj/item/clothing/head/helmet/space/rig/advhazmat
	camera_networks = list(NETWORK_RESEARCH)

/obj/item/rig/advhazmat/equipped
	req_access = list(access_xenoarch)
	initial_modules = list(
		/obj/item/rig_module/storage/large,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/anomaly_scanner
		)

/***************************************
	Medical
****************************************/
/obj/item/rig/medical
	name = "rescue suit control module"
	suit_type = "rescue hardsuit"
	desc = "A relatively lightweight and ceramic RIG suit designed for medical rescue in hazardous locations."
	icon_state = "medical_rig"
	armor_list = list(
		melee = 5,
		bullet = 2,
		energy = 2,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	ablative_max = 10
	ablation = ABLATION_CERAMIC
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
	req_access = null
	req_one_access = null

	initial_modules = list(
		/obj/item/rig_module/modular_injector/medical/preloaded,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/storage/med
		)

/obj/item/rig/recovery_suit
	name = "recovery team suit control module"
	suit_type = "Recovery Team hardsuit"
	desc = "An upgraded hardsuit designed by the Soteria for their Recovery Team division. While not as heavily armored as a proper hardsuit, the inbuilt medical systems make it highly prized. \
	It is best suited for surviving and combating wild life, but has reasonably decent kevlar plating and impact pads to absorb bullets and energy blasts."
	icon_state = "response_team"
	armor_list = list(
		melee = 10,
		bullet = 8,
		energy = 6,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	seal_delay = 15 //quick deploy for quick recovery
	slowdown = 0.25
	stiffness = MEDIUM_STIFFNESS
	helm_type = /obj/item/clothing/head/helmet/space/rig/medical

	extra_allowed = list(
		/obj/item/storage/firstaid,
		/obj/item/device/scanner/health,
		/obj/item/stack/medical,
		/obj/item/roller
	)


/obj/item/rig/recovery_suit/equipped
	req_access = null
	req_one_access = null

	initial_modules = list(
		/obj/item/rig_module/modular_injector/medical/preloaded,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/storage/large
		)

/obj/item/rig/cmo
	name = "SI 'Medtek' control module"
	suit_type = "SI 'Medtek"
	desc = "An upgraded and updated Soteria 'Retainer' RIGsuit made for field surgery in dangerous locations, this suit has undergone a series of upgrades to improve its utility \
	for Soteria's resident overworked Chief Biolab Overseer.  Improved servos are paired with neural-mnemonic sensors allowing the user unmatched speed and dexterity- one can easily forget that they are even wearing the suit."
	icon_state = "cmo_rig"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 100,
		rad = 100
	)
	req_access = list(access_cmo)
	seal_delay = 4 //built for speed
	slowdown = -0.5 //we get a bit more speed than the baseline recovery rig as this is a unique item with exactly 0 armor. This is for zipping around medical, rather than getting in the weeds
	ablative_armor = 0
	ablative_max = 0 //no armor, none.
	helm_type = /obj/item/clothing/head/helmet/space/rig/cmo
	max_upgrades = 1
	initial_modules = list(
		/obj/item/rig_module/modular_injector/combat/preloaded,
		/obj/item/rig_module/modular_injector/medical/preloaded,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/storage/large
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
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	price_tag = 3000
	ablative_max = 8
	ablation = ABLATION_DURABLE // Lasts longer than most rigs
	slowdown = 0.3
	drain = 3.5
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazard
	max_upgrades = 1
	req_access = null
	req_one_access = null


/obj/item/rig/hazard/equipped
	initial_modules = list(
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/mounted/taser
		)
/obj/item/rig/hazard/steward
	name = "stewards hardsuit control module"
	desc = "A modification of the traditional combat rig built for equal parts utility and defense. Marked with a seal of two Armstrong rifles crossing each other in a X at the base of the neck."
	icon_state = "security_rig"
	suit_type = "stewards hardsuit"
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 10,
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
	req_one_access = null


	initial_modules = list(
		/obj/item/rig_module/mounted/taser,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/modular_injector/medical/preloaded,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/storage/large
		)


/***************************************
	MU66 Suit
****************************************/
/obj/item/rig/sea
	name = "S-170 Atmos suit"
	suit_type = "S-170 Soft-suit"
	desc = "A light RIG for performing minute repairs and maintenance in atypical atmospheres."
	icon_state = "sea_rig"
	armor_list = list(
		melee = 6,
		bullet = 7,
		energy = 5,
		bomb = 10,
		bio = 100,
		rad = 100
	)
	seal_delay = 20
	ablative_max = 10
	ablation = ABLATION_DURABLE
	slowdown = 0
	offline_slowdown = 1
	offline_vision_restriction = 1
	removable_cell = TRUE
	cell_type =  /obj/item/cell/large
	air_type =   /obj/item/tank/oxygen
	suitable_cell = /obj/item/cell/large

	extra_allowed = list(
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/rcd
	)

	max_upgrades = 1

	req_access = list()
	req_one_access = list()

/obj/item/rig/sea/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/vision/meson
		)
