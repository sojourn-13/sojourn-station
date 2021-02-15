/obj/machinery/vending/medical
	name = "MiniPharma Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	icon_deny = "med-deny"
	req_access = list(access_medical_equip)
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!;You do know how to use those, right?"
	products = list(/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/toxin = 4,
					/obj/item/weapon/reagent_containers/syringe/spaceacillin = 4,
					/obj/item/weapon/reagent_containers/syringe = 12,
					/obj/item/device/scanner/health = 5,
					/obj/item/weapon/reagent_containers/glass/beaker = 4,
					/obj/item/weapon/reagent_containers/dropper = 2,
					/obj/item/stack/medical/advanced/bruise_pack = 3,
					/obj/item/stack/medical/advanced/ointment = 3,
					/obj/item/stack/medical/splint = 2)
	contraband = list(/obj/item/weapon/reagent_containers/pill/tox = 3,
						/obj/item/weapon/reagent_containers/pill/stox = 4,
						/obj/item/weapon/reagent_containers/pill/antitox = 6)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	auto_price = FALSE

/obj/machinery/vending/wallmed
	name = "MicroMed"
	desc = "Wall-mounted medical dispenser."
	density = FALSE //It is wall-mounted, and thus, not dense. --Superxpdude
	icon_state = "wallmed"
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	icon_deny = "wallmed-deny"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;I hope you know what you're doing."

	products = list(
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector = 4,
		/obj/item/device/scanner/health = 1
		)
	contraband = list(
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 2,
		/obj/item/weapon/reagent_containers/syringe/spaceacillin = 2,
		/obj/item/weapon/reagent_containers/pill/tox = 1
		)
	auto_price = FALSE

/obj/machinery/vending/wallmed/minor
	products = list(
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector = 4,
		/obj/item/device/scanner/health = 1
		)
	contraband = list(
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 2,
		/obj/item/weapon/reagent_containers/syringe/spaceacillin = 2,
		/obj/item/weapon/reagent_containers/pill/tox = 1
		)
	auto_price = FALSE

/obj/machinery/vending/wallmed/lobby
	products = list(
		/obj/item/device/scanner/health = 6,

		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/stack/medical/advanced/bruise_pack = 1,
		/obj/item/stack/medical/advanced/ointment = 1,
		/obj/item/stack/nanopaste = 1,

		/obj/item/weapon/reagent_containers/hypospray/autoinjector/antitoxin = 5,
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/tricordrazine = 5,
		/obj/item/weapon/reagent_containers/syringe/tricordrazine = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/spaceacillin = 1,
		/obj/item/weapon/reagent_containers/syringe/spaceacillin = 1,

		/obj/item/weapon/implantcase/death_alarm = 2,
		/obj/item/weapon/implanter = 2
		)
	contraband = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/hyperzine = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/drugs = 2,
		)
	prices = list(
		/obj/item/device/scanner/health = 50,

		/obj/item/stack/medical/bruise_pack = 50, /obj/item/stack/medical/ointment = 35,
		/obj/item/stack/medical/advanced/bruise_pack = 100, /obj/item/stack/medical/advanced/ointment = 100,
		/obj/item/stack/nanopaste = 300,

		/obj/item/weapon/reagent_containers/hypospray/autoinjector/antitoxin = 50,
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/tricordrazine = 75,
		/obj/item/weapon/reagent_containers/syringe/tricordrazine = 125,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/spaceacillin = 50,
		/obj/item/weapon/reagent_containers/syringe/spaceacillin = 100,

		/obj/item/weapon/implantcase/death_alarm = 25,
		/obj/item/weapon/implanter = 25,

		/obj/item/weapon/reagent_containers/hypospray/autoinjector/hyperzine = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/drugs = 100,
		)
	vendor_department = DEPARTMENT_MEDICAL
	auto_price = FALSE
