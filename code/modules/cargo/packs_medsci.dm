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
	cost = 1000
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical crate"
	group = "Medical / Science"

/datum/supply_pack/virus
	name = "Virus Sample Crate"
	contains = list(/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random,
					/obj/item/weapon/virusdish/random)
	cost = 2500
	containertype = /obj/structure/closet/crate/secure
	crate_name = "virus sample crate"
	access = access_cmo
	group = "Medical / Science"

/datum/supply_pack/coolanttank
	name = "Coolant Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/coolanttank)
	cost = 1600
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
	cost = 1500
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "plasma assembly crate"
	access = access_tox_storage
	group = "Medical / Science"

/datum/supply_pack/surgery
	name = "Surgery Crate"
	contains = list(/obj/item/weapon/tool/cautery,
					/obj/item/weapon/tool/surgicaldrill,
					/obj/item/clothing/mask/breath/medical,
					/obj/item/weapon/tank/anesthetic,
					/obj/item/weapon/tool/hemostat,
					/obj/item/weapon/tool/scalpel,
					/obj/item/weapon/tool/retractor,
					/obj/item/weapon/tool/bonesetter,
					/obj/item/weapon/tool/saw/circular)
	cost = 1200
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
	cost = 900
	containertype = /obj/structure/closet/crate
	crate_name = "sterile equipment crate"
	group = "Medical / Science"

/datum/supply_pack/bloodpacks
	name = "Blood Pack Variety Crate"
	cost = 1500
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
	cost = 700
	contains = list(/obj/structure/medical_stand)
	containertype = /obj/structure/closet/crate/medical
	crate_name = "medical stand crate"
	group = "Medical / Science"

/datum/supply_pack/body_bags
	name = "Body Bags Crate"
	cost = 600
	contains = list(/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags,
					/obj/item/weapon/storage/box/bodybags)
	crate_name = "body bags crate"
	group = "Medical / Science"

/datum/supply_pack/suspension_gen
	name = "Suspension Field Generator Crate"
	cost = 2500
	contains = list(/obj/machinery/suspension_gen)
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "suspension field generator crate"
	group = "Medical / Science"

/datum/supply_pack/nanites
	name = "Raw Nanites Crate"
	contains = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/nanites
	)
	cost = 1500
	crate_name = "raw nanites crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/uncapnanites
	name = "Raw Uncapped Nanites Crate"
	contains = list(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/uncapnanites
	)
	cost = 2000
	crate_name = "raw uncapped nanites crate"
	group = "Medical / Science"
	contraband = TRUE
	containertype = /obj/structure/closet/crate/medical

/datum/supply_pack/diamondsheets
	name = "Diamond sheet crate"
	contains = list(
		/obj/item/stack/material/diamond/tenstack
	)
	cost = 10000
	crate_name = "diamond sheet crate"
	group = "Medical / Science"
	containertype = /obj/structure/closet/crate