// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
//Factory disks have no license cost and start in the bioprinter room.
//Non-plus disks can be found in vendors or random spawns.
//Plus disks are available only from the EOTP and have additional license points and/or decreased item costs
// Absolute

/obj/item/pc_part/drive/disk/design/nt
	disk_name = "Absolute Armory"
	icon_state = "neotheology"
	license = -1

/obj/item/pc_part/drive/disk/design/nt/basic_utility
	disk_name = "Church of the Absolute Bioprinter Utilities Factory"
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
		/datum/design/bioprinter/belt/medical, //Can fit things the other Church belts can't. Todo: make Church medical belt
		//church clothes
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/nt_clothes/church_uniform,
		/datum/design/bioprinter/nt_clothes/acolyte_uniform,
		/datum/design/bioprinter/nt_clothes/sports_jacket,
		/datum/design/bioprinter/nt_clothes/rosary,
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

/obj/item/pc_part/drive/disk/design/nt/basic_utility/public
	disk_name = "Church of the Absolute Bioprinter Products and Utilities"
	desc = "This disk is made by the Church and distributed at a nominal cost to anyone who wishes to use a bioprinter for basic needs."
	license = 20
	designs = list(
		//Products
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,
		//Utilities
		/datum/design/bioprinter/holyvacuum,
		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller,
		//Medical (No kit, just packs)
		/datum/design/bioprinter/medical/advanced/bruise/nt,
		/datum/design/bioprinter/medical/advanced/ointment/nt,
		//church clothes
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/nt_clothes/church_uniform, //No vector uniform, but yes this uniform
		/datum/design/bioprinter/nt_clothes/sports_jacket,
		/datum/design/bioprinter/sling,
		/datum/design/bioprinter/botanic_leather,
		//Misc (No pouches, gotta get them from the source)
		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/leather/satchel,
		/datum/design/bioprinter/leather/leather_jacket,
		/datum/design/bioprinter/leather/cash_bag,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/misc/champion,
	)

/obj/item/pc_part/drive/disk/design/nt/basic_arms
	disk_name = "Absolute Armory - Basic Armaments Factory"
	icon_state = "neotheology_testament"
	license = -1
	designs = list(
		//weapons
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_longsword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/autolathe/sword/nt_halberd,
		/datum/design/autolathe/sword/nt_polehammer,
		/datum/design/autolathe/sword/nt_scourge,
		/datum/design/autolathe/sword/nt_spear,
		/datum/design/autolathe/sword/nt_warhammer,
		/datum/design/autolathe/sword/nt_flanged,
		/datum/design/autolathe/sword/nt_power,
		/datum/design/autolathe/nt/sword/nt_verutum,
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
		/datum/design/bioprinter/pouch/tubular,
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

/obj/item/pc_part/drive/disk/design/nt/basic_arms/public
	disk_name = "Absolute Armory - Basic Armaments"
	license = 8 //Seems low, but everything is one point
	designs = list(
		//weapons
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_longsword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/autolathe/sword/nt_halberd,
		/datum/design/autolathe/sword/nt_polehammer,
		/datum/design/autolathe/sword/nt_scourge,
		/datum/design/autolathe/sword/nt_spear,
		/datum/design/autolathe/nt/shield/nt_buckler,
		/datum/design/autolathe/shield/nt_shield,
		/datum/design/autolathe/gun/plasma/martyr,
		//armor
		/datum/design/bioprinter/nt_clothes/custodian_armor_helm,
		/datum/design/bioprinter/nt_clothes/custodian_armor, //Already given to janitors, and there needs to be *some* armor on this. Todo: generic Church armor
		//holsters
		/datum/design/bioprinter/leather/holster/saber/greatsword/churchprint,
		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,
		//pouches (Leaving these ones in since they're very combat specific and still need a bioprinter)
		/datum/design/bioprinter/pouch/ammo,
		/datum/design/bioprinter/pouch/tubular,
		/datum/design/bioprinter/pouch/baton_holster,
		/datum/design/bioprinter/pouch/pistol_holster,
		/datum/design/bioprinter/pouch/pistol_double,
		/datum/design/bioprinter/pouch/kniferig,
		/datum/design/bioprinter/pouch/quiver,
		/datum/design/bioprinter/pouch/xbowquiver,
		//mods
		/datum/design/autolathe/tool_upgrade/sanctifier,
		/datum/design/autolathe/gun_upgrade/barrel/excruciator,
		//power cells (No plasmas)
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/medium,
		/datum/design/bioprinter/nt_cells/large,
	)

/obj/item/pc_part/drive/disk/design/nt/old_guns
	disk_name = "Absolute Armory of the Old Testament"
	desc = "A disk containing designs for highly advanced energy and ballistic weaponry from the Testament, the Absolutes arms division. Old Testament designs are older, having been in use since New Byzantine."
	license = 12 //Church can get this for free from their vendor, need to incentivize them to actually pray for the Plus without making it useless to outsiders
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood = 2,
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/gun/lemant = 3,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/sniperrifle = 6,
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2,
		/datum/design/autolathe/gun/shepherd = 6
	)

/obj/item/pc_part/drive/disk/design/nt/old_guns/plus
	disk_name = "Absolute Armory of the Old Testament Plus"
	desc = "A disk containing designs for highly advanced energy and ballistic weaponry from the Testament, the Absolutes arms division. Obtained through praying at the Will of the Protector."

	license = 18

/obj/item/pc_part/drive/disk/design/nt/new_guns
	disk_name = "Absolute Armory of the New Testament"
	desc = "A disk containing designs for highly advanced energy weapons from the Testament, the Absolutes arms division. New testament designs were made in Nadezhda and are more experimental than the Old Testament designs."

	license = 12 //Same as OT, Church can get it free
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

/obj/item/pc_part/drive/disk/design/nt/new_guns/plus
	disk_name = "Absolute Armory of the New Testament Plus"
	desc = "A disk containing designs for highly advanced energy weapons from the Testament, the Absolutes arms division. New testament designs were made in Nadezhda and are more experimental than the Old Testament designs. Obtained through praying at the Will of the Protector."

	license = 18

/obj/item/pc_part/drive/disk/design/nt_bioaugment
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
/obj/item/pc_part/drive/disk/design/nt/mk58
	disk_name = "Absolute Armory - Thorn and Rose Handgun Pack"

	license = 12
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

//Thorn and Rose Pack - both 10mm and 9mm
/obj/item/pc_part/drive/disk/design/nt/mk58/plus
	disk_name = "Absolute Armory - Thorn and Rose Handgun Pack Plus"
	license = 20

/obj/item/pc_part/drive/disk/design/nt/lemant
	disk_name = "Absolute Armory - .40/20mm Pilgrim revolver"

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
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 3
		)

//Church Revolver
/obj/item/pc_part/drive/disk/design/nt/lemant/plus
	disk_name = "Absolute Armory - .40/20mm Pilgrim revolver Plus"

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
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2
		)

//Church shotgun
/obj/item/pc_part/drive/disk/design/nt/regulator
	disk_name = "Absolute Armory - 20mm Regulator Shotgun"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator = 3,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/ammo/shotgun_biomatter = 5
		)

//Church rifle
/obj/item/pc_part/drive/disk/design/nt/shepherd
	disk_name = "Absolute Armory - OT MR 8.6x70mm Shepherd"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/shepherd = 3,
		/datum/design/autolathe/ammo/hrifle_practice = 0,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_lethal = 2,
		)

/obj/item/pc_part/drive/disk/design/nt/shepherd/plus
	disk_name = "Absolute Armory - OT MR 8.6x70mm Shepherd Plus"

	license = 10

/obj/item/pc_part/drive/disk/design/nt/regulator/plus
	disk_name = "Absolute Armory - 20mm Regulator Shotgun Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks = 0,
		/datum/design/autolathe/ammo/shotgun_illumination,
		/datum/design/autolathe/ammo/shotgun_box = 3,
		/datum/design/autolathe/ammo/shotgun_pellet_box = 3,
		/datum/design/autolathe/ammo/shotgun_biomatter = 3
		)

// ENERGY SMALL ARMS

/obj/item/pc_part/drive/disk/design/nt/counselor
	disk_name = "Absolute Armory - Counselor PDW E"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/counselor/plus
	disk_name = "Absolute Armory - Counselor PDW E Plus"

	license = 10

/obj/item/pc_part/drive/disk/design/nt/serenity
	disk_name = "Absolute Armory - NT LP \"Serenity\""

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol = 2,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/pc_part/drive/disk/design/nt/serenity/plus
	disk_name = "Absolute Armory - NT LP \"Serenity\" Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ntpistol,
		/datum/design/autolathe/cell/small/high,
	)

// ENERGY ARMS

/obj/item/pc_part/drive/disk/design/nt/nemesis
	disk_name = "Absolute Armory - Nemesis Energy Crossbow"

	license = 2
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
	)

/obj/item/pc_part/drive/disk/design/nt/nemesis/plus
	disk_name = "Absolute Armory - Nemesis Energy Crossbow Plus"

	license = 3

/obj/item/pc_part/drive/disk/design/nt/themis
	disk_name = "Absolute Armory - Themis Energy Crossbow"

	license = 1
	designs = list(
		/datum/design/autolathe/gun/large_energy_crossbow,
	)

/obj/item/pc_part/drive/disk/design/nt/themis/plus
	disk_name = "Absolute Armory - Themis Energy Crossbow Plus"

	license = 2

/obj/item/pc_part/drive/disk/design/nt/lightfall
	disk_name = "Absolute Armory - Lightfall Laser Gun"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/lightfall/plus
	disk_name = "Absolute Armory - Lightfall Laser Gun Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/valkirye
	disk_name = "Absolute Armory - Valkyrie Energy Rifle"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 3,
		/datum/design/autolathe/cell/medium/high,
	)


obj/item/pc_part/drive/disk/design/nt/valkirye/plus
	disk_name = "Absolute Armory - Valkyrie Energy Rifle Plus"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/carpedie
	disk_name = "Absolute Armory - Carpediem Laser Musket"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/carpediem = 3,
		/datum/design/autolathe/cell/medium/high,
	)


/obj/item/pc_part/drive/disk/design/nt/carpedie/plus
	disk_name = "Absolute Armory - Carpediem Laser Musket Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/carpediem = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/concillium
	disk_name = "Absolute Armory - Concillium Las-MG"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/concillium = 3,
		/datum/design/autolathe/cell/large/high,
	)


obj/item/pc_part/drive/disk/design/nt/concillium/plus
	disk_name = "Absolute Armory - Concillium Las-MG Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/concillium = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/halicon
	disk_name = "Absolute Armory - Halcyon Ion Rifle"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle = 2,
		/datum/design/autolathe/cell/medium/high,
	)


/obj/item/pc_part/drive/disk/design/nt/halicon/plus
	disk_name = "Absolute Armory - Halcyon Ion Rifle Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/pc_part/drive/disk/design/nt/dominion
	disk_name = "Absolute Armory - Dominion Plasma Rifle"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 3,
		/datum/design/autolathe/cell/medium/high,
	)


/obj/item/pc_part/drive/disk/design/nt/dominion/plus
	disk_name = "Absolute Armory - Dominion Plasma Rifle Plus"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/pulse = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/purger
	disk_name = "Absolute Armory - Purger Plasma Rifle"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 3,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/nt/purger/plus
	disk_name = "Absolute Armory - Purger Plasma Rifle Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer = 2,
		/datum/design/autolathe/cell/medium/high,
	)


// Grenade Launchers

/obj/item/pc_part/drive/disk/design/nt/protector
	disk_name = "Absolute Armory GL - Grenade Launcher"

	license = 3
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher, // "OT GL \"Protector\""
	)


/obj/item/pc_part/drive/disk/design/nt/protector/plus
	disk_name = "Absolute Armory GL - Grenade Launcher Plus"

	license = 5
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher,
		/datum/design/autolathe/ammo/grenade,
		/datum/design/autolathe/ammo/grenade/frag = 2,
		/datum/design/autolathe/ammo/grenade/emp = 2,
		/datum/design/autolathe/ammo/grenade/blast = 2,
		/datum/design/autolathe/ammo/grenade/flash = 2
	)

/obj/item/pc_part/drive/disk/design/nt/antebellum
	disk_name = "Absolute Armory - Antebellum Laser Blunderbuss"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/plasma/antebellum = 3,
		/datum/design/bioprinter/nt_cells/medium,
	)


/obj/item/pc_part/drive/disk/design/nt/antebellum/plus
	disk_name = "Absolute Armory - Antebellum Laser Blunderbuss Plus"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/plasma/antebellum,
		/datum/design/bioprinter/nt_cells/medium,
	)



/obj/item/pc_part/drive/disk/design/nt/grenades
	disk_name = "Absolute Armory - Grenades Pack"

	license = 12
	designs = list(
		/datum/design/autolathe/grenade/nt_explosive,
		/datum/design/autolathe/grenade/nt_flashbang,
		/datum/design/autolathe/grenade/nt_frag,
		/datum/design/autolathe/grenade/nt_smokebomb,
		/datum/design/autolathe/grenade/nt_heatwave
	)


/obj/item/pc_part/drive/disk/design/nt/grenades/plus
	disk_name = "Absolute Armory - Grenades Pack Plus"

	license = 16

/obj/item/pc_part/drive/disk/design/nt/plasma_shells
	disk_name = "Absolute Armory - Plasma Shell Pack"
	desc = "A disk containing designs for highly advanced plasma based shotgun shells."

	license = 8 // 20 heavy plasma shells or 40 normal shots.
	designs = list(
		/datum/design/autolathe/ammo/shotgun_plasma_heavy = 2,
		/datum/design/autolathe/ammo/shotgun_plasma,
	)


/obj/item/pc_part/drive/disk/design/nt/plasma_shells/plus
	disk_name = "Absolute Armory - Plasma Shell Pack Plus"
	desc = "A disk containing designs for highly advanced plasma based shotgun shells."
	license = 10 // 36 heavy plasma shells or 56 normal shots.

/obj/item/pc_part/drive/disk/design/nt/cells
	disk_name = "Absolute Armory - Power Cells Pack"

	license = 12
	designs = list(
		/datum/design/bioprinter/nt_cells/large = 3,
		/datum/design/bioprinter/nt_cells/large/plasma = 4,
		/datum/design/bioprinter/nt_cells/medium = 2,
		/datum/design/bioprinter/nt_cells/medium/plasma = 3,
		/datum/design/bioprinter/nt_cells/small,
		/datum/design/bioprinter/nt_cells/small/plasma = 2
		)
/obj/item/pc_part/drive/disk/design/nt/cells/plus
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

/obj/item/pc_part/drive/disk/design/nt/caustic_rounds
	disk_name = "Absolute Armory - Caustic Ammunition Pack"
	desc = "A disk containing designs for biomatter based caseless ballistic rounds."
	license = 12
	designs = list(
		/datum/design/autolathe/ammo/shotgun_biomatter = 4,
		/datum/design/autolathe/ammo/magnum_ammobox_biomatter = 2,
		/datum/design/autolathe/ammo/pistol_ammobox_biomatter
	)

/obj/item/pc_part/drive/disk/design/nt/caustic_rounds/plus
	disk_name = "Absolute Armory - Caustic Ammunition Pack"

	license = 20
