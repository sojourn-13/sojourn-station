//-----------------------------------------------
//------------MEDICAL / SCIENCE------------------
//-----------------------------------------------

/datum/supply_pack/medical
	name = "Medical Crate"
	contains = list(/obj/item/weapon/storage/firstaid/regular,
					/obj/item/weapon/storage/firstaid/fire,
					/obj/item/weapon/storage/firstaid/toxin,
					/obj/item/weapon/storage/firstaid/o2,
					/obj/item/weapon/storage/firstaid/adv,
					/obj/item/weapon/reagent_containers/glass/bottle/antitoxin,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin,
					/obj/item/weapon/storage/box/syringes,
					/obj/item/weapon/storage/box/autoinjectors)
	cost = 800
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical crate"
	group = "Medical / Science"

/datum/supply_pack/medical_defib
	name = "Spare Defibrillator Crate"
	contains = list(/obj/item/device/defib_kit,
					/obj/item/weapon/cell/large/high)
	cost = 800
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical crate"
	group = "Medical / Science"

/datum/supply_pack/virus
	name = "Virus Sample Crate"
	contains = list(/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "virus sample crate"
	access = access_cmo
	group = "Medical / Science"

/datum/supply_pack/coolanttank
	name = "Coolant Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/coolanttank)
	cost = 1000
	containertype = /obj/structure/largecrate
	crate_name = "coolant tank crate"
	group = "Medical / Science"

/datum/supply_pack/phoron
	name = "Plasma Assembly Crate"
	contains = list(/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "plasma assembly crate"
	access = access_tox_storage
	group = "Medical / Science"

/datum/supply_pack/surgery
	name = "Surgery Crate"
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/weapon/tank/anesthetic,
					/obj/item/weapon/storage/firstaid/surgery)
	cost = 960
	containertype = /obj/structure/closet/crate/secure
	crate_name = "surgery crate"
	access = access_moebius
	group = "Medical / Science"

/datum/supply_pack/adv_surgery
	contraband = TRUE
	name = "Advanced Surgery Crate"
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/weapon/tank/anesthetic,
					/obj/item/weapon/storage/firstaid/surgery/traitor)
	cost = 1260
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
					/obj/item/weapon/storage/box/masks,
					/obj/item/weapon/storage/box/gloves)
	cost = 720
	containertype = /obj/structure/closet/crate
	crate_name = "sterile equipment crate"
	group = "Medical / Science"

/datum/supply_pack/bloodpacks
	name = "Blood Pack Variety Crate"
	cost = 1200
	contains = list(/obj/item/weapon/reagent_containers/blood/empty,
					/obj/item/weapon/reagent_containers/blood/empty,
					/obj/item/weapon/reagent_containers/blood/APlus,
					/obj/item/weapon/reagent_containers/blood/AMinus,
					/obj/item/weapon/reagent_containers/blood/BPlus,
					/obj/item/weapon/reagent_containers/blood/BMinus,
					/obj/item/weapon/reagent_containers/blood/OPlus,
					/obj/item/weapon/reagent_containers/blood/OMinus)
	containertype = /obj/structure/closet/crate/freezer
	crate_name = "blood freezer"
	group = "Medical / Science"

/datum/supply_pack/medical_stand
	name = "Medical Stand Crate"
	cost = 560
	contains = list(/obj/structure/medical_stand)
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical stand crate"
	group = "Medical / Science"

/datum/supply_pack/body_bags
	name = "Body Bags Crate"
	cost = 480
	contains = list(/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags)
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
		/obj/item/weapon/reagent_containers/glass/beaker/vial/nanites
	)
	cost = 1200
	crate_name = "raw nanites crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/uncapnanites
	name = "Raw Uncapped Nanites Crate"
	contains = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/uncapnanites
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
	cost = 8000
	crate_name = "diamond sheet crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate

/datum/supply_pack/research
	name = "Research Data crate"
	contains = list(/obj/item/weapon/computer_hardware/hard_drive/portable/research_points,
					/obj/item/weapon/computer_hardware/hard_drive/portable/research_points)
	cost = 4000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "Research data crate"
	access = access_moebius
	group = "Medical / Science"

/datum/supply_pack/discs
	contains = list(/obj/item/weapon/computer_hardware/hard_drive/portable/design,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design)
	name = "Empty Design Disk Crate"
	cost = 800
	crate_name ="Empty disks crate"
	group = "Miscellaneous"

/datum/supply_pack/rped
	contains = list(/obj/item/weapon/storage/part_replacer/mini)
	name = "Compact Rapid Part Exchange Device"
	cost = 250 //Its STILL cheaper to have rnd print this then buying
	crate_name ="compact rapid part exchange device crate"
	group = "Miscellaneous"