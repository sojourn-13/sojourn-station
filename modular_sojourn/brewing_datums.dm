
/datum/brewing_product
	var/reagent_to_brew = "ethanol"			//This is what are end resault will be
	//What a rare loot drop! its MYTHIC level you should if you see this in game brag about it to coders :D
	var/display_name = "MYTHIC Coders Tears"//Name that is displayed when selecting and fewing
	var/prerequisite = null					//Weather or not we need a already made brew for this product, (string, so that we can make multiple recipes for the 'same' drink if needed)
	var/list/needed_crops = list()			//List of crops using the kitchen tag i.e list("corn"=5,"potato"=10)
	var/list/needed_chems = list()			//List of chemicals using the id i.e list("sugar"=5,"salt"=10"

	var/price_tag_setter = 0				//After brewing what are sell value is (For cargo)
	var/brew_timer = 1						//How long it takes in seconds
	var/brewed_amount = 1					//How many bottles are made at the end of the day
	var/bottled_brew_amount = 30			//How much we give per bottle

/datum/brewing_product/beer
	reagent_to_brew = "beer"
	display_name = "Beer"
	needed_crops = list("wheat" = 40, "poppy" = 5)
	needed_chems = list("water" = 60)

	price_tag_setter = 1750
	brew_timer = 2 MINUTES
	brewed_amount = 12 //12 pack

/datum/brewing_product/sleepy_beer
	reagent_to_brew = "beer2"
	display_name = "Sleepy Beer"
	prerequisite = "beer"
	brewed_amount = 2 //its beer2
	needed_crops = list("wheat" = 10, "poppy" = 5)
	needed_chems = list("water" = 60, "chloralhydrate" = 5)

	price_tag_setter = 2250
	brew_timer = 2 MINUTES

/datum/brewing_product/wine
	reagent_to_brew = "wine"
	display_name = "Wine"

	brewed_amount = 2
	needed_crops = list("grape" = 80, "towercap" = 5)
	needed_chems = list("water" = 160, "sugar"= 15)

	price_tag_setter = 3000
	brew_timer = 6 MINUTES

/datum/brewing_product/pwine
	reagent_to_brew = "pwine"
	display_name = "Fungal Wine (poison)"
	prerequisite = "wine"
	brewed_amount = 1
	needed_crops = list("grapes" = 10, "towercap" = 5, "plumphelmet" = 5)
	needed_chems = list("amatoxin" = 15)

	price_tag_setter = 4000
	brew_timer = 16 MINUTES

/datum/brewing_product/redcandyliquor
	reagent_to_brew = "redcandyliquor"
	display_name = "Red Candy Wine"
	prerequisite = "wine" // (string, so that we can make multiple recipes for the 'same' drink if needed)
	brewed_amount = 1
	needed_crops = list("grapes" = 10, "sunflowers" = 5, "harebells" = 5)
	needed_chems = list("sugar" = 15)

	price_tag_setter = 4000
	brew_timer = 16 MINUTES

/datum/brewing_product/rum
	reagent_to_brew = "rum"
	display_name = "Rum"
	needed_crops = list("sugarcane" = 60, "towercap" = 5)
	needed_chems = list("water" = 120, "sodiumchloride" = 5)

	price_tag_setter = 2000
	brew_timer = 7 MINUTES
	brewed_amount = 4

/datum/brewing_product/ale
	reagent_to_brew = "ale"
	display_name = "Ale"
	needed_crops = list("wheat" = 60, "towercap" = 5, "poppy" = 5)
	needed_chems = list("water" = 120, "honey" = 5)

	price_tag_setter = 2000
	brew_timer = 14 MINUTES
	brewed_amount = 12

/datum/brewing_product/vodka
	reagent_to_brew = "vodka"
	display_name = "Vodka"
	needed_crops = list("potato" = 30, "corn" = 15)
	needed_chems = list("water" = 80)

	price_tag_setter = 1000
	brew_timer = 1 MINUTES
	brewed_amount = 4

/datum/brewing_product/Kvass
	reagent_to_brew = "Kvass"
	display_name = "Kvass"
	prerequisite = "vodka"

	needed_crops = list("wheat" = 30)
	needed_chems = list("water" = 200)

	price_tag_setter = 1200
	brew_timer = 3 MINUTES
	brewed_amount = 3

/datum/brewing_product/whiskey
	reagent_to_brew = "whiskey"
	display_name = "Whiskey"

	needed_crops = list("wheat" = 40, "towercap" = 5)
	needed_chems = list("water" = 120)

	price_tag_setter = 2000
	brew_timer = 20 MINUTES
	brewed_amount = 10

//The graveyard of uncoded yet coded wines, may their sprites rest not well in the stomic of those that drank it.

/* Coded out for lore reasons - Lore head hates fun >:T
/datum/brewing_product/ntcahors
	reagent_to_brew = "ntcahors"
	display_name = "#Blessed Wine"
	prerequisite = "wine" // (string, so that we can make multiple recipes for the 'same' drink if needed)
	brewed_amount = 1
	needed_crops = list("greengrapes" = 30, "sugarcane" = 25, "harebells" = 5)
	needed_chems = list("carbon" = 120, "holywater" = 120)

	price_tag_setter = 6000
	brew_timer = 3600 //1 hour

*/