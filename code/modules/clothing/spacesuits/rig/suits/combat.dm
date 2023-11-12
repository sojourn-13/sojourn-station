/obj/item/clothing/head/helmet/space/rig/combat
	light_overlay = "helmet_light_dual_green"

/obj/item/rig/combat
	name = "combat hardsuit control module"
	desc = "A sleek and dangerous hardsuit for active combat."
	icon_state = "security_rig"
	suit_type = "combat hardsuit"
	armor_list = list(
		melee = 50,
		bullet = 45,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	stiffness = 0
	obscuration = 0
	max_upgrades = 1
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat


/obj/item/rig/combat/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/modular_injector/combat
		)


//Ironhammer rig suit
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
		/obj/item/rig_module/storage/combat
		)

/obj/item/clothing/head/helmet/space/rig/combat/ironhammer
	light_overlay = "sec_light"
	camera_networks = list(NETWORK_SECURITY)
//blacksheild
/obj/item/rig/combat/blackshield
	name = "Blackshield Ops control module"
	desc = "A Blackshield RIG module that has been tailored for CQC. Due to its plating, it's slightly bulkier than normal standard security hardsuits."
	icon_state = "blackshield_rig"
	suit_type = "light suit"
	armor_list = list(
		melee = 60,
		bullet = 55,
		energy = 40,
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
		/obj/item/rig_module/storage/combat,
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
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/knight
	name = "hussar hardsuit control module"
	desc = "A RIG module for a \"Hussar\" model hardsuit, jointly manufactured by Divisors and Numericals of the New Testament. \
	The Tau Cross shining brightly upon its shoulder, it offers moderate combat protection against many a type of threat to the Absolute."
	icon_state = "hussar_rig" //Rig modula by Gundam Tanaka#9565
	suit_type = "hussar rig"
	armor_list = list(
		melee = 50,
		bullet = 45,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 1
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
	name = "hussar hardsuit breastplate"

/obj/item/clothing/gloves/rig/combat/knight //Gloves by Gundam Tanaka#9565
	name = "hussar hardsuit gauntlets"

/obj/item/clothing/shoes/magboots/rig/combat/knight //Boots by Gundam Tanaka#9565
	name = "hussar hardsuit greaves"

/obj/item/clothing/head/helmet/space/rig/combat/knight //Helm by Polyushko#0323
	name = "hussar hardsuit full helm"
	desc = "One's spirit is generally the greatest shield."
	light_overlay = "helmet_light_dual"
	armor_list = list(
		melee = 50,
		bullet = 40,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)

//sec-ert suit and weaker versions for CO + WO.
/obj/item/rig/combat/ert
	name = "tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. Despite its age, it still smells brand new."
	icon_state = "ert_rig"
	suit_type = "combat hardsuit"
	req_access = list(access_hos)
	armor_list = list(
		melee = 50,
		bullet = 65,
		energy = 65,
		bomb = 50,
		bio = 100,
		rad = 100
	)
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
		/obj/item/rig_module/modular_injector/combat,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/held/shield
		)

/obj/item/clothing/suit/space/rig/combat/ert
	name = "tactical armored hardsuit"

/obj/item/clothing/gloves/rig/combat/ert
	name = "tactical armored gloves"

/obj/item/clothing/shoes/magboots/rig/combat/ert
	name = "tactical armored shoes"

/obj/item/clothing/head/helmet/space/rig/combat/ert
	name = "tactical armored helmet"
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/ert/co
	name = "blackshield tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. This one appears to have been modified for CQB."
	req_access = list(access_hos)
	icon_state = "ert_rig"
	suit_type = "combat hardsuit"
	armor_list = list(
		melee = 60,
		bullet = 55,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.5 //Heavy ass armor. This isn't for rapid deployment. It is for slapping the shit out of a threat to the colony that has been foolish enough to stay in one place.
	drain = 25
	offline_slowdown = 3
	offline_vision_restriction = 1
	max_upgrades = 0 //60 armor no plating
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ert/co
	initial_modules = list(/obj/item/rig_module/maneuvering_jets)

/obj/item/clothing/head/helmet/space/rig/combat/ert/co
	name = "tactical armored helmet"
	camera_networks = list(NETWORK_SECURITY)

/obj/item/rig/combat/ert/co/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage/combat,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/rig/combat/ert/co/wo //whaetever.
	name = "marshals tactical hardsuit control module"
	desc = "A heavy duty RIG that any true sons and daughters of Sol(or terrorist, for that matter.) would instantly recognize as a slightly older style of tactical armor, often issued by system defense fleets for anti-piracy operations. This one appears to have had some of its armor stripped and its servos upgraded.."
	icon_state = "ert_rig_wo"
	req_access = list(access_hos)
	armor_list = list(
		melee = 50,
		bullet = 45,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.3
	drain = 4
	offline_slowdown = 3
	offline_vision_restriction = 1
	stiffness = 0
	obscuration = 0
	max_upgrades = 1
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/ert/co/wo

/obj/item/rig/combat/ert/co/wo/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted,
		/obj/item/rig_module/storage/combat,
		/obj/item/rig_module/device/flash,
		/obj/item/rig_module/mounted/egun,
		/obj/item/rig_module/vision/sechud
		)

/obj/item/clothing/head/helmet/space/rig/combat/ert/co/wo
	name = "tactical armored helmet"
	camera_networks = list(NETWORK_SECURITY)