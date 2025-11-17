////////////////////////////////////////////////////////////////////////////////
/// Drinks.
////////////////////////////////////////////////////////////////////////////////
/obj/item/reagent_containers/drinks
	name = "drink"
	desc = "yummy"
	icon = 'icons/obj/drinks.dmi'
	icon_state = null
	reagent_flags = OPENCONTAINER
	amount_per_transfer_from_this = 5
	volume = 50
	var/base_name = null // Name to put in front of drinks, i.e. "[base_name] of [contents]"
	var/base_icon = null // Base icon name for fill states
	var/can_be_opened = TRUE // To distinguish between cans and non-cans

/obj/item/reagent_containers/drinks/Initialize()
	. = ..()
	if(is_drainable())
		verbs += /obj/item/reagent_containers/drinks/proc/gulp_whole

/obj/item/reagent_containers/drinks/on_reagent_change()
	update_icon()
	return

/obj/item/reagent_containers/drinks/attack_self(mob/user as mob)
	if(!is_open_container() && can_be_opened) // For any subtype of this parent that doesn't want to be opened like a can.
		open(user)

/obj/item/reagent_containers/drinks/proc/open(mob/user)
	playsound(loc, 'sound/effects/canopen.ogg', rand(10,50), 1)
	icon_state += "_open"
	to_chat(user, SPAN_NOTICE("You open [src] with an audible pop!"))
	reagent_flags |= OPENCONTAINER
	verbs += /obj/item/reagent_containers/drinks/proc/gulp_whole
	update_icon()

/obj/item/reagent_containers/drinks/attack(mob/M as mob, mob/user as mob, def_zone)
	if(force && !(flags & NOBLUDGEON) && user.a_intent == I_HURT)
		return ..()

	if(standard_feed_mob(user, M))
		return

	return 0

/obj/item/reagent_containers/drinks/afterattack(obj/target, mob/user, proximity)
	if(!proximity) return

	if(standard_pour_into(user, target))
		return
	if(standard_dispenser_refill(user, target))
		return
	return ..()

/obj/item/reagent_containers/drinks/is_closed_message(mob/user)
	to_chat(user, SPAN_NOTICE("You need to open [src] first!"))

/obj/item/reagent_containers/drinks/self_feed_message(var/mob/user)
	to_chat(user, SPAN_NOTICE("You swallow a gulp from \the [src]."))

/obj/item/reagent_containers/drinks/feed_sound(var/mob/user)
	playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1)

/obj/item/reagent_containers/drinks/update_icon()
	cut_overlays()
	if(reagents.total_volume)
		if(base_name)
			var/datum/reagent/R = reagents.get_master_reagent()
			SetName("[base_name] of [R.glass_name ? R.glass_name : "something"]")
			desc = R.glass_desc ? R.glass_desc : initial(desc)
		if(filling_states)
			var/mutable_appearance/filling = mutable_appearance(icon, "[base_icon][get_filling_state()]")
			filling.color = reagents.get_color()
			add_overlay(filling)
	else
		SetName(initial(name))
		desc = initial(desc)

/obj/item/reagent_containers/drinks/proc/gulp_whole()
	set category = "Object"
	set name = "Gulp Down"
	set src in view(1)

	if(isghost(usr))
		to_chat(usr, "You are a ghost! You can't do that!")
		return

	if(is_drainable())
		if(ishuman(usr))
			var/mob/living/carbon/human/H = usr
			var/obj/item/blocked = H.check_mouth_coverage()
			if(blocked)
				to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
				return

		if(reagents.total_volume > 30) // 30 equates to 3 SECONDS.
			usr.visible_message(SPAN_NOTICE("[usr] prepares to gulp down [src]."), SPAN_NOTICE("You prepare to gulp down \the [src]."))
		if(!do_after(usr, reagents.total_volume))
			standard_splash_mob(usr, usr)
			return

		if(!Adjacent(usr))
			return

		usr.visible_message(SPAN_NOTICE("[usr] gulped down the whole \the [src]!"),SPAN_NOTICE("You gulped down the whole \the [src]!"))
		reagents.trans_to_mob(usr, reagents.total_volume, CHEM_INGEST)
		feed_sound(usr)
	else
		is_closed_message(usr)

////////////////////////////////////////////////////////////////////////////////
/// Drinks. END
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/drinks/golden_cup
	desc = "golden cup"
	name = "golden cup"
	icon_state = "golden_cup"
	item_state = "" //nope :(
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	throwforce = 10
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = null
	volume = 150
	flags = CONDUCT

///////////////////////////////////////////////Drinks
//Notes by Darem: Drinks are simply containers that start preloaded. Unlike condiments, the contents can be ingested directly
//	rather then having to add it to something else first. They should only contain liquids. They have a default container size of 50.
//	Formatting is the same as food.

/obj/item/reagent_containers/drinks/milk
	name = "milk carton"
	desc = "A carton of milk."
	icon_state = "milk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("milk" = 50)

/obj/item/reagent_containers/drinks/soymilk
	name = "soy milk carton"
	desc = "A carton of soy milk."
	icon_state = "soymilk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("soymilk" = 50)

/obj/item/reagent_containers/drinks/milk/small
	name = "small milk carton"
	desc = "A smaller carton of milk"
	icon_state = "mini-milk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("milk" = 30)

/obj/item/reagent_containers/drinks/soymilk/small
	name = "small soy milk carton"
	desc = "A smaller carton of soy milk."
	icon_state = "mini-soymilk"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("soymilk" = 30)

/obj/item/reagent_containers/drinks/cocamilk/small
	name = "small chocolate milk carton"
	desc = "A small carton of chocolate milk. Brown and sweet goodness!"
	icon_state = "mini-milkcoca"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("chocolatemilk" = 30)

/obj/item/reagent_containers/drinks/redmilk/small
	name = "small strawberry milk carton"
	desc = "A small carton of strawberry milk. Red and sweet goodness!"
	icon_state = "mini-milkred"
	item_state = "carton"
	center_of_mass = list("x"=16, "y"=9)
	preloaded_reagents = list("strawberrymilk" = 30)

/obj/item/reagent_containers/drinks/coffee
	name = "Robust Coffee"
	desc = "A cup of hot coffee."
	icon_state = "coffee"
	center_of_mass = list("x"=15, "y"=10)
	base_icon = "cup"
	preloaded_reagents = list("coffee" = 30)

/obj/item/reagent_containers/drinks/coffee/update_icon()
	if(reagents.total_volume)
		icon_state = "coffee"
	else
		icon_state = "cup"

/obj/item/reagent_containers/drinks/os_coffee
	name = "Hot Black Water"
	desc = "A bottle of coffee."
	icon_state = "oscoffee"
	center_of_mass = list("x"=15, "y"=10)
	base_icon = "oscup"
	preloaded_reagents = list("coffee" = 30)

/obj/item/reagent_containers/drinks/ice
	name = "Northern Freeze"
	desc = "A frosty cup of ice."
	icon_state = "cup"
	center_of_mass = list("x"=15, "y"=10)
	base_icon = "cup"
	filling_states = "100"
	preloaded_reagents = list("ice" = 30)

/obj/item/reagent_containers/drinks/h_chocolate
	name = "Dutch Hot Coco"
	desc = "A cup of hot chocolate."
	icon_state = "hot_coco"
	item_state = "coffee"
	center_of_mass = list("x"=15, "y"=13)
	preloaded_reagents = list("hot_coco" = 30)

/obj/item/reagent_containers/drinks/h_chocolate/update_icon()
	if(reagents.total_volume)
		icon_state = "hot_coco"
	else
		icon_state = "cup"

/obj/item/reagent_containers/drinks/dry_ramen
	name = "Raving Ramen"
	desc = "A self-heating cup of ramen. Just add 10ml water."
	icon_state = "ramen"
	center_of_mass = list("x"=16, "y"=11)
	base_icon = "cup"
	filling_states = "100"
	preloaded_reagents = list("dry_ramen" = 30)

/obj/item/reagent_containers/drinks/dry_ramen/update_icon()
	if(reagents.total_volume)
		icon_state = "ramen"
	else
		icon_state = "ramen_e"

/obj/item/reagent_containers/drinks/dry_ramen/premade
	name = "Raving Ramen"
	desc = "A cup of ramen, with water, salt and even an egg already added."
	icon_state = "ramen"
	center_of_mass = list("x"=16, "y"=11)
	base_icon = "cup"
	filling_states = "100"
	preloaded_reagents = list("hot_ramen" = 30, "sodiumchloride" = 2, "egg" = 5)

/obj/item/reagent_containers/drinks/sillycup
	name = "paper cup"
	desc = "A paper water cup."
	icon_state = "water_cup_e"
	possible_transfer_amounts = null
	volume = 10
	center_of_mass = list("x"=16, "y"=12)

/obj/item/reagent_containers/drinks/sillycup/update_icon()
	if(reagents.total_volume)
		icon_state = "water_cup"
	else
		icon_state = "water_cup_e"


//////////////////////////pitchers, pots, flasks and cups//
//Note by Darem: This code handles the mixing of drinks. New drinks go in three places: In Chemistry-Reagents.dm (for the drink
//	itself), in Chemistry-Recipes.dm (for the reaction that changes the components into the drink), and here (for the drinking glass
//	icon states.

// Snowflake shaker code goes here, acting as a NO_REACT "cryostasis beaker" of sorts, reagent mixing enabled by manually shaking it in-hand. - Seb

/obj/item/reagent_containers/drinks/shaker
	name = "cocktail shaker"
	desc = "A metal cocktail shaker with a bluespace-infused stasis interior.  Give it a shake to mix its contents into a proper drink!" // Changing description so that people know why the hell their drinks aren't mixing. - Seb
	icon_state = "shaker"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,20,30,60,120)
	volume = 120
	center_of_mass = list("x"=17, "y"=10)
	reagent_flags = OPENCONTAINER | NO_REACT
	can_be_opened = FALSE


/obj/item/reagent_containers/drinks/shaker/Initialize()
	. = ..()
	verbs += /obj/item/reagent_containers/drinks/shaker/proc/shakeshake

/obj/item/reagent_containers/drinks/shaker/attack_self(mob/user as mob) // Double method to avoid having it become a soda can. - Seb
	shakeshake(user)
	return

/obj/item/reagent_containers/drinks/shaker/proc/shakeshake() // QOL action for RP purposes, bartender's shaker now has a true purpose after all! - Seb
	set category = "Object"
	set name = "Shake contents"
	set src in view(1)

	if(isghost(usr))
		to_chat(usr, "You are a ghost! You can't do that!")
		return

	if(is_drainable())
		usr.visible_message(SPAN_NOTICE("[usr] expertly shakes their [src] over their shoulder, thoroughly mixing the drink inside."), SPAN_NOTICE("You vigorously give \the [src] a shake over your shoulder, mixing the drink inside it."))
		flick("shakeshake", src)
		playsound(loc, 'sound/effects/shakeshake.ogg', 50, 1)
		do_after(usr, 30)
		reagent_flags &= ~NO_REACT
		icon_state = "shaker" //Just in case
		reagents.process_reactions() // This will mix one reaction at a time, to avoid bulk-mixing. Simply do the proc again to mix further. - Seb
		reagent_flags |= NO_REACT // Back to not mix drinks inside of it.
		icon_state = "shaker"
		return

// END OF SHAKER
/obj/item/reagent_containers/drinks/teapot
	name = "teapot"
	desc = "An elegant teapot. It simply oozes class."
	icon_state = "teapot"
	item_state = "teapot"
	matter = list(MATERIAL_STEEL = 1)
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=7)

/obj/item/reagent_containers/drinks/teapot/psych
	name = "teapot"
	desc = "An elegant and mysterious ornate teapot. One wonders what must be in it."
	icon_state = "teapot"
	item_state = "teapot"
	matter = list(MATERIAL_STEEL = 1)
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=7)
	preloaded_reagents = list("tea" = 80, "psi_juice" = 40)

/obj/item/reagent_containers/drinks/pitcher
	name = "insulated pitcher"
	desc = "A stainless steel insulated pitcher."
	icon_state = "pitcher"
	volume = 120
	amount_per_transfer_from_this = 10
	matter = list(MATERIAL_STEEL = 1)
	possible_transfer_amounts = list(5,10,20,30,60,120)
	center_of_mass = "x=16;y=9"
	filling_states = "15;30;50;70;85;100"
	base_icon = "pitcher"

/obj/item/reagent_containers/drinks/carafe
	name = "pitcher"
	desc = "A handled glass pitcher."
	icon_state = "carafe"
	item_state = "beaker"
	base_name = "pitcher"
	base_icon = "carafe"
	filling_states = "10;20;30;40;50;60;70;80;90;100"
	volume = 120
	matter = list(MATERIAL_GLASS = 1)
	possible_transfer_amounts = list(5,10,20,30,60,120)
	center_of_mass = "x=16;y=7"

/obj/item/reagent_containers/drinks/flask
	name = "premier's flask"
	desc = "A metal flask belonging to the Premier."
	icon_state = "flask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/reagent_containers/drinks/flask/shiny
	name = "shiny flask"
	desc = "A shiny metal flask. It appears to have a Greek symbol inscribed on it."
	icon_state = "shinyflask"

/obj/item/reagent_containers/drinks/flask/lithium
	name = "lithium flask"
	desc = "A flask with a Lithium Atom symbol on it."
	icon_state = "lithiumflask"

/obj/item/reagent_containers/drinks/flask/detflask
	name = "ranger's flask"
	desc = "A metal flask with a leather band and golden badge belonging to the Ranger."
	icon_state = "detflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=8)

/obj/item/reagent_containers/drinks/flask/barflask
	name = "flask"
	desc = "For those who can't be bothered to hang out at the bar to drink."
	icon_state = "barflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/reagent_containers/drinks/flask/vacuumflask
	name = "vacuum flask"
	desc = "A flask for keeping drinks either cold or hot for longer."
	icon_state = "vacuumflask"
	volume = 60
	center_of_mass = list("x"=15, "y"=4)

/obj/item/reagent_containers/drinks/mug
	name = "mug"
	desc = "A plain mug."
	icon_state = "mug"
	item_state = "coffee"
	volume = 30
	center_of_mass = "x=15;y=13"
	filling_states = "100"
	base_name = "mug"
	base_icon = "mug"

/obj/item/reagent_containers/drinks/mug/black
	name = "black mug"
	desc = "A sleek black mug."
	icon_state = "mug_black"
	base_name = "black mug"

/obj/item/reagent_containers/drinks/mug/green
	name = "green mug"
	desc = "A pale green and pink mug."
	icon_state = "mug_green"
	base_name = "green mug"

/obj/item/reagent_containers/drinks/mug/blue
	name = "blue mug"
	desc = "A blue and black mug."
	icon_state = "mug_blue"
	base_name = "blue mug"

/obj/item/reagent_containers/drinks/mug/red
	name = "red mug"
	desc = "A red and black mug."
	icon_state = "mug_red"
	base_name = "red mug"

/obj/item/reagent_containers/drinks/mug/heart
	name = "heart mug"
	desc = "A white mug, it prominently features a red heart."
	icon_state = "mug_heart"
	base_name = "heart mug"

/obj/item/reagent_containers/drinks/mug/one
	name = "#1 mug"
	desc = "A white mug, it prominently features a #1."
	icon_state = "mug_one"
	base_name = "#1 mug"

/obj/item/reagent_containers/drinks/mug/metal
	name = "metal mug"
	desc = "A metal mug. It's unclear which sort of metal."
	icon_state = "mug_metal"
	flags = CONDUCT
	base_name = "metal mug"

/obj/item/reagent_containers/drinks/mug/rainbow
	name = "rainbow mug"
	desc = "A rainbow mug. The colors are almost as blinding as a welder."
	icon_state = "mug_rainbow"
	base_name = "rainbow mug"

/obj/item/reagent_containers/drinks/mug/brit
	name = "flag mug"
	desc = "A mug with an unknown flag emblazoned on it. You feel like tea might be the only beverage that belongs in it."
	icon_state = "britmug"

/obj/item/reagent_containers/drinks/mug/moebius
	name = "\improper soteria mug"
	desc = "A mug with a Soteria Institute logo on it. Not even your morning coffee is safe from corporate advertising."
	icon_state = "mug_moebius"

/obj/item/reagent_containers/drinks/mug/moebius/sci
	name = "\improper soteria research mug"
	desc = "A mug with a Soteria Institute research department logo on it. Not even your morning coffee is safe from corporate advertising."
	icon_state = "mug_moebius_sci"

/obj/item/reagent_containers/drinks/mug/moebius/bio
	name = "\improper soteria biolabs mug"
	desc = "A mug with a Soteria Institute biolabs department logo on it. Not even your morning coffee is safe from corporate advertising."
	icon_state = "mug_moebius_bio"

/obj/item/reagent_containers/drinks/mug/gold
	name = "gold mug"
	desc = "A shiny gold-like mug."
	icon_state = "mug_gold"

/obj/item/reagent_containers/drinks/mug/old_nt
	name = "NanoTrasen mug"
	desc = "Not even your morning coffee is safe from corporate advertising."
	icon_state = "mug_old_nt"

/obj/item/reagent_containers/drinks/mug/new_nt
	name = "Absolute mug"
	desc = "A brown mug, it prominently features a tau-cross."
	icon_state = "mug_new_nt"

/obj/item/reagent_containers/drinks/mug/syndie
	name = "Syndicate mug"
	desc = "A sleek red mug."
	icon_state = "mug_syndie"

/obj/item/reagent_containers/drinks/mug/serb
	name = "Serbian mug"
	desc = "A mug with a Serbian flag emblazoned on it."
	icon_state = "mug_serb"

/obj/item/reagent_containers/drinks/mug/ironhammer
	name = "Blackshield mug"
	desc = "A mug with an Blackshield sign on it."
	icon_state = "mug_hammer"

/obj/item/reagent_containers/drinks/mug/league
	name = "Technomancer mug"
	desc = "A mug with a Technomancer League logo on it."
	icon_state = "mug_league"

/obj/item/reagent_containers/drinks/mug/moe
	name = "\improper soteria mug"
	desc = "A white mug with Soteria Institute logo on it."
	icon_state = "mug_moe"

/obj/item/reagent_containers/drinks/mug/moe/sci
	name = "\improper soteria research mug"
	desc = "A white mug with Soteria Institute research department logo on it."
	icon_state = "mug_moe_sci"

/obj/item/reagent_containers/drinks/mug/moe/bio
	name = "\improper soteria biolabs mug"
	desc = "A white mug with Soteria Institute biolabs department logo on it."
	icon_state = "mug_moe_bio"

/obj/item/reagent_containers/drinks/mug/aster
	name = "Aster mug"
	desc = "A fancy gold mug with a Aster Guild logo on it."
	icon_state = "mug_aster"

/obj/item/reagent_containers/drinks/mug/guild
	name = "Guild mug"
	desc = "A plain mug with a Guild logo on it."
	icon_state = "mug_guild"

/obj/item/reagent_containers/drinks/mug/white
	name = "white mug"
	desc = "A plain white mug."
	icon_state = "mug_white"

/obj/item/reagent_containers/drinks/mug/teacup
	name = "cup"
	desc = "A plain white porcelain teacup."
	icon_state = "_cup"
	base_name = "cup"
	base_icon = "_cup"
	filling_states = "100"

//tea and tea accessories
/obj/item/reagent_containers/drinks/tea
	name = "cup of tea master item"
	desc = "A tall plastic cup full of the concept and ideal of tea."
	icon_state = "cup"
	item_state = "coffee"
	center_of_mass = "x=16;y=14"
	filling_states = "100"
	base_name = "cup"
	base_icon = "cup"

/obj/item/reagent_containers/drinks/tea/black
	name = "cup of black tea"
	desc = "A tall plastic cup of hot black tea."
	icon_state = "tea_v"
	preloaded_reagents = list("tea" = 30)

/obj/item/reagent_containers/drinks/tea/green
	name = "cup of green tea"
	desc = "A tall plastic cup of hot green tea."
	icon_state = "greentea_v"
	preloaded_reagents = list("greentea" = 30)
