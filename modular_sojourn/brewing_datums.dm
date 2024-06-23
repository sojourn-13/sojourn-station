
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

	var/other_name							//Used for alt items display names
	var/alt_brew_item						//If it prodces an item (See Cheese)
	var/alt_brew_item_amount = 1			//If it prodces an item (See Cheese)

	var/info_helper							//Simple string to give folks an extra line of info.

/datum/brewing_product/beer
	reagent_to_brew = "beer"
	display_name = "Beer"
	needed_crops = list("wheat" = 40, "poppies" = 5)
	needed_chems = list("water" = 60)

	price_tag_setter = 1750
	brew_timer = 2 MINUTES
	brewed_amount = 12 //12 pack
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/sleepy_beer
	reagent_to_brew = "beer2"
	display_name = "Sleepy Beer"
	prerequisite = "beer"
	brewed_amount = 2 //its beer2
	needed_crops = list("wheat" = 10, "poppies" = 5)
	needed_chems = list("water" = 60, "chloralhydrate" = 5)

	price_tag_setter = 2250
	brew_timer = 2 MINUTES

/datum/brewing_product/melonliquor
	reagent_to_brew = "melonliquor"
	display_name = "Melon Liquor"

	brewed_amount = 2
	needed_crops = list("watermelon" = 80, "towercap" = 15, "poppies" = 35)
	needed_chems = list("water" = 160)

	price_tag_setter = 2000
	brew_timer = 6 MINUTES

/datum/brewing_product/bluecuracao
	reagent_to_brew = "bluecuracao"
	display_name = "Blue Curacao"

	brewed_amount = 2
	needed_crops = list("orange" = 80, "towercap" = 15, "poppies" = 35)
	needed_chems = list("water" = 160)

	price_tag_setter = 2100
	brew_timer = 8 MINUTES

/datum/brewing_product/wine
	reagent_to_brew = "wine"
	display_name = "Wine"

	brewed_amount = 2
	needed_crops = list("grapes" = 80, "towercap" = 5)
	needed_chems = list("water" = 160, "sugar"= 15)

	price_tag_setter = 3000
	brew_timer = 6 MINUTES
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/vermouth
	reagent_to_brew = "vermouth"
	prerequisite = "wine"
	display_name = "Vermouth"

	brewed_amount = 3
	needed_crops = list("grass" = 60, "towercap" = 15, "blueberries" = 30)
	needed_chems = list("water" = 160)

	price_tag_setter = 3500
	brew_timer = 8 MINUTES

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
	prerequisite = "wine"
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
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/deadrum
	reagent_to_brew = "deadrum"
	display_name = "Deadrum (Seawater Rum)"
	prerequisite = "rum"
	needed_crops = list("sugarcane" = 30, "towercap" = 15)
	needed_chems = list("water" = 60, "sodiumchloride" = 60)

	price_tag_setter = 5000
	brew_timer = 10 MINUTES
	brewed_amount = 2
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/nanatsunoumi
	reagent_to_brew = "nanatsunoumi"
	display_name = "Nanatsunoumi"
	prerequisite = "deadrum"
	needed_crops = list("rice" = 30, "towercap" = 15, "poppies" = 5)
	needed_chems = list("water" = 80)

	price_tag_setter = 8000
	brew_timer = 20 MINUTES
	brewed_amount = 3

/datum/brewing_product/kahlua
	reagent_to_brew = "kahlua"
	prerequisite = "rum"
	display_name = "Kahlua"

	brewed_amount = 3
	needed_crops = list("gelthi" = 40, "cinnamon" = 5)
	needed_chems = list("water" = 30, "sugar" = 30)

	price_tag_setter = 3000
	brew_timer = 3 MINUTES

/datum/brewing_product/gin
	reagent_to_brew = "gin"
	display_name = "Gin"

	brewed_amount = 3
	needed_crops = list("berries" = 40, "lemon" = 40, "towercap" = 5, "cinnamon" = 25)
	needed_chems = list("water" = 160, "sugar"= 15)

	price_tag_setter = 3200
	brew_timer = 9 MINUTES

/datum/brewing_product/schnapps
	reagent_to_brew = "schnapps"
	display_name = "Cinnamon Schnapps (Kros Style)"

	brewed_amount = 4
	needed_crops = list("berries" = 40, "strawberries" = 40, "towercap" = 5, "cinnamon" = 5)
	needed_chems = list("water" = 160, "sugar"= 35)

	price_tag_setter = 1200 //Flooded market
	brew_timer = 5 MINUTES
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/goldschlager
	reagent_to_brew = "goldschlager"
	prerequisite = "schnapps"
	display_name = "Goldschlager"

	brewed_amount = 4
	needed_crops = list("berries" = 40, "goldapple" = 5, "cinnamon" = 55)
	needed_chems = list("water" = 10)

	price_tag_setter = 6500
	brew_timer = 20 MINUTES

/datum/brewing_product/tequilla
	reagent_to_brew = "tequilla"
	display_name = "Tequilla"

	brewed_amount = 2
	needed_crops = list("lime" = 40, "lemon" = 40, "towercap" = 5, "pineapple" = 10)
	needed_chems = list("water" = 50, "sodiumchloride"= 5)

	price_tag_setter = 2250
	brew_timer = 3 MINUTES

/datum/brewing_product/patron
	reagent_to_brew = "patron"
	display_name = "Patron"

	brewed_amount = 1
	needed_crops = list("wheat" = 80,  "mint" = 30)
	needed_chems = list("water" = 30)

	price_tag_setter = 2000
	brew_timer = 15 MINUTES


/datum/brewing_product/ale
	reagent_to_brew = "ale"
	display_name = "Ale"
	needed_crops = list("wheat" = 60, "towercap" = 5, "poppies" = 5)
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
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/ethanol
	reagent_to_brew = "ethanol"
	display_name = "Ethanol"
	prerequisite = "vodka"
	needed_crops = list("corn" = 30)
	needed_chems = list("water" = 30)
	brew_timer = 5 MINUTES
	brewed_amount = 3
	price_tag_setter = 1500
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/absinthe
	reagent_to_brew = "absinthe"
	prerequisite = "ethanol"
	display_name = "Absinthe"

	brewed_amount = 1
	bottled_brew_amount = 50
	needed_crops = list("towercap" = 120, "maidengrass" = 5, "moon tear" = 30)
	needed_chems = list("water" = 230)

	price_tag_setter = 12000 //Takes FOREVERRRRR to brew + needs SI to make maidengrass
	brew_timer = 60 MINUTES

/datum/brewing_product/Kvass
	reagent_to_brew = "Kvass"
	display_name = "Kvass"
	prerequisite = "vodka"

	needed_crops = list("wheat" = 30)
	needed_chems = list("water" = 200)

	price_tag_setter = 1200
	brew_timer = 3 MINUTES
	brewed_amount = 3
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/whiskey
	reagent_to_brew = "whiskey"
	display_name = "Whiskey"

	needed_crops = list("wheat" = 40, "towercap" = 5)
	needed_chems = list("water" = 120)

	price_tag_setter = 2000
	brew_timer = 20 MINUTES
	brewed_amount = 10

//THE SLUGE
/datum/brewing_product/glucose
	reagent_to_brew = "glucose"
	display_name = "Glucose"
	prerequisite = "Kvass"
	needed_crops = list("wheat" = 60, "corn" = 30)
	needed_chems = list("water" = 30, "sugar" = 30, "honey" = 5)
	brew_timer = 12 MINUTES
	brewed_amount = 1
	bottled_brew_amount = 5
	price_tag_setter = 4750
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/nothing
	reagent_to_brew = "nothing"
	display_name = "Nothing"
	prerequisite = "glucose"
	needed_crops = list("cinnamon" = 10)
	needed_chems = list("water" = 200)
	brew_timer = 30 MINUTES
	brewed_amount = 1
	bottled_brew_amount = 50
	price_tag_setter = 404 //this is more or less a joke price, you make a lot more by mixing silencer

/datum/brewing_product/soysauce
	reagent_to_brew = "soysauce"
	display_name = "Soy Sauce"
	prerequisite = "vinegar"
	needed_crops = list("wheat" = 20, "soybean" = 30, "plumphelmet" = 2)
	needed_chems = list("water" = 30, "sodiumchloride" = 30)
	brew_timer = 5 MINUTES
	brewed_amount = 3
	price_tag_setter = 2750

/datum/brewing_product/vinegar
	reagent_to_brew = "vinegar"
	display_name = "Vinegar"
	prerequisite = "wine"//IDK this is what copoilet says to do
	needed_crops = list("apple" = 20, "pineapple" = 30)
	needed_chems = list("water" = 30)
	brew_timer = 15 MINUTES
	brewed_amount = 3
	price_tag_setter = 2500
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/cream
	reagent_to_brew = "cream"
	display_name = "Cream"
	needed_crops = list("soybean" = 40)
	needed_chems = list("milk" = 30, "vinegar" = 10)
	brew_timer = 3 MINUTES
	brewed_amount = 3
	price_tag_setter = 800
	info_helper = "Further brewing can be done when finished."

/datum/brewing_product/grenadine
	reagent_to_brew = "grenadine"
	display_name = "Grenadine"
	needed_crops = list("cherry" = 20, "strawberries" = 20)
	needed_chems = list("water" = 30, "sugar" = 20)
	brew_timer = 5 MINUTES
	brewed_amount = 2
	price_tag_setter = 1300

/datum/brewing_product/cheese
	reagent_to_brew = "vinegar" //Gives back some vinegar
	display_name = "Cheese Wheels (Byproduct Vinegar)"
	prerequisite = "cream"
	needed_crops = list("soybean" = 20)
	needed_chems = list("water" = 30, "milk" = 30, "vinegar" = 5)
	brew_timer = 2 MINUTES
	brewed_amount = 1
	bottled_brew_amount = 5
	price_tag_setter = 1000

	other_name = "Cheese Wheel"
	alt_brew_item = /obj/item/reagent_containers/food/snacks/sliceable/cheesewheel
	alt_brew_item_amount = 3
	info_helper = "The bottles will produced Vinegar."

//Fast-ish for drying
/datum/brewing_product/blackpepper
	reagent_to_brew = "blackpepper"
	display_name = "Pepper Pepper Pepper"
	needed_crops = list("chili" = 10, "ambrosia" = 15, "towercap" = 10)
	needed_chems = list("sodiumchloride" = 15, "cornoil" = 5)
	brew_timer = 3 MINUTES
	brewed_amount = 1
	price_tag_setter = 1500

/datum/brewing_product/dough
	reagent_to_brew = "ethanol"
	display_name = "Dough (Ethanol Byproduct)"
	needed_crops = list("wheat" = 30)
	needed_chems = list("sodiumchloride" = 5, "egg" = 5, "sugar" = 10, "water" = 30)
	brew_timer = 1 MINUTES
	brewed_amount = 1
	price_tag_setter = 800 //Its cheap and fast and just uncooked bread
	bottled_brew_amount = 5 //Just a little bit as a byproduct

	other_name = "Dough"
	alt_brew_item = /obj/item/reagent_containers/food/snacks/dough
	alt_brew_item_amount = 6 //Mass production
	info_helper = "The bottles produced are Ethanol."

/datum/brewing_product/salt
	reagent_to_brew = "sodiumchloride"
	display_name = "Salt"
	needed_crops = list("orange" = 10, "pineapple" = 10, "lemon" = 10, "lime" = 10)
	needed_chems = list("water" = 20)
	brew_timer = 5 MINUTES
	brewed_amount = 1
	price_tag_setter = 900

//Asked Microsoft Copoilet for this one, idk looks fine to me - Trilby
/datum/brewing_product/enzyme
	reagent_to_brew = "enzyme"
	display_name = "Universal Enzyme"
	prerequisite = "vinegar"
	needed_crops = list("mint" = 20, "pineapple" = 30, "grass" = 120, "orange" = 30)
	needed_chems = list("water" = 30, "ethanol" = 60)
	brew_timer = 15 MINUTES
	brewed_amount = 1
	price_tag_setter = 7500

//The graveyard of uncoded yet coded wines, may their sprites rest not well in the stomic of those that drank it.

/* Coded out for lore reasons - Lore head hates fun >:T
/datum/brewing_product/ntcahors
	reagent_to_brew = "ntcahors"
	display_name = "#Blessed Wine"
	prerequisite = "wine" // (string, so that we can make multiple recipes for the 'same' drink if needed)
	brewed_amount = 1
	needed_crops = list("green grape" = 30, "sugarcane" = 25, "harebell" = 5)
	needed_chems = list("carbon" = 120, "holywater" = 120)

	price_tag_setter = 6000
	brew_timer = 3600 //1 hour

//Coded out do to not sure how to accually make this, and the copoilet quarries are able to help me
/datum/brewing_product/fernet
	reagent_to_brew = "fernet"
	display_name = "Fernet"
	needed_crops = list("mint" = 20, "thaadra" = 20, "harebell" = 5)
	needed_chems = list("water" = 60)
	brew_timer = 15 MINUTES
	brewed_amount = 1
	price_tag_setter = 1500


*/