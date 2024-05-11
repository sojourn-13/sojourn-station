// roach toxin bottles defined in module/reagents/reagent_containters/glass/bottle.dm
/datum/trade_station/trapper
	name_pool = list(
		"EXT 'Armitage'" = "Exterminator 'Armitage':\n\"Greetings, Colony. We're in a bit of a rough spot at the moment. Got any traps to spare?\".",
	)
	icon_states = list("htu_destroyer", "ship")
	uid = "trapper"
	tree_x = 0.34
	tree_y = 0.5
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNCOMMON_GOODS
	offer_limit = 5
	base_income = 3200
	hidden_inv_threshold = 2000
	recommendation_threshold = 3500
	stations_recommended = list("illegal2")
	recommendations_needed = 2
	inventory = list(
		"Roach Cubes and Eggs" = list(
			/obj/item/storage/deferred/roacheggs,	// make egg box
			/obj/item/reagent_containers/food/snacks/cube/roach/roachling = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach/jager = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach/seuche = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach/panzer = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/food/snacks/cube/roach/grestrahlte = custom_good_amount_range(list(1, 5))
		),
		"Roach Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/trade/blattedin = good_data("blattedin bottle", list(-1, 2), 600),
			/obj/item/reagent_containers/glass/bottle/trade/diplopterum = good_data("diplopterum bottle", list(-1, 2), 650),
			/obj/item/reagent_containers/glass/bottle/trade/seligitillin = good_data("seligitillin bottle", list(-1, 2), 650),
			/obj/item/reagent_containers/glass/bottle/trade/starkellin = good_data("starkellin bottle", list(-1, 2), 650),
			/obj/item/reagent_containers/glass/bottle/trade/gewaltine = good_data("gewaltine bottle", list(-1, 2), 650)
		),
		"Spider Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/trade/pararein = good_data("pararein bottle", list(-1, 2), 400),
			/obj/item/reagent_containers/glass/bottle/trade/aranecolmin = good_data("aranacolmin bottle", list(-1, 2), 500)
		),
		"Carp Toxins" = list(
			/obj/item/reagent_containers/glass/bottle/trade/carpotoxin = good_data("carpotoxin bottle", list(-1, 2), 675)
		)
	)
	hidden_inventory = list(
		"High-End Roach Product" = list(
			/obj/item/reagent_containers/food/snacks/cube/roach/kraftwerk = custom_good_amount_range(list(1, 5)),
			/obj/item/reagent_containers/glass/bottle/trade/fuhrerole = good_data("fuhrerole bottle", list(1, 1), 900),
			/obj/item/reagent_containers/glass/bottle/trade/kaiseraurum = good_data("kaiseraurum bottle", list(1, 1), 1000)
		),
		"Just Spiders" = list(
			/mob/living/carbon/superior_animal/giant_spider = custom_good_amount_range(list(2, 3)),
			/mob/living/carbon/superior_animal/giant_spider/nurse = custom_good_amount_range(list(-2, 3)),
			/mob/living/carbon/superior_animal/giant_spider/hunter = custom_good_amount_range(list(1, 2))
		)
	)
	//Types of items bought by the station
	offer_types = list(
		/obj/item/mine = offer_data("landmine", 1200, 3),
		/obj/item/beartrap = offer_data("mechanical trap", 600, 5),
		/obj/item/device/assembly/mousetrap = offer_data("mousetrap", 200, 10),
		/datum/reagent/toxin/zombiepowder = offer_data("zombie powder bottle(60u)", 800, 2)
	)
