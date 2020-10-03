/datum/supply_pack/formal_wear
	contains = list(/obj/item/clothing/head/bowler,
					/obj/item/clothing/head/tophat,
					/obj/item/clothing/under/suit_jacket,
					/obj/item/clothing/under/suit_jacket/red,
					/obj/item/clothing/shoes/color/black,
					/obj/item/clothing/shoes/color/black,
					/obj/item/clothing/shoes/leather,
					/obj/item/clothing/suit/storage/wcoat/black)
	name = "Formalwear Crate"
	cost = 1200
	containertype = /obj/structure/closet
	crate_name = "formalwear crate"
	group = "Clothing"

/datum/supply_pack/costume
	name = "Actor Costumes Crate"
	contains = list(/obj/item/clothing/suit/costume/history/pirate,
					/obj/item/clothing/suit/costume/job/judge,
					/obj/item/clothing/suit/storage/wcoat/black,
					/obj/item/clothing/suit/costume/job/nun,
					/obj/item/clothing/under/rank/first_officer/suit,
					/obj/item/clothing/suit/costume/history/plaguedoctor,
					/obj/item/clothing/under/plaid/properblue,
					/obj/item/clothing/under/costume/animal/owl,
					/obj/item/clothing/under/costume/job/waiter,
					/obj/item/clothing/under/costume/history/gladiator,
					/obj/item/clothing/under/costume/history/soviet,
					/obj/item/clothing/under/bride_white,
					/obj/item/clothing/suit/rank/chef,
					/obj/item/clothing/under/plaid/kilt)
	cost = 800 //they dont get payed much
	crate_name = "actor costumes crate"
	containertype = /obj/structure/closet/crate/secure
	access = access_theatre
	group = "Clothing"