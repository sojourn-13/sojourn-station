
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food. They all
//	leave empty containers when used up and can be filled/re-filled with other items. Formatting for first section is identical
//	to mixed-drinks code. If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/reagent_containers/food/condiment
	name = "condiment container"
	desc = "Just your average condiment container."
	icon = 'icons/obj/food.dmi'
	icon_state = "emptycondiment"
	reagent_flags = OPENCONTAINER
	possible_transfer_amounts = list(1,5,10)
	center_of_mass = list("x"=16, "y"=6)
	volume = 60

	attackby(var/obj/item/W as obj, var/mob/user as mob)
		return

	attack_self(var/mob/user as mob)
		return

	attack(var/mob/M as mob, var/mob/user as mob, var/def_zone)
		standard_feed_mob(user, M)

	afterattack(var/obj/target, var/mob/user, var/proximity)
		if(!proximity)
			return

		if(standard_pour_into(user, target))
			return
		if(standard_dispenser_refill(user, target))
			return

		if(istype(target, /obj/item/reagent_containers/food/snacks)) // These are not opencontainers but we can transfer to them
			if(!reagents || !reagents.total_volume)
				to_chat(user, SPAN_NOTICE("There is no condiment left in \the [src]."))
				return

			if(!target.reagents.get_free_space())
				to_chat(user, SPAN_NOTICE("You can't add more condiment to \the [target]."))
				return

			var/trans = reagents.trans_to_obj(target, amount_per_transfer_from_this)
			to_chat(user, SPAN_NOTICE("You add [trans] units of the condiment to \the [target]."))
		else
			..()

	feed_sound(var/mob/user)
		playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1)

	self_feed_message(var/mob/user)
		to_chat(user, SPAN_NOTICE("You swallow some of contents of \the [src]."))

	on_reagent_change()
		if(icon_state == "saltshakersmall" || icon_state == "peppermillsmall" || icon_state == "flour" || icon_state == "sugarsmall")
			return
		if(reagents.reagent_list.len > 0)
			switch(reagents.get_master_reagent_id())
				if("ketchup")
					name = "Ketchup"
					desc = "You feel more American already."
					icon_state = "ketchup"
					center_of_mass = list("x"=16, "y"=6)
				if("bbqsauce")
					name = "Barbecue sauce"
					desc = "Pass the ribs!"
					icon_state = "bbqsauce"
					center_of_mass = list("x"=17, "y"=8)
				if("capsaicin")
					name = "Hotsauce"
					desc = "You can almost TASTE the stomach ulcers now!"
					icon_state = "hotsauce"
					center_of_mass = list("x"=16, "y"=6)
				if("enzyme")
					name = "Universal Enzyme"
					desc = "Used in cooking various dishes."
					icon_state = "enzyme"
					center_of_mass = list("x"=16, "y"=6)
				if("soysauce")
					name = "Soy Sauce"
					desc = "A salty soy-based flavoring."
					icon_state = "soysauce"
					center_of_mass = list("x"=16, "y"=6)
				if("frostoil")
					name = "Coldsauce"
					desc = "Leaves the tongue numb in its passage."
					icon_state = "coldsauce"
					center_of_mass = list("x"=16, "y"=6)
				if("sodiumchloride")
					name = "Salt Bag"
					desc = "A big bag of Salt. From space oceans, presumably."
					icon_state = "salt" // "saltshaker" was nonexistant
					center_of_mass = list("x"=16, "y"=10)
				if("blackpepper")
					name = "Pepper Mill"
					desc = "Often used to flavor food or make people sneeze."
					icon_state = "peppermillsmall"
					center_of_mass = list("x"=16, "y"=10)
				if("sugar")
					name = "Sugar sack"
					icon_state = "sugar"
					desc = "A big bag of sugar, universal sweetener and cavity generator."
					center_of_mass = list("x"=16, "y"=6)
					if(prob(50))
						icon_state = "sugarsmall"
						desc = "Tasty space sugar!"
				if("cornoil")
					name = "Cooking Oil Bottle"
					icon_state = "oliveoil"
					desc = "A bottle of corn oil, for all your deep frying needs."
					center_of_mass = list("x"=16, "y"=6)
				if("vinegar")
					name = "Vinegar Bottle"
					icon_state = "vinegar"
					desc = "A bottle of red wine vinegar, a great condiment for many a salad and more."
					center_of_mass = list("x"=16, "y"=6)
				else
					name = "Misc Condiment Bottle"
					if (reagents.reagent_list.len==1)
						desc = "A condiment bottle filled with [reagents.get_master_reagent_name()]."
					else
						desc = "A mixture of various condiments, [reagents.get_master_reagent_name()] being the most prevalent one on it."
					icon_state = "mixedcondiments"
					center_of_mass = list("x"=16, "y"=6)
		else
			icon_state = "emptycondiment"
			name = "Condiment Bottle"
			desc = "An empty condiment bottle."
			center_of_mass = list("x"=16, "y"=6)
			return

/obj/item/reagent_containers/food/condiment/enzyme
	name = "universal enzyme"
	desc = "Used in cooking various dishes."
	icon_state = "enzyme"
	preloaded_reagents = list("enzyme" = 50)

/obj/item/reagent_containers/food/condiment/sugar
	name = "Sugar shaker"
	desc = "Tasty space sugar!"
	icon_state = "sugarsmall"
	preloaded_reagents = list("sugar" = 30)

/obj/item/reagent_containers/food/condiment/cookingoil
	name = "cooking oil bottle"
	desc = "A bottle of corn oil, for all your deep frying needs."
	icon_state = "oliveoil"
	possible_transfer_amounts = list(1,2,3,4,5,10)
	preloaded_reagents = list("cornoil" = 50)
	center_of_mass = list("x"=16, "y"=6)

//Seperate from above since it's a small shaker rather than a large one.
/obj/item/reagent_containers/food/condiment/saltshaker
	name = "salt shaker"
	desc = "Salt. From space oceans, presumably."
	icon_state = "saltshakersmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = 1
	volume = 20
	preloaded_reagents = list("sodiumchloride" = 20)

/obj/item/reagent_containers/food/condiment/peppermill
	name = "pepper mill"
	desc = "Often used to flavor food or make people sneeze."
	icon_state = "peppermillsmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = 1
	volume = 20
	preloaded_reagents = list("blackpepper" = 20)

/obj/item/reagent_containers/food/condiment/flour
	name = "flour sack"
	desc = "A big bag of flour. Good for baking!"
	icon = 'icons/obj/food.dmi'
	icon_state = "flour"
	item_state = "flour"
	preloaded_reagents = list("flour" = 50)


/obj/item/reagent_containers/food/condiment/pack
	name = "condiment pack"
	desc = "A small plastic pack with condiments to put on your food."
	icon_state = "condi_empty"
	volume = 10
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list()

	on_reagent_change()
		if(reagents.reagent_list.len > 0)
			switch(reagents.get_master_reagent_id())
				if("ketchup")
					name = "Ketchup"
					desc = "Mixed up with blood all the time."
					icon_state = "condi_ketchup"
					center_of_mass = list("x"=16, "y"=6)
				if("vinegar")
					name = "Vinegar"
					desc = "Perfect to season your salad."
					icon_state = "condi_vinegar"
					center_of_mass = list("x"=16, "y"=6)
				if("bbqsauce")
					name = "Barbecue sauce"
					desc = "Get those ribs ready."
					icon_state = "condi_bbq"
					center_of_mass = list("x"=16, "y"=6)
				if("capsaicin")
					name = "Hotsauce"
					desc = "You can almost TASTE the stomach ulcers now!"
					icon_state = "condi_hotsauce"
					center_of_mass = list("x"=16, "y"=6)
				if("enzyme")
					name = "Universal Enzyme"
					desc = "Used in cooking various dishes."
					icon_state = "condi_soysauce"
					center_of_mass = list("x"=16, "y"=6)
				if("soysauce")
					name = "Soy Sauce"
					desc = "A salty soy-based flavoring."
					icon_state = "condi_soysauce"
					center_of_mass = list("x"=16, "y"=6)
				if("frostoil")
					name = "Coldsauce"
					desc = "Leaves the tongue numb in its passage."
					icon_state = "coldsauce"
					center_of_mass = list("x"=16, "y"=6)
				if("sodiumchloride")
					name = "Salt Shaker"
					desc = "Salt. From space oceans, presumably."
					icon_state = "condi_salt"
					center_of_mass = list("x"=16, "y"=10)
				if("blackpepper")
					name = "Pepper Mill"
					desc = "Often used to flavor food or make people sneeze."
					icon_state = "condi_pepper"
					center_of_mass = list("x"=16, "y"=10)
				if("cornoil")
					name = "Corn Oil"
					desc = "A delicious oil used in cooking. Made from corn."
					icon_state = "condi_cornoil"
					center_of_mass = list("x"=16, "y"=6)
				if("sugar")
					name = "Sugar"
					desc = "Tasty space sugar!"
					icon_state = "condi_sugar"
					center_of_mass = list("x"=16, "y"=6)
				else
					name = "Misc Condiment Bottle"
					if (reagents.reagent_list.len==1)
						desc = "Looks like it is [reagents.get_master_reagent_name()], but you are not sure."
					else
						desc = "A mixture of various condiments. [reagents.get_master_reagent_name()] is one of them."
					icon_state = "mixedcondiments"
					center_of_mass = list("x"=16, "y"=6)
		else
			icon_state = "emptycondiment"
			name = "Condiment Bottle"
			desc = "An empty condiment bottle."
			center_of_mass = list("x"=16, "y"=6)
			return

/obj/item/reagent_containers/food/condiment/pack/attack(mob/M, mob/user, target_zone) //Can't feed these to people directly.
	return

/obj/item/reagent_containers/food/condiment/pack/afterattack(obj/target, mob/user , proximity)
	. = ..()
	if(!proximity)
		return

	//You can tear the bag open above food to put the condiments on it, obviously.
	if(istype(target, /obj/item/reagent_containers/food/snacks))
		if(!reagents.total_volume)
			to_chat(user, "<span class='warning'>You tear open [src], but there's nothing in it.</span>")
			qdel(src)
			return
		if(target.reagents.total_volume >= target.reagents.maximum_volume)
			to_chat(user, "<span class='warning'>You tear open [src], but [target] is stacked so high that it just drips off!</span>" )
			qdel(src)
			return
		else
			to_chat(user, "<span class='notice'>You tear open [src] above [target] and the condiments drip onto it.</span>")
			src.reagents.trans_to(target, amount_per_transfer_from_this)
			qdel(src)

//Ketchup
/obj/item/reagent_containers/food/condiment/pack/ketchup
	name = "ketchup pack"
	preloaded_reagents = list("ketchup" = 10)

//Milk
/obj/item/reagent_containers/food/condiment/pack/milk
	name = "milk pack"
	preloaded_reagents = list("milk"= 10)

//Sugar
/obj/item/reagent_containers/food/condiment/pack/sugar
	name = "sugar pack"
	preloaded_reagents = list("sugar" = 10)

//Salt
/obj/item/reagent_containers/food/condiment/pack/salt
	name = "salt pack"
	preloaded_reagents = list("sodiumchloride" = 10)

//Pepper
/obj/item/reagent_containers/food/condiment/pack/pepper
	name = "pepper pack"
	preloaded_reagents = list("blackpepper" = 10)

//Hot sauce
/obj/item/reagent_containers/food/condiment/pack/hotsauce
	name = "hotsauce pack"
	preloaded_reagents = list("capsaicin" = 10)

// Barbecue sauce
/obj/item/reagent_containers/food/condiment/pack/bbq
	name = "bbq sauce pack"
	preloaded_reagents = list("bbqsauce" = 10)

// Vinegar pack
/obj/item/reagent_containers/food/condiment/pack/vinegar
	name = "vinegar pack"
	preloaded_reagents = list("vinegar" = 10)

