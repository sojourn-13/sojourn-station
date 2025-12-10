/obj/item/storage/box/bloodpacks
	name = "blood packs bags"
	desc = "This box contains blood packs."
	icon_state = "box"
	illustration = "sterile"

/obj/item/storage/box/bloodpacks/populate_contents()
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)
	new /obj/item/reagent_containers/blood(src)

/obj/item/reagent_containers/blood
	name = "blood pack"
	desc = "Contains blood used for transfusion."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "bloodpack"
	volume = 200
	amount_per_transfer_from_this = REM // To avoid overdosing and emptying blood packs a bit too much. It's enough to keep someone alive over time. - Seb
	possible_transfer_amounts = list(REM,0.5,1,2) // In case the blood packs are to be filled with other chems somehow, or to change from slow drip to faster.
	reagent_flags = OPENCONTAINER
	filling_states = "25;50;75;100"
	var/blood_type = null
	var/mob/living/carbon/human/attached_patient = null // For direct IV connection without medical stand
	var/iv_transfer_rate = REM // Current transfer rate for IV

/obj/item/reagent_containers/blood/Initialize()
	. = ..()
	if(blood_type)
		reagents.add_reagent("blood", 200, list("donor"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))


/obj/item/reagent_containers/blood/on_reagent_change()
	..()
	update_name()


/obj/item/reagent_containers/blood/update_icon()
	cut_overlays()

	if(!reagents.total_volume)
		return

	var/mutable_appearance/filling = mutable_appearance(icon, "[icon_state][get_filling_state()]")
	filling.color = reagents.get_color()
	add_overlay(filling)

/obj/item/reagent_containers/blood/proc/update_name()
	var/list/data = reagents.get_data("blood")
	if(data)
		blood_type = data["blood_type"]
		name = "blood pack ([blood_type])"
	else
		name = "blood pack"

/obj/item/reagent_containers/blood/examine(mob/user)
	. = ..()
	if(attached_patient)
		. += SPAN_NOTICE("It is connected to [attached_patient] via IV, transferring at [iv_transfer_rate] units per second.")

/obj/item/reagent_containers/blood/verb/disconnect_iv()
	set name = "Disconnect IV"
	set category = "Object"
	set src in view(1)

	if(!attached_patient)
		to_chat(usr, SPAN_WARNING("[src] is not connected to anyone."))
		return

	if(!Adjacent(usr))
		to_chat(usr, SPAN_WARNING("You need to be closer to [src]."))
		return

	if(usr.incapacitated())
		to_chat(usr, SPAN_WARNING("You can't do this while incapacitated."))
		return

	usr.visible_message(
		SPAN_NOTICE("[usr] begins disconnecting [src] from [attached_patient]."),
		SPAN_NOTICE("You begin disconnecting [src] from [attached_patient].")
	)

	if(!do_after(usr, 20, attached_patient))
		return

	usr.visible_message(
		SPAN_NOTICE("[usr] carefully disconnects [attached_patient] from the IV."),
		SPAN_NOTICE("You carefully disconnect [attached_patient] from the IV.")
	)

	attached_patient = null
	STOP_PROCESSING(SSobj, src)

// MouseDrop functionality to connect blood bag to person or disconnect from IV when dragged to hand/ground
/obj/item/reagent_containers/blood/MouseDrop(atom/over_object, src_location, over_location, src_control, over_control, params)
	var/mob/user = usr
	if(!user)
		return ..()

	// Handle dragging to a person (same logic as MouseDrop_T but in the right place)
	if(ishuman(over_object))
		var/mob/living/carbon/human/target = over_object

		// Basic validation checks
		if(!Adjacent(user) || !target.Adjacent(user))
			to_chat(user, SPAN_WARNING("You need to be closer to both the blood bag and [target]."))
			return ..()

		if(user.incapacitated())
			to_chat(user, SPAN_WARNING("You can't do this while incapacitated."))
			return ..()

		if(target.stat == DEAD)
			to_chat(user, SPAN_WARNING("There's no point in hooking up an IV to a dead person."))
			return ..()

		// Check if already connected to this blood bag or another IV
		if(attached_patient)
			to_chat(user, SPAN_WARNING("[src] is already connected to [attached_patient]."))
			return ..()

		var/obj/structure/medical_stand/existing_stand = null
		for(var/obj/structure/medical_stand/stand in range(2, target))
			if(stand.attached == target)
				existing_stand = stand
				break

		if(existing_stand)
			to_chat(user, SPAN_WARNING("[target] is already connected to [existing_stand]."))
			return ..()

		// Check for nearby blood bags already connected to target
		for(var/obj/item/reagent_containers/blood/bag in range(2, target))
			if(bag != src && bag.attached_patient == target)
				to_chat(user, SPAN_WARNING("[target] is already connected to [bag]."))
				return ..()

		// Check if we have a medical stand nearby to attach to
		var/obj/structure/medical_stand/nearest_stand = null
		var/min_distance = 3
		for(var/obj/structure/medical_stand/stand in range(2, user))
			if(!stand.beaker && !stand.attached)
				var/distance = get_dist(stand, user)
				if(distance < min_distance)
					nearest_stand = stand
					min_distance = distance

		// If we have a medical stand, use it
		if(nearest_stand)
			user.visible_message(
				SPAN_NOTICE("[user] begins setting up an IV line between [src] and [target] using [nearest_stand]."),
				SPAN_NOTICE("You begin setting up an IV line between [src] and [target] using [nearest_stand].")
			)

			if(!do_after(user, 30, target))
				return ..()

			// Move blood bag to the stand and connect everything
			if(!user.unEquip(src, nearest_stand))
				return ..()

			nearest_stand.beaker = src
			nearest_stand.attached = target
			nearest_stand.update_icon()

			user.visible_message(
				SPAN_NOTICE("[user] successfully connects [src] to [target] via [nearest_stand]."),
				SPAN_NOTICE("You successfully connect [src] to [target] via [nearest_stand]. The IV is now active.")
			)

			// Start the IV process
			START_PROCESSING(SSobj, nearest_stand)

			return TRUE

		// No medical stand available, set up direct connection
		user.visible_message(
			SPAN_NOTICE("[user] begins setting up a direct IV line between [src] and [target]."),
			SPAN_NOTICE("You begin setting up a direct IV line between [src] and [target].")
		)

		if(!do_after(user, 40, target)) // Takes longer without proper equipment
			return ..()

		// Set transfer rate
		var/chosen_rate = input(user, "Choose transfer rate:", "IV Transfer Rate") as null|anything in possible_transfer_amounts
		if(!chosen_rate)
			return ..()

		iv_transfer_rate = chosen_rate
		attached_patient = target

		user.visible_message(
			SPAN_NOTICE("[user] successfully connects [src] directly to [target]. The IV is now active at [iv_transfer_rate] units per second."),
			SPAN_NOTICE("You successfully connect [src] directly to [target]. The IV is now active at [iv_transfer_rate] units per second.")
		)

		// Start processing for direct IV
		START_PROCESSING(SSobj, src)

		return TRUE

	// Check if this blood bag is currently attached to a medical stand
	var/obj/structure/medical_stand/connected_stand = null
	for(var/obj/structure/medical_stand/stand in world)
		if(stand.beaker == src)
			connected_stand = stand
			break

	// Handle medical stand disconnection
	if(connected_stand)
		if(!Adjacent(user))
			to_chat(user, SPAN_WARNING("You need to be closer to the medical stand."))
			return ..()

		if(user.incapacitated())
			to_chat(user, SPAN_WARNING("You can't do this while incapacitated."))
			return ..()

		// If dragged to a hand slot, or just clicked normally, disconnect the IV
		if(istype(over_object, /obj/screen/inventory/hand) || over_object == user)
			user.visible_message(
				SPAN_NOTICE("[user] begins disconnecting [src] from [connected_stand]."),
				SPAN_NOTICE("You begin disconnecting [src] from [connected_stand].")
			)

			if(!do_after(user, 20, connected_stand.attached))
				return ..()

			// Disconnect the IV
			if(connected_stand.attached)
				user.visible_message(
					SPAN_NOTICE("[user] carefully disconnects [connected_stand.attached] from the IV."),
					SPAN_NOTICE("You carefully disconnect [connected_stand.attached] from the IV.")
				)

			connected_stand.attached = null
			connected_stand.beaker = null
			STOP_PROCESSING(SSobj, connected_stand)
			connected_stand.update_icon()

			forceMove(user.loc)
			user.put_in_hands(src)

			return TRUE

	// Handle direct patient connection disconnection
	else if(attached_patient)
		if(!Adjacent(user))
			to_chat(user, SPAN_WARNING("You need to be closer to [attached_patient]."))
			return ..()

		if(user.incapacitated())
			to_chat(user, SPAN_WARNING("You can't do this while incapacitated."))
			return ..()

		// If dragged to a hand slot, or just clicked normally, disconnect the IV
		if(istype(over_object, /obj/screen/inventory/hand) || over_object == user)
			user.visible_message(
				SPAN_NOTICE("[user] begins disconnecting [src] from [attached_patient]."),
				SPAN_NOTICE("You begin disconnecting [src] from [attached_patient].")
			)

			if(!do_after(user, 20, attached_patient))
				return ..()

			// Disconnect the direct IV
			user.visible_message(
				SPAN_NOTICE("[user] carefully disconnects [attached_patient] from the direct IV."),
				SPAN_NOTICE("You carefully disconnect [attached_patient] from the direct IV.")
			)

			attached_patient = null
			STOP_PROCESSING(SSobj, src)

			forceMove(user.loc)
			user.put_in_hands(src)

			return TRUE

	return ..()

// Processing function for direct IV connection
/obj/item/reagent_containers/blood/Process()
	if(!attached_patient)
		STOP_PROCESSING(SSobj, src)
		return

	// Check if patient is still valid and nearby
	if(attached_patient.stat == DEAD || get_dist(src, attached_patient) > 2)
		visible_message(SPAN_WARNING("[src] disconnects from [attached_patient] as they move too far away or die."))
		attached_patient = null
		STOP_PROCESSING(SSobj, src)
		return

	// Transfer reagents to patient
	if(reagents.total_volume > 0)
		var/transfer_amount = min(iv_transfer_rate, reagents.total_volume)
		var/datum/reagents/target_blood = attached_patient.get_blood()

		if(target_blood && target_blood.get_free_space() > 0)
			var/actual_transfer = min(transfer_amount, target_blood.get_free_space())
			reagents.trans_to(target_blood, actual_transfer)

			if(actual_transfer > 0)
				attached_patient.visible_message(SPAN_NOTICE("[attached_patient] receives [actual_transfer] units via IV from [src]."))

		// Stop processing if blood bag is empty
		if(reagents.total_volume <= 0)
			visible_message(SPAN_NOTICE("[src] is now empty and disconnects from [attached_patient]."))
			attached_patient = null
			STOP_PROCESSING(SSobj, src)
			return#define bloodtypeandpackname(bloodtype) name = "blood pack ("+bloodtype+")"; blood_type = bloodtype;
/obj/item/reagent_containers/blood/APlus
	bloodtypeandpackname("A+")

/obj/item/reagent_containers/blood/AMinus
	bloodtypeandpackname("A-")

/obj/item/reagent_containers/blood/BPlus
	bloodtypeandpackname("B+")

/obj/item/reagent_containers/blood/BMinus
	bloodtypeandpackname("B-")

/obj/item/reagent_containers/blood/OPlus
	bloodtypeandpackname("O+")

/obj/item/reagent_containers/blood/OMinus
	bloodtypeandpackname("O-")

/obj/item/reagent_containers/blood/empty
