/obj/machinery/vending/one_star
	name = "Greyson Positronic Vendor"
	desc = "A holographic vendor made by Greyson Positronic."
	icon = 'icons/obj/machines/one_star/vending.dmi'
	icon_state = "vendor_guns"
	icon_vend = "vendor_printing"
	//product_slogans = "Usually no carcinogens!;Best sports!;Become the strongest!"
	//product_ads = "Strength!;Cheap!;There are contraindications, it is recommended to consult a medical specialist."
	vendor_department = DEPARTMENT_GREYSON
	alt_currency_path = /obj/item/stack/os_cash

/obj/machinery/vending/one_star/Initialize()
	. = ..()
	set_light(1.4, 1, COLOR_LIGHTING_CYAN_BRIGHT)
	earnings_account = department_accounts[DEPARTMENT_GREYSON]

/obj/machinery/vending/one_star/guns
	desc = "A vendor of the One Star variety typical made by GP. This one sells firearms of the GP variety."
	icon_state = "vendor_guns"

	products = list(
		/obj/item/gun/energy/cog = 3,
		/obj/item/gun/projectile/spring = 2,
		/obj/item/gun/projectile/rivet = 1
		)

	prices = list(
		/obj/item/gun/energy/cog = 50,
		/obj/item/gun/projectile/spring = 100,
		/obj/item/gun/projectile/rivet = 200
		)

/obj/machinery/vending/one_star/food
	desc = "A holographic vendor made by Greyson Positronic. This one sells a variety of food."
	product_slogans = "It's a Vending Machine!;We all eat lunch from a Vending Machine!"
	product_ads = "You must be the new guy!;Hows is your child doing?;Real Meals!;Some people say its not real food but many quite like and many think you will to!"

	icon_state = "vendor_food"

	products = list(
		/obj/item/clothing/mask/smokable/cigarette/os = 12,
		/obj/item/reagent_containers/food/drinks/os_coffee = 12,
		/obj/item/reagent_containers/food/snacks/openable/os_soypack = 6,
		/obj/item/reagent_containers/food/snacks/openable/os_bun = 6,
		/obj/item/reagent_containers/food/snacks/openable/os_meat = 6,
		/obj/item/reagent_containers/food/snacks/openable/candy/os = 6,
		/obj/item/reagent_containers/food/snacks/openable/mre/os = 6,
		/obj/item/reagent_containers/food/snacks/os_paste = 3,
		/obj/item/reagent_containers/food/snacks/openable/os_heart = 2,
		/obj/item/reagent_containers/food/snacks/openable/os_liver = 2
		)

	prices = list(
		/obj/item/clothing/mask/smokable/cigarette/os = 5,
		/obj/item/reagent_containers/food/drinks/os_coffee = 7,
		/obj/item/reagent_containers/food/snacks/openable/os_soypack = 60,
		/obj/item/reagent_containers/food/snacks/openable/os_bun = 30,
		/obj/item/reagent_containers/food/snacks/openable/os_meat = 75,
		/obj/item/reagent_containers/food/snacks/openable/candy/os = 50,
		/obj/item/reagent_containers/food/snacks/openable/mre/os = 65,
		/obj/item/reagent_containers/food/snacks/os_paste = 80,
		/obj/item/reagent_containers/food/snacks/openable/os_heart = 200,
		/obj/item/reagent_containers/food/snacks/openable/os_liver = 120
		)

/obj/machinery/vending/one_star/health
	desc = "A holographic vendor made by Greyson Positronic. This one sells medical paraphernalia of the GP variety."
	icon_state = "vendor_health"


//Based off a event that the colony helped a distress signal from the greyson. Mostly fluff and cosmetic

/obj/machinery/vending/greyson_colony_ally
	name = "Greyson Star Traders Vending Machine"
	desc = "A holographic vendor made by a unknown Greyson Positronic sub-brand that owns a trading vessel, that said vessel constantly trades with lonestar and in a effort of good will by the mainframe GSTPMF Nova Greyson they have given this vendor to the colony containing greyson goods... This one sells a variety of items."
	product_slogans = "It's a Vending Machine! Well... we think you might enjoy it?; Again thank you for saving one of our representatives! The GSTPMF Nova Greyson sends her regards to the colony."
	product_ads = "We thank your colony for saving our Representative in the past! We hope to make more deals for tomorrow!;Hows are you doing? Hope you have a wonderful day!;We really do hope the colony fares well! Contact us anytime soon!;Some people really want to see the world shine! As do us!"
	icon = 'icons/obj/machines/one_star/vending.dmi'
	icon_state = "vendor_items"
	icon_vend = "vendor_printing"
	vendor_department = DEPARTMENT_GREYSON

/obj/machinery/vending/greyson_colony_ally/Initialize()
	. = ..()
	set_light(1.4, 1, COLOR_LIGHTING_CYAN_BRIGHT)
	earnings_account = department_accounts[DEPARTMENT_GREYSON]


	products = list(
		/obj/item/clothing/mask/smokable/cigarette/os/nova = 25,
		/obj/item/clothing/head/helmet/space/os/nova = 15,
		/obj/item/clothing/suit/space/os/nova = 15,
		/obj/item/clothing/suit/greatcoat/os = 10,
		/obj/item/clothing/under/os_jumpsuit/nova = 10,
		/obj/item/clothing/under/os_jumpsuit/bdu/nova = 10,
		/obj/item/clothing/under/iron_lock_security = 10,
		/obj/item/clothing/head/os_cap/nova = 10,
 		)

	prices = list(
		/obj/item/clothing/mask/smokable/cigarette/os/nova = 5,
		/obj/item/clothing/head/helmet/space/os/nova = 85,
		/obj/item/clothing/suit/space/os/nova = 120,
		/obj/item/clothing/suit/greatcoat/os/nova = 70,
		/obj/item/clothing/under/os_jumpsuit/nova = 25,
		/obj/item/clothing/under/os_jumpsuit/bdu/nova = 35,
		/obj/item/clothing/under/iron_lock_security = 70,
		/obj/item/clothing/head/os_cap/nova = 45,
		)

/obj/item/clothing/head/helmet/space/os/nova
	name = "Greyson Star Traders Enviromental Helm"
	icon_state = "gsn_spacehelm"
	item_state = "gsn_spacehelm"
	desc = "A helmet produced by Greyson Star Traders. It's more outdated than the usual version, but with sleekier design makes it still viable to use even after all these years."
	flash_protection = FLASH_PROTECTION_MINOR
	tint = TINT_NONE
	armor_list = list( // nerf the value compared to the original
		melee = 10,
		bullet = 5,
		energy = 15,
		bomb = 5,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.3 // half of the original helm value

/obj/item/clothing/suit/space/os/nova
	name = "Greyson Star Traders Enviromental Suit"
	icon_state = "os_spacesuit"
	item_state = "os_spacesuit"
	desc = "A engineering space suit with slight armor plates to help protect the warer form space dust and haul breaches well not impeeding speed, folds up really tightly as well.."
	w_class = ITEM_SIZE_NORMAL
	slowdown = 0
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 15,
		bomb = 0,
		bio = 100,
		rad = 15
	)
	siemens_coefficient = 0.3

/obj/item/clothing/head/os_cap/nova
	name = "Greyson Star Trader Cap"
	desc = "A flat brim cap made for the colony office workers to keep out light out of their heads, weirdly enough it smells like if you just buyed it out of the vendor, it smells like cinnamon."
	icon_state = "os_cap"
	item_state = "os_cap"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 5,
		bomb = 0,
		bio = 5,
		rad = 5
	)

/obj/item/clothing/suit/greatcoat/os/nova
	name = "Greyson Star Traders greatcoat"
	desc = "A thick, heavy coat for workers that really enjoys paperwork."
	icon_state = "os_overcoat"
	item_state = "os_overcoat"
	blood_overlay_type = "coat"
	armor_list = list(melee = 5, bullet = 5, energy = 15, bomb = 0, bio = 0, rad = 25)
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	stiffness = LIGHT_STIFFNESS

/obj/item/clothing/mask/smokable/cigarette/os/nova
	name = "\improper Greyson Star Traders produced cigarette"
	desc = "A inhouse made cigarette by Greyson Star Traders. It has a very unique aroma, hard to describe but its honestly not awful, you can see that it is actually somehow packed with care? Why robots would mass produce cigars with care?"
	icon_state = "cigoff"
	icon_on = "cigon"
	icon_off = "cigoff"
	type_butt = /obj/item/trash/cigbutt/os
	preloaded_reagents = list("nicotine" = 5)

/obj/item/clothing/under/os_jumpsuit/bdu/nova
	name = "Greyson Star Traders Battle Dress Uniform"
	desc = "A Battle Dress Uniform produced by Greyson Star Traders based of the actual Greyson Positronics, for their more style oriented personnel"
	icon_state = "bdugreyson"

/obj/item/clothing/under/os_jumpsuit/nova
	name = "Greyson Star Traders jumpsuit"
	desc = "An uniform that was produced by Greyson Star Traders, cleaning to enginering this over engineered suit was used. Surprisingly the suit senors still work. Perfect for a dangerous colony in middle of fucking nowhere!"
	icon_state = "os_jumpsuit"
