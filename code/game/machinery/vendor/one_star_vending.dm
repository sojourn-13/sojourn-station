/obj/machinery/vending/one_star
	name = "One Star Vendor"
	desc = "A vendor of the One Star variety typical made by GP."
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
	desc = "A vendor of the One Star variety typical made by GP. This one sells food variety."
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
	desc = "A vendor of the One Star variety typical made by GP. This one sells medical paraphernalia of the GP variety."
	icon_state = "vendor_health"