/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/rig/combat
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor_list = list(
		melee = 12,
		bullet = 11,
		energy = 7,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	price_tag = 3500
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	ablative_armor = 8
	ablative_max = 8
	ablation = ABLATION_RESILIENT
	stiffness = 0
	obscuration = 0
	max_upgrades = 1
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat


/obj/item/rig/combat/equipped
	cell_type =  /obj/item/cell/large/moebius/nuclear
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/modular_injector/combat/preloaded
		)


//Ironhammer rig suit
/obj/item/rig/combat/ironhammer
	name = "security hardsuit control module"
	desc = "Standard operative suit issued to blackshield and marshal operatives alike. Provides balanced overall protection against various threats and widely used on planets surface, space stations or in open space."
	icon_state = "ihs_rig"
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	suit_type = "security hardsuit"

/obj/item/rig/combat/ironhammer/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/storage
		)

/obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	light_overlay = "sec_light"
	camera_networks = list(NETWORK_SECURITY)
//blacksheild
/obj/item/rig/combat/blackshield
	name = "Blackshield Ops control module"
	desc = "A Blackshield RIG module that has been tailored for CQC. Due to its plating, it's slightly bulkier than normal standard security hardsuits."
	icon_state = "blackshield_rig"
	suit_type = "blackshield hardsuit"
	armor_list = list(
		melee = 15,
		bullet = 13,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.5 //So we have a reason to not use it
	drain = 25
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 0 //60 armor no plating
	initial_modules = list(/obj/item/rig_module/maneuvering_jets) //junkfield recovery
	chest_type = /obj/item/clothing/suit/space/rig/combat/blackshield
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/blackshield
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/blackshield
	glove_type = /obj/item/clothing/gloves/rig/combat/blackshield

/obj/item/rig/combat/blackshield/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/clothing/suit/space/rig/combat/blackshield

/obj/item/clothing/gloves/rig/combat/blackshield

/obj/item/clothing/shoes/magboots/rig/combat/blackshield
/obj/item/clothing/head/helmet/space/rig/combat/blackshield
	desc = "A hazard hood modded to help against CQC combat."
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/knight
	name = "hussar hardsuit control module"
	desc = "A RIG module for a \"Hussar\" model hardsuit, jointly manufactured by Divisors and Numericals of the New Testament. \
	The Tau Cross shining brightly upon its shoulder, it offers moderate combat protection against many a type of threat to the Absolute."
	icon_state = "hussar_rig" //Rig modula by Gundam Tanaka#9565
	suit_type = "hussar hardsuit"
	armor_list = list(
		melee = 12,
		bullet = 11,
		energy = 7,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 1
	ablative_max = 5
	ablation = ABLATION_CERAMIC //lots of gold and filigree
	chest_type = /obj/item/clothing/suit/space/rig/combat/knight
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/knight
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/knight
	glove_type = /obj/item/clothing/gloves/rig/combat/knight

/obj/item/rig/combat/knight/equipped
	initial_modules = list(
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/held/shield
		)

/obj/item/clothing/suit/space/rig/combat/knight //Suit by Polyushko#0323

/obj/item/clothing/gloves/rig/combat/knight //Gloves by Gundam Tanaka#9565

/obj/item/clothing/shoes/magboots/rig/combat/knight //Boots by Gundam Tanaka#9565

/obj/item/clothing/head/helmet/space/rig/combat/knight //Helm by Polyushko#0323
	name = "full helm"
	desc = "One's spirit is generally the greatest shield."
	light_overlay = "helmet_light_dual"
	armor_list = list(
		melee = 12,
		bullet = 10,
		energy = 7,
		bomb = 50,
		bio = 100,
		rad = 100
	)

//sec-ert suit and weaker versions for CO + WO.
/obj/item/rig/combat/ert
	name = "tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. Despite its age, it still smells brand new."
	icon_state = "ert_rig"
	suit_type = "tactical armored hardsuit"
	req_access = list(access_hos)
	armor_list = list(
		melee = 12,
		bullet = 16,
		energy = 16,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	ablative_armor = 12
	ablative_max = 12
	ablation = ABLATION_EVERLASTING
	slowdown = 0.4 //Heavy ass armor. This isn't for rapid deployment. It is for slapping the shit out of a threat to the colony that has been foolish enough to stay in one place.
	drain = 12
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 0 //60 armor no plating
	initial_modules = list(/obj/item/rig_module/maneuvering_jets)
	chest_type = /obj/item/clothing/suit/space/rig/combat/ert
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/ert
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/ert
	glove_type = /obj/item/clothing/gloves/rig/combat/ert

/obj/item/rig/combat/ert/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/modular_injector/combat/preloaded,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/held/shield
		)

/obj/item/clothing/suit/space/rig/combat/ert

/obj/item/clothing/gloves/rig/combat/ert

/obj/item/clothing/shoes/magboots/rig/combat/ert

/obj/item/clothing/head/helmet/space/rig/combat/ert
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/ert/co
	name = "blackshield tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. This one appears to have been modified for CQB."
	req_access = list(access_hos)
	icon_state = "ert_rig"
	suit_type = "blackshield tactical hardsuit"
	armor_list = list(
		melee = 15,
		bullet = 13,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	ablative_armor = 8
	ablative_max = 8
	ablation = ABLATION_RESILIENT
	slowdown = 0.5 //Heavy ass armor. This isn't for rapid deployment. It is for slapping the shit out of a threat to the colony that has been foolish enough to stay in one place.
	drain = 25
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 0 //60 armor no plating
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ert/co
	initial_modules = list(/obj/item/rig_module/maneuvering_jets)

/obj/item/clothing/head/helmet/space/rig/combat/ert/co
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/ert/co/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/rig/combat/ert/co/wo //whaetever.
	name = "marshals tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. This one appears to have had some of its armor stripped and its servos upgraded.."
	icon_state = "ert_rig_wo"
	suit_type = "marshal tactical"
	req_access = list(access_hos)
	armor_list = list(
		melee = 12,
		bullet = 11,
		energy = 7,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	ablative_armor = 8
	ablative_max = 8
	ablation = ABLATION_RESILIENT
	stiffness = 0
	obscuration = 0
	max_upgrades = 1
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ert/co/wo

/obj/item/rig/combat/ert/co/wo/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/clothing/head/helmet/space/rig/combat/ert/co/wo
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/solfed //Suffice it to say this should NOT see extensive use and should be reserved for specific events, the nature of this equipment is that it should NOT fall into player hands.
	name = "MK.XXI 'Pathfinder' RIG"
	desc = "An incredibly rare and advanced RIG. Typically found in the hands of Solarian vanguard and special recon units, these suits strike fear into the hearts of colonial traitors the galaxy over for they signal\
	the coming wrath of Sol."
	icon_state = "military_rig"
	suit_type = "Pathfinder hardsuit advanced armored"
	armor_list = list(
		melee = 15,
		bullet = 17,
		energy = 17,
		bomb = 60,
		bio = 100,
		rad = 100
	)
	slowdown = -0.2 //super advanced hardsuit.
	drain = 2
	offline_slowdown = 4 // aalso fucking heavy.
	offline_vision_restriction = 1
	ablative_armor = 15
	ablative_max = 15
	ablation = ABLATION_EVERLASTING
	stiffness = 0
	obscuration = 0
	max_upgrades = 0
	initial_modules = list(/obj/item/rig_module/maneuvering_jets)
	chest_type = /obj/item/clothing/suit/space/rig/combat/solfed
	helm_type =  /obj/item/clothing/head/helmet/space/rig/combat/solfed
	boot_type =  /obj/item/clothing/shoes/magboots/rig/combat/solfed
	glove_type = /obj/item/clothing/gloves/rig/combat/solfed

/obj/item/rig/combat/solfed/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/storage,
		/obj/item/rig_module/stealth_field,
		/obj/item/rig_module/modular_injector/combat/preloaded,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/held/shield,
		/obj/item/rig_module/self_destruct
		)

/obj/item/clothing/suit/space/rig/combat/solfed

/obj/item/clothing/gloves/rig/combat/solfed

/obj/item/clothing/shoes/magboots/rig/combat/solfed

/obj/item/clothing/head/helmet/space/rig/combat/solfed
	camera_networks = null//list(NETWORK_SOYFED) //It is over general, I have depicted your murderous federation as the soyjack and my glorious homeland as the chad. To do, maybe actually set this up.
