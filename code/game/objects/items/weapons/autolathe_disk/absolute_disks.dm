// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Absolute
/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Church of Absolute Bioprinter Products and Utilities"
	desc = "This disk is sole property of the church, the files within are encrypted and should not be used, taken, or tested by anyone not affiliated with the Absolute."
	icon_state = "neotheology"

	license = -1
	designs = list(
		//products
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,
		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,
		//general clothes
		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/leather/leather_jacket,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,
		//church clothes
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/nt_clothes/sports_jacket,
		/datum/design/bioprinter/nt_clothes/acolyte_uniform,
		/datum/design/bioprinter/nt_clothes/sports_uniform,
		/datum/design/bioprinter/nt_clothes/church_uniform,
		/datum/design/bioprinter/nt_clothes/hermes_shoes,
		//medical
		/datum/design/autolathe/firstaid/nt,
		//backpacks
		/datum/design/bioprinter/leather/storage/backpack/satchel/neotheology,
		/datum/design/bioprinter/leather/storage/backpack/neotheology,
		/datum/design/bioprinter/leather/storage/backpack/sport/neotheology,
		//pouches
		/datum/design/bioprinter/pouch/engineering_supply,
		/datum/design/bioprinter/pouch/engineering_tools,
		/datum/design/bioprinter/pouch/janitor_supply,
		/datum/design/bioprinter/pouch/small_generic/purple,
		/datum/design/bioprinter/pouch/small_generic,
		/datum/design/bioprinter/pouch/medium_generic,
		/datum/design/bioprinter/pouch/large_generic,
		/datum/design/bioprinter/pouch/tubular,
		/datum/design/bioprinter/pouch/tubular/vial,
		/datum/design/bioprinter/sling,
		//power cells
		/datum/design/bioprinter/nt_cells/large,
		/datum/design/bioprinter/nt_cells/large/plasma,
		/datum/design/bioprinter/nt_cells/medium,
		/datum/design/bioprinter/nt_cells/medium/plasma,
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma,
		//utilities
		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller,
		/datum/design/bioprinter/holyvacuum
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioaugment
	disk_name = "Church of Absolute Bioaugmentation Disk"
	desc = "This disk is sole property of the church, the files within are encrypted and should not be used, taken, or tested by anyone not affiliated with the Absolute."
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/bioimplant/osurgical,
		/datum/design/bioprinter/bioimplant/oengineering,
		/datum/design/bioprinter/bioimplant/oscythe,
		/datum/design/bioprinter/bioimplant/oarmor,
		/datum/design/bioprinter/bioimplant/omuscle,
		/datum/design/research/item/mechfab/modules/hud/welder_bio,
		/datum/design/research/item/mechfab/modules/hud/night_bio,
		/datum/design/research/item/mechfab/modules/hud/thermal_bio
	)

// Same as the other NT disk, minus the medical designs. Spawns in public access bioprinters.
/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
	disk_name = "Church of Absolute Basic Bioprinter Pack"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/leather/satchel,
		/datum/design/bioprinter/leather/leather_jacket,
		/datum/design/bioprinter/leather/cash_bag,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,
	)

// Thorn and Rose Pack - both .40 and .35
/obj/item/computer_hardware/hard_drive/portable/design/guns/mk58
	disk_name = "Absolute Armory - Thorn and Rose Handgun Pack"
	icon_state = "neotheology"

	license = 16
	designs = list(
		/datum/design/autolathe/gun/mk58 = 3,
		/datum/design/autolathe/gun/mk58_wood = 3,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
		)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lemant
	disk_name = "Absolute Armory - .40/20mm Pilgrim revolver"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/lemant = 3,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/ammo/shotgun_pellet = 2,
		/datum/design/autolathe/ammo/shotgun = 2,
		)

//Church shotgun
/obj/item/computer_hardware/hard_drive/portable/design/guns/regulator
	disk_name = "Absolute Armory - 20mm Regulator Shotgun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		)

// ENERGY SMALL ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/counselor
	disk_name = "Absolute Armory - Counselor PDW E"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_counselor
	disk_name = "Absolute Armory - NT LP \"Serenity\""
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol = 2,
		/datum/design/autolathe/cell/small/high,
	)


// ENERGY ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/nemesis
	disk_name = "Absolute Armory - Nemesis Energy Crossbow"
	icon_state = "neotheology"

	license = 2
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/themis
	disk_name = "Absolute Armory - Themis Energy Crossbow"
	icon_state = "neotheology"

	license = 1
	designs = list(
		/datum/design/autolathe/gun/large_energy_crossbow,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/lightfall
	disk_name = "Absolute Armory - Lightfall Laser Gun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/valkirye
	disk_name = "Absolute Armory - Valkyrie Energy Rifle"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/halicon
	disk_name = "Absolute Armory - Halcyon Ion Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/computer_hardware/hard_drive/portable/design/guns/dominion
	disk_name = "Absolute Armory - Dominion Plasma Rifle"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/purger
	disk_name = "Absolute Armory - Purger Plasma Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 3,
		/datum/design/autolathe/cell/medium/high,
	)

// Grenade Launchers

/obj/item/computer_hardware/hard_drive/portable/design/guns/protector
	disk_name = "OT GL - Grenade Launcher"
	icon_state = "neotheology"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher, // "NT GL \"Protector\""
	)

//Absolute Armory gun packs

/obj/item/computer_hardware/hard_drive/portable/design/nt_old_guns
	disk_name = "Absolute Armory of the Old Testament"
	desc = "A rare and expensive disk containing designs for highly advanced energy and ballistic weaponry from the Old Testament, the Absolutes arms division."
	icon_state = "neotheology"
	license = 16
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood = 2,
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/sniperrifle = 6
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms
	disk_name = "Absolute Armory - New Testament Armaments"
	icon_state = "neotheology"
	license = -1
	designs = list(
		//weapons
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_longsword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/autolathe/sword/nt_halberd,
		/datum/design/autolathe/sword/nt_scourge,
		/datum/design/autolathe/sword/nt_spear,
		/datum/design/autolathe/shield/nt_shield,
		/datum/design/autolathe/nt/shield/nt_buckler,
		/datum/design/autolathe/gun/plasma/martyr,
		//armor and clothes
		/datum/design/bioprinter/nt_clothes/acolyte_armor_helm,
		/datum/design/bioprinter/nt_clothes/acolyte_armor,
		/datum/design/bioprinter/nt_clothes/rosaria_armor_helm,
		/datum/design/bioprinter/nt_clothes/rosaria_armor,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor_helm,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor,
		/datum/design/bioprinter/nt_clothes/custodian_armor_helm,
		/datum/design/bioprinter/nt_clothes/custodian_armor,
		/datum/design/bioprinter/nt_clothes/NTvoid,
		/datum/design/bioprinter/nt_clothes/hermes_shoes,
		/datum/design/bioprinter/belt/security/neotheology,
		//holsters
		/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint,
		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,
		//pouches
		/datum/design/bioprinter/pouch/ammo,
		/datum/design/bioprinter/pouch/baton_holster,
		/datum/design/bioprinter/pouch/pistol_holster,
		//mods
		/datum/design/autolathe/tool_upgrade/sanctifier,
		/datum/design/autolathe/gun_upgrade/barrel/excruciator
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms/public
	disk_name = "Absolute Armory - Crusade Starter Kit"
	license = 8

/obj/item/computer_hardware/hard_drive/portable/design/nt_grenades
	disk_name = "Absolute Armory - Grenades Pack"
	icon_state = "neotheology"
	license = 12
	designs = list(
		/datum/design/autolathe/grenade/nt_explosive,
		/datum/design/autolathe/grenade/nt_flashbang,
		/datum/design/autolathe/grenade/nt_frag,
		/datum/design/autolathe/grenade/nt_smokebomb
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_new_guns
	disk_name = "Absolute Armory of the New Testament"
	desc = "A rare and expensive disk containing designs for highly advanced energy weapons from the Old Testament, the Absolutes arms division. Nicknamed the new testament for containing its latest weaponry designs."
	icon_state = "neotheology"
	license = 16
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow = 10,
		/datum/design/autolathe/gun/large_energy_crossbow = 12,
		/datum/design/autolathe/gun/ntpistol,
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/gun/pulse = 5,
		/datum/design/autolathe/gun/pulse_destroyer = 8,
		/datum/design/autolathe/gun/ionrifle = 3,
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_plasma_shells
	disk_name = "Absolute Armory - Plasma Shell Pack"
	desc = "A rare and expensive disk containing designs for highly advanced plasma based shotgun shells."
	icon_state = "neotheology"
	license = 8 // 20 heavy plasma shells or 40 normal shots.
	designs = list(
		/datum/design/autolathe/ammo/shotgun_plasma_heavy = 2,
		/datum/design/autolathe/ammo/shotgun_plasma,
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_cells
	disk_name = "Absolute Armory - Power Cells Pack"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/nt_cells/large,
		/datum/design/bioprinter/nt_cells/large/plasma,
		/datum/design/bioprinter/nt_cells/medium,
		/datum/design/bioprinter/nt_cells/medium/plasma,
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma
		)
