/datum/design/research/item/part
	build_type = AUTOLATHE | PROTOLATHE
	name_category = "component"
	category = CAT_STOCKPARTS

/datum/design/research/item/part/AssembleDesignDesc()
	if(!desc)
		desc = "A stock part used in the construction of various devices."

/datum/design/research/item/part/consolescreen
	build_path = /obj/item/weapon/stock_parts/console_screen
	materials = list(MATERIAL_GLASS = 3) //Balance it costs more for RnD to make

/datum/design/research/item/part/basic_capacitor
	build_path = /obj/item/weapon/stock_parts/capacitor

/datum/design/research/item/part/adv_capacitor
	build_path = /obj/item/weapon/stock_parts/capacitor/adv

/datum/design/research/item/part/super_capacitor
	build_path = /obj/item/weapon/stock_parts/capacitor/super

/datum/design/research/item/part/micro_mani
	build_path = /obj/item/weapon/stock_parts/manipulator

/datum/design/research/item/part/nano_mani
	build_path = /obj/item/weapon/stock_parts/manipulator/nano

/datum/design/research/item/part/pico_mani
	build_path = /obj/item/weapon/stock_parts/manipulator/pico

/datum/design/research/item/part/basic_matter_bin
	build_path = /obj/item/weapon/stock_parts/matter_bin

/datum/design/research/item/part/adv_matter_bin
	build_path = /obj/item/weapon/stock_parts/matter_bin/adv

/datum/design/research/item/part/super_matter_bin
	build_path = /obj/item/weapon/stock_parts/matter_bin/super

/datum/design/research/item/part/basic_micro_laser
	build_path = /obj/item/weapon/stock_parts/micro_laser

/datum/design/research/item/part/high_micro_laser
	build_path = /obj/item/weapon/stock_parts/micro_laser/high

/datum/design/research/item/part/ultra_micro_laser
	build_path = /obj/item/weapon/stock_parts/micro_laser/ultra

/datum/design/research/item/part/basic_sensor
	build_path = /obj/item/weapon/stock_parts/scanning_module

/datum/design/research/item/part/adv_sensor
	build_path = /obj/item/weapon/stock_parts/scanning_module/adv

/datum/design/research/item/part/phasic_sensor
	build_path = /obj/item/weapon/stock_parts/scanning_module/phasic

// Telecomm parts
/datum/design/research/item/part/subspace_ansible
	build_path = /obj/item/weapon/stock_parts/subspace/ansible
	category = "Bluespace Telecoms"

/datum/design/research/item/part/hyperwave_filter
	build_path = /obj/item/weapon/stock_parts/subspace/filter
	category = "Bluespace Telecoms"

/datum/design/research/item/part/subspace_amplifier
	build_path = /obj/item/weapon/stock_parts/subspace/amplifier
	category = "Bluespace Telecoms"

/datum/design/research/item/part/subspace_treatment
	build_path = /obj/item/weapon/stock_parts/subspace/treatment
	category = "Bluespace Telecoms"

/datum/design/research/item/part/subspace_analyzer
	build_path = /obj/item/weapon/stock_parts/subspace/analyzer
	category = "Bluespace Telecoms"

/datum/design/research/item/part/subspace_crystal
	build_path = /obj/item/weapon/stock_parts/subspace/crystal
	category = "Bluespace Telecoms"

/datum/design/research/item/part/subspace_transmitter
	build_path = /obj/item/weapon/stock_parts/subspace/transmitter
	category = "Bluespace Telecoms"

/datum/design/research/item/part/artificialbscrystal
	name = "Artificial BlueSpace Crystal"
	build_path = /obj/item/bluespace_crystal/artificial
	category = "Bluespace Telecoms"

// SMES coils
/datum/design/research/item/part/smes_coil
	build_path = /obj/item/weapon/stock_parts/smes_coil

/datum/design/research/item/part/smes_coil/weak
	build_path = /obj/item/weapon/stock_parts/smes_coil/weak

/datum/design/research/item/part/smes_coil/super_io
	build_path = /obj/item/weapon/stock_parts/smes_coil/super_io

/datum/design/research/item/part/smes_coil/super_capacity
	build_path = /obj/item/weapon/stock_parts/smes_coil/super_capacity

// RPED
/datum/design/research/item/part/RPED
	name = "Rapid Part Exchange Device"
	desc = "A special mechanical module made to store, sort, and apply standard machine parts."
	build_path = /obj/item/weapon/storage/part_replacer

/datum/design/research/item/part/RPED/mini
	name = "Mini Rapid Part Exchange Device"
	desc = "A special mechanical module made to store, sort, and apply standard machine parts. This one is compact, making it easier to handle, but holds less."
	build_path = /obj/item/weapon/storage/part_replacer/mini