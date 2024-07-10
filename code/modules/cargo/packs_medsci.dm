//-----------------------------------------------
//------------MEDICAL / SCIENCE------------------
//-----------------------------------------------

/datum/supply_pack/medical
	name = "Medical Crate"
	contains = list(/obj/item/storage/firstaid/regular,
					/obj/item/storage/firstaid/fire,
					/obj/item/storage/firstaid/toxin,
					/obj/item/storage/firstaid/o2,
					/obj/item/storage/firstaid/adv,
					/obj/item/reagent_containers/glass/bottle/antitoxin,
					/obj/item/reagent_containers/glass/bottle/inaprovaline,
					/obj/item/reagent_containers/glass/bottle/stoxin,
					/obj/item/storage/box/syringes,
					/obj/item/storage/box/autoinjectors)
	cost = 500
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical crate"
	group = "Medical / Science"

/datum/supply_pack/medical_defib
	name = "Spare Defibrillator Crate"
	contains = list(/obj/item/device/defib_kit,
					/obj/item/cell/large/high)
	cost = 300
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical crate"
	group = "Medical / Science"

/datum/supply_pack/coolanttank
	name = "Coolant Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/coolanttank)
	cost = 100
	containertype = /obj/structure/largecrate
	crate_name = "coolant tank crate"
	group = "Medical / Science"

/datum/supply_pack/phoron
	name = "Plasma Assembly Crate"
	contains = list(/obj/item/tank/plasma,
					/obj/item/tank/plasma,
					/obj/item/tank/plasma,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer)
	cost = 120
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "plasma assembly crate"
	access = access_tox_storage
	group = "Medical / Science"

/datum/supply_pack/surgery
	name = "Surgery Crate"
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/tank/anesthetic,
					/obj/item/storage/firstaid/surgery)
	cost = 150
	containertype = /obj/structure/closet/crate/secure
	crate_name = "surgery crate"
	access = access_moebius
	group = "Medical / Science"

/datum/supply_pack/adv_surgery
	contraband = TRUE
	name = "Advanced Surgery Crate"
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/tank/anesthetic,
					/obj/item/storage/firstaid/surgery/traitor)
	cost = 300
	containertype = /obj/structure/closet/crate/secure
	crate_name = "surgery crate"
	access = access_moebius
	group = "Medical / Science"

/datum/supply_pack/sterile
	name = "Sterile Equipment Crate"
	contains = list(/obj/item/clothing/under/scrubs/green,
					/obj/item/clothing/under/scrubs/green,
					/obj/item/clothing/head/surgery/green,
					/obj/item/clothing/head/surgery/green,
					/obj/item/storage/box/masks,
					/obj/item/storage/box/gloves)
	cost = 150
	containertype = /obj/structure/closet/crate
	crate_name = "sterile equipment crate"
	group = "Medical / Science"

/datum/supply_pack/bloodpacks
	name = "Blood Pack Variety Crate"
	cost = 200
	contains = list(/obj/item/reagent_containers/blood/empty,
					/obj/item/reagent_containers/blood/empty,
					/obj/item/reagent_containers/blood/APlus,
					/obj/item/reagent_containers/blood/AMinus,
					/obj/item/reagent_containers/blood/BPlus,
					/obj/item/reagent_containers/blood/BMinus,
					/obj/item/reagent_containers/blood/OPlus,
					/obj/item/reagent_containers/blood/OMinus)
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "blood freezer"
	group = "Medical / Science"

/datum/supply_pack/medical_stand
	name = "Medical Stand Crate"
	cost = 120
	contains = list(/obj/structure/medical_stand)
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical stand crate"
	group = "Medical / Science"

/datum/supply_pack/body_bags
	name = "Body Bags Crate"
	cost = 100
	contains = list(/obj/item/storage/box/bodybags,
					/obj/item/storage/box/bodybags,
					/obj/item/storage/box/bodybags,
					/obj/item/storage/box/bodybags)
	crate_name = "body bags crate"
	group = "Medical / Science"

/datum/supply_pack/suspension_gen
	name = "Suspension Field Generator Crate"
	cost = 2000
	contains = list(/obj/machinery/suspension_gen)
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "suspension field generator crate"
	group = "Medical / Science"

/datum/supply_pack/nanites
	name = "Raw Nanites Crate"
	contains = list(
		/obj/item/reagent_containers/glass/beaker/vial/nanites
	)
	cost = 1200
	crate_name = "raw nanites crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/uncapnanites
	name = "Raw Uncapped Nanites Crate"
	contains = list(
		/obj/item/reagent_containers/glass/beaker/vial/uncapnanites
	)
	cost = 1600
	crate_name = "raw uncapped nanites crate"
	group = "Medical / Science"
	contraband = TRUE
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/diamondsheets
	name = "Diamond sheet crate"
	contains = list(
		/obj/item/stack/material/diamond/tenstack
	)
	cost = 4000
	crate_name = "diamond sheet crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate

/datum/supply_pack/research
	name = "Research Data crate"
	contains = list(/obj/item/computer_hardware/hard_drive/portable/research_points,
					/obj/item/computer_hardware/hard_drive/portable/research_points)
	cost = 4000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Research data crate"
	access = access_moebius
	group = "Medical / Science"

/datum/supply_pack/discs
	contains = list(/obj/item/computer_hardware/hard_drive/portable/design,
					/obj/item/computer_hardware/hard_drive/portable/design,
					/obj/item/computer_hardware/hard_drive/portable/design,
					/obj/item/computer_hardware/hard_drive/portable/design,
					/obj/item/computer_hardware/hard_drive/portable/design,
					/obj/item/computer_hardware/hard_drive/portable/design)
	name = "Empty Design Disk Crate"
	cost = 400
	crate_name ="Empty disks crate"
	group = "Miscellaneous"

/datum/supply_pack/rped
	contains = list(/obj/item/storage/part_replacer/mini)
	name = "Compact Rapid Part Exchange Device"
	cost = 550 //Its STILL cheaper to have rnd print this then buying
	crate_name ="compact rapid part exchange device crate"
	group = "Miscellaneous"

/datum/supply_pack/hydrogen
	name = "Cryo-Sealed Hydrogen Cells"
	contains = list(
		/obj/item/hydrogen_fuel_cell,
		/obj/item/hydrogen_fuel_cell,
		/obj/item/hydrogen_fuel_cell,
		/obj/item/hydrogen_fuel_cell
	)
	cost = 600 // Not cheap, but basically 1$ per unit of hydrogen-plasma, this crate contain 600 hydrogen-plasma
	crate_name = "cryo-sealed hydrogen crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate

/datum/supply_pack/hydrogen_pack
	name = "Cryo-Sealed Hydrogen Pack"
	contains = list(
		/obj/item/hydrogen_fuel_cell/backpack
	)
	cost = 5000 // Not cheap, but basically 1$ per unit of hydrogen-plasma, this crate contain 5000 hydrogen-plasma
	crate_name = "cryo-sealed hydrogen crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate
