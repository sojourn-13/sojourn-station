/obj/structure/fermentation_keg
	name = "Fermentation Keg"
	desc = "A simple keg that is meant for making booze."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrel_tapless_open"
	density = TRUE
	throwpass = TRUE
	climbable = TRUE
	reagent_flags = OPENCONTAINER | NO_REACT	//Lids open, we dont react to prevent some conflicting requrements
	var/ready_for_bottleing = FALSE				//After brewing we can sell or bottle, this is for the latter
	var/brewing = FALSE							//If we currently brewing a booze or not
	var/brew_to									//What we are making
	var/fake_name								//Used for Exsamine
	//Needed crops
	var/needed_crop								//crop by kitch tag needed
	var/needed_crop_amount						//crop amount need
	var/stored_crop = 0							//how much of needed crop is stored
	var/needed_crop_one							//a second crop that would be needed - kitch tag
	var/needed_crop_one_amount					//a second crop needed amount
	var/stored_crop_one = 0						//how much of second needed crop is stored
	var/needed_crop_two							//a third crop that would be needed - kitch tag
	var/needed_crop_two_amount					//a third crop needed amount
	var/stored_crop_two = 0						//how much of third needed crop is stored
	//Needed Chems
	var/needed_water							//how much water we need, should need a lot i.e 120u
	var/needed_chem_one							//a chemical that would be needed
	var/needed_chem_one_amount					//a chemical needed amount
	var/needed_chem_two							//a second chemical that would be needed
	var/needed_chem_two_amount					//a second chemical needed amount
	//Misc after the fact stuff
	var/brewed_amount							//how many bottles we give
	var/brew_timer								//How *long* it takes to brew a booze (in seconds)
	var/price_tag_setter						//For selling pre-brewed kegs

	price_tag = 150

/obj/item/bottle_kit
	name = "Bottling Kit"
	desc = "A box that holds glasses fabricators, lables, caps and quarks ready for home brewing and bottling."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bottler_box"
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATTER_STEEL = 10, MATTER_GLASS = 10)

/obj/structure/fermentation_keg/Initialize()
	. = ..()
	create_reagents(240) //on agv it should be 120u for water then rest can be other needed chemicals

/obj/structure/fermentation_keg/attack_hand(mob/user as mob)
	if(!brew_to)
		shopping_run(user, 1)
		return

	if(ready_for_bottleing)
		shopping_run(user, 2)


	if(try_n_brew(user))
		start_brew()
	..()

/obj/structure/fermentation_keg/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/bottle_kit))
		bottle()

	if(istype(I, /obj/item/reagent_containers/food/snacks/grown))
		var/obj/item/reagent_containers/food/snacks/grown/G = I
		if(G.seed.kitchen_tag == needed_crop)
			stored_crop += 1
			qdel(G)
		if(G.seed.kitchen_tag == needed_crop_one)
			stored_crop_one += 1
			qdel(G)
		if(G.seed.kitchen_tag == needed_crop_two)
			stored_crop_two += 1
			qdel(G)

	if(istype(I, /obj/item/storage/bag/produce))
		var/obj/item/storage/bag/produce/POUCH = I
		for(var/obj/item/reagent_containers/food/snacks/grown/G in POUCH.contents)
			if(G.seed.kitchen_tag == needed_crop)
				stored_crop += 1
				qdel(G)
			if(G.seed.kitchen_tag == needed_crop_one)
				stored_crop_one += 1
				qdel(G)
			if(G.seed.kitchen_tag == needed_crop_two)
				stored_crop_two += 1
				qdel(G)
		POUCH.refresh_all()

	..()

/obj/structure/fermentation_keg/examine(mob/user)
	..()
	if(brew_to)
		if(!fake_name)
			fake_name = "Unknown brew"

		var/message = "Currently making: [fake_name].\n"
		//Water
		if(needed_water)
			message += "Water Required: [needed_water], current water level is [reagents.get_reagent_amount("water")].\n"

		//Crops
		if(needed_crop)
			message += "Crop Needed: [needed_crop] x [needed_crop_amount], current amount of [needed_crop] is [stored_crop].\n"
		if(needed_crop_one)
			message += "Second Crop Needed: [needed_crop_one] x [needed_crop_one_amount], current amount of [needed_crop_one] is [stored_crop_one].\n"
		if(needed_crop_two)
			message += "Third Crop Needed: [needed_crop_two] x [needed_crop_two_amount], current amount of [needed_crop_two] is [stored_crop_two].\n"

		//Chems
		if(needed_chem_one)
			message += "Reagent Needed: [get_reagent_name_by_id(needed_chem_one)] in a amount of at least [needed_chem_one_amount].\n"
		if(needed_chem_two)
			message += "Second Reagent Needed: [get_reagent_name_by_id(needed_chem_two)] in a amount of at least [needed_chem_two_amount].\n"

		//time
		if(brew_timer)
			if(brew_timer >= 60)
				message += "Once set, will take [brew_timer/60] Minutes.\n"
			else
				message += "Once set, will take [brew_timer] Seconds.\n"

		//How many are brewed
		if(brewed_amount)
			message += "Will produce [brewed_amount] bottles when finished.\n"

		to_chat(user, "<span class='info'>[message]</span>")

/obj/structure/fermentation_keg/proc/shopping_run(mob/user as mob, fermentation = 1)
	if(brewing)
		return

	var/list/options = list()
	if(fermentation == 1)
		options["Beer"] = "beer"
		options["Wine"] = "wine"
		options["Rum"] = "rum"
		options["Ale"] = "ale"
		options["Vodka"] = "vodka"
		options["Whiskey"] = "whiskey"
	if(fermentation == 2)
		switch(brew_to)
			if("beer")
				options["Special Sleepy Brew"] = "beer2"
			if("vodka")
				options["Kvass"] = "Kvass"
			if("wine")
				options["Warlock Velvet"] = "pwine"
				//options["Cahors Wine"] = "ntcahors"
				options["Red Candy Liquor"] = "redcandyliquor" //Its a wine


	if(!options.len)
		to_chat(user, "<span class='info'>[brew_to] can not be processed further.</span>")
		return

	var/choice = input(user,"What brew do you want to make?") as null|anything in options

	var/shopping = options[choice]

	if(shopping)
		clear_out(TRUE)

	//Little long but at lest its clean and easy to read
	switch(shopping)
		if("beer")
			brew_to = "beer"
			fake_name = "beer"
			needed_water = 120
			needed_crop = "wheat"
			needed_crop_amount = 40
			needed_crop_one = "poppy" //Hopps
			needed_crop_one_amount = 5
			price_tag_setter = 1750
			brew_timer = 120 //2 mins
			brewed_amount = 12 //12 pack

		if("beer2")
			brew_to = "beer2"
			fake_name = "sleepy beer"
			needed_water = 60
			needed_crop = "wheat"
			needed_crop_amount = 10
			needed_crop_one = "poppy" //Hopps
			needed_crop_one_amount = 5
			//chems
			needed_chem_one = "chloralhydrate"
			needed_chem_one_amount = 5
			price_tag_setter = 2250
			brew_timer = 120 //2 mins
			brewed_amount = 6 //6 pack

		if("wine")
			brew_to = "wine"
			fake_name = "wine"
			needed_water = 160
			needed_crop = "grapes"
			needed_crop_amount = 80
			needed_crop_one = "towercap"
			needed_crop_one_amount = 5
			//chems
			needed_chem_one = "sugar"
			needed_chem_one_amount = 15
			price_tag_setter = 3000
			brew_timer = 480 //8 mins
			brewed_amount = 2 //2 pack

		if("pwine")
			brew_to = "pwine"
			fake_name = "fungal wine (poison)"
			needed_water = -1
			needed_crop = "grapes"
			needed_crop_amount = 10
			needed_crop_one = "towercap"
			needed_crop_one_amount = 5
			needed_crop_two = "plumphelmet"
			needed_crop_two_amount = 5
			//chems
			needed_chem_one = "amatoxin"
			needed_chem_one_amount = 15
			price_tag_setter = 4000
			brew_timer = 960 //16 mins
			brewed_amount = 1 //1 pack

		if("redcandyliquor")
			brew_to = "redcandyliquor"
			fake_name = "red candy wine"
			needed_water = -1
			needed_crop = "grapes"
			needed_crop_amount = 10
			needed_crop_one = "sunflowers"
			needed_crop_one_amount = 5
			needed_crop_two = "harebells"
			needed_crop_two_amount = 5
			//chems
			needed_chem_one = "sugar"
			needed_chem_one_amount = 15
			price_tag_setter = 4000
			brew_timer = 960 //16 mins
			brewed_amount = 1 //1 pack

		if("ntcahors")
			brew_to = "ntcahors"
			fake_name = "blessed wine"
			needed_water = -1
			needed_crop = "greengrapes"
			needed_crop_amount = 30
			needed_crop_one = "sugarcane"
			needed_crop_one_amount = 25
			//chems
			needed_chem_one = "carbon"
			needed_chem_one_amount = 120
			needed_chem_two = "holywater"
			needed_chem_two_amount = 120
			price_tag_setter = 6000
			brew_timer = 3600 //1 hour
			brewed_amount = 1 //1 pack

		if("rum")
			brew_to = "rum"
			fake_name = "rum"
			needed_water = 120
			needed_crop = "sugarcane"
			needed_crop_amount = 60
			needed_crop_one = "towercap"
			needed_crop_one_amount = 5
			//chems
			needed_chem_one = "sodiumchloride"
			needed_chem_one_amount = 5
			price_tag_setter = 2000
			brew_timer = 420 //7 mins
			brewed_amount = 4 //4 pack

		if("ale")
			brew_to = "ale"
			fake_name = "ale"
			needed_water = 120
			needed_crop = "wheat"
			needed_crop_amount = 60
			needed_crop_one = "towercap"
			needed_crop_one_amount = 5
			needed_crop_two = "poppy"
			needed_crop_two_amount = 25
			//chems
			needed_chem_one = "honey"
			needed_chem_one_amount = 5
			price_tag_setter = 4000
			brew_timer = 840 //14 mins
			brewed_amount = 12 //12 pack

		//Fast n cheap
		if("vodka")
			brew_to = "vodka"
			fake_name = "vodka"
			needed_water = 80
			needed_crop = "potato"
			needed_crop_amount = 30
			needed_crop_one = "corn"
			needed_crop_one_amount = 15
			price_tag_setter = 1000
			brewed_amount = 4 //4 pack
			brew_timer = 60 //1 mins

		if("Kvass")
			brew_to = "Kvass"
			fake_name = "kvass"
			needed_water = 200
			needed_crop = "wheat"
			needed_crop_amount = 30
			price_tag_setter = 1200
			brewed_amount = 3 //3 pack
			brew_timer = 180 //3 mins

		if("whiskey")
			brew_to = "whiskey"
			fake_name = "whiskey"
			needed_water = 120
			needed_crop = "wheat"
			needed_crop_amount = 40
			needed_crop_one = "towercap" //For that iTs AgEd iN aN OAk BaRrEl
			needed_crop_one_amount = 5
			price_tag_setter = 2000
			brew_timer = 1200 //20 mins, whiskey takes long to be done
			brewed_amount = 10 //10 pack

//Nom nom nom, so if the person is mass making we dont cheat them out of crops as much
/obj/structure/fermentation_keg/proc/consume_consume_consume_consume_consume_consume_consume_consume()
	if(reagents)
		//consume consume consume consume
		reagents.clear_reagents()
	stored_crop -= needed_crop_amount
	stored_crop_one -= needed_crop_one_amount
	stored_crop_two -= needed_crop_two_amount

//Remove only chemicals
/obj/structure/fermentation_keg/proc/clear_out_chemicals()
	if(reagents)
		//consume consume consume consume
		reagents.clear_reagents()

//Remove and reset
/obj/structure/fermentation_keg/proc/clear_out(forceful = FALSE)
	if(brewing)
		return FALSE

	if(!forceful && ready_for_bottleing)
		return FALSE

	if(reagents)
		reagents.clear_reagents()

	if(forceful)
		brew_to = null

	ready_for_bottleing = FALSE
	fake_name = null
	icon_state = "barrel_tapless_open"

	pitty_system(needed_crop, stored_crop)
	stored_crop = 0
	needed_crop = null
	needed_crop_amount = 0

	pitty_system(needed_crop_one, stored_crop_one)
	stored_crop_one = 0
	needed_crop_one = null
	needed_crop_one_amount = 0

	pitty_system(needed_crop_two, stored_crop_two)
	stored_crop_two = 0
	needed_crop_two = null
	needed_crop_two_amount = 0
	needed_water = 0
	price_tag = 150
	return TRUE

//For returning plants that are leftover
/obj/structure/fermentation_keg/proc/pitty_system(pitty_crop, sack_of_potatos)
	if(!pitty_crop)
		return //fast return
	var/PS
	var/able = FALSE
	switch(pitty_crop)
		if("wheat")
			PS = /obj/plant_spawner/wheat
		if("poppies")
			PS = /obj/plant_spawner/poppy
		if("grapes")
			PS = /obj/plant_spawner/grapes
		if("greengrapes")
			PS = /obj/plant_spawner/green_grapes
		if("towercap")
			PS = /obj/plant_spawner/towercaps
		if("sugarcane")
			PS = /obj/plant_spawner/sugarcane
		if("corn")
			PS = /obj/plant_spawner/corn
		if("potato")
			PS = /obj/plant_spawner/potato
		if("plumphelmet")
			PS = /obj/plant_spawner/plumphelmet
		if("sunflowers")
			PS = /obj/plant_spawner/sunflower

	if(PS)
		able = TRUE

	if(able)
		var/tickets
		for(tickets=0, tickets<sack_of_potatos, tickets++)
			new PS(get_turf(src))
	return

/obj/structure/fermentation_keg/proc/start_brew()
	brewing = TRUE
	consume_consume_consume_consume_consume_consume_consume_consume()
	addtimer(CALLBACK(src, .proc/end_brew), brew_timer SECONDS)
	icon_state = "barrel_tapless"

/obj/structure/fermentation_keg/proc/end_brew()
	icon_state = "barrel_tapless_ready"
	ready_for_bottleing = TRUE
	brewing = FALSE
	price_tag = price_tag_setter


/obj/structure/fermentation_keg/proc/try_n_brew(mob/user)
	if(!brew_to)
		if(user)
			to_chat(user, SPAN_NOTICE("You need to set a booze to brew!"))
		return FALSE

	if(brewing)
		if(user)
			to_chat(user, SPAN_NOTICE("This keg is already brewing a mix!"))
		return FALSE


	if(!water_check(user))
		return FALSE

	//Crops
	if(needed_crop)
		if(needed_crop_amount > stored_crop)
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [needed_crop]!"))
			return FALSE

	if(needed_crop_one)
		if(needed_crop_one_amount > stored_crop)
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [needed_crop_one]!"))
			return FALSE
	if(needed_crop_two)
		if(needed_crop_two_amount > stored_crop)
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [needed_crop_two]!"))
			return FALSE
	//Chems
	if(needed_chem_one)
		var/chem_one_has = reagents.get_reagent_amount("[needed_chem_one]")
		if(needed_chem_one_amount > chem_one_has)
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [get_reagent_name_by_id(needed_chem_one)]!"))
			return FALSE

	if(needed_chem_two)
		var/chem_one_has = reagents.get_reagent_amount("[needed_chem_two]")
		if(needed_chem_one_amount > chem_one_has)
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [get_reagent_name_by_id(needed_chem_two)]!"))
			return FALSE

	return TRUE

//returns eather true or false, checks if we have the required water amount
/obj/structure/fermentation_keg/proc/water_check(mob/user)
	if(!needed_water || 0 >= needed_water)
		return TRUE
	var/water_has = 0
	if(reagents)
		water_has = reagents.get_reagent_amount("water")
		if(water_has >= needed_water)
			return TRUE
	if(user)
		to_chat(user, SPAN_NOTICE("\The [src] needs at least [needed_water] units of water, currently only [water_has]!"))
	return FALSE


/obj/structure/fermentation_keg/proc/bottle()
	if(brew_to && ready_for_bottleing)
		var/bottles
		var/able = FALSE
		switch(brew_to)
			if("beer")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/small/beer
			if("beer2")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/small/beer_two
			if("wine")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/wine
			if("redcandywine")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/redcandywine
			if("pwine")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/pwine
			if("ntcahors")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/ntcahors
			if("vodka")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/vodka
			if("Kavss")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/small/kvass
			if("rum")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/rum
			if("ale")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/small/ale
			if("whiskey")
				bottles = /obj/item/reagent_containers/food/drinks/bottle/whiskey


		if(bottles)
			able = TRUE

		if(able)
			ready_for_bottleing = FALSE
			brewing = FALSE
			price_tag = 150
			icon_state = "barrel_tapless_open"
			var/bottlecaps
			for(bottlecaps=0, bottlecaps<brewed_amount, bottlecaps++)
				new bottles(get_turf(src))

/obj/structure/fermentation_keg/verb/reset_keg()
	set name = "Clear Keg (Completely Resets)"
	set category = "Object"
	set src in range(1)

	if(!isghost(usr))
		clear_out(TRUE)
	else
		to_chat(usr, SPAN_NOTICE("Sadly this keg isnt brewing spirits!"))