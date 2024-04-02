//Now were cooking with gas!
/obj/machinery/petrel_maker
	name = "Greyson Petrol Pump"
	desc = "A machine for petrol and refined scrap. Originally design by the Greyson Positronic's AI then given to the Artificer's Guild. \
	When enough plastic is stored inside, flip the switch on its side to produce a bottle of diesel, consuming a portion of stored plastic. \
	Thanks to advanced blueprint designs by SI it can also take lumps of scrap to create refined scrap by simply adding them to the pump's storage."
	description_info = "Try inserting a sandwich on it for a tasty (and very mechanically educational) snack."
	icon = 'icons/obj/machines/petrel_maker.dmi'
	icon_state = "diesel_greyson"
	circuit = /obj/item/circuitboard/petrel_maker
	var/petrel_form_plastic = 30 //25/5 = 5 so with grayson upgrades this is 29 sheets of plastic into 120 welder fuel.
	var/stored_plastic = 0 //How much stored plastic we have
//	var/convert_speed = 30 SECONDS //How long it takes to covert things
	density = TRUE
	anchored = TRUE

//TODO: remove sleep, make it use wait somehow...
//TODO: max cap of how many plastics it can hold
//TODO: More cooking and other oddities with it

	use_power = IDLE_POWER_USE
	idle_power_usage = 120 //Some drain

/obj/item/circuitboard/petrel_maker
	build_name = "greyson petrol pump"
	build_path = /obj/machinery/petrel_maker
	origin_tech = list(TECH_DATA = 16, TECH_ENGINEERING = 8, TECH_POWER = 14)
	board_type = "machine"
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/micro_laser = 1
	)

/obj/machinery/petrel_maker/proc/try_to_make_petrel(mob/user)
	//..()
	if(petrel_form_plastic <= stored_plastic)
//		sleep(convert_speed)//So its not istant
		stored_plastic -= petrel_form_plastic
		to_chat(user, SPAN_NOTICE("The Petrol Pump dispenses a canister of welding fuel."))
		new /obj/item/reagent_containers/glass/bottle/petrel(loc)
		return //No looping
	else
		to_chat(user, SPAN_WARNING("The pump needs [petrel_form_plastic] sheets of plastic to make a full canister.")) //FIXME: this message is not displaying under any circumstances and I can't find out why.
		return


/obj/machinery/petrel_maker/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Total plastic sheets stored: [stored_plastic]</span>")
	to_chat(user, "<span class='info'>Plastic sheets needed to make a fuel canister: [petrel_form_plastic]</span>")

/obj/machinery/petrel_maker/attack_hand(mob/user)
	try_to_make_petrel()
	return

/obj/machinery/petrel_maker/attackby(obj/item/I, mob/user as mob)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if (istype(I, /obj/item/stack/material/plastic))
		var/obj/item/stack/material/plastic/B = I
		if (B.amount)
			var/sheets_amount_to_transphere = input(user, "How many sheets you want to load?", "Plastic coverting", 1) as num
			if (sheets_amount_to_transphere > B.amount ) //No cheating!
				to_chat(user, SPAN_WARNING("You don't have that many [B.name]"))
				return
			if(sheets_amount_to_transphere)
				B.use(sheets_amount_to_transphere)
				stored_plastic += sheets_amount_to_transphere
				user.visible_message(
									"[user.name] inserted \the [B.name]'s sheets in \the [name].",
									"You inserted [sheets_amount_to_transphere] \the [B.name]\s in \the [name].\
									And after that you see how the counter on \the [name] is incremented by [sheets_amount_to_transphere]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transphere] in [name]"))
			return
	if (istype(I, /obj/item/scrap_lump))
		qdel(I)
		ping()
		new /obj/item/stack/material/refined_scrap(loc)
		return
	if (istype(I, /obj/item/reagent_containers/food/snacks/sandwich))
		qdel(I)
		ping()
		new /obj/item/reagent_containers/food/snacks/toasted_guild_sandwich(loc)
		return

/obj/machinery/petrel_maker/RefreshParts()
	..()
	for(var/obj/item/stock_parts/P in component_parts)
	//	if(istype(P, /obj/item/stock_parts/micro_laser))
		//	convert_speed = clamp((P.rating / convert_speed),1,30) //max level is 6 so 5 sleep or what not
		if(istype(P, /obj/item/stock_parts/manipulator))
			petrel_form_plastic -= clamp((P.rating - petrel_form_plastic),1,30) //Max level is 6 so 21 is min amout for admin spawned things
	return
