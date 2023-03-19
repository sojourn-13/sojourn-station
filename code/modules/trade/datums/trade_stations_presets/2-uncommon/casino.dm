/datum/trade_station/gamba
	name_pool = list(
		"FTB 'Lucky Deck'" = "Free Trade Beacon 'Lucky Deck': \"Try your luck with our random box specials!\"",
	)
	uid = "casino"
	tree_x = 0.62
	tree_y = 0.8
	markup = 10				// High markup, low base price to prevent export abuse
	base_income = 0
	wealth = 0
	hidden_inv_threshold = 1000
	recommendation_threshold = 3000
	stations_recommended = list("illegal1", "greyson")
	recommendations_needed = 1
	inventory = list(
		"Assorted Goods" = list(
			/obj/item/storage/deferred/powercells = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/electronics = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/science = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/toolmod = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/medical = custom_good_amount_range(list(2, 4))
		),
		"Assorted Goods" = list(
			/obj/item/storage/deferred/powercells = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/electronics = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/science = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/toolmod = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/medical = custom_good_amount_range(list(2, 4))
		)
	)
	hidden_inventory = list(
		"Premium Assorted Goods" = list(
			/obj/item/storage/deferred/disks = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/rig = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/tools = custom_good_amount_range(list(2, 4)),
			/obj/item/gem //THE BIG TICKET ITEM
		)
	)
	offer_types = list(
		/obj/item/oddity/common/coin = offer_data("strange coin", 800, 1),
		/obj/item/oddity/common/old_money = offer_data("old money", 800, 1),
		/datum/reagent/other/woodpulp = offer_data("wood pulp bottle (60u)", 400, 2) //Well, if boxes aren't acceptable, the reagent to MAKE the boxes should work.
	)
