/datum/design/research/item/mecha_tracking
	name = "Exosuit tracking beacon"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_tracking
	category = CAT_MECHA
	starts_unlocked = TRUE

	required_printer_code = TRUE
	code_dex = "MECHFAB"

/datum/design/research/item/mecha
	build_type = MECHFAB
	category = CAT_MECHA


	required_printer_code = TRUE
	code_dex = "MECHFAB"

/datum/design/research/item/mecha/AssembleDesignDesc()
	if(!desc)
		desc = "Allows for the construction of \a '[item_name]' exosuit module."

/datum/design/research/item/mecha/hydraulic_clamp
	name = "Hydraulic clamp"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp

/datum/design/research/item/mecha/drill
	name = "Drill"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/drill

/datum/design/research/item/mecha/extinguisher
	name = "Extinguisher"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/extinguisher

/datum/design/research/item/mecha/cable_layer
	name = "Cable layer"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/cable_layer

/datum/design/research/item/mecha/sleeper
	name = "Sleeper"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/sleeper

/datum/design/research/item/mecha/syringe_gun
	name = "Syringe gun"
	desc = "Exosuit-mounted syringe gun and chemical synthesizer."
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/syringe_gun

/datum/design/research/item/mecha/passenger
	name = "Passenger compartment"
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/passenger

/datum/design/research/item/mecha/jetpack
	name = "jetpack module"
	build_path = /obj/item/mecha_parts/mecha_equipment/thruster

//obj/item/mecha_parts/mecha_equipment/repair_droid,
//Ballistic Mech Ammo

/datum/design/research/item/mecha/ammo/hmg
	name = "25mm HMG ammunition box"
	build_path = /obj/item/mech_ammo_box/hmg
	starts_unlocked = TRUE
	category = "Ammo"

/datum/design/research/item/mecha/ammo/cannon
	name = "60mm HEAD ammunition box"
	build_path = /obj/item/mech_ammo_box/cannon
	starts_unlocked = TRUE
	category = "Ammo"

/datum/design/research/item/mecha/ammo/ultracannon
	name = "30mm HEAD ammunition box"
	build_path = /obj/item/mech_ammo_box/ultracannon
	starts_unlocked = TRUE
	category = "Ammo"

/datum/design/research/item/mecha/ammo/scattershot
	name = "50mm HEAD ammunition box"
	build_path = /obj/item/mech_ammo_box/scattershot
	starts_unlocked = TRUE
	category = "Ammo"

// Ballistic Mech Weapons
/datum/design/research/item/mecha/weapon

/datum/design/research/item/mecha/weapon/hmg
	name = "25mm Heavy Machinegun \"Liberator\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/flak
	name = "50mm Flak Cannon \"Ox\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/cannon
	name = "60mm Ancient Autocannon \"Mule\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/cannon/military
	name = "60mm Autocannon \"Valor\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/cannon/military
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/ultracannon
	name = "30mm Burst-Fire Autocannon \"Victory\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/scattershot
	name = "50mm Scatter-Shot Autocannon \"Liberty\""
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot


// Energy

/datum/design/research/item/mecha/taser
	name = "MHM \"Pacifier\" mounted taser"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/taser
	starts_unlocked = TRUE

/datum/design/research/item/mecha/weapon/ion
	name = "PHM \"Nebula\" ion cannon"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion

/datum/design/research/item/mecha/weapon/laser
	name = "MHM \"Immolator\" mining laser"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser

/datum/design/research/item/mecha/weapon/laser_heavy
	name = "MHM-MS \"Solaris\" laser cannon"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy

/datum/design/research/item/mecha/weapon/hydrogen
	name = "Mech-mounted Hydrogen-Plasma Cannon"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/hydrogen

/datum/design/research/item/mecha/weapon/sonic
	name = "mech-mounted sonic emitter"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/sonic

//Explosives

/datum/design/research/item/mecha/weapon/grenade_launcher
	name = "SGL-6 grenade launcher"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang

/datum/design/research/item/mecha/flaregun
	name = "Flare launcher"
	build_path = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare

//Melee

/datum/design/research/item/mecha/weapon/mecha_sword
	name = "Mecha Sword"
	build_path = /obj/item/mecha_parts/mecha_equipment/melee_weapon/sword

/datum/design/research/item/mecha/weapon/mecha_cutlass
	name = "Mech Energy Cutlass"
	build_path = /obj/item/mecha_parts/mecha_equipment/melee_weapon/cutlass

// Mech Armors

/datum/design/research/item/mecha/weapon/mecha_fist
	name = "Mech Melee Plating"
	build_path = /obj/item/mecha_parts/mecha_equipment/fist_plating
	starts_unlocked = TRUE

/datum/design/research/item/mecha/ccw_armor
	name = "CCW armor booster"
	desc = "Exosuit close-combat armor booster."
	build_path = /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster

/datum/design/research/item/mecha/proj_armor
	desc = "Exosuit projectile armor booster."
	build_path = /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster

// *** Nonweapon modules
/datum/design/research/item/mecha/wormhole_gen
	name = "Wormhole generator"
	desc = "An exosuit module that can generate small quasi-stable wormholes."
	build_path = /obj/item/mecha_parts/mecha_equipment/wormhole_generator

/datum/design/research/item/mecha/teleporter
	name = "Teleporter"
	desc = "An exosuit module that allows teleportation to any position in view."
	build_path = /obj/item/mecha_parts/mecha_equipment/teleporter

/datum/design/research/item/mecha/rcd
	name = "RCD"
	desc = "An exosuit-mounted rapid construction device."
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/rcd

/datum/design/research/item/mecha/gravcatapult
	name = "Gravitational catapult"
	desc = "An exosuit-mounted gravitational catapult."
	build_path = /obj/item/mecha_parts/mecha_equipment/gravcatapult

/datum/design/research/item/mecha/repair_droid
	name = "Repair droid"
	desc = "Automated repair droid, exosuits' best companion. BEEP BOOP!"
	build_path = /obj/item/mecha_parts/mecha_equipment/repair_droid

/datum/design/research/item/mecha/shield_droid
	name = "Shield droid"
	desc = "Automated sheild droid, exosuits' second best companion. BEEP BOOP!"
	build_path = /obj/item/mecha_parts/mecha_equipment/combat_shield

/datum/design/research/item/mecha/plasma_generator
	desc = "Plasma reactor"
	build_path = /obj/item/mecha_parts/mecha_equipment/generator

/datum/design/research/item/mecha/energy_relay
	name = "Energy relay"
	build_path = /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay

/datum/design/research/item/mecha/diamond_drill
	name = "Diamond drill"
	desc = "A diamond version of the exosuit drill. It's harder, better, faster, stronger."
	build_path = /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill

/datum/design/research/item/mecha/generator_nuclear
	name = "Nuclear reactor"
	desc = "Exosuit-held nuclear reactor. Converts uranium and everyone's health to energy."
	build_path = /obj/item/mecha_parts/mecha_equipment/generator/nuclear
