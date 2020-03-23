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


// Asters
/obj/item/weapon/computer_hardware/hard_drive/portable/design/tools
	disk_name = "Lonestar Basic Tool Pack"
	icon_state = "guild"
	license = -1
	designs = list(
		/datum/design/autolathe/tool/hatchet,
		/datum/design/autolathe/tool/minihoe,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/tool/knife,
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/crowbar,
		/datum/design/autolathe/tool/screwdriver,
		/datum/design/autolathe/tool/wirecutters,
		/datum/design/autolathe/tool/pliers,
		/datum/design/autolathe/tool/wrench,
		/datum/design/autolathe/tool/hammer,
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
		/datum/design/autolathe/device/flamethrower
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/misc
	disk_name = "Lonestar Miscellaneous Pack"
	icon_state = "guild"
	license = -1
	designs = list(
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
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/devices
	disk_name = "Lonestar Devices and Instruments"
	icon_state = "guild"
	license = 10
	designs = list(
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
		/datum/design/research/item/light_replacer
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
	..()

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
	disk_name = "Technomancers LAT-018 Conveyors"
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


// Moebius
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

// NeoTheology
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns
	disk_name = "Absolute Armory of the Old Testament"
	icon_state = "neotheology"
	license = 3
	designs = list(
		/datum/design/autolathe/gun/mk58,
		/datum/design/autolathe/gun/mk58_wood,
		/datum/design/autolathe/gun/combat_shotgun,
		/datum/design/autolathe/gun/heavysniper,
		/datum/design/autolathe/gun/grenade_launcher,
		/datum/design/research/item/weapon/stunrevolver,
		/datum/design/autolathe/gun/taser,
		/datum/design/autolathe/gun/sniperrifle
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns
	disk_name = "Absolute Armory of the New Testament"
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

		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,
		/datum/design/bioprinter/bioimplant/osurgical,
		/datum/design/bioprinter/bioimplant/oscythe,
		/datum/design/autolathe/gun/nt_sprayer
	)

// Same as the other NT disk, minus the medical designs. Spawns in public access bioprinters.
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
	disk_name = "Soteria Bioprinter Pack"
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
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/security/hos
	disk_name = "Security Miscellaneous Factory"
	license = -1

// Frozen Star
/obj/item/weapon/computer_hardware/hard_drive/portable/design/fs_cheap_guns
	disk_name = "Heckler and Sons Basic Civilian Pack"
	icon_state = "frozenstar"
	license = 7
	designs = list(
		/datum/design/autolathe/gun/giskard,
		/datum/design/autolathe/gun/olivaw,
		/datum/design/autolathe/gun/clarissa,
		/datum/design/autolathe/gun/colt,
		/datum/design/autolathe/gun/revolver_detective,
		/datum/design/autolathe/gun/doublebarrel,
		/datum/design/autolathe/gun/pump_shotgun,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/fs_kinetic_guns //please, maintain general order (pistol>revolver>SMG>Other>Shotgun>GLs)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "Heckler and Sons Ultimate Protection Pack"
	icon_state = "frozenstar"
	license = 5
	designs = list(
		/datum/design/autolathe/gun/IH_sidearm, //pistols
		/datum/design/autolathe/gun/IH_colt,
		/datum/design/autolathe/gun/IH_machinepistol,
		/datum/design/autolathe/gun/lamia,
		/datum/design/autolathe/gun/scoped_lamia,
		/datum/design/autolathe/gun/deagle,
		/datum/design/autolathe/gun/revolver_consul, //revolvers
		/datum/design/autolathe/gun/revolver_deckard,
		/datum/design/autolathe/gun/revolver,
		/datum/design/autolathe/gun/idaho, //smgs
		/datum/design/autolathe/gun/IH_smg,
		/datum/design/autolathe/gun/atreides,
		/datum/design/autolathe/gun/smg_sol, //other
		/datum/design/autolathe/gun/smg_sol_rds,
		/datum/design/autolathe/gun/z8,
		/datum/design/autolathe/gun/IH_heavyrifle,
		/datum/design/autolathe/gun/ak47_fs,
		/datum/design/autolathe/gun/grenade_launcher_lenar, //GLs
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/fs_energy_guns
	disk_name = "Heckler and Sons Void Warrior Pack"
	icon_state = "frozenstar"
	license = 3
	designs = list(
		/datum/design/autolathe/gun/energygun_martin,
		/datum/design/autolathe/gun/energygun,
		/datum/design/autolathe/gun/pulse_cassad,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "Heckler and Sons Nonlethal Ammo Pack"
	icon_state = "frozenstar"
	license = 20
	designs = list(
		/datum/design/autolathe/ammo/mg_cl32_rubber, //pistol mags
		/datum/design/autolathe/ammo/magazine_mc9mm_rubber,
		/datum/design/autolathe/ammo/magazine_c45m_rubber,
		/datum/design/autolathe/ammo/magazine_a10mm_rubber,
		/datum/design/autolathe/ammo/mg_cl44_rubber,
		/datum/design/autolathe/ammo/mg_a50_rubber,
		/datum/design/autolathe/ammo/sl_c138_rubber, //speed loaders
		/datum/design/autolathe/ammo/sl_cl44_rubber,
		/datum/design/autolathe/ammo/smg9mm_rubber, //smg mags
		/datum/design/autolathe/ammo/c45smg_rubber,
		/datum/design/autolathe/ammo/SMG_sol_rubber, //other mags
		/datum/design/autolathe/ammo/a556_practice,
		/datum/design/autolathe/ammo/shotgun_blanks, //shells
		/datum/design/autolathe/ammo/shotgun_flash,
		/datum/design/autolathe/ammo/stunshell,
		/datum/design/autolathe/ammo/shotgun_beanbag
	)
	..()

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammoboxs
	name = "Heckler and Sons Nonlethal Ammo Box Pack"
	icon_state = "frozenstar"
	license = 30
	designs = list(
		/datum/design/autolathe/ammo/box_a10mm/rubber,
		/datum/design/autolathe/ammo/box_c9mm/flash,
		/datum/design/autolathe/ammo/box_c9mm/rubber,
		/datum/design/autolathe/ammo/box_c9mm/practice,
		/datum/design/autolathe/ammo/box_cl32/rubber,
		/datum/design/autolathe/ammo/box_c45/flash,
		/datum/design/autolathe/ammo/box_c45/rubber,
		/datum/design/autolathe/ammo/box_c45/practice,
		/datum/design/autolathe/ammo/box_c65mm/rubber,
		/datum/design/autolathe/ammo/box_c44/rubber,
		/datum/design/autolathe/ammo/box_c50/rubber,
	)
	..()

/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammo //please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
	disk_name = "Heckler and Sons Lethal Ammo Pack"
	icon_state = "frozenstar"
	license = 20
	designs = list(
		/datum/design/autolathe/ammo/mg_cl32_brute, //pistol mags
		/datum/design/autolathe/ammo/magazine_mc9mm,
		/datum/design/autolathe/ammo/magazine_c45m,
		/datum/design/autolathe/ammo/magazine_a10mm,
		/datum/design/autolathe/ammo/mg_cl44_brute,
		/datum/design/autolathe/ammo/mg_a50,
		/datum/design/autolathe/ammo/sl_c138_brute, //speed loaders
		/datum/design/autolathe/ammo/sl_cl44_brute,
		/datum/design/autolathe/ammo/magazine_sl357,
		/datum/design/autolathe/ammo/smg9mm_brute, //smg mags
		/datum/design/autolathe/ammo/c45smg_brute,
		/datum/design/autolathe/ammo/magazine_smg10mm,
		/datum/design/autolathe/ammo/SMG_sol_brute, //other mags
		/datum/design/autolathe/ammo/a556,
		/datum/design/autolathe/ammo/ih556,
		/datum/design/autolathe/ammo/c762_short,
		/datum/design/autolathe/ammo/c762_long,
		/datum/design/autolathe/ammo/shotgun_pellet, //shells
		/datum/design/autolathe/ammo/shotgun
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/lethal_ammoboxs
	name = "Heckler and Sons Lethal Ammo Boxes Pack"
	icon_state = "frozenstar"
	license = 30
	designs = list(
		/datum/design/autolathe/ammo/box_a762,
		/datum/design/autolathe/ammo/box_a10mm,
		/datum/design/autolathe/ammo/box_a9mm,
		/datum/design/autolathe/ammo/box_cl32,
		/datum/design/autolathe/ammo/box_c45,
		/datum/design/autolathe/ammo/box_c10x24,
		/datum/design/autolathe/ammo/box_a556,
		/datum/design/autolathe/ammo/box_c65mm,
		/datum/design/autolathe/ammo/box_c357,
		/datum/design/autolathe/ammo/box_c38,
		/datum/design/autolathe/ammo/box_c44,
		/datum/design/autolathe/ammo/box_c50,
		/datum/design/autolathe/ammo/box_a145,
	)
	..()

// Excelsior
/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior
	disk_name = "Excelsior Means of Production"
	desc = "Seize it."
	icon_state = "excelsior"
	license = -1
	designs = list(
		/datum/design/autolathe/circuit/autolathe_excelsior,
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/reconstructor_excelsior,
		/datum/design/autolathe/circuit/teleporter_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/autolathe/device/implanter,
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/ammo/magazine_mc9mm,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/c762_long,
		/datum/design/autolathe/ammo/box_a762,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/device/excelsiormine,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/cell/large/excelsior,
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/autolathe/device/excelbaton,
		/datum/design/autolathe/part/camera_assembly
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior_weapons
	disk_name = "Excelsior Means of Revolution"
	desc = "The back has a machine etching: \"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\""
	icon_state = "excelsior"
	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/ammo/magazine_mc9mm,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/c762_long,
		/datum/design/autolathe/ammo/box_a762,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/device/excelsiormine,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/clothing/excelsior_armor,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior_rusted
	disk_name = "Excelsior Means of Resolution"
	desc = "A little rusty, but you can still seize it."
	icon_state = "excelsior"

	license = 0
	designs = list(
		/datum/design/autolathe/circuit/autolathe_excelsior,
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/teleporter_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/sec/silencer,
		/datum/design/autolathe/ammo/magazine_mc9mm,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/c762_long,
		/datum/design/autolathe/ammo/box_a762,
		/datum/design/autolathe/device/excelsiormine,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/cell/large/excelsior,
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/autolathe/part/camera_assembly
	)

// greyson positronic
/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar
	disk_name = "Greyson Positronics Tool Pack"
	icon_state = "onestar"
	license = 2
	designs = list(
		/datum/design/autolathe/tool/crowbar_onestar,
		/datum/design/autolathe/tool/combi_driver_onestar,
		/datum/design/autolathe/tool/jackhammer_onestar,
		/datum/design/autolathe/tool/drill_onestar,
		/datum/design/autolathe/tool/weldertool_onestar
	)



/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Absolutism Bioprinter Production"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,
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
		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,
		/datum/design/bioprinter/bioimplant/osurgical,
		/datum/design/bioprinter/bioimplant/oscythe
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield
	disk_name = "Blackshield Sovereignty Pack"
	icon_state = "onestar"
	license = 10

	designs = list(
		/datum/design/autolathe/gun/ten,
		/datum/design/autolathe/gun/ten_dark,
		/datum/design/autolathe/gun/omnirifle,//rifles
		/datum/design/autolathe/gun/standard_omnirifle,
		/datum/design/autolathe/gun/fancy_omnirifle,
		/datum/design/autolathe/gun/scoped_omnirifle,
		/datum/design/autolathe/gun/omnicarbine,
		/datum/design/autolathe/gun/rds_omnicarbine,
		/datum/design/autolathe/device/gps,//misc gear
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/tacknife,
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/ammo/magazine_a10mm,//ammo
		/datum/design/autolathe/ammo/magazine_a10mm_rubber,
		/datum/design/autolathe/ammo/magazine_c10mm,
		/datum/design/autolathe/ammo/magazine_c10mm_rubber,
		/datum/design/autolathe/ammo/magazine_c10mm_hv,
		/datum/design/autolathe/ammo/magazine_c10mm_lethal,
		/datum/design/autolathe/ammo/box_c10mm,
		/datum/design/autolathe/ammo/box_c10mm/lethal,
		/datum/design/autolathe/ammo/box_c10mm/rubber,
		/datum/design/autolathe/ammo/box_c10mm/hv
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