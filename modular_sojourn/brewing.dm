/obj/structure/fermentation_keg
	name = "Fermentation Keg"
	desc = "A simple keg that is meant for making booze."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrel_tapless_open"
	density = TRUE
	throwpass = TRUE
	climbable = TRUE
	reagent_flags = OPENCONTAINER | NO_REACT			//Lids open, we dont react to prevent some conflicting requrements
	var/ready_for_bottleing = FALSE						//After brewing we can sell or bottle, this is for the latter
	var/brewing = FALSE									//If we currently brewing a booze or not
	//Needed crops
	var/list/recipe_crop_stocks							//crop by kitch tag needed
	price_tag = 150

	var/datum/brewing_product/selected_recipe = null	//The repice we have seleceted to brew! woo

/obj/structure/fermentation_keg/Initialize()
	. = ..()
	create_reagents(240) //on agv it should be 120u for water then rest can be other needed chemicals
	recipe_crop_stocks = list()

/obj/structure/fermentation_keg/attack_hand(mob/user as mob)
	if(!brewing && (!selected_recipe || ready_for_bottleing))
		shopping_run(user)
		return

	if(try_n_brew(user))
		start_brew()
	..()

/obj/structure/fermentation_keg/attackby(obj/item/I, mob/user)
	var/produce_list
	var/obj/item/storage/bag/produce/POUCH

	if(istype(I, /obj/item/bottle_kit))
		var/obj/item/bottle_kit/BK = I
		bottle(BK.glass_colour)

	if(istype(I, /obj/item/reagent_containers/food/snacks/grown))
		produce_list = list(I)

	if(istype(I, /obj/item/storage/bag/produce))
		POUCH = I
		produce_list = POUCH.contents

	for(var/obj/item/reagent_containers/food/snacks/grown/G in produce_list)
		if(G.seed.name in selected_recipe?.needed_crops)
			var/amount = recipe_crop_stocks[G.seed.name] || 0
			recipe_crop_stocks[G.seed.name] = amount + 1
			qdel(G)

	POUCH?.refresh_all()

	..()

/obj/structure/fermentation_keg/examine(mob/user)
	..()

	if(selected_recipe)
		var/message = "Currently making: [selected_recipe.display_name].\n"

		for(var/required_chem in selected_recipe.needed_chems)
			message += "Reagent Needed: [get_reagent_name_by_id(required_chem)] [selected_recipe.needed_chems[required_chem]].\n"

		for(var/required_crop in selected_recipe.needed_crops)
			message += "Crop Needed: [required_crop] [selected_recipe.needed_crops[required_crop]], Current Amount: [recipe_crop_stocks[required_crop]].\n"

		//time
		if(selected_recipe.brew_timer)
			if(selected_recipe.brew_timer >= 600)
				message += "Once set, will take [selected_recipe.brew_timer/600] Minutes.\n"
			else
				message += "Once set, will take [selected_recipe.brew_timer] Seconds.\n"

		//How many are brewed
		if(selected_recipe.brewed_amount)
			message += "Will produce [selected_recipe.brewed_amount] bottles when finished.\n"

		if(selected_recipe.alt_brew_item && selected_recipe.alt_brew_item_amount)
			var/name_to_use = selected_recipe.other_name
			if(!name_to_use)
				name_to_use = selected_recipe.display_name
			message += "Will produce [name_to_use] x [selected_recipe.alt_brew_item_amount] when finished.\n"

		if(selected_recipe.info_helper)
			message += "[selected_recipe.info_helper].\n"

		to_chat(user, "<span class='info'>[message]</span>")

/obj/structure/fermentation_keg/proc/shopping_run(mob/user as mob)
	if(brewing)
		return

	var/list/options = list()
	for(var/path in typesof(/datum/brewing_product) - /datum/brewing_product)
		var/datum/brewing_product/recipe = path
		var/prereq = initial(recipe.prerequisite)
		if((!ready_for_bottleing && prereq == null) || (selected_recipe?.reagent_to_brew == prereq && ready_for_bottleing))
			options[initial(recipe.display_name)] = recipe

	if(options.len == 0)
		to_chat(user, "Their is no further brewing to be done, clear this barrel out or sell it.")
		return

	var/choice = input(user,"What brew do you want to make?") as null|anything in options

	if(!choice)
		return

	var/choice_to_spawn = options[choice]

	selected_recipe = new choice_to_spawn

	//Second stage brewing gives no refunds! - This is intented design to help make it so folks dont quit halfway through and still get a rebate
	//Grind core maxing!
	ready_for_bottleing = FALSE
	price_tag = 150
	icon_state = "barrel_tapless_open"

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

	ready_for_bottleing = FALSE
	icon_state = "barrel_tapless_open"

	for(var/crop in recipe_crop_stocks)
		pitty_system(crop, recipe_crop_stocks[crop])

	recipe_crop_stocks.Cut()

	price_tag = 150

	if(forceful)
		selected_recipe = null

	return TRUE

//For returning plants that are leftover
/obj/structure/fermentation_keg/proc/pitty_system(pitty_crop, sack_of_potatos)
	if(!pitty_crop)
		return //fast return
	var/tickets
	for(tickets=0, tickets<sack_of_potatos, tickets++)
		var/obj/plant_spawner/non_auto_spawn/PS = new /obj/plant_spawner/non_auto_spawn(get_turf(src))
		PS.seedtype = pitty_crop
		PS.spawn_growth()
	return

/obj/structure/fermentation_keg/proc/start_brew()
	brewing = TRUE

	for(var/G in selected_recipe.needed_crops)
		var/amount = recipe_crop_stocks[G] || 0
		recipe_crop_stocks[G] = amount - selected_recipe.needed_crops[G]

	if(reagents)
		//consume consume consume consume
		reagents.clear_reagents()

	addtimer(CALLBACK(src, PROC_REF(end_brew)), selected_recipe.brew_timer)
	icon_state = "barrel_tapless"

/obj/structure/fermentation_keg/proc/end_brew()
	icon_state = "barrel_tapless_ready"
	ready_for_bottleing = TRUE
	brewing = FALSE
	price_tag = selected_recipe.price_tag_setter

/obj/structure/fermentation_keg/proc/try_n_brew(mob/user)
	var/ready = TRUE
	if(!selected_recipe)
		if(user)
			to_chat(user, SPAN_NOTICE("You need to set a booze to brew!"))
		ready = FALSE

	if(brewing)
		if(user)
			to_chat(user, SPAN_NOTICE("This keg is already brewing a mix!"))
		ready = FALSE

	//Crops
	for(var/needed_crop in selected_recipe.needed_crops)
		if(recipe_crop_stocks[needed_crop]<selected_recipe.needed_crops[needed_crop])
			if(user)
				to_chat(user, SPAN_NOTICE("This keg lacks [needed_crop]!"))
				ready = FALSE


	for(var/required_chem in selected_recipe.needed_chems)
		if(selected_recipe.needed_chems[required_chem]>reagents.get_reagent_amount(required_chem))
			if(user)
				to_chat(user, SPAN_NOTICE("The keg's unable to brew well lacking [required_chem]!"))
				ready = FALSE

	return ready

/obj/structure/fermentation_keg/proc/bottle(glass_colour)
	if(ready_for_bottleing)

		ready_for_bottleing = FALSE
		brewing = FALSE
		price_tag = 150
		icon_state = "barrel_tapless_open"

		if(selected_recipe.reagent_to_brew)
			if(!glass_colour)
				glass_colour = "brew_bottle"

			var/bottlecaps
			for(bottlecaps=0, bottlecaps<selected_recipe.brewed_amount, bottlecaps++)
				var/obj/item/reagent_containers/food/drinks/bottle/small/brewing_bottle/bottle_made = new /obj/item/reagent_containers/food/drinks/bottle/small/brewing_bottle(get_turf(src))
				bottle_made.icon_state = "[glass_colour]"
				bottle_made.reagents.add_reagent("[selected_recipe.reagent_to_brew]", selected_recipe.bottled_brew_amount)
				bottle_made.icon_state_full = "[glass_colour]"
				bottle_made.icon_state_empty = "[glass_colour]_empty"

		if(selected_recipe.alt_brew_item)
			var/items_given
			for(items_given=0, items_given<selected_recipe.alt_brew_item_amount, items_given++)
				new selected_recipe.alt_brew_item(get_turf(src))


/obj/structure/fermentation_keg/verb/reset_keg()
	set name = "Clear Keg (Completely Resets)"
	set category = "Object"
	set src in range(1)

	if(!isghost(usr))
		clear_out(TRUE)
	else
		to_chat(usr, SPAN_NOTICE("Sadly this keg isnt brewing spirits!"))
