/datum/trade_station/gamba
	name_pool = list(
		"FTB 'Solntsey'" = "Free Trade Beacon 'Solntsey': \"Try your luck with our grab bag specials!\"",
	)
	uid = "casino"
	markup = 5				// High markup, low base price to prevent export abuse
	base_income = 0
	wealth = 0
	hidden_inv_threshold = 1000
	recommendation_threshold = 4000
	stations_recommended = list("illegal1", "serbian", "greyson")
	recommendations_needed = 1
	inventory = list(
		"Assorted Goods" = list(
			/obj/item/storage/deferred/powercells = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/electronics = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/science = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/toolmod = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/medical = custom_good_amount_range(list(2, 4))
		)
	)
	hidden_inventory = list(
			/obj/item/storage/deferred/disks = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/rig = custom_good_amount_range(list(2, 4)),
			/obj/item/storage/deferred/tools = custom_good_amount_range(list(2, 4))
	)
	offer_types = list(
		/obj/item/oddity/common/coin = offer_data("strange coin", 800, 1),
		/obj/item/oddity/common/old_money = offer_data("old money", 800, 1)
	)
