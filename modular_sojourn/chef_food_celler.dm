
/obj/structure/celler
	name = "Cellar"
	desc = "A pulley-system that leads down into a warehouse for food and drink. Has a smart scanner to make sure no non-requested food or drink is sent below."
	icon = 'icons/obj/closet.dmi'
	icon_state = "ecase_door"
	density = FALSE
	anchored = TRUE

	var/obj/item/reagent_containers/food/snacks/requested_food = null
	var/allowed_foods = null
	var/list/denie_list_f = list(
	//Raw
	/obj/item/reagent_containers/food/snacks,
	/obj/item/reagent_containers/food/snacks/rawcutlet,
	/obj/item/reagent_containers/food/snacks/rawbacon,
	/obj/item/reagent_containers/food/snacks/rawmeatball,
	/obj/item/reagent_containers/food/snacks/patty_raw,
	/obj/item/reagent_containers/food/snacks/organ,
	/obj/item/reagent_containers/food/snacks/rawsticks,
	/obj/item/reagent_containers/food/snacks/patty,
	/obj/item/reagent_containers/food/snacks/chickenbreast,
	/obj/item/reagent_containers/food/snacks/cutlet,
	/obj/item/reagent_containers/food/snacks/bun,
	/obj/item/reagent_containers/food/snacks/flatdoughslice,
	/obj/item/reagent_containers/food/snacks/spagetti,
	/obj/item/reagent_containers/food/snacks/doughslice,
	/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
	/obj/item/reagent_containers/food/snacks/dough,
	/obj/item/reagent_containers/food/snacks/butterslice,
	/obj/item/reagent_containers/food/snacks/watermelonslice,
	//Unresonable
	/obj/item/reagent_containers/food/snacks/cheesewedge,
	/obj/item/reagent_containers/food/snacks/chocolatepiece,
	/obj/item/reagent_containers/food/snacks/chocolatepiece/white,
	/obj/item/reagent_containers/food/snacks/boiledslimecore,
	/obj/item/reagent_containers/food/snacks/mint,
	/obj/item/reagent_containers/food/snacks/jelliedtoast,
	/obj/item/reagent_containers/food/snacks/jelliedtoast/cherry,
	/obj/item/reagent_containers/food/snacks/jelliedtoast/slime,
	/obj/item/reagent_containers/food/snacks/rofflewaffles,
	/obj/item/reagent_containers/food/snacks/poppypretzel/holy,
	/obj/item/reagent_containers/food/snacks/badrecipe,
	/obj/item/reagent_containers/food/snacks/tomatomeat,
	/obj/item/reagent_containers/food/snacks/brainburger,
	/obj/item/reagent_containers/food/snacks/monkeyburger,
	/obj/item/reagent_containers/food/snacks/roburger,
	/obj/item/reagent_containers/food/snacks/roburgerbig,
	/obj/item/reagent_containers/food/snacks/clownburger,
	/obj/item/reagent_containers/food/snacks/mimeburger,
	/obj/item/reagent_containers/food/snacks/spellburger,
	/obj/item/reagent_containers/food/snacks/jellyburger/slime,
	/obj/item/reagent_containers/food/snacks/jellyburger/cherry,
	/obj/item/reagent_containers/food/snacks/bigbiteburger/cargo,
	/obj/item/reagent_containers/food/snacks/kaiserburger,
	/obj/item/reagent_containers/food/snacks/sliceable/braincake,
	/obj/item/reagent_containers/food/snacks/braincakeslice,
	/obj/item/reagent_containers/food/snacks/meat/runtimes_dinner,
	/obj/item/reagent_containers/food/snacks/csandwich,
	/obj/item/reagent_containers/food/snacks/toasted_guild_sandwich,
	/obj/item/reagent_containers/food/snacks/toastedsandwich/holy,
	/obj/item/reagent_containers/food/snacks/jellysandwich,
	/obj/item/reagent_containers/food/snacks/jellysandwich/slime,
	/obj/item/reagent_containers/food/snacks/jellysandwich/cherry,
	/obj/item/reagent_containers/food/snacks/slimesoup,
	/obj/item/reagent_containers/food/snacks/clownstears,
	//Vender stuff
	/obj/item/reagent_containers/food/snacks/candy,
	/obj/item/reagent_containers/food/snacks/chocolatebar,
	/obj/item/reagent_containers/food/snacks/candy/donor,
	/obj/item/reagent_containers/food/snacks/candy/proteinbar,
	/obj/item/reagent_containers/food/snacks/candy/pistachios_pack,
	/obj/item/reagent_containers/food/snacks/candy/sunflowerseeds,
	/obj/item/reagent_containers/food/snacks/candy/energybar,
	/obj/item/reagent_containers/food/snacks/candy_corn,
	/obj/item/reagent_containers/food/snacks/candy_drop_blue,
	/obj/item/reagent_containers/food/snacks/candy_drop_red,
	/obj/item/reagent_containers/food/snacks/sosjerky,
	/obj/item/reagent_containers/food/snacks/cheesiehonkers,
	/obj/item/reagent_containers/food/snacks/dogtreats,
	/obj/item/reagent_containers/food/snacks/openable/chips,
	/obj/item/reagent_containers/food/snacks/openable/gamerchips,
	/obj/item/reagent_containers/food/snacks/openable/syndicake,
	/obj/item/reagent_containers/food/snacks/openable/no_raisin,
	/obj/item/reagent_containers/food/snacks/openable/spacetwinkie,
	/obj/item/reagent_containers/food/snacks/openable/liquidfood,
	/obj/item/reagent_containers/food/snacks/openable/tastybread,
	/obj/item/reagent_containers/food/snacks/donkpocket,
	/obj/item/reagent_containers/food/snacks/donkpocket/sinpocket,
	//tisanes
	/obj/item/reagent_containers/food/snacks/helmet_tisane,
	/obj/item/reagent_containers/food/snacks/mercy_tisane,
	/obj/item/reagent_containers/food/snacks/vale_tisane,
	/obj/item/reagent_containers/food/snacks/poppy_tisane
	)
	//What we currently want as a drink
	var/datum/reagent/requested_drink = null
	//Drinks that are directly denied, more types are blacklisted then this
	var/list/denie_list_d = list(
	/datum/reagent/ethanol,
	/datum/reagent/ethanol/absinthe,
	/datum/reagent/ethanol/beer,
	/datum/reagent/ethanol/ale,
	/datum/reagent/ethanol/Kvass,
	/datum/reagent/ethanol/bluecuracao,
	/datum/reagent/ethanol/redcandywine,
	/datum/reagent/ethanol/nanatsunoumi,
	/datum/reagent/ethanol/cognac,
	/datum/reagent/ethanol/gin,
	/datum/reagent/ethanol/coffee,
	/datum/reagent/ethanol/coffee/kahlua,
	/datum/reagent/ethanol/melonliquor,
	/datum/reagent/ethanol/rum,
	/datum/reagent/ethanol/sake,
	/datum/reagent/ethanol/tequilla,
	/datum/reagent/ethanol/vermouth,
	/datum/reagent/ethanol/thirteenloko,
	/datum/reagent/ethanol/vodka,
	/datum/reagent/ethanol/whiskey,
	/datum/reagent/ethanol/wine,
	/datum/reagent/ethanol/ntcahors,
	/datum/reagent/ethanol/pwine,
	/datum/reagent/ethanol/schnapps,
	/datum/reagent/ethanol/specialwhiskey,
	/datum/reagent/drink,
	/datum/reagent/drink/energy_drink_monster,
	/datum/reagent/drink/energy_drink_baton,
	/datum/reagent/drink/ice,
	/datum/reagent/drink/blendedmint,
	/datum/reagent/drink/cinnamonpowder,
	/datum/reagent/drink/grenadine,
	/datum/reagent/drink/tonic,
	/datum/reagent/drink/space_cola,
	/datum/reagent/drink/spacemountainwind,
	/datum/reagent/drink/dr_gibb,
	/datum/reagent/drink/space_up,
	/datum/reagent/drink/lemon_lime,
	/datum/reagent/drink/melonsoda,
	/datum/reagent/drink/sodawater,
	/datum/reagent/drink/grapesoda,
	/datum/reagent/drink/nuka_cola,
	/datum/reagent/drink/hot_coco,
	/datum/reagent/drink/protein_shake,
	/datum/reagent/drink/protein_shake/commercial,
	/datum/reagent/drink/banana,
	/datum/reagent/drink/grapejuice,
	/datum/reagent/drink/carrotjuice,
	/datum/reagent/drink/berryjuice,
	/datum/reagent/drink/lemonjuice,
	/datum/reagent/drink/limejuice,
	/datum/reagent/drink/orangejuice,
	/datum/reagent/drink/potato_juice,
	/datum/reagent/drink/tomatojuice,
	/datum/reagent/drink/watermelonjuice,
	/datum/reagent/drink/pineapplejuice,
	/datum/reagent/drink/blueberryjuice,
	/datum/reagent/drink/strawberryjuice
	)
	var/allowed_drinks = null
	//Cooldowns
	var/drinking_glass_cooldown = FALSE
	var/cooldown_timer_glasses = 30 SECONDS
	var/reroll_on_cooldown = FALSE
	var/reroll_cooldown = 15 SECONDS //every 15 seconds you can reroll the drink, adds up



/obj/structure/celler/Initialize()
	. = ..()
	handle_drinks()
	handle_foods()

/obj/structure/celler/examine(mob/user)
	..()

	if(requested_food)
		to_chat(user, "<span class='info'>Client is requesting [requested_food.name], appraised and of higher food quality.</span>")

	if(requested_drink)
		to_chat(user, "<span class='info'>Client is requesting a glass of [requested_drink.name] (30+u Drinking Glass).</span>")

	if(!drinking_glass_cooldown)
		to_chat(user, "<span class='info'>Swipe ID card to access a box of spare Drinking Glasses.</span>")

	if(!reroll_cooldown)
		to_chat(user, "<span class='info'>Use a deny stamp to reroll the current Client's unresonable requests.</span>")


/obj/structure/celler/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/food/snacks) && requested_food)
		var/obj/item/reagent_containers/food/snacks/SNACK = I
		if(SNACK.bitecount > 0 || SNACK.oldified)
			to_chat(user, "<span class='info'>The micro-AI beeps red, no shoving in rotten or bitten food.</span>")
			return
		if(initial(SNACK.name) == requested_food.name)
			celler_request_food_completed(SNACK, user)
		return
	if(istype(I, /obj/item/reagent_containers/food/drinks/drinkingglass) && requested_drink)
		var/obj/item/reagent_containers/food/drinks/drinkingglass/DG = I
		for(var/datum/reagent/R in DG.reagents.reagent_list)
			if(R.volume >= 30 && R == requested_drink.name)
				celler_request_drink_completed(DG, user, R.volume)
				break
		return
	if(istype(I, /obj/item/card/id) && !drinking_glass_cooldown)
		to_chat(user, "<span class='info'>You swipe the ID over the mico-AI's scanner leading to it dropping a box of drinking glasses at your feet.</span>")
		new /obj/item/storage/box/drinkingglasses(user.loc)
		drinking_glass_cooldown = TRUE
		addtimer(CALLBACK(src, PROC_REF(celler_request_drink_completed)), cooldown_timer_glasses)
		cooldown_timer_glasses *= 2 //Dobles in wait time every use. 30->60->120->ect
		return
	if(istype(I, /obj/item/stamp/denied) && !reroll_on_cooldown)
		to_chat(user, "<span class='info'>You hold up the [I] mico-AI's scanner making it flash red a few times before printing out a set of new orders.</span>")
		reroll_drink()
		reroll_on_cooldown = TRUE
		addtimer(CALLBACK(src, PROC_REF(cooldown_clearer)), reroll_cooldown)
		return
	..()

/obj/structure/celler/proc/cooldown_clearer()
	reroll_on_cooldown = FALSE

//Everything to do with food!
/obj/structure/celler/proc/handle_foods()
	LAZYINITLIST(allowed_foods)

	var/list/food_to_add = list(typesof(/obj/item/reagent_containers/food/snacks)\
	 - denie_list_f \
	 - typesof(/obj/item/reagent_containers/food/snacks/openable) \
	 - typesof(/obj/item/reagent_containers/food/snacks/human) \
	 - typesof(/obj/item/reagent_containers/food/snacks/meat) \
	 - typesof(/obj/item/reagent_containers/food/snacks/donut) \
	 - typesof(/obj/item/reagent_containers/food/snacks/grown) \
	 - typesof(/obj/item/reagent_containers/food/snacks/egg))
	for(var/FTA in food_to_add)
		if(FTA)
			LAZYADD(allowed_foods, FTA)

	reroll_food()

/obj/structure/celler/proc/celler_request_food_completed(obj/item/reagent_containers/food/snacks/I, mob/user)
	to_chat(user, "<span class='info'>The Cellar slowly produces some credits as you hand in the dish.</span>")
	qdel(I)
	var/price = I.get_item_cost()
	if(I.appraised)
		price += 10 //Adds a base 10 credits
	price *= (1+I.sanity_gain)

	if(I.food_quality>0)
		//Anti-Scaling
		if(I.food_quality >= 500)
			I.food_quality *= 0.5
		//Again!
		if(I.food_quality >= 500)
			I.food_quality *= 0.5

		price += (I.food_quality*0.1)

	price = round(price)
	if(0 >= price)
		price = 1
	spawn_money(price, user.loc, user)
	reroll_food()

/obj/structure/celler/proc/reroll_food(mob/user)
	var/old_requested_food = requested_food

	requested_food = pick(allowed_foods)
	//Ensure we want a different drink.
	while(requested_food == old_requested_food)
		requested_food = pick(allowed_foods)

	if(user)
		to_chat(user, "<span class='info'>The Cellar's mico-AI prints out a new request for [requested_food].</span>")

//Everything to do with drinks!
/obj/structure/celler/proc/cooldown_clearer_glasses()
	drinking_glass_cooldown = FALSE

/obj/structure/celler/proc/handle_drinks()
	LAZYINITLIST(allowed_drinks)

	var/list/drinks_to_add = list(typesof(/datum/reagent/ethanol) + typesof(/datum/reagent/drink) - denie_list_d - typesof(/datum/reagent/drink/coffee) - typesof(/datum/reagent/drink/tea) - typesof(/datum/reagent/drink/milk))
	for(var/DRA in drinks_to_add)
		if(DRA)
			LAZYADD(allowed_drinks, DRA)

	reroll_drink()

/obj/structure/celler/proc/celler_request_drink_completed(obj/I, mob/user, units)
	to_chat(user, "<span class='info'>The Cellar slowly dispenses some credits as you hand in the drink.</span>")
	qdel(I)
	var/wealth = round(requested_drink.price_per_unit * 60 * 2 + (units / 2)) //If you give more then what is requested then get rewarded.
	spawn_money(wealth, user.loc, user)
	reroll_drink()

/obj/structure/celler/proc/reroll_drink(mob/user)
	var/old_requested_drink = requested_drink

	requested_drink = pick(allowed_drinks)
	//Ensure we want a different drink.
	while(requested_drink == old_requested_drink)
		requested_drink = pick(allowed_drinks)

	if(user)
		to_chat(user, "<span class='info'>The Cellar's mico-AI prints out a new request for [get_reagent_name_by_id(requested_drink)].</span>")


