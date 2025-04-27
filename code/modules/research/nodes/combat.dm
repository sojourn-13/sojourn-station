/datum/technology/basic_combat
	name = "Basic Combat Systems"
	desc = "Basic combat systems and integration of security database HUD in glasses. As well as a low power pistol"
	tech_type = RESEARCH_COMBAT

	x = 0.1
	y = 0.5
	icon = "stunbaton"

	required_technologies = list()
	required_tech_levels = list()
	cost = 0

	unlocks_designs = list(/datum/design/research/item/clothing/security,
							/datum/design/research/item/weapon/clarissa,
							/datum/design/research/item/ammo/pistol/empty)

// TO ADD: synth flashes?
/datum/technology/basic_nonlethal
	name = "Basic Non-Lethal"
	desc = "Basic Non-Lethal"
	tech_type = RESEARCH_COMBAT

	x = 0.3
	y = 0.5
	icon = "flash"

	required_technologies = list(/datum/technology/basic_combat)
	required_tech_levels = list()
	cost = 375

	unlocks_designs = list(/datum/design/research/item/flash,
						   /datum/design/research/item/weapon/weapon_upgrade/auto_eject_no_removal,
						   /datum/design/research/item/ammo/pistol/rubber)



/datum/technology/weapon_recharging //You know... Its really not logical that this is even here...
	name = "Weapon Recharging"
	desc = "Weapon Recharging"
	tech_type = RESEARCH_COMBAT

	x = 0.5
	y = 0.5
	icon = "recharger"

	required_technologies = list(
								/datum/technology/basic_combat
								)
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(
							/datum/design/research/circuit/recharger
							///datum/design/research/item/hand_charger //Not yet
							)

/datum/technology/weapon_sonic
	name = "Sonic Weaponry And Defence"
	desc = "The advanced sonic crystal destoryer and a shield wall of same calibration"
	tech_type = RESEARCH_COMBAT

	x = 0.5
	y = 0.7
	icon = "sonic"

	required_technologies = list(
								/datum/technology/weapon_recharging
								)
	required_tech_levels = list()
	cost = 1000 //cheap

	unlocks_designs = list(
							/datum/design/research/item/weapon/sonic_gun,
							/datum/design/research/item/mecha/weapon/sonic,
							/datum/design/research/circuit/ameridianshieldwallgen
							)


/datum/technology/advanced_nonlethal
	name = "Advanced Non-Lethal"
	desc = "Electrical-shock weapon and ammo."
	tech_type = RESEARCH_COMBAT

	x = 0.5
	y = 0.3
	icon = "stunrevolver"

	required_technologies = list(/datum/technology/weapon_recharging)
	required_tech_levels = list()
	cost = 1125

	unlocks_designs = list(	/datum/design/research/item/weapon/stunrevolver,
							/datum/design/research/item/ammo/shotgun_stun
						)

/datum/technology/sst
	name = "Soteria Surface Tenstion Project"
	desc = "The development of non-lethal weapons for Soteria Medical using GP technology."
	x = 0.6
	y = 0.3
	tech_type = RESEARCH_COMBAT
	icon = "abnegate"
	required_technologies = list(/datum/technology/advanced_nonlethal)
	required_tech_levels = list(RESEARCH_GREYSON = 3) //Likely people will get parts/cog/bots for this
	cost = 5625
	unlocks_designs = list(
	/datum/design/research/item/greyson/abnegate,
	/datum/design/research/item/greyson/formatbound,
	/datum/design/research/item/greyson/humility,
	/datum/design/research/item/greyson/systemcost
                    )

/datum/technology/hardsuit_nonlethal
	name = "Mounted Non-Lethal"
	desc = "Electrical-shock weapon for hardsuits."
	tech_type = RESEARCH_COMBAT

	x = 0.3
	y = 0.3
	icon = "rigtaser"

	required_technologies = list(/datum/technology/advanced_nonlethal)
	required_tech_levels = list()
	cost = 3375

	unlocks_designs = list(	/datum/design/research/item/rig_grenade_launcher,
							/datum/design/research/item/rig_flash,
							/datum/design/research/item/tasermount
						)

/*/datum/technology/sec_computers
	name = "Security Computers"
	desc = "Security Computers"
	tech_type = RESEARCH_COMBAT

	x = 0.2
	y = 0.6
	icon = "seccomputer"

	required_technologies = list(/datum/technology/basic_combat)
	required_tech_levels = list()
	cost = 500

	unlocks_designs = list(/datum/design/research/circuit/secdata, /datum/design/research/circuit/prisonmanage)*/

/datum/technology/basic_lethal
	name = "Basic Lethal Weapons"
	desc = "Chemical grenades with anti-acid coating inside and new laser based ammo."
	tech_type = RESEARCH_COMBAT

	x = 0.6
	y = 0.5
	icon = "ammobox"

	required_technologies = list(/datum/technology/weapon_recharging)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(/datum/design/research/item/weapon/large_grenade,
							/datum/design/research/item/ammo/pistol,
							/datum/design/research/item/ammo/smg_mag,
							/datum/design/research/item/ammo/smg_mag/laser,
							/datum/design/research/item/ammo/pistol_laser,
							/datum/design/research/item/ammo/pistol/empty/laser,
							/datum/design/research/item/ammo/magum_laser,
							/datum/design/research/item/robot_upgrade/bigknife,
							/datum/design/research/item/weapon/slimebaton
							)

/datum/technology/exotic_weaponry
	name = "Experimental Weaponry"
	desc = "Remote temperature controlling weapon, implants and advanced shields."
	tech_type = RESEARCH_COMBAT

	x = 0.7
	y = 0.3
	icon = "tempgun"

	required_technologies = list(/datum/technology/basic_lethal)
	required_tech_levels = list()
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/weapon/temp_gun,
							/datum/design/research/item/weapon/slimegun,
							/datum/design/research/item/ammo/shotgun_fire,
							/datum/design/research/item/ammo/shotgun_laser,
							/datum/design/research/item/weapon/bastion,
							/datum/design/research/item/mechfab/modules/punch_helper,
							/datum/design/research/item/mechfab/modules/momentum_speed_adder
							)

/datum/technology/adv_exotic_weaponry
	name = "Advanced Experimental Weaponry"
	desc = "Specisl weapon system using plasma as catalyst. Special weapon core prototipe that deal DNA damage to target."
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.3
	icon = "teslagun"

	required_technologies = list(/datum/technology/exotic_weaponry)
	required_tech_levels = list()
	cost = 3750

	unlocks_designs = list(	/datum/design/research/item/weapon/centurio,
							/datum/design/research/item/weapon/auretian
						)


/datum/technology/adv_lethal
	name = "Advanced Lethal Weapons"
	desc = "Improvements on already lethal weapons to be a more advanced version of itself."
	tech_type = RESEARCH_COMBAT

	x = 0.7
	y = 0.7
	icon = "submachinegun"

	required_technologies = list(/datum/technology/basic_lethal)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/weapon/c20r,
							/datum/design/research/item/ammo/smg_mag/lethal,
							/datum/design/research/item/ammo/smg_mag/rubber,
							/datum/design/research/item/ammo/laser/box,
							//datum/design/research/item/ammo/laser/box/ap,
							//datum/design/research/item/ammo/laser/box/lethal,
							/datum/design/research/item/weapon/starstriker,
							/datum/design/research/item/weapon/katana,
							/datum/design/research/item/ammo/rifle_75,
							/datum/design/research/item/ammo/light_rifle_257,
							/datum/design/research/item/ammo/kurz_laser)

/datum/technology/exotic_gunmods
	name = "Experimental Gunmods"
	desc = "Experimental gunmods that can grant a wide variety of effects. Use at your own risks."
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.6
	icon = "toxincoater"

	required_technologies = list(/datum/technology/adv_lethal)
	required_tech_levels = list()
	cost = 1500

	unlocks_designs = list(
							/datum/design/research/item/weapon/weapon_upgrade/battery_shunt,
							/datum/design/research/item/weapon/weapon_upgrade/overdrive,
							/datum/design/research/item/weapon/weapon_upgrade/toxin_coater,
							/datum/design/research/item/weapon/weapon_upgrade/overheat,
							/datum/design/research/item/weapon/weapon_upgrade/penetrator,
							/datum/design/research/item/weapon/weapon_upgrade/dnalock_mod
							//datum/design/research/item/weapon/weapon_upgrade/isotope_diffuser,
							//datum/design/research/item/weapon/weapon_upgrade/psionic_catalyst
						)

/datum/technology/laser_weaponry
	name = "Laser Weaponry"
	desc = "Laser Weaponry"
	tech_type = RESEARCH_COMBAT

	x = 0.9
	y = 0.5
	icon = "gun"

	required_technologies = list(/datum/technology/adv_lethal, /datum/technology/adv_exotic_weaponry)
	required_tech_levels = list()
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/weapon/nuclear_gun,
							/datum/design/research/item/weapon/lasercannon,
							/datum/design/research/item/ammo/heavy_rifle_408,
							/datum/design/research/item/ammo/laser_mag,
							/datum/design/research/item/weapon/laser_ak,
							/datum/design/research/item/weapon/centauri
							)

/datum/technology/riglaser_weaponry
	name = "Hardsuit Laser Weaponry"
	desc = "Hardsuit Laser Weaponry"
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.5
	icon = "riglethals"

	required_technologies = list(/datum/technology/laser_weaponry)
	required_tech_levels = list()
	cost = 5625

	unlocks_designs = list(/datum/design/research/item/lasercannon, /datum/design/research/item/lasermount)

//Armor
/datum/technology/basic_armor
	name = "Basic Armor Designs"
	desc = "Basic armor designs for hazardous work."
	tech_type = RESEARCH_COMBAT

	x = 0.1
	y = 0.8
	icon = "armor"

	required_technologies = list()
	required_tech_levels = list()
	cost = 750

	unlocks_designs = list(/datum/design/research/item/clothing/soteriaarmorchest,
							 /datum/design/research/item/clothing/soteriaarmorhead,
							 /datum/design/research/item/clothing/rig_cheap,
							 /datum/design/research/item/clothing/tinfoil,
							 /datum/design/research/item/clothing/armor_soterialabcoat)

/datum/technology/advanced_armor
	name = "Advanced Armor Designs"
	desc = "Advanced armor designs for space or laser combat."
	tech_type = RESEARCH_COMBAT

	x = 0.3
	y = 0.8
	icon = "void_suit"

	required_technologies = list(/datum/technology/basic_armor)
	required_tech_levels = list()
	cost = 3750

	unlocks_designs = list(/datum/design/research/item/clothing/medarmor,
							/datum/design/research/item/clothing/armor_laserproof,
							/datum/design/research/item/clothing/paramedic_armor,
							/datum/design/research/item/clothing/paramedic_helmet,
							/datum/design/research/item/clothing/rig_advhazmat)

/datum/technology/advanced_unstable_plasma_weapons
	name = "Advanced Plasma Weapon Designs"
	desc = "Advanced plasma designs for space or ground combat, rather unstable designs for unstable minds."
	tech_type = RESEARCH_COMBAT

	x = 0.9
	y = 0.8
	icon = "hydrogen"

	required_technologies = list(/datum/technology/advanced_armor,
								 /datum/technology/laser_weaponry)
	required_tech_levels = list(RESEARCH_POWERSTORAGE = 12, RESEARCH_ENGINEERING = 20)
	cost = 5625 //You get back a lot

	unlocks_designs = list(/datum/design/research/item/weapon/hydrogen_rifle,
							/datum/design/research/item/weapon/hydrogen_pistol,
							/datum/design/research/item/weapon/hydrogen_cannon,
							/datum/design/research/item/mecha/weapon/hydrogen,
							/datum/design/research/item/weapon/hydrogen_sword,
							/datum/design/research/item/weapon/hydrogen_welder,
							/datum/design/research/item/weapon/hydrogrenade,
							/datum/design/research/item/ammo/hydroflaskette,
							/datum/design/research/item/ion_jaunt)
