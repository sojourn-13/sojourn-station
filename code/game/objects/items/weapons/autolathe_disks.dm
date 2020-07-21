/obj/item/weapon/computer_hardware/hard_drive/portable/design
	name = "design disk"
	desc = "Data disk used to store autolathe designs."
	icon_state = "yellow"
	max_capacity = 1024	// Up to 255 designs, automatically reduced to the nearest power of 2
	origin_tech = list(TECH_DATA = 3) // Most design disks end up being 64 to 128 GQ
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 0.5)
	license = -1
	var/list/designs = list()

/obj/item/weapon/computer_hardware/hard_drive/portable/design/install_default_files()
	..()
	// Add design files to the disk
	for(var/design_typepath in designs)
		var/datum/computer_file/binary/design/D = new
		D.set_design_type(design_typepath)
		if(license > 0)
			D.set_copy_protection(TRUE)

		store_file(D, TRUE) //Will force the disk to accept it in spite of size.

	// Prevent people from breaking DRM by copying files across protected disks.
	// Stops people from screwing around with unprotected disks too.
	read_only = TRUE
	return TRUE


// Lonestar
/obj/item/weapon/computer_hardware/hard_drive/portable/design/misc
	disk_name = "Lonestar Miscellaneous Pack"
	icon_state = "guild"
	license = 20
	designs = list(
		//Basic Tools
		/datum/design/autolathe/tool/hatchet,
		/datum/design/autolathe/tool/minihoe,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/tool/knife,
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/crowbar,
		/datum/design/autolathe/tool/screwdriver,
		/datum/design/autolathe/tool/wirecutters,
		/datum/design/autolathe/tool/wrench,
		/datum/design/autolathe/tool/saw,
		/datum/design/autolathe/tool/multitool,
		/datum/design/autolathe/tool/pickaxe,
		/datum/design/autolathe/tool/shovel,
		/datum/design/autolathe/tool/spade,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/tool/rcd_ammo,
		/datum/design/autolathe/tool/weldertool,
		/datum/design/autolathe/tool/weldinggoggles,
		/datum/design/autolathe/tool/weldermask,
		/datum/design/autolathe/device/flamethrower,
		/datum/design/autolathe/device/proxsensor,
		//Misc
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/misc/extinguisher,
		/datum/design/autolathe/misc/radio_headset,
		/datum/design/autolathe/misc/radio_bounced,
		/datum/design/autolathe/misc/ashtray,
		/datum/design/autolathe/container/drinkingglass,
		/datum/design/autolathe/container/carafe,
		/datum/design/autolathe/container/insulated_pitcher,
		/datum/design/autolathe/container/bucket,
		/datum/design/autolathe/container/jar,
		/datum/design/autolathe/container/syringe,
		/datum/design/autolathe/container/vial,
		/datum/design/autolathe/container/beaker,
		/datum/design/autolathe/container/beaker_large,
		/datum/design/autolathe/container/pill_bottle,
		/datum/design/autolathe/container/spray,
		/datum/design/autolathe/misc/cane,
		/datum/design/autolathe/misc/floor_light,
		/datum/design/autolathe/misc/tube,
		/datum/design/autolathe/misc/bulb,
		//Devices
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/device/analyzer,
		/datum/design/autolathe/device/plant_analyzer,
		/datum/design/autolathe/device/healthanalyzer,
		/datum/design/research/item/medical/mass_spectrometer,
		/datum/design/research/item/medical/reagent_scanner,
		/datum/design/research/item/medical/robot_scanner,
		/datum/design/autolathe/device/slime_scanner,
		/datum/design/autolathe/device/antibody_scanner,
		/datum/design/autolathe/device/megaphone,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/device/gps,
		/datum/design/autolathe/device/destTagger,
		/datum/design/autolathe/device/export_scanner,
		/datum/design/autolathe/device/implanter,
		/datum/design/autolathe/device/hand_labeler,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/device/camera,
		/datum/design/autolathe/device/camerafilm,

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/robustcells
	disk_name = "Lonestar Robustcells"
	icon_state = "guild"
	license = 8
	designs = list(
		/datum/design/autolathe/cell/large,
		/datum/design/autolathe/cell/large/high,
		/datum/design/autolathe/cell/medium,
		/datum/design/autolathe/cell/medium/high,
		/datum/design/autolathe/cell/small,
		/datum/design/autolathe/cell/small/high,
		/datum/design/autolathe/part/cell_mout,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/cargo
	disk_name = "Lonestar Tidbits Factory"
	icon_state = "guild"
	license = -1
	designs = list(
		//Basic Tools
		/datum/design/autolathe/tool/hatchet,
		/datum/design/autolathe/tool/minihoe,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/tool/knife,
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/crowbar,
		/datum/design/autolathe/tool/screwdriver,
		/datum/design/autolathe/tool/wirecutters,
		/datum/design/autolathe/tool/wrench,
		/datum/design/autolathe/tool/saw,
		/datum/design/autolathe/tool/multitool,
		/datum/design/autolathe/tool/pickaxe,
		/datum/design/autolathe/tool/shovel,
		/datum/design/autolathe/tool/spade,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/tool/rcd_ammo,
		/datum/design/autolathe/tool/weldertool,
		/datum/design/autolathe/tool/weldinggoggles,
		/datum/design/autolathe/tool/weldermask,
		/datum/design/autolathe/device/flamethrower,
		/datum/design/autolathe/device/proxsensor,
		//Misc
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/misc/extinguisher,
		/datum/design/autolathe/misc/radio_headset,
		/datum/design/autolathe/misc/radio_bounced,
		/datum/design/autolathe/misc/ashtray,
		/datum/design/autolathe/container/drinkingglass,
		/datum/design/autolathe/container/carafe,
		/datum/design/autolathe/container/insulated_pitcher,
		/datum/design/autolathe/container/bucket,
		/datum/design/autolathe/container/jar,
		/datum/design/autolathe/container/syringe,
		/datum/design/autolathe/container/vial,
		/datum/design/autolathe/container/beaker,
		/datum/design/autolathe/container/beaker_large,
		/datum/design/autolathe/container/pill_bottle,
		/datum/design/autolathe/container/spray,
		/datum/design/autolathe/misc/cane,
		/datum/design/autolathe/misc/floor_light,
		/datum/design/autolathe/misc/tube,
		/datum/design/autolathe/misc/bulb,
		//Devices
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/device/analyzer,
		/datum/design/autolathe/device/plant_analyzer,
		/datum/design/autolathe/device/healthanalyzer,
		/datum/design/research/item/medical/mass_spectrometer,
		/datum/design/research/item/medical/reagent_scanner,
		/datum/design/research/item/medical/robot_scanner,
		/datum/design/autolathe/device/slime_scanner,
		/datum/design/autolathe/device/antibody_scanner,
		/datum/design/autolathe/device/megaphone,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/device/gps,
		/datum/design/autolathe/device/destTagger,
		/datum/design/autolathe/device/export_scanner,
		/datum/design/autolathe/device/implanter,
		/datum/design/autolathe/device/hand_labeler,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/device/camera,
		/datum/design/autolathe/device/camerafilm,
		//Cells
		/datum/design/autolathe/cell/large,
		/datum/design/autolathe/cell/large/high,
		/datum/design/autolathe/cell/medium,
		/datum/design/autolathe/cell/medium/high,
		/datum/design/autolathe/cell/small,
		/datum/design/autolathe/cell/small/high,
	)

// Technomancers
/obj/item/weapon/computer_hardware/hard_drive/portable/design/components
	disk_name = "Artificer's ARK-034 Components"
	icon_state = "technomancers"
	license = 20
	designs = list(
		/datum/design/autolathe/part/consolescreen,
		/datum/design/research/item/part/smes_coil,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/research/item/part/basic_sensor,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/basic_micro_laser,
		/datum/design/research/item/part/basic_matter_bin,
		/datum/design/autolathe/device/camera,
		/datum/design/autolathe/device/camerafilm,
		/datum/design/autolathe/part/igniter,
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_infra,
		/datum/design/autolathe/part/timer,
		/datum/design/autolathe/part/voice_analyzer,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/autolathe/part/camera_assembly,
		/datum/design/autolathe/part/laserguide,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/adv_tools
	disk_name = "Artificer's IJIRO-451 Advanced Tools"
	icon_state = "technomancers"
	license = 10
	designs = list(
		/datum/design/autolathe/tool/big_wrench,
		/datum/design/autolathe/tool/pneumatic_crowbar,
		/datum/design/research/item/weapon/mining/jackhammer,
		/datum/design/research/item/weapon/mining/drill,
		/datum/design/research/item/weapon/mining/drill_diamond,
		/datum/design/autolathe/tool/pickaxe_excavation,
		/datum/design/autolathe/tool/shovel/power,
		/datum/design/autolathe/tool/circularsaw,
		/datum/design/autolathe/tool/powered_hammer,
		/datum/design/autolathe/tool/chainsaw,
		/datum/design/autolathe/tool/hypersaw,
		/datum/design/autolathe/tool/rcd,
		/datum/design/autolathe/tool/electric_screwdriver,
		/datum/design/autolathe/tool/combi_driver,
		/datum/design/autolathe/tool/armature_cutter,
		/datum/design/autolathe/tool/weldingtool/advanced,
		/datum/design/autolathe/part/diamondblade,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/parttoolpack
	name = "Artificer's PAK-103 Tool Mods"
	icon_state = "technomancers"
	license = 10
	designs = list(
		/datum/design/autolathe/part/laserguide,
		/datum/design/autolathe/part/diamondblade,
		/datum/design/autolathe/part/stick,
		/datum/design/autolathe/part/plating,
		/datum/design/autolathe/part/guard,
		/datum/design/autolathe/part/heatsink,
		/datum/design/autolathe/part/ergonomic_grip,
		/datum/design/autolathe/part/ratchet,
		/datum/design/autolathe/part/red_paint,
		/datum/design/autolathe/part/whetstone,
		/datum/design/autolathe/part/magbit,
		/datum/design/autolathe/part/red_paint,
		/datum/design/autolathe/part/stabilized_grip,
		/datum/design/autolathe/part/ported_barrel,
		/datum/design/autolathe/part/motor,
		/datum/design/autolathe/part/cell_mout,
		/datum/design/autolathe/part/fuel_tank,
		/datum/design/autolathe/part/oxyjet,
		/datum/design/autolathe/part/expansion,
		/datum/design/autolathe/part/spikes,
		/datum/design/autolathe/part/dampener,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/circuits
	disk_name = "Artificer's ESPO-830 Circuits"
	icon_state = "technomancers"
	license = 10
	designs = list(
		/datum/design/autolathe/circuit/airlockmodule,
		/datum/design/autolathe/circuit/airalarm,
		/datum/design/autolathe/circuit/firealarm,
		/datum/design/autolathe/circuit/powermodule,
		/datum/design/autolathe/circuit/recharger,
		/datum/design/research/circuit/autolathe,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/autolathe/circuit/vending,
		/datum/design/research/circuit/arcade_battle,
		/datum/design/research/circuit/arcade_orion_trail,
		/datum/design/research/circuit/teleconsole,
		/datum/design/research/circuit/operating,
		/datum/design/autolathe/circuit/helm,
		/datum/design/autolathe/circuit/nav,
		/datum/design/autolathe/circuit/centrifuge,
		/datum/design/autolathe/circuit/electrolyzer,
		/datum/design/autolathe/circuit/reagentgrinder,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/conveyors
	disk_name = "Artificer's LAT-018 Conveyors"
	icon_state = "technomancers"

	license = -1
	designs = list(
		/datum/design/autolathe/conveyor,
		/datum/design/autolathe/conveyor_switch
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/engineering
	disk_name = "Artificer's Supply Factory"
	icon_state = "technomancers"
	license = -1 //Should make this disk infinite.
	designs = list(
		// From Components
		/datum/design/autolathe/part/consolescreen,
		/datum/design/research/item/part/smes_coil,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/research/item/part/basic_sensor,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/basic_micro_laser,
		/datum/design/research/item/part/basic_matter_bin,
		/datum/design/autolathe/part/igniter,
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_infra,
		/datum/design/autolathe/part/timer,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/autolathe/part/camera_assembly,
		/datum/design/autolathe/part/laserguide,
		// From Tools
		/datum/design/autolathe/tool/big_wrench,
		/datum/design/autolathe/tool/pneumatic_crowbar,
		/datum/design/research/item/weapon/mining/jackhammer,
		/datum/design/research/item/weapon/mining/drill,
		/datum/design/research/item/weapon/mining/drill_diamond,
		/datum/design/autolathe/tool/pickaxe_excavation,
		/datum/design/autolathe/tool/circularsaw,
		/datum/design/autolathe/tool/chainsaw,
		/datum/design/autolathe/tool/rcd,
		/datum/design/autolathe/tool/electric_screwdriver,
		/datum/design/autolathe/tool/combi_driver,
		/datum/design/autolathe/tool/armature_cutter,
		/datum/design/autolathe/tool/weldingtool/advanced,
		// From Circuits
		/datum/design/autolathe/circuit/airlockmodule,
		/datum/design/autolathe/circuit/airalarm,
		/datum/design/autolathe/circuit/firealarm,
		/datum/design/autolathe/circuit/powermodule,
		/datum/design/autolathe/circuit/recharger,
		/datum/design/research/circuit/autolathe,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/autolathe/circuit/vending,
		/datum/design/research/circuit/arcade_battle,
		/datum/design/research/circuit/arcade_orion_trail,
		/datum/design/research/circuit/teleconsole,
		/datum/design/research/circuit/operating,
		/datum/design/autolathe/circuit/helm,
		/datum/design/autolathe/circuit/nav,
		/datum/design/autolathe/circuit/centrifuge,
		// From tool mods
		/datum/design/autolathe/part/laserguide,
		/datum/design/autolathe/part/diamondblade,
		/datum/design/autolathe/part/stick,
		/datum/design/autolathe/part/plating,
		/datum/design/autolathe/part/guard,
		/datum/design/autolathe/part/heatsink,
		/datum/design/autolathe/part/ergonomic_grip,
		/datum/design/autolathe/part/ratchet,
		/datum/design/autolathe/part/red_paint,
		/datum/design/autolathe/part/whetstone,
		/datum/design/autolathe/part/magbit,
		/datum/design/autolathe/part/red_paint,
		/datum/design/autolathe/part/stabilized_grip,
		/datum/design/autolathe/part/ported_barrel,
		/datum/design/autolathe/part/motor,
		/datum/design/autolathe/part/cell_mout,
		/datum/design/autolathe/part/fuel_tank,
		/datum/design/autolathe/part/oxyjet,
		/datum/design/autolathe/part/expansion,
		/datum/design/autolathe/part/spikes,
		/datum/design/autolathe/part/dampener,
		)


// Soteria
/obj/item/weapon/computer_hardware/hard_drive/portable/design/medical
	disk_name = "Soteria Medical Designs"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/autolathe/gun/syringe_gun,
		/datum/design/autolathe/misc/penflashlight,
		/datum/design/autolathe/tool/scalpel,
		/datum/design/autolathe/tool/circularsaw,
		/datum/design/autolathe/tool/surgicaldrill,
		/datum/design/autolathe/tool/retractor,
		/datum/design/autolathe/tool/cautery,
		/datum/design/autolathe/tool/hemostat,
		/datum/design/autolathe/tool/bonesetter,
		/datum/design/autolathe/container/syringe,
		/datum/design/autolathe/container/vial,
		/datum/design/autolathe/container/beaker,
		/datum/design/autolathe/container/beaker_large,
		/datum/design/autolathe/container/pill_bottle,
		/datum/design/autolathe/container/spray,
		/datum/design/autolathe/device/implanter,
		/datum/design/autolathe/container/syringegun_ammo,
		/datum/design/autolathe/misc/bodybag
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/medical/cmo
	disk_name = "Soteria Medical Factory"
	license = -1 //Same disk, but for the CBO exclusively with endless uses.

/obj/item/weapon/computer_hardware/hard_drive/portable/design/computer
	disk_name = "Soteria Computer Parts"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/autolathe/computer_part/frame_pda,
		/datum/design/autolathe/computer_part/frame_tablet,
		/datum/design/autolathe/computer_part/frame_laptop,
		/datum/design/research/item/computer_part/disk/micro,
		/datum/design/research/item/computer_part/disk/small,
		/datum/design/research/item/computer_part/disk/normal,
		/datum/design/research/item/computer_part/disk/advanced,
		/datum/design/research/item/computer_part/cpu/basic,
		/datum/design/research/item/computer_part/cpu/basic/small,
		/datum/design/research/item/computer_part/cpu/adv,
		/datum/design/research/item/computer_part/cpu/adv/small,
		/datum/design/research/item/computer_part/netcard/basic,
		/datum/design/research/item/computer_part/netcard/advanced,
		/datum/design/research/item/computer_part/netcard/wired,
		/datum/design/research/item/computer_part/cardslot,
		/datum/design/research/item/computer_part/teslalink,
		/datum/design/research/item/computer_part/portabledrive/basic,
		/datum/design/research/item/computer_part/portabledrive/normal,
		/datum/design/research/item/computer_part/printer,
		/datum/design/research/item/computer_part/led,
		/datum/design/research/item/computer_part/led/adv,
		/datum/design/autolathe/device/camera,
		/datum/design/autolathe/device/camerafilm,
		/datum/design/autolathe/computer_part/gps,
		/datum/design/autolathe/part/heatsink,
		/datum/design/autolathe/part/motor,
		/datum/design/autolathe/part/dampener,
		/datum/design/autolathe/part/cell_mout,
		/datum/design/autolathe/computer_part/scanner/paper,
		/datum/design/autolathe/computer_part/scanner/atmos,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/computer/rd
	disk_name = "Soteria Computer Factory"
	license = -1

/obj/item/weapon/computer_hardware/hard_drive/portable/design/rped
	disk_name = "Soteria RnD Stock Parts Desgins"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/research/item/part/RPED,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/research/item/part/adv_capacitor,
		/datum/design/research/item/part/super_capacitor,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/nano_mani,
		/datum/design/research/item/part/pico_mani,
		/datum/design/research/item/part/basic_matter_bin,
		/datum/design/research/item/part/adv_matter_bin,
		/datum/design/research/item/part/super_matter_bin,
		/datum/design/research/item/part/basic_micro_laser,
		/datum/design/research/item/part/high_micro_laser,
		/datum/design/research/item/part/ultra_micro_laser,
		/datum/design/research/item/part/basic_sensor,
		/datum/design/research/item/part/adv_sensor,
		/datum/design/research/item/part/phasic_sensor,
		/datum/design/autolathe/part/consolescreen
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/rped/rd
	disk_name = "Soteria Stock Parts Factory"
	license = -1

// NeoTheology
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns
	disk_name = "Absolute Armory of the Old Testament"
	desc = "A rare and expensive disk containing designs for highly advanced energy and ballistic weaponry from the Old Testament, the Absolutes arms division."
	icon_state = "neotheology"
	license = 3
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood,
		/datum/design/autolathe/gun/regulator,
		/datum/design/research/item/weapon/stunrevolver,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/sniperrifle
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns
	disk_name = "Absolute Armory of the New Testament"
	desc = "A rare and expensive disk containing designs for highly advanced energy weapons from the Old Testament, the Absolutes arms division. Nicknamed the new testament for containing its latest weaponry designs."
	icon_state = "neotheology"
	license = 3
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
		/datum/design/autolathe/gun/large_energy_crossbow,
		/datum/design/autolathe/gun/laser,
		/datum/design/autolathe/gun/pulse,
		/datum/design/autolathe/gun/pulse_destroyer,
		/datum/design/autolathe/gun/ionrifle,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Church of Absolute Bioprinter Production"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		//datum/design/bioprinter/cardboard,
		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/leather/satchel,
		/datum/design/bioprinter/leather/leather_jacket,
		/datum/design/bioprinter/leather/cash_bag,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,

		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,

		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,
		/datum/design/autolathe/gun/nt_sprayer,

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
		/datum/design/bioprinter/sling


	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioaugment
	disk_name = "Church of Absolute Bioaugmentation Disk"
	desc = "This disk is sole property of the church, the files within are encrypted and should not be used, taken, or tested by anyone not affiliated with the Absolute."
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/bioimplant/osurgical,
		/datum/design/bioprinter/bioimplant/oscythe,
		/datum/design/bioprinter/bioimplant/oarmor,
		/datum/design/bioprinter/bioimplant/omuscle,
	)

// Same as the other NT disk, minus the medical designs. Spawns in public access bioprinters.
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
	disk_name = "Church of Absolute Public Bioprinter Pack"
	icon_state = "neotheology"

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
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,

		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,
		/datum/design/bioprinter/leather/holster/leg,

		/datum/design/autolathe/gun/nt_sprayer,
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
	)

// Ironhammer
/obj/item/weapon/computer_hardware/hard_drive/portable/design/security
	disk_name = "Security Miscellaneous Pack"
	icon_state = "ironhammer"
	license = 20
	designs = list(
		/datum/design/autolathe/sec/secflashlight,
		/datum/design/research/item/flash,
		/datum/design/autolathe/sec/handcuffs,
		/datum/design/autolathe/sec/zipties,
		/datum/design/autolathe/sec/electropack,
		/datum/design/autolathe/misc/taperecorder,
		/datum/design/autolathe/tool/tacknife,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/sec/gun_case,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/security/hos
	disk_name = "Security Miscellaneous Factory"
	license = -1

// greyson positronic
/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar
	disk_name = "Greyson Positronics Tool Pack"
	icon_state = "onestar"
	license = 5
	designs = list(
		/datum/design/autolathe/tool/crowbar_onestar,
		/datum/design/autolathe/tool/combi_driver_onestar,
		/datum/design/autolathe/tool/jackhammer_onestar,
		/datum/design/autolathe/tool/drill_onestar,
		/datum/design/autolathe/tool/weldertool_onestar,
		/datum/design/autolathe/tool/hammer_onestar,
		/datum/design/autolathe/tool/omni_surgery_onestar,
		/datum/design/autolathe/tool/pickaxe_onestar,
		/datum/design/autolathe/part/greyson/ai,

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/cog
	disk_name = "Greyson Positronics - Cog"
	icon_state = "onestar"
	license = 3
	designs = list(
		/datum/design/autolathe/gun/greyson_cog,
		/datum/design/autolathe/cell/medium/high,

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/stockparts
	disk_name = "Greyson Positronics Stockpart Pack"
	icon_state = "onestar"
	license = 8
	designs = list(
		/datum/design/autolathe/greyson/laser,
		/datum/design/autolathe/greyson/matter,
		/datum/design/autolathe/greyson/module,
		/datum/design/autolathe/greyson/capacitor,
		/datum/design/autolathe/greyson/manipulator,

	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield
	disk_name = "Blackshield Sovereignty Pack"
	icon_state = "onestar"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/ten_dark,
		/datum/design/autolathe/gun/ladon,
 		/datum/design/autolathe/gun/naga,
 		/datum/design/autolathe/ammo/magnum,
 		/datum/design/autolathe/ammo/magnum_lethal,
 		/datum/design/autolathe/ammo/kurtz,
 		/datum/design/autolathe/ammo/kurtz_lethal,
		/datum/design/autolathe/gun/omnirifle,//rifles
		/datum/design/autolathe/gun/standard_omnirifle,
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/gun/sts40,
		/datum/design/autolathe/gun/rds_omnicarbine,
		/datum/design/autolathe/device/gps,//misc gear
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/tacknife,
		/datum/design/autolathe/sec/beartrap,

		)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield/ammo
	disk_name = "SA Sovereignty Pack"
	icon_state = "onestar"
	license = 25

	designs = list(

		/datum/design/autolathe/ammo/pistol_practice,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_practice,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum_practice,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_rubber,
		/datum/design/autolathe/ammo/hrifle_practice,
		/datum/design/autolathe/ammo/hrifle_lethal,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short_practice,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_practice,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_practice,
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
		/datum/design/autolathe/circuit/biocan,
		/datum/design/autolathe/circuit/bioreactor_platform,
		/datum/design/autolathe/circuit/bioreactor_unloader,
		/datum/design/autolathe/circuit/bioreactor_biotank,
		/datum/design/autolathe/circuit/bioreactor_port,
		/datum/design/autolathe/circuit/bioreactor_metrics,
		/datum/design/autolathe/circuit/bioreactor_loader,
		/datum/design/autolathe/circuit/biogen,
		/datum/design/autolathe/circuit/biogen_port,
		/datum/design/autolathe/circuit/biogen_console,
	)


// Excelsior
/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior
	disk_name = "Excelsior Means of Production"
	desc = "The back has a machine etching: \"This struggle must be organised, according to \"all the rules of the art\", by people who are professionally engaged in revolutionary activity.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,						//guns
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/gun/reclaimer,
		/datum/design/autolathe/ammo/pistol,				//makarov ammo
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/smg,							//drozd ammo
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/rifle,							//vintorez ammo
		/datum/design/autolathe/ammo/rifle_short_hv,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/sl_rifle,						//boltgun ammo
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/circuit/autolathe_excelsior,		//circuits
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/reconstructor_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/research/item/part/micro_mani,				//machine parts
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,						//regular parts
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/autolathe/cell/large/excelsior,				//power cells
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/autolathe/device/excelsiormine,				//security
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/device/implanter,					//misc
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/device/excelbaton,
		/datum/design/autolathe/excelsior/laser,
		/datum/design/autolathe/excelsior/matter,
		/datum/design/autolathe/excelsior/module,
		/datum/design/autolathe/excelsior/capacitor,
		/datum/design/autolathe/excelsior/manipulator
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior_weapons
	disk_name = "Excelsior Means of Revolution"
	desc = "The back has a machine etching: \"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/pistol,				//makarov ammo
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/smg,							//drozd ammo
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/sl_rifle,						//boltgun ammo
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/rifle,							//vintorez ammo
		/datum/design/autolathe/ammo/rifle_short_hv,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/sec/silencer,						//misc
		/datum/design/autolathe/clothing/excelsior_armor,
	)


// Magazines and ammo

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "H&S Nonlethal Magazines Pack"
	icon_state = "frozenstar"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/kurtz_rubber,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol_rubber,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		/datum/design/autolathe/ammo/slkurtz_rubber,
		//smg mags
		/datum/design/autolathe/ammo/smg_rubber,
		// rifles
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/hrifle_rubber,
		//shells
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_flash,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "SA Lethal Magazines Pack"
	icon_state = "black"

	license = 20
	designs = list(
		//pistol mags
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/kurtz_lethal,
		//speed loaders
		/datum/design/autolathe/ammo/slpistol,
		/datum/design/autolathe/ammo/slpistol_lethal,
		/datum/design/autolathe/ammo/slmagnum,
		/datum/design/autolathe/ammo/slmagnum_lethal,
		/datum/design/autolathe/ammo/slkurtz,
		/datum/design/autolathe/ammo/slkurtz_lethal,
		//smg mags
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_lethal,
		// rifles
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/rifle_short,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/lrifle_short_lethal,
		/datum/design/autolathe/ammo/rifle_short_lethal,
		//shells
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_smallarms
	disk_name = "SA Handgun Ammunition"
	icon_state = "black"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_practice,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox_lethal,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox_practice,
		/datum/design/autolathe/ammo/magnum_ammobox_rubber,
		/datum/design/autolathe/ammo/magnum_ammobox_lethal,
		/datum/design/autolathe/ammo/kurtz_ammobox,
		/datum/design/autolathe/ammo/kurtz_ammobox_practice,
		/datum/design/autolathe/ammo/kurtz_ammobox_rubber,
		/datum/design/autolathe/ammo/kurtz_ammobox_lethal,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/ammo_boxes_rifle
	disk_name = "SA Rifle Ammunition"
	icon_state = "black"

	license = 20
	designs = list(
		/datum/design/autolathe/ammo/rifle_ammobox_small,
		/datum/design/autolathe/ammo/rifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/rifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox_small,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_rubber,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/hrifle_ammobox,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/exotic_ammo
	disk_name = "SA Exotic Ammunition Pack"
	icon_state = "black"
	license = 20

	designs = list(
		/datum/design/autolathe/ammo/m12empty,
		/datum/design/autolathe/ammo/sbaw_empty,
		/datum/design/autolathe/ammo/hrifle_drum_empty,
		/datum/design/autolathe/ammo/rifle_pk_empty,
		/datum/design/autolathe/ammo/lrifle_belt_empty,
		/datum/design/autolathe/ammo/maxim_empty,
		/datum/design/autolathe/ammo/c10x24,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/hrifle_ammobox,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/box_10x24,
		/datum/design/autolathe/ammo/box_antim,
		)

// G U N S (minus excelsior and research)
// Pack is used when there is more than one gun on the disk

// .35 PISTOLS + REVOLVERS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cheap_guns
	disk_name = "H&S - .35 Economy Pack"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/giskard,
		/datum/design/autolathe/gun/olivaw,
		/datum/design/autolathe/gun/clarissa,
		/datum/design/autolathe/gun/detective,
		/datum/design/autolathe/ammo/pistol_practice,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/slpistol_practice,
		/datum/design/autolathe/ammo/slpistol_rubber,
		)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt
	disk_name = "SA - .35 M1911"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/colt,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/firefly
	disk_name = "H&S - .35 Firefly Pistol"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/firefly,
		/datum/design/autolathe/ammo/hpistol_practice,
		/datum/design/autolathe/ammo/hpistol_rubber,
	)


// .40 REVOLVERS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver
	disk_name = "H&S - .40 Minotaur Revolver"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/revolver,
		/datum/design/autolathe/ammo/slmagnum_practice,
		/datum/design/autolathe/ammo/slmagnum_rubber,
		)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/revolver_mateba
	disk_name = "SA - .50 Kurtz Mateba Revolver"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/revolver/mateba,
		/datum/design/autolathe/ammo/slkurtz,
		/datum/design/autolathe/ammo/slkurtz_rubber,
		)

// .40 pistols

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon
	disk_name = "H&S - .40 Auto-Mag Ladon Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_hs,
		/datum/design/autolathe/ammo/magnum_practice,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon/sa
	disk_name = "SA - .40 Auto-Mag Ladon Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon_sa,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ladon/dark
	disk_name = ".40 Auto-Mag Ladon Handgun"
	icon_state = "onestar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ladon,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mk58
	disk_name = "Absolute Armory - .40 Auto-Mag MK58 Handgun Pack"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood,
		/datum/design/autolathe/ammo/magnum_practice,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/colt/ten
	disk_name = "H&S - .40 Auto-Mag Delta Elite"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ten,
		/datum/design/autolathe/ammo/magnum_practice,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/rafale
	disk_name = "SM - .40 Auto-Mag Rafale"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/rafale,
		/datum/design/autolathe/ammo/magnum_lethal,
		/datum/design/autolathe/ammo/magnum_practice,
		/datum/design/autolathe/ammo/magnum_rubber,
		)

// .50 PISTOLS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lamia
	disk_name = "H&S - .50 Lamia Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/lamia,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz_practice,
		/datum/design/autolathe/ammo/kurtz_rubber,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/basilisk
	disk_name = "H&S - .50 Basilisk Handgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/basilisk,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/naga
	disk_name = ".50 Naga Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/naga,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/akurra
	disk_name = "SA - .50 Akurra Silenced Handgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/akurra,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz_practice,
		/datum/design/autolathe/ammo/kurtz_lethal,
		)

// SHOTGUNS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/doublebarrel
	disk_name = "SA - 20mm Double Barrel Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/doublebarrel,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/grizzly
	disk_name = "SA - 20mm Grizly Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pump_shotgun,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sbaw
	disk_name = "20mm SBAW disk"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sbaw,
		/datum/design/autolathe/ammo/sbaw_slug,
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/sbaw_beanbag,
		/datum/design/autolathe/ammo/sbaw_payload,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/regulator
	disk_name = "Absolute Armory - 20mm Regulator Shotgun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/regulator,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/gladstone
	disk_name = "H&S - 20mm Gladstone Shotgun"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/gladstone,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pug
	disk_name = "SA - 20mm Pug Auto Shotgun"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pug,
		/datum/design/autolathe/ammo/m12beanbag, // Never add tazershells, for love of god
		/datum/design/autolathe/ammo/m12pellet,
		/datum/design/autolathe/ammo/m12slug,
		)

// SMGs

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/wirbelwind
	disk_name = "SM - .35 Wirbelwind SMG"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/wirbelwind,
		/datum/design/autolathe/ammo/smg_practice,
		/datum/design/autolathe/ammo/smg_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/straylight
	disk_name = "H&S - .35 Straylight SMG"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/straylight,
		/datum/design/autolathe/ammo/smg_practice,
		/datum/design/autolathe/ammo/smg_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/texan
	disk_name = "SA - .35 Texan SMG"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/texan,
		/datum/design/autolathe/ammo/smg_practice,
		/datum/design/autolathe/ammo/smg_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/mac
	disk_name = "SA - .35 MAC SMG"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/mac,
		/datum/design/autolathe/ammo/smg_practice,
		/datum/design/autolathe/ammo/smg_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_drozd
	disk_name = "Excelsior - .35 Drozd SMG"
	desc = "The back has a machine etching: \"Nobody is to be blamed for being born a slave; but a slave who not only eschews a striving for freedom but justifies and eulogies his slavery - such a slave is a lickspittle and a boor, who arouses a legitimate feeling of indignation, contempt, and loathing..\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber
	)

// .257 carbines

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pitbull
	disk_name = "H&S - .257 Pitbull Carbine"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pitbull,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ostwind
	disk_name = "SM - .257 Ostwind Carbine"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ostwind,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/bulldog
	disk_name = "H&S - .257 Bulldog Carbine"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/bulldog,
		/datum/design/autolathe/gun/bulldog_rds,
		/datum/design/autolathe/ammo/lrifle_short_practice,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/pulse_rifle
	disk_name = "PAR - 10mm Caseless Pulse Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_rifle,
		/datum/design/autolathe/ammo/c10x24,
		/datum/design/autolathe/ammo/box_10x24,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_kalashnikov
	disk_name = "SA - .257 Kalashnikov Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ak47_sa,
		/datum/design/autolathe/ammo/lrifle,
		/datum/design/autolathe/ammo/lrifle_short_practice,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/saw
	disk_name = "SA - .257 Pegasus LMG"
	icon_state = "black"

	license = 4
	designs = list(
		/datum/design/autolathe/gun/saw,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/lrifle_belt,
		/datum/design/autolathe/ammo/lrifle_short_practice,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sika
	disk_name = "SA - .257 Sika Rifle"
	icon_state = "black"

	license = 4
	designs = list(
		/datum/design/autolathe/gun/sika,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/roe
	disk_name = "H&S - .257 Roe Rifle"
	icon_state = "frozenstar"

	license = 4
	designs = list(
		/datum/design/autolathe/gun/roe,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber,
	)


// .30 Rifles

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/boltgun_sa
	disk_name = "SA - 7.5mm Novakovic Rifle"
	icon_state = "black"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/boltgun_sa,
		/datum/design/autolathe/ammo/sl_rifle,
		/datum/design/autolathe/ammo/rifle_ammobox_small,
	)


//.408 rifles

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/hustler
	disk_name = "SA - .408 Hustler Heavy Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/omnirifle,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/boar
	disk_name = "H&S - .408 Boar Heavy Carbine"
	icon_state = "frozenstar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_practice,
		/datum/design/autolathe/ammo/hrifle_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sts40
	disk_name = "SA - .408 STS-40 Heavy Rifle"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sts40,
		/datum/design/autolathe/ammo/hrifle,
		/datum/design/autolathe/ammo/hrifle_rubber,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/scout
	disk_name = "H&S - .408 Scout Sniper Rifle"
	icon_state = "frozenstar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/scout,
		/datum/design/autolathe/ammo/hrifle_ammobox_small,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_practice,
		/datum/design/autolathe/ammo/hrifle_ammobox_small_hv,
	)


// Heavy

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/heavysniper
	disk_name = "SA - .60-06 Penetrator AMR"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/heavysniper,
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/sa_pk
	disk_name = "SA - 7.5mm Pulemyot Kalashnikova MG"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/mg_pk,
		/datum/design/autolathe/ammo/rifle_pk,
	)

// Grenade Launchers

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/protector
	disk_name = "SA - Grenade Launcher"
	icon_state = "black"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher, // "NT GL \"Protector\""
	)

obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lenar
	disk_name = "H&S - Lenar Grenade Launcher"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher_lenar, // "FS GL \"Lenar\""
	)

// ENERGY SMALL ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/counselor
	disk_name = "Absolute Armory - Councelor PDW E"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/spiderrose
	disk_name = "H&S - Spider Rose PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/martin
	disk_name = "H&S - Martin PDW E"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energygun_martin,
		/datum/design/autolathe/cell/small/high,
	)

// ENERGY ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nemesis
	disk_name = "Absolute Armory - Nemesis Energy Crossbow"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/themis
	disk_name = "Absolute Armory - Themis Energy Crossbow"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/large_energy_crossbow,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/lightfall
	disk_name = "Absolute Armory - Lightfall Laser Gun"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/laser,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/valkirye
	disk_name = "Absolute Armory - Valkyrie Energy Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/sniperrifle,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/halicon
	disk_name = "Absolute Armory - Halicon Ion Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/ionrifle,
		/datum/design/autolathe/cell/medium/high,
	)

// PLASMA ARMS

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dominion
	disk_name = "Absolute Armory - Dominion Plasma Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/purger
	disk_name = "Absolute Armory - Purger Plasma Rifle"
	icon_state = "neotheology"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_destroyer,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/cassad
	disk_name = "H&S - Cassad Plasma Rifle"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun/pulse_cassad,
		/datum/design/autolathe/cell/medium/high,
	)