// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Absolute
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter
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
		//datum/design/bioprinter/cardboard,

		//general clothes
		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/leather/satchel,
		/datum/design/bioprinter/leather/leather_jacket,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,
		//church clothes
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/nt_clothes/acolyte_armor,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor,
		/datum/design/bioprinter/nt_clothes/custodian_armor,
		/datum/design/bioprinter/nt_clothes/sports_jacket,
		/datum/design/bioprinter/nt_clothes/acolyte_uniform,
		/datum/design/bioprinter/nt_clothes/sports_uniform,
		/datum/design/bioprinter/nt_clothes/church_uniform,
		//holsters
		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,
		//medical
		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,
		//pouches
		/datum/design/bioprinter/pouch/ammo,
		/datum/design/bioprinter/pouch/baton_holster,
		/datum/design/bioprinter/pouch/pistol_holster,
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
		//utilities
		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller,
		/datum/design/autolathe/gun/plasma/martyr,
		/datum/design/autolathe/gun_upgrade/barrel/excruciator

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioaugment
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
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
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


/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_boards
	disk_name = "Absolutism Circuit Pack"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/autolathe/circuit/bioprinter,
		/datum/design/autolathe/circuit/solidifier,

		//datum/design/autolathe/circuit/cloner,
		//datum/design/autolathe/circuit/reader,
		//datum/design/autolathe/circuit/biocan,

		/datum/design/autolathe/circuit/bioreactor_platform,
		/datum/design/autolathe/circuit/bioreactor_unloader,
		/datum/design/autolathe/circuit/bioreactor_biotank,
		/datum/design/autolathe/circuit/bioreactor_port,
		/datum/design/autolathe/circuit/bioreactor_metrics,
		/datum/design/autolathe/circuit/bioreactor_loader,

		/datum/design/autolathe/circuit/biogen,
		/datum/design/autolathe/circuit/biogen_port,
		/datum/design/autolathe/circuit/biogen_console,

		/datum/design/autolathe/circuit/smelter, //In case they want to do a duel system or need to replace/sell it
		/datum/design/autolathe/circuit/sorter,
	)

// Thorn and Rose Pack - both .40 and .35
/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mk58
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

//Church shotgun
/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/regulator
	disk_name = "Absolute Armory - 20mm Regulator Shotgun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

// ENERGY SMALL ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/counselor
	disk_name = "Absolute Armory - Councelor PDW E"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_counselor
	disk_name = "Absolute Armory - NT LP \"Serenity\""
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol = 2,
		/datum/design/autolathe/cell/small/high,
	)


// ENERGY ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nemesis
	disk_name = "Absolute Armory - Nemesis Energy Crossbow"
	icon_state = "neotheology"

	license = 2
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/themis
	disk_name = "Absolute Armory - Themis Energy Crossbow"
	icon_state = "neotheology"

	license = 1
	designs = list(
		/datum/design/autolathe/gun/large_energy_crossbow,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lightfall
	disk_name = "Absolute Armory - Lightfall Laser Gun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/valkirye
	disk_name = "Absolute Armory - Valkyrie Energy Rifle"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/halicon
	disk_name = "Absolute Armory - Halicon Ion Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dominion
	disk_name = "Absolute Armory - Dominion Plasma Rifle"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/purger
	disk_name = "Absolute Armory - Purger Plasma Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 3,
		/datum/design/autolathe/cell/medium/high,
	)

//Absolute Armory gun packs

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns
	disk_name = "Absolute Armory of the Old Testament"
	desc = "A rare and expensive disk containing designs for highly advanced energy and ballistic weaponry from the Old Testament, the Absolutes arms division."
	icon_state = "neotheology"
	license = 16
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood = 2,
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/research/item/weapon/stunrevolver,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/sniperrifle = 6
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns
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
