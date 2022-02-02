// roach toxin bottles defined in module/reagents/reagent_containters/glass/bottle.dm
/datum/trade_station/trapper
	name_pool = list(
		"EXT 'Armitage'" = "Exterminator 'Armitage':\n\"Greetings, Colony. We're in a bit of a rough spot at the moment. Got any traps to spare?\".",
	)
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNIQUE_GOODS
	markdown = 0
	base_income = 3200
	wealth = -48000
	secret_inv_threshold = 32000
	assortiment = list(
		"Roach Cubes and Eggs" = list(
			/obj/item/roach_egg = custom_good_amount_range(list(5, 10)),
			/obj/item/reagent_containers/food/snacks/cube/roachling = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/jager = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/seuche = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/panzer = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/grestrahlte = custom_good_amount_range(list(1, 5))
		),
		"Roach Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/blattedin = custom_good_amount_range(list(-1, 2)),
			/obj/item/reagent_containers/glass/bottle/diplopterum = custom_good_amount_range(list(-1, 2)),
			/obj/item/reagent_containers/glass/bottle/seligitillin = custom_good_amount_range(list(-1, 2)),
			/obj/item/reagent_containers/glass/bottle/starkellin = custom_good_amount_range(list(-1, 2)),
			/obj/item/reagent_containers/glass/bottle/gewaltine = custom_good_amount_range(list(-1, 2))
		),
		"Spider Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/pararein = custom_good_amount_range(list(-1, 2)),
			/obj/item/reagent_containers/glass/bottle/aranecolmin = custom_good_amount_range(list(-1, 2))
		),
		"Carp Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/carpotoxin = custom_good_amount_range(list(-1, 2))
		)
	)
	secret_inventory = list(
		"High-End Roach Product" = list(
			/obj/item/reagent_containers/food/snacks/cube/kraftwerk = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/fuhrer = custom_good_amount_range(list(1, 3)),
			/obj/item/reagent_containers/glass/bottle/fuhrerole = custom_good_amount_range(list(2, 2)),
		),
		"Just Spiders" = list(
			/mob/living/carbon/superior_animal/giant_spider = custom_good_amount_range(list(2, 3)),
			/mob/living/carbon/superior_animal/giant_spider/nurse = custom_good_amount_range(list(-2, 3)),
			/mob/living/carbon/superior_animal/giant_spider/hunter = custom_good_amount_range(list(1, 2))
		)
	)
	//Types of items bought by the station
	offer_types = list(
		/obj/item/mine = offer_data("landmine", 1200, 10),
		/obj/item/beartrap = offer_data("mechanical trap", 600, 20),
		/obj/item/device/assembly/mousetrap = offer_data("mousetrap", 200, 20)
	)