/obj/machinery/vending/medical
	name = "MiniPharma Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	pixel_x = -3
	icon_deny = "med-deny"
	req_access = list(access_medical_equip)
	shut_up = 1 // Products are all free please stop offering them
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!;You do know how to use those, right?"
	products = list(/obj/item/reagent_containers/glass/bottle/antitoxin = 4,
					/obj/item/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/reagent_containers/glass/bottle/stoxin = 4,
					/obj/item/reagent_containers/glass/bottle/toxin = 4,
					/obj/item/reagent_containers/syringe/spaceacillin = 4,
					/obj/item/reagent_containers/syringe/adrenaline = 4,
					/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 10,
					/obj/item/stack/medical/splint = 30,
					/obj/item/reagent_containers/syringe = 12,
					/obj/item/device/scanner/health = 5,
					/obj/item/reagent_containers/glass/beaker = 4,
					/obj/item/reagent_containers/dropper = 2,
					/obj/item/stack/medical/bruise_pack/advanced = 3,
					/obj/item/stack/medical/ointment/advanced = 3,
					/obj/item/stack/medical/splint = 2)
	contraband = list(/obj/item/reagent_containers/pill/tox = 3,
						/obj/item/reagent_containers/pill/stox = 4,
						/obj/item/reagent_containers/pill/antitox = 6)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	auto_price = FALSE
	custom_vendor = TRUE // Chemists can load it for MDs
	can_stock = list(/obj/item/reagent_containers/glass, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/pill, /obj/item/stack/medical, /obj/item/bodybag, /obj/item/device/scanner/health, /obj/item/reagent_containers/hypospray, /obj/item/storage/pill_bottle)
	vendor_department = DEPARTMENT_MEDICAL
	give_discounts = FALSE
	give_discount_points = FALSE

/obj/machinery/vending/wallmed
	name = "MicroMed"
	desc = "Wall-mounted medical dispenser."
	density = FALSE //It is wall-mounted, and thus, not dense. --Superxpdude
	icon_state = "wallmed"
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	icon_deny = "wallmed-deny"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;I hope you know what you're doing."

	products = list(
		/obj/item/stack/medical/bruise_pack = 6,
		/obj/item/stack/medical/bruise_pack/soteria = 6,
		/obj/item/stack/medical/ointment = 6,
		/obj/item/stack/medical/ointment/soteria = 6,
		/obj/item/stack/medical/splint = 10,

		/obj/item/reagent_containers/hypospray/autoinjector = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 20,
		/obj/item/reagent_containers/hypospray/autoinjector/kelotane = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/dexalin = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/tramadol = 10,

		/obj/item/device/scanner/health = 3
		)
	contraband = list(
		/obj/item/reagent_containers/syringe/antitoxin = 2,
		/obj/item/reagent_containers/syringe/spaceacillin = 2,
		/obj/item/reagent_containers/pill/tox = 5,
		/obj/item/stack/medical/bruise_pack/handmade = 10,
		/obj/item/stack/medical/ointment/handmade  = 10,
		/obj/item/stack/medical/splint/improvised = 5
		)
	prices = list(
		/obj/item/device/scanner/health = 50,

		/obj/item/stack/medical/bruise_pack/handmade = 25,
		/obj/item/stack/medical/bruise_pack = 50,
		/obj/item/stack/medical/bruise_pack/soteria = 700,
		/obj/item/stack/medical/ointment/handmade  = 25,
		/obj/item/stack/medical/ointment = 35,
		/obj/item/stack/medical/ointment/soteria = 700,
		/obj/item/stack/medical/splint/improvised = 5,
		/obj/item/stack/medical/splint = 10,

		/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 50,
		/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 75,
		/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 50,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 20,
		/obj/item/reagent_containers/hypospray/autoinjector/kelotane = 250,
		/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = 250,
		/obj/item/reagent_containers/hypospray/autoinjector/dexalin = 200,
		/obj/item/reagent_containers/hypospray/autoinjector/tramadol = 500,

		/obj/item/reagent_containers/pill/tox = 100
		)
	custom_vendor = TRUE // Chemists can load it for customers
	can_stock = list(/obj/item/reagent_containers/glass, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/pill, /obj/item/stack/medical, /obj/item/bodybag, /obj/item/device/scanner/health, /obj/item/reagent_containers/hypospray, /obj/item/storage/pill_bottle)
	vendor_department = DEPARTMENT_MEDICAL

/obj/machinery/vending/wallmed/lobby
	products = list(
		/obj/item/device/scanner/health = 6,

		/obj/item/stack/medical/bruise_pack = 6,
		/obj/item/stack/medical/bruise_pack/soteria = 4,
		/obj/item/stack/medical/bruise_pack/advanced = 2,
		/obj/item/stack/medical/ointment = 6,
		/obj/item/stack/medical/ointment/soteria = 4,
		/obj/item/stack/medical/ointment/advanced = 2,
		/obj/item/storage/firstaid/regular/si = 2,

		/obj/item/stack/medical/splint = 20, //Legit dosnt heal, stacks on 1 cuz scam
		/obj/item/stack/nanopaste = 4,

		/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 10,
		/obj/item/reagent_containers/syringe/antitoxin = 5,
		/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 10,
		/obj/item/reagent_containers/syringe/tricordrazine = 5,
		/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 10,
		/obj/item/reagent_containers/syringe/spaceacillin = 5,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 20,

		/obj/item/reagent_containers/hypospray/autoinjector/kelotane = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/dexalin = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/tramadol = 10,
		/obj/item/reagent_containers/hypospray/autoinjector/antirad = 10,

		/obj/item/implantcase/death_alarm = 4,
		/obj/item/implantcase/death_alarm/psionic = 2,
		/obj/item/implanter = 4,

		/obj/item/device/defib_kit = 2
		)
	contraband = list(
		/obj/item/reagent_containers/hypospray/autoinjector/hyperzine = 5,
		/obj/item/reagent_containers/hypospray/autoinjector/drugs = 10,
		/obj/item/stack/medical/bruise_pack/handmade = 10,
		/obj/item/stack/medical/ointment/handmade  = 10,
		/obj/item/stack/medical/splint/improvised = 5
		)
	prices = list(
		/obj/item/device/scanner/health = 50,

		/obj/item/stack/medical/bruise_pack/handmade = 25,
		/obj/item/stack/medical/bruise_pack = 50,
		/obj/item/stack/medical/bruise_pack/advanced = 100,
		/obj/item/stack/medical/bruise_pack/soteria = 250,
		/obj/item/stack/medical/ointment/handmade  = 25,
		/obj/item/stack/medical/ointment = 35,
		/obj/item/stack/medical/ointment/advanced = 100,
		/obj/item/stack/medical/ointment/soteria = 250,
		/obj/item/stack/medical/splint/improvised = 5,
		/obj/item/storage/firstaid/regular/si = 700,
		/obj/item/stack/medical/splint = 10,
		/obj/item/stack/nanopaste = 300,

		/obj/item/reagent_containers/hypospray/autoinjector/antitoxin = 50,
		/obj/item/reagent_containers/syringe/antitoxin = 100,
		/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = 75,
		/obj/item/reagent_containers/syringe/tricordrazine = 125,
		/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 50,
		/obj/item/reagent_containers/syringe/spaceacillin = 100,
		/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 20,

		/obj/item/reagent_containers/hypospray/autoinjector/kelotane = 250,
		/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = 250,
		/obj/item/reagent_containers/hypospray/autoinjector/dexalin = 200,
		/obj/item/reagent_containers/hypospray/autoinjector/tramadol = 500,
		/obj/item/reagent_containers/hypospray/autoinjector/antirad = 400,

		/obj/item/implantcase/death_alarm = 25,
		/obj/item/implantcase/death_alarm/psionic = 75,
		/obj/item/implanter = 25,

		/obj/item/device/defib_kit = 750,

		/obj/item/reagent_containers/hypospray/autoinjector/hyperzine = 100,
		/obj/item/reagent_containers/hypospray/autoinjector/drugs = 100
		)
	auto_price = FALSE
