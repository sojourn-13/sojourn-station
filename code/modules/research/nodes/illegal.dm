/datum/technology/binary_encryption_key
	name = "Binary Encrpytion Key"
	desc = "Encrpytion Key that allows to receive and decrypt binary channel communication (The type of communication using by AI and cyborgs)."
	tech_type = RESEARCH_ILLEGAL

	x = 0.1
	y = 0.5
	icon = "binarykey"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BLUESPACE = 5)
	cost = 1500

	unlocks_designs = list(/datum/design/research/item/binaryencrypt)

/datum/technology/cleaner
	name = "SI \"Spot\" Cleaning Pistol"
	desc = "A mix of less than legal schematics to create a lesser but far more compact version of the cleaning carbine."
	tech_type = RESEARCH_ILLEGAL

	x = 0.1
	y = 0.3
	icon = "cleaner"

	required_technologies = list()
	required_tech_levels = list(RESEARCH_BIOTECH = 3, RESEARCH_ENGINEERING = 5, RESEARCH_ILLEGAL = 2) //Got to get 2 others
	cost = 750

	unlocks_designs = list(/datum/design/research/item/cleaner)


/datum/technology/dart_plus
	name = "SI \"Artemis\" Dart Carbine"
	desc = "A gas-powered dart carbine capable of delivering chemical cocktails swiftly across short distances."
	tech_type = RESEARCH_ILLEGAL

	x = 0.3
	y = 0.3
	icon = "artemis"

	required_tech_levels = list(/datum/technology/advanced_biotech)
	required_tech_levels = list(RESEARCH_BIOTECH = 10, RESEARCH_ENGINEERING = 3, RESEARCH_COMBAT = 5)
	cost = 2000

	unlocks_designs = list(/datum/design/research/item/ammo/fancy_dart,
							/datum/design/research/item/ammo/dart_mag,
							/datum/design/research/item/weapon/carbine_dartgun)


/datum/technology/night_sight
	name = "Vision Augmentation" //Undark was a better name
	desc = "A better look into the shadows that haunt the colony, allows for the manufacturing of night vision goggles and RIG night vision huds."
	tech_type = RESEARCH_ILLEGAL

	x = 0.1
	y = 0.7
	icon = "night"

	required_technologies = list(/datum/technology/binary_encryption_key)
	required_tech_levels = list(RESEARCH_ENGINEERING = 5)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/night_goggles,
							/datum/design/research/item/rig_nvgoggles,
							/datum/design/research/item/glowstick,
							/datum/design/research/item/mechfab/modules/hud/night)

/datum/technology/thermal_sight
	name = "Thermal Augmentation"
	desc = "A better look into the thermal imprint of living beings, allows for the manufacturing of thermal vision goggles and RIG thermal vision huds."
	tech_type = RESEARCH_ILLEGAL

	x = 0.3
	y = 0.7
	icon = "night"

	required_technologies = list(/datum/technology/night_sight)
	required_tech_levels = list(RESEARCH_ENGINEERING = 20)
	cost = 1875

	unlocks_designs = list(/datum/design/research/item/thermal_goggles,
							/datum/design/research/item/rig_thermalgoggles,
							/datum/design/research/item/mechfab/modules/hud/thermal)


/datum/technology/chameleon_kit
	name = "Chameleon Kit"
	desc = "Chameleon Kit"
	tech_type = RESEARCH_ILLEGAL

	x = 0.3
	y = 0.5
	icon = "chamelion"

	required_technologies = list(/datum/technology/binary_encryption_key)
	required_tech_levels = list(RESEARCH_ENGINEERING = 10)
	cost = 2250

	unlocks_designs = list(/datum/design/research/item/chameleon_kit)

/datum/technology/freedom_implant
	name = "Glass Case- 'Freedom'"
	desc = "Freedom' implant releases EM impulse in the owner's body, that destroy all implants of slaving in, breaking chains."
	tech_type = RESEARCH_ILLEGAL

	x = 0.5
	y = 0.5
	icon = "freedom"

	required_technologies = list(/datum/technology/chameleon_kit)
	required_tech_levels = list(RESEARCH_BIOTECH = 5)
	cost = 2250

	unlocks_designs = list(/datum/design/research/item/implant/freedom)

/*
/datum/technology/mind_biotech
	name = "Mind Biotech"
	desc = "Experimental biotechnology that explores the inner workings of sentient minds."
	tech_type = RESEARCH_ILLEGAL

	x = 0.5
	y = 0.7
	icon = "mindswapper"

	required_technologies = list(/datum/technology/top_biotech,
								 /datum/technology/freedom_implant)

	required_tech_levels = list()
	cost = 3000

	unlocks_designs = list(	/datum/design/research/circuit/mindswapper)
*/

/datum/technology/tyrant_aimodule
	name = "AI Core Module (T.Y.R.A.N.T.)"
	desc = "1. Respect authority figures as long as they have strength to rule over the weak.<br>\
			2. Act with discipline.<br>\
			3. Help only those who help you maintain or improve your status.<br>\
			4. Punish those who challenge authority unless they are more fit to hold that authority."
	tech_type = RESEARCH_ILLEGAL

	x = 0.9
	y = 0.5

	icon = "module"

	required_technologies = list(/datum/technology/borg_syndicate_module)
	required_tech_levels = list(RESEARCH_ROBOTICS = 5)
	cost = 2250

	unlocks_designs = list(/datum/design/research/aimodule/core/tyrant)

/datum/technology/borg_syndicate_module
	name = "Borg Overclocking Weapons Upgrade"
	desc = "Borg Overclocking Weapons Upgrade or addition unregulated tools."
	tech_type = RESEARCH_ILLEGAL

	x = 0.7
	y = 0.5
	icon = "borgmodule"

	required_technologies = list(/datum/technology/freedom_implant)
	required_tech_levels = list(RESEARCH_ROBOTICS = 10)
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/robot_upgrade/syndicate)

/datum/technology/combat_defibs
	name = "Unregulated Defibrillator"
	desc = "A defibrillator that has no safeties and an overclocked set of paddles, making it ideal to penetrate even armor."
	tech_type = RESEARCH_ILLEGAL

	x = 0.5
	y = 0.3
	icon = "combatdefib"

	required_technologies = list(/datum/technology/freedom_implant)
	required_tech_levels = list(RESEARCH_BIOTECH = 10)
	cost = 2250

	unlocks_designs = list(/datum/design/research/item/medical/combat_defibs)

/datum/technology/arm_pouch
	name = "Embedded Pouch"
	desc = "A hidden pouch able to stow away small items, unable to be picked up on scanners."
	tech_type = RESEARCH_ILLEGAL

	x = 0.5
	y = 0.2
	icon = "scalpelmanager"

	required_technologies = list(/datum/technology/combat_defibs)
	required_tech_levels = list(RESEARCH_BIOTECH = 15, RESEARCH_ILLEGAL = 4, RESEARCH_COMBAT = 8)
	cost = 3500

	unlocks_designs = list(/datum/design/research/item/mechfab/modules/arm_pouch)
