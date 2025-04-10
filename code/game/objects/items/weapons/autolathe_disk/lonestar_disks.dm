// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// Lonestar
/obj/item/pc_part/drive/disk/design/misc
	disk_name = "Lonestar Miscellaneous Pack"
	icon_state = "guild"
	license = 20
	designs = list(
		//Basic Tools
		/datum/design/autolathe/tool/hatchet,
		/datum/design/autolathe/tool/hammer,
		/datum/design/autolathe/tool/minihoe,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/tool/knife,
		/datum/design/autolathe/misc/heavyflashlight,
		/datum/design/autolathe/tool/crowbar,
		/datum/design/autolathe/tool/screwdriver,
		/datum/design/autolathe/tool/wirecutters,
		/datum/design/autolathe/tool/pliers,
		/datum/design/autolathe/tool/wrench,
		/datum/design/autolathe/tool/saw,
		/datum/design/autolathe/tool/multitool,
		/datum/design/autolathe/tool/pickaxe,
		/datum/design/autolathe/tool/shovel,
		/datum/design/autolathe/tool/spade,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/tool/ducttape/glue,
		/datum/design/autolathe/tool/weldertool,
		/datum/design/autolathe/tool/weldinggoggles,
		/datum/design/autolathe/tool/weldermask,
		/datum/design/autolathe/device/flamethrower,
		/datum/design/autolathe/device/proxsensor,
		/datum/design/autolathe/part/cable_coil,
		//Misc
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/misc/extinguisher,
		/datum/design/autolathe/misc/radio_headset,
		/datum/design/autolathe/misc/radio_bounced,
		/datum/design/autolathe/misc/ashtray,
		/datum/design/autolathe/container/drinkingglass,
		/datum/design/autolathe/container/drinkingglass_shot,
		/datum/design/autolathe/container/drinkingglass_pint,
		/datum/design/autolathe/container/drinkingglass_doble,
		/datum/design/autolathe/container/drinkingglass_mug,
		/datum/design/autolathe/container/drinkingglass_wine,
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
		/datum/design/autolathe/misc/floor_light = 0,
		/datum/design/autolathe/misc/tube = 0,
		/datum/design/autolathe/misc/bulb = 0,
		//Devices
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/device/analyzer,
		/datum/design/autolathe/device/plant_analyzer,
		/datum/design/autolathe/device/healthanalyzer,
		/datum/design/research/item/medical/mass_spectrometer,
		/datum/design/research/item/medical/reagent_scanner,
		/datum/design/research/item/medical/robot_scanner,
		/datum/design/autolathe/device/slime_scanner,
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
		//spare flare
		/datum/design/autolathe/gun/flare_gun = 5,
		/datum/design/autolathe/ammo/flare_shell = 2,
		/datum/design/autolathe/ammo/flare_shell_g = 2,
		/datum/design/autolathe/ammo/flare_shell_b = 2,
	)

/obj/item/pc_part/drive/disk/design/robustcells
	disk_name = "Lonestar Robustcells"
	icon_state = "guild"
	license = 8
	designs = list(
		/datum/design/autolathe/cell/large,
		/datum/design/autolathe/cell/large/high = 2,
		/datum/design/autolathe/cell/medium,
		/datum/design/autolathe/cell/medium/high = 2,
		/datum/design/autolathe/cell/small,
		/datum/design/autolathe/cell/small/high = 2,
		/datum/design/autolathe/part/cell_mout,
	)

/obj/item/pc_part/drive/disk/design/cargo
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
		/datum/design/autolathe/tool/pliers,
		/datum/design/autolathe/tool/wrench,
		/datum/design/autolathe/tool/saw,
		/datum/design/autolathe/tool/multitool,
		/datum/design/autolathe/tool/pickaxe,
		/datum/design/autolathe/tool/shovel,
		/datum/design/autolathe/tool/spade,
		/datum/design/autolathe/device/t_scanner,
		/datum/design/autolathe/tool/weldertool,
		/datum/design/autolathe/tool/weldinggoggles,
		/datum/design/autolathe/tool/weldermask,
		/datum/design/autolathe/device/flamethrower,
		/datum/design/autolathe/device/proxsensor,
		/datum/design/autolathe/part/cable_coil,
		//Misc
		/datum/design/autolathe/misc/flashlight,
		/datum/design/autolathe/tool/ducttape,
		/datum/design/autolathe/misc/extinguisher,
		/datum/design/autolathe/misc/radio_headset,
		/datum/design/autolathe/misc/radio_bounced,
		/datum/design/autolathe/misc/ashtray,
		/datum/design/autolathe/container/drinkingglass,
		/datum/design/autolathe/container/drinkingglass_shot,
		/datum/design/autolathe/container/drinkingglass_pint,
		/datum/design/autolathe/container/drinkingglass_doble,
		/datum/design/autolathe/container/drinkingglass_mug,
		/datum/design/autolathe/container/drinkingglass_wine,
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
		//Flare Gun
		/datum/design/autolathe/gun/flare_gun,
		/datum/design/autolathe/ammo/flare_shell,
		/datum/design/autolathe/ammo/flare_shell_g,
		/datum/design/autolathe/ammo/flare_shell_b,
	)

/obj/item/pc_part/drive/disk/design/janitor
	disk_name = "Lonestar Janitor Pack"
	icon_state = "guild"
	license = 8
	designs = list(
		/datum/design/autolathe/misc/floor_light = 0,
		/datum/design/autolathe/misc/tube = 0,
		/datum/design/autolathe/misc/bulb = 0,
		/datum/design/autolathe/misc/extinguisher = 0,
		/datum/design/autolathe/misc/trashbag,
		/datum/design/autolathe/container/bucket,
		/datum/design/autolathe/tool/isprayer = 2,
		/datum/design/autolathe/tool/mop,
		/datum/design/autolathe/device/hand_labeler,
		/datum/design/research/item/light_replacer,
		/datum/design/autolathe/part/cable_coil,
		)

/obj/item/pc_part/drive/disk/design/scav
	disk_name = "Prospectors Swag"
	icon_state = "scav"
	license = 6
	designs = list(
		/datum/design/autolathe/clothing/formanhat = 3,
		/datum/design/autolathe/clothing/formansuit = 3,
		/datum/design/autolathe/clothing/scav_armor,
		/datum/design/autolathe/clothing/scav_armor_void,
		/datum/design/autolathe/clothing/scav_helm_void = 0,
		/datum/design/autolathe/tool/manual_charger
		)

/obj/item/pc_part/drive/disk/design/scav/forman
	disk_name = "Prospectors Sweatshop"
	icon_state = "scav"
	license = -1
