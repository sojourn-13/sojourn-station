/datum/trade_station/illegaltrader
	name_pool = list(
		"NSTB 'Arau'" = "Nefarious-Space Trade Beacon 'Arau'. The trade beacon is sending an automated message: \"Hey, buddy. Interested in our 'legal' goods?\""
	)
	uid = "illegal1"
	tree_x = 0.62
	tree_y = 0.5
	spawn_always = TRUE
	markup = UNCOMMON_GOODS
	offer_limit = 20
	base_income = 1600
	wealth = 0
	hidden_inv_threshold = 2000
	recommendation_threshold = 3500
	stations_recommended = list("illegal2", "marqua")
	icon_states = list("oberth_cruiser", "object")
	recommendations_needed = 3
	inventory = list(
		"Syndicate Gear" = list(
			/obj/item/clothing/under/syndicate,
			/obj/item/storage/toolbox/syndicate = custom_good_amount_range(list(1, 3)),
			/obj/item/clothing/suit/space/syndicate = custom_good_amount_range(list(1, 1)),
			/obj/item/clothing/head/helmet/space/syndicate = custom_good_amount_range(list(1, 1)),
			/obj/item/clothing/suit/space/void/merc = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/makarov = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/lamia/socom = custom_good_amount_range(list(1, 1))
		),
		"Sol Fed Stockpiles" = list(
			/obj/item/gun/projectile/automatic/thompson = custom_good_amount_range(list(1, 3)),
			/obj/item/gun/projectile/lamia/gemini = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/colt/ten = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/automatic/omnirifle/solmarine = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/automatic/greasegun = custom_good_amount_range(list(2, 3)),
			/obj/item/gun/projectile/automatic/omnirifle = custom_good_amount_range(list(1, 1)),
			/obj/item/gun/projectile/rpg = good_data(null, list(1, 1), 2500),
			/obj/item/ammo_casing/rocket = good_data(null, list(2, 4), 1500),
			/obj/item/ammo_casing/rocket/shrapnel = good_data(null, list(2, 4), 1500),
			/obj/item/ammo_casing/rocket/heat = good_data(null, list(2, 4), 1500)
		),
		"Useful Stuff" = list(
			// Autoinjectors defined in hypospray.dm
			/obj/item/reagent_containers/hypospray/autoinjector/hyperzine = custom_good_amount_range(list(5, 10)),
			/obj/item/reagent_containers/hypospray/autoinjector/drugs = custom_good_amount_range(list(5, 10)),
			/obj/item/reagent_containers/hypospray/autoinjector/quickhealbrute = custom_good_amount_range(list(5, 10)),
			/obj/item/reagent_containers/hypospray/autoinjector/quickhealburn = custom_good_amount_range(list(5, 10))
		),
		"Imprinters" = list(
			/obj/item/device/hardware_imprinter/smartlink,
			/obj/item/device/hardware_imprinter/cogenhance,
			/obj/item/device/hardware_imprinter/chemneutral
		)
	)
	hidden_inventory = list(
		"Syndicate Gear II" = list(
			/obj/item/gun/energy/crossbow = custom_good_amount_range(list(1, 1)),
			/obj/item/clothing/suit/space/syndicate = custom_good_amount_range(list(1, 1)),
			/obj/item/clothing/head/helmet/space/syndicate = custom_good_amount_range(list(1, 1)),
			/obj/item/clothing/suit/armor/vest/breach1 = custom_good_amount_range(list(2, 3)),
			/obj/item/clothing/mask/gas/chemhood = custom_good_amount_range(list(2, 3)),
			/obj/item/clothing/head/helmet/hazcap = custom_good_amount_range(list(2, 3)),
			/obj/item/clothing/glasses/powered/night = custom_good_amount_range(list(1, 1))
		),
		"Syndicate Gun Mods" = list(
			/obj/item/gun_upgrade/barrel/gauss,
			/obj/item/gun_upgrade/muzzle/pain_maker, //Clearly so you can get those
			/obj/item/gun_upgrade/scope/killer
		),
		"Sydnicate Gun Parts" = list (
			/obj/item/part/gun/grip/rubber,
			/obj/item/part/gun/barrel/hrifle,
			/obj/item/part/gun/mechanism/machinegun,
			/obj/item/part/gun/barrel/antim
		)
	)
	offer_types = list(
		/obj/item/organ/internal/kidney = offer_data("kidney", 800, 2),
		/obj/item/organ/internal/liver/big = offer_data("big liver", 1200, 1),
		/obj/item/organ/internal/vital/heart/huge = offer_data("six-chambered heart", 2000, 1),
		/obj/item/organ/internal/vital/lungs/long = offer_data("long lungs", 1650, 1),
		/obj/item/organ/internal/nerve/sensitive_nerve  = offer_data("sensitive nerve", 2650, 1),
		/obj/item/organ/internal/blood_vessel/extensive   = offer_data("extensive blood vessels", 2650, 1),
		/obj/item/cell/medium/greyson = offer_data("GP-SI \"Posi-cell 1600M\"", 725, 3)
	)
