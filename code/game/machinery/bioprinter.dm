//These machines are mostly just here for debugging/spawning. Skeletons of the feature to come.

/obj/machinery/bioprinter
	name = "organ bioprinter"
	desc = "It's a machine that grows replacement organs."

	anchored = TRUE
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 40

	circuit = /obj/item/circuitboard/organ_printer

	icon_state = "bioprinter"
	icon = 'icons/obj/surgery.dmi'

	var/stored_matter = 0
	var/max_matter = 300
	var/loaded_dna //Blood sample for DNA hashing.
	var/list/products = list(
		OP_HEART =  		list(/obj/item/organ/internal/vital/heart,  50),
		OP_LUNGS =  		list(/obj/item/organ/internal/vital/lungs,  40),
		OP_KIDNEY_LEFT = 	list(/obj/item/organ/internal/kidney/left, 20),
		OP_KIDNEY_RIGHT = 	list(/obj/item/organ/internal/kidney/right, 20),
		OP_EYES =    		list(/obj/item/organ/internal/eyes,   30),
		OP_LIVER =   		list(/obj/item/organ/internal/liver,  50),
		OP_BLOOD_VESSEL =  	list(/obj/item/organ/internal/blood_vessel,  10),
		OP_MUSCLE  =    	list(/obj/item/organ/internal/muscle,  20),
		OP_NERVE  =	    	list(/obj/item/organ/internal/nerve,  10)
		)

/obj/machinery/bioprinter/RefreshParts()
	..()
	var/mb_rating = 0
	var/mb_amount = 0
	for(var/obj/item/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
		mb_amount++

	max_matter = round(initial(max_matter)*(mb_rating/mb_amount))


/obj/machinery/bioprinter/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Levels of stored biomass: [stored_matter]</span>")

/obj/machinery/bioprinter/New()
	..()
	if(SSticker.current_state != GAME_STATE_PLAYING)
		stored_matter = 200
	products = list(
		OP_HEART =   		list(/obj/item/organ/internal/vital/heart,  50),
		OP_LUNGS =   		list(/obj/item/organ/internal/vital/lungs,  40),
		OP_KIDNEYS = 		list(/obj/item/organ/internal/kidney, 20),
		OP_EYES =   		list(/obj/item/organ/internal/eyes,   30),
		OP_LIVER =   		list(/obj/item/organ/internal/liver,  50),
		OP_STOMACH = 		list(/obj/item/organ/internal/stomach, 50),
		OP_BLOOD_VESSEL =	list(/obj/item/organ/internal/blood_vessel,  10),
		OP_MUSCLE  =    	list(/obj/item/organ/internal/muscle,  20),
		OP_NERVE  =	    	list(/obj/item/organ/internal/nerve,  10)
		)


/obj/machinery/bioprinter/attack_hand(mob/user)

	var/choice = input("What would you like to print?") as null|anything in products
	if(!choice)
		return

	if(stored_matter >= products[choice][2])

		stored_matter -= products[choice][2]
		var/new_organ = products[choice][1]
		var/obj/item/organ/O = new new_organ(get_turf(src))

		if(loaded_dna)
			visible_message("<span class='notice'>The printer injects the stored DNA into the biomass.</span>.")
			O.transplant_data = list(
				"blood_type" = loaded_dna["blood_type"],
				"blood_DNA" = loaded_dna["blood_DNA"],
			)
			var/datum/weakref/ref = loaded_dna["donor"]
			if(istype(ref))
				var/mob/living/carbon/C = ref.resolve()
				if(istype(C))
					O.transplant_data["species"] =    C.species.name

		visible_message("<span class='info'>The bioprinter spits out a new organ.</span>")

	else
		to_chat(user, SPAN_WARNING("There is not enough matter in the printer."))

/obj/machinery/bioprinter/attackby(obj/item/W, mob/user)

	// DNA sample from syringe.
	if(istype(W,/obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = W
		var/datum/reagent/organic/blood/injected = locate() in S.reagents.reagent_list //Grab some blood
		if(injected && injected.data)
			loaded_dna = injected.data
			to_chat(user, "<span class='info'>You inject the blood sample into the bioprinter.</span>")
		return
	// Meat for biomass.
	for(var/type in BIOMASS_TYPES)
		if(istype(W,type))
			stored_matter += BIOMASS_TYPES[type]
			user.drop_item()
			to_chat(user, "<span class='info'>\The [src] processes \the [W]. Levels of stored biomass now: [stored_matter]</span>")
			qdel(W)
			return

	if(default_deconstruction(W, user))
		return

	if(default_part_replacement(W, user))
		return

	return ..()

/obj/machinery/bioprinter/prosthetics
	name = "prosthetics fabricator"
	desc = "It's a machine that prints prosthetic organs."
	circuit = /obj/item/circuitboard/prosthetics_printer


/obj/machinery/bioprinter/prosthetics/New()
	..()
	if(SSticker.current_state != GAME_STATE_PLAYING)
		stored_matter = 200

	products = list(
		OP_HEART =  		list(/obj/item/organ/internal/vital/heart/prosthetic,  50),
		OP_LUNGS =  		list(/obj/item/organ/internal/vital/lungs/prosthetic,  40),
		OP_KIDNEYS = 		list(/obj/item/organ/internal/kidney/prosthetic, 20),
		OP_EYES =    		list(/obj/item/organ/internal/eyes/prosthetic,   30),
		OP_LIVER =   		list(/obj/item/organ/internal/liver/prosthetic,  50),
		OP_STOMACH = 		list(/obj/item/organ/internal/stomach/prosthetic, 50),
		OP_BLOOD_VESSEL =	list(/obj/item/organ/internal/blood_vessel/prosthetic,  10),
		OP_MUSCLE  =    	list(/obj/item/organ/internal/muscle/robotic,  20),
		OP_NERVE  =	    	list(/obj/item/organ/internal/nerve/robotic,  10)
		)


/obj/machinery/bioprinter/prosthetics/attack_hand(mob/user)

	var/choice = input("What would you like to print?") as null|anything in products
	if(!choice)
		return

	if(stored_matter >= products[choice][2])

		stored_matter -= products[choice][2]
		var/new_organ = products[choice][1]
		var/obj/item/organ/O = new new_organ(get_turf(src))

		O.nature = MODIFICATION_SILICON

		visible_message("<span class='info'>The bioprinter spits out a new organ.</span>")
	else
		to_chat(user, SPAN_WARNING("There is not enough matter in the printer."))

/obj/machinery/bioprinter/prosthetics/attackby(obj/item/W, mob/user)
	// Steel for matter.
	if(istype(W, /obj/item/stack/material) && W.get_material_name() == MATERIAL_STEEL)
		var/obj/item/stack/S = W
		stored_matter += S.amount * 10
		user.drop_item()
		to_chat(user, "<span class='info'>\The [src] processes \the [W]. Levels of stored matter now: [stored_matter]</span>")
		qdel(W)
		return

	if(default_deconstruction(W, user))
		return

	if(default_part_replacement(W, user))
		return

	return ..()
