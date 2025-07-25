// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1

// Soteria
/obj/item/pc_part/drive/disk/design/medical
	disk_name = "Soteria Medical Designs"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/autolathe/gun/syringe_gun = 4,
		/datum/design/autolathe/misc/penflashlight,
		/datum/design/autolathe/tool/scalpel,
		/datum/design/autolathe/tool/circularsaw,
		/datum/design/autolathe/tool/bonegel,
		/datum/design/autolathe/tool/retractor,
		/datum/design/autolathe/tool/cautery,
		/datum/design/autolathe/tool/hemostat,
		/datum/design/autolathe/tool/bonesetter,
		/datum/design/research/item/fire_kit,
		/datum/design/research/item/regular_kit,
		/datum/design/research/item/toxin_kit,
		/datum/design/research/item/o2_kit,
		/datum/design/research/item/adv_kit,
		/datum/design/autolathe/container/syringe,
		/datum/design/autolathe/container/syringe/large = 2,
		/datum/design/autolathe/container/vial,
		/datum/design/autolathe/container/beaker,
		/datum/design/autolathe/container/beaker_large,
		/datum/design/autolathe/container/pill_bottle,
		/datum/design/autolathe/container/spray,
		/datum/design/autolathe/device/implanter,
		/datum/design/autolathe/container/syringegun_ammo,
		/datum/design/autolathe/misc/bodybag,
		/datum/design/research/item/medical/autopsy_scanner,
		/datum/design/research/item/medical/roller_bed,
		/datum/design/research/item/weapon/weapon_upgrade/dnalock_mod,
		/datum/design/autolathe/container/hcase_med
	)

/obj/item/pc_part/drive/disk/design/medical/advanced
	disk_name = "Soteria Advanced Medical Designs"
	icon_state = "moebius"
	license = 10
	designs = list(
		/datum/design/autolathe/gun/syringe_gun,
		/datum/design/autolathe/misc/penflashlight,
		/datum/design/autolathe/container/syringe,
		/datum/design/autolathe/container/syringe/large,
		/datum/design/autolathe/container/vial = 0,
		/datum/design/autolathe/container/beaker,
		/datum/design/autolathe/container/beaker_large,
		/datum/design/autolathe/container/pill_bottle = 0,
		/datum/design/autolathe/container/spray,
		/datum/design/autolathe/container/syringegun_ammo,
		/datum/design/research/item/fire_kit,
		/datum/design/research/item/regular_kit,
		/datum/design/research/item/toxin_kit,
		/datum/design/research/item/o2_kit,
		/datum/design/research/item/adv_kit,
		/datum/design/research/item/si_kit,
		/datum/design/research/item/medical/cryobag,
		/datum/design/research/item/medical/compact_roller_bed,
		/datum/design/research/item/medical/adv_mass_spectrometer,
		/datum/design/research/item/medical/adv_reagent_scanner,
		/datum/design/research/item/medical/defibs = 3,
		/datum/design/research/item/medical/red,
		/datum/design/research/item/scalpel_laser,
		/datum/design/autolathe/tool/scalpel/advanced,
		/datum/design/research/item/bonesetter_adv,
		/datum/design/research/item/cautery_adv,
		/datum/design/research/item/hemostat_adv,
		/datum/design/research/item/retractor_adv,
		/datum/design/research/item/medsaw_circular,
		/datum/design/research/item/drill_s_adv,
		/datum/design/research/item/bonegel,
		/datum/design/research/item/fiber_medical,
		/datum/design/research/item/medical/nanopaste = 2,
		/datum/design/research/item/clothing/health = 2,
		/datum/design/autolathe/clothing/si_xenobio_hood,
		/datum/design/autolathe/clothing/si_xenobio_suit,
		/datum/design/research/item/weapon/weapon_upgrade/dnalock_mod,
		/datum/design/autolathe/container/hcase_med
	)


/obj/item/pc_part/drive/disk/design/medical/cmo
	disk_name = "Soteria Medical Factory"
	license = -1 //Same disk, but for the CBO exclusively with endless uses.

/obj/item/pc_part/drive/disk/design/medical/advanced/cmo
	disk_name = "Soteria Advanced Medical Designs Factory"
	license = -1 //Same disk, but for the CBO exclusively with endless uses.

/obj/item/pc_part/drive/disk/design/medical/surgery
	disk_name = "Soteria Standard Organs"
	license = -1
	designs = list(
		/datum/design/organ/heart,
		/datum/design/organ/lungs,
		/datum/design/organ/kidney_left,
		/datum/design/organ/kidney_right,
		/datum/design/organ/liver,
		/datum/design/organ/eyes,
		/datum/design/organ/nerves,
		/datum/design/organ/muscle,
		/datum/design/organ/blood_vessel
	)

/obj/item/pc_part/drive/disk/design/surgery
	disk_name = "Back Alley Organs"
	icon_state = "moebius"

	license = 5
	designs = list(
		/datum/design/organ/back_alley/ex_lungs,
		/datum/design/organ/back_alley/huge_heart,
		/datum/design/organ/back_alley/big_liver,
		/datum/design/organ/back_alley/hyper_nerves,
		/datum/design/organ/back_alley/super_muscle,
		/datum/design/organ/back_alley/ex_blood_vessel
	)

/obj/item/pc_part/drive/disk/design/computer
	disk_name = "Soteria Computer Parts"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/autolathe/computer_part/frame_pda,
		/datum/design/autolathe/computer_part/frame_tablet,
		/datum/design/autolathe/computer_part/frame_laptop,
		/datum/design/autolathe/computer_part/frame_wristmount,
		/datum/design/research/item/computer_part/disk/micro,
		/datum/design/research/item/computer_part/disk/small,
		/datum/design/research/item/computer_part/disk/normal,
		/datum/design/research/item/computer_part/disk/advanced = 2,
		/datum/design/research/item/computer_part/cpu/basic,
		/datum/design/research/item/computer_part/cpu/basic/small,
		/datum/design/research/item/computer_part/cpu/adv = 2,
		/datum/design/research/item/computer_part/cpu/adv/small,
		/datum/design/research/item/computer_part/netcard/basic,
		/datum/design/research/item/computer_part/netcard/advanced = 2,
		/datum/design/research/item/computer_part/netcard/wired,
		/datum/design/research/item/computer_part/cardslot,
		/datum/design/research/item/computer_part/teslalink,
		/datum/design/research/item/computer_part/portabledrive/basic,
		/datum/design/research/item/computer_part/portabledrive/normal = 2,
		/datum/design/research/item/computer_part/printer,
		/datum/design/research/item/computer_part/led,
		/datum/design/research/item/computer_part/led/adv = 2,
		/datum/design/research/item/omnitranslator_handheld,
		/datum/design/autolathe/part/cable_coil,
		/datum/design/autolathe/device/camera,
		/datum/design/autolathe/device/camerafilm,
		/datum/design/autolathe/computer_part/gps,
		/datum/design/autolathe/part/heatsink = 2,
		/datum/design/autolathe/part/motor = 2,
		/datum/design/autolathe/part/dampener = 3,
		/datum/design/autolathe/part/cell_mout = 2,
		/datum/design/autolathe/container/hcase_parts,
		/datum/design/autolathe/computer_part/scanner/paper,
		/datum/design/autolathe/computer_part/scanner/atmos,
	)

/obj/item/pc_part/drive/disk/design/computer/rd
	disk_name = "Soteria Computer Factory"
	license = -1

/obj/item/pc_part/drive/disk/design/rped
	disk_name = "Soteria RnD Stock Parts Designs"
	icon_state = "moebius"
	license = 20
	designs = list(
		/datum/design/research/item/part/RPED = 2,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/research/item/part/adv_capacitor = 2,
		/datum/design/research/item/part/super_capacitor = 3,
		/datum/design/research/item/part/micro_mani,
		/datum/design/research/item/part/nano_mani = 2,
		/datum/design/research/item/part/pico_mani = 3,
		/datum/design/research/item/part/basic_matter_bin,
		/datum/design/research/item/part/adv_matter_bin = 2,
		/datum/design/research/item/part/super_matter_bin = 3,
		/datum/design/research/item/part/basic_micro_laser,
		/datum/design/research/item/part/high_micro_laser = 2,
		/datum/design/research/item/part/ultra_micro_laser = 3,
		/datum/design/research/item/part/basic_sensor,
		/datum/design/research/item/part/adv_sensor = 2,
		/datum/design/research/item/part/phasic_sensor = 3,
		/datum/design/research/item/omnitranslator_handheld,
		/datum/design/autolathe/part/cable_coil,
		/datum/design/autolathe/part/igniter,
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_infra,
		/datum/design/autolathe/part/timer,
		/datum/design/autolathe/part/voice_analyzer,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/autolathe/part/camera_assembly,
		/datum/design/autolathe/container/hcase_parts,
		/datum/design/autolathe/container/hcase_engi,
		/datum/design/autolathe/part/consolescreen
	)

/obj/item/pc_part/drive/disk/design/rped/rd
	disk_name = "Soteria Stock Parts Factory"
	license = -1

/obj/item/pc_part/drive/disk/design/xenobio
	disk_name = "Soteria Xenobio Equipment Designs"
	icon_state = "moebius"
	license = 10
	designs = list(
		/datum/design/research/item/weapon/chemsprayer = 2,
		/datum/design/research/item/weapon/large_grenade,
		/datum/design/autolathe/container/syringe,
		/datum/design/research/item/weapon/slimebaton = 2,
		/datum/design/research/item/weapon/slimegun = 3,
		/datum/design/autolathe/clothing/si_xenobio_hood,
		/datum/design/autolathe/clothing/si_xenobio_suit
	)

/obj/item/pc_part/drive/disk/design/xenobio/rd
	disk_name = "Soteria Xenobio Equipment Factory"
	license = -1
