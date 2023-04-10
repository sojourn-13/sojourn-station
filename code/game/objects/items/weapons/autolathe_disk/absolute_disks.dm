// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Absolute

/obj/item/computer_hardware/hard_drive/portable/design/nt
	disk_name = "Absolute Armory"
	icon_state = "neotheology"
	license = -1

/obj/item/computer_hardware/hard_drive/portable/design/nt/bioprinter
	disk_name = "Church of Absolute Bioprinter Products and Utilities Plus"
	desc = "This disk is sole property of the church, the files within are encrypted and should not be used, taken, or tested by anyone not affiliated with the Absolute."
	icon_state = "neotheology_testament_u"
	license = -1
	designs = list(
		//products
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,
		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,
		//utilities
		/datum/design/bioprinter/holyvacuum,
		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller,
		//medical
		/datum/design/bioprinter/medical/advanced/bruise/nt,
		/datum/design/bioprinter/medical/advanced/ointment/nt,
		/datum/design/autolathe/firstaid/nt,
		//church clothes
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/nt_clothes/church_uniform,
		/datum/design/bioprinter/nt_clothes/acolyte_uniform,
		/datum/design/bioprinter/nt_clothes/sports_jacket,
		/datum/design/bioprinter/sling,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/nt_clothes/hermes_shoes,
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
		/datum/design/bioprinter/pouch/tubular/vial
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Church of Absolute Bioprinter Products and Utilities"
	desc = "This disk is sole property of the church, the files within are encrypted and should not be used, taken, or tested by anyone not affiliated with the Absolute."
	icon_state = "neotheology_testament_u"
	license = 20
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

// Same as the other NT disk, minus the medical designs. Spawns in public access bioprinters.
/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter/public
	disk_name = "Church of Absolute Basic Bioprinter Pack"
	icon_state = "neotheology_testament_u"
	license = -1

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioaugment
	disk_name = "Strange Disk"
	desc = "Now,where did this come from?"
	icon_state = "onestar"

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

// Thorn and Rose Pack - both 10mm and 9mm
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
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter = 3,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 4
		)

//Church shotgun
/obj/item/computer_hardware/hard_drive/portable/design/nt/mk58
	disk_name = "Absolute Armory - Thorn and Rose Handgun Pack Plus"
	icon_state = "neotheology"

	license = 20
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
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter = 2,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 3
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
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 3,
		)

//Church shotgun
/obj/item/computer_hardware/hard_drive/portable/design/nt/lemant
	disk_name = "Absolute Armory - .40/20mm Pilgrim revolver Plus"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/lemant,
		/datum/design/autolathe/ammo/slmagnum_practice = 0,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal = 2,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/ammo/shotgun_pellet = 2,
		/datum/design/autolathe/ammo/shotgun = 2,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2,
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/regulator
	disk_name = "Absolute Armory - 20mm Regulator Shotgun Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/ammo/shotgun_box = 3,
		/datum/design/autolathe/ammo/shotgun_pellet_box = 3,
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/counselor
	disk_name = "Absolute Armory - Counselor PDW E Plus"
	icon_state = "neotheology"

	license = 10
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt/nt_counselor
	disk_name = "Absolute Armory - NT LP \"Serenity\" Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol,
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/guns/nemesis
	disk_name = "Absolute Armory - Nemesis Energy Crossbow Plus"
	icon_state = "neotheology"

	license = 3
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/themis
	disk_name = "Absolute Armory - Themis Energy Crossbow Plus"
	icon_state = "neotheology"

	license = 2
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/lightfall
	disk_name = "Absolute Armory - Lightfall Laser Gun Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser,
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

//for the EOTP
obj/item/computer_hardware/hard_drive/portable/design/nt/valkirye
	disk_name = "Absolute Armory - Valkyrie Energy Rifle Plus"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/carpedie
	disk_name = "Absolute Armory - Carpediem laser musket"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/carpediem = 3,
		/datum/design/autolathe/cell/medium/high,
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/carpedie
	disk_name = "Absolute Armory - Carpediem laser musket Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/carpediem = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/concillium
	disk_name = "Absolute Armory - Concillium Las-MG"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/concillium = 3,
		/datum/design/autolathe/cell/medium/high,
	)

//for the EOTP
obj/item/computer_hardware/hard_drive/portable/design/nt/concillium
	disk_name = "Absolute Armory - Concillium Las-MG Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/concillium = 2,
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/halicon
	disk_name = "Absolute Armory - Halcyon Ion Rifle Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle,
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/dominion
	disk_name = "Absolute Armory - Dominion Plasma Rifle Plus"
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 2,
		/datum/design/autolathe/cell/medium/high,
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/purger
	disk_name = "Absolute Armory - Purger Plasma Rifle Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 2,
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
	disk_name = "Absolute Armory GL - Grenade Launcher"
	icon_state = "neotheology"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher, // "OT GL \"Protector\""
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/protector
	disk_name = "Absolute Armory GL - Grenade Launcher Plus"
	icon_state = "neotheology"

	license = 5
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 2,
		/datum/design/autolathe/ammo/grenade/flash = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/antebellum
	disk_name = "Absolute Armory - Antebellum laser blunderbuss"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/plasma/antebellum = 3,
		/datum/design/bioprinter/nt_cells/medium,
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/antebellum
	disk_name = "Absolute Armory - Antebellum laser blunderbuss Plus"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/plasma/antebellum,
		/datum/design/bioprinter/nt_cells/medium,
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
		/datum/design/autolathe/gun/lemant = 3,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/gun/sniperrifle = 6,
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/old_guns
	disk_name = "Absolute Armory of the Old Testament Plus"
	desc = "A rare and expensive disk containing designs for highly advanced energy and ballistic weaponry from the Old Testament, the Absolutes arms division."
	icon_state = "neotheology"
	license = 18
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood = 2,
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/gun/lemant = 3,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/gun/sniperrifle = 6,
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms
	disk_name = "Absolute Armory - New Testament Armaments"
	icon_state = "neotheology_testament"
	license = -1
	designs = list(
		//weapons
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_longsword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/autolathe/sword/nt_halberd,
		/datum/design/autolathe/sword/nt_scourge,
		/datum/design/autolathe/sword/nt_spear,
		/datum/design/autolathe/sword/nt_warhammer,
		/datum/design/autolathe/sword/nt_flanged,
		/datum/design/autolathe/sword/nt_power,
		/datum/design/autolathe/nt/shield/nt_buckler,
		/datum/design/autolathe/shield/nt_shield,
		/datum/design/autolathe/gun/plasma/martyr,
		/datum/design/autolathe/gun/plasma/excubitor,
		//armor
		/datum/design/bioprinter/nt_clothes/armor_kit,
		/datum/design/bioprinter/nt_clothes/acolyte_armor_helm,
		/datum/design/bioprinter/nt_clothes/acolyte_armor,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor_helm,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor,
		/datum/design/bioprinter/nt_clothes/custodian_armor_helm,
		/datum/design/bioprinter/nt_clothes/custodian_armor,
		/datum/design/bioprinter/nt_clothes/rosaria_armor_helm,
		/datum/design/bioprinter/nt_clothes/rosaria_armor,
		/datum/design/bioprinter/nt_clothes/NTvoid,
		/datum/design/bioprinter/nt_clothes/knight_rig,
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
		/datum/design/bioprinter/pouch/pistol_double,
		/datum/design/bioprinter/pouch/kniferig,
		/datum/design/bioprinter/pouch/quiver,
		/datum/design/bioprinter/pouch/xbowquiver,
		//mods
		/datum/design/autolathe/tool_upgrade/sanctifier,
		/datum/design/autolathe/gun_upgrade/barrel/excruciator,
		//power cells
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma,
		/datum/design/bioprinter/nt_cells/medium,
		/datum/design/bioprinter/nt_cells/medium/plasma,
		/datum/design/bioprinter/nt_cells/large,
		/datum/design/bioprinter/nt_cells/large/plasma
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
		/datum/design/autolathe/grenade/nt_smokebomb,
		/datum/design/autolathe/grenade/nt_heatwave
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/grenades
	disk_name = "Absolute Armory - Grenades Pack Plus"
	icon_state = "neotheology"
	license = 16
	designs = list(
		/datum/design/autolathe/grenade/nt_explosive,
		/datum/design/autolathe/grenade/nt_flashbang,
		/datum/design/autolathe/grenade/nt_frag,
		/datum/design/autolathe/grenade/nt_smokebomb,
		/datum/design/autolathe/grenade/nt_heatwave
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/new_guns
	disk_name = "Absolute Armory of the New Testament Plus"
	desc = "A rare and expensive disk containing designs for highly advanced energy weapons from the Old Testament, the Absolutes arms division. Nicknamed the new testament for containing its latest weaponry designs."
	icon_state = "neotheology"
	license = 18
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow = 10,
		/datum/design/autolathe/gun/large_energy_crossbow = 12,
		/datum/design/autolathe/gun/ntpistol,
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/gun/pulse = 5,
		/datum/design/autolathe/gun/pulse_destroyer = 8,
		/datum/design/autolathe/gun/ionrifle = 3,
		/datum/design/autolathe/gun/plasma/antebellum,
		/datum/design/autolathe/gun/concillium = 10,
		/datum/design/autolathe/gun/carpediem = 4
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
		/datum/design/autolathe/gun/pulse = 5,
		/datum/design/autolathe/gun/pulse_destroyer = 8,
		/datum/design/autolathe/gun/ionrifle = 3,
		/datum/design/autolathe/gun/plasma/antebellum,
		/datum/design/autolathe/gun/concillium = 10,
		/datum/design/autolathe/gun/carpediem = 4
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

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/plasma_shells
	disk_name = "Absolute Armory - Plasma Shell Pack Plus"
	desc = "A rare and expensive disk containing designs for highly advanced plasma based shotgun shells."
	icon_state = "neotheology"
	license = 10 // 36 heavy plasma shells or 56 normal shots.
	designs = list(
		/datum/design/autolathe/ammo/shotgun_plasma_heavy = 2,
		/datum/design/autolathe/ammo/shotgun_plasma,
	)

//for the EOTP
/obj/item/computer_hardware/hard_drive/portable/design/nt/cells
	disk_name = "Absolute Armory - Power Cells Pack Plus"
	icon_state = "neotheology_testament"

	license = 12
	designs = list(
		/datum/design/bioprinter/nt_cells/large,
		/datum/design/bioprinter/nt_cells/large/plasma,
		/datum/design/bioprinter/nt_cells/medium,
		/datum/design/bioprinter/nt_cells/medium/plasma,
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma
		)

/obj/item/computer_hardware/hard_drive/portable/design/nt_cells
	disk_name = "Absolute Armory - Power Cells Pack"
	icon_state = "neotheology_testament"

	license = 12
	designs = list(
		/datum/design/bioprinter/nt_cells/large = 3,
		/datum/design/bioprinter/nt_cells/large/plasma = 4,
		/datum/design/bioprinter/nt_cells/medium = 2,
		/datum/design/bioprinter/nt_cells/medium/plasma = 3,
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma = 2
		)
