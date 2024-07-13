/obj/structure/bonfire
	name = "bonfire"
	desc = "For grilling, broiling, charring, smoking, heating, roasting, toasting, simmering, searing, melting, and occasionally burning things."
	icon = 'icons/obj/structures.dmi'
	icon_state = "bonfire"
	density = FALSE // We can go over it, needed to buckle people to it.
	anchored = TRUE // We can't move it around.
	can_buckle = FALSE // We can't buckle to it just yet.
	buckle_lying = FALSE
	var/burning = FALSE // Are we burning right now?
	var/grill = FALSE // Does it have a grill?
	var/fuel = 0 // How much fuel does it have right now, AKA the plank currently being burned
	var/fuel_conversion_rate = 1000 // How much fuel does a single plank give?
	var/fuel_usage_rate = 5 // How much fuel does it use each tick.
	var/start_fuel_use = 50 // How much fuel does it use when starting?

	var/burn_damage = 4 // How much damage does it deal to the buckled mob? || APPLY TO EVERY BODYPART, MULTIPLY BY 7 TO GET THE REAL AMOUNT OF DAMAGE

	var/obj/item/reagent_containers/food/snacks/meat/current_steak = null // The steak it is currently cooking
	var/cooking_time = 10 // The number of tick it take to cook the steak
	var/time = 0 // Timer to cook the steam

/obj/structure/bonfire/Created()
	fuel = fuel_conversion_rate * 5 // Start with fuel when fabricated
	return

/obj/structure/bonfire/New()
	START_PROCESSING(SSobj, src)
	..()

// Attack stuff
/obj/structure/bonfire/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/stack/rods) && !can_buckle && !grill) // Make either a stake or a grill with the rods, not both.
		var/obj/item/stack/rods/R = W
		var/choice = input(user, "What would you like to construct?", "Bonfire") as null|anything in list("Stake","Grill") // Choice
		switch(choice)
			if("Stake")
				R.use(1)
				can_buckle = TRUE // We can buckle to the fire!
				buckle_require_restraints = TRUE // No one will get willingly buckled
				to_chat(user, "<span class='notice'>You add a rod to \the [src].</span>")
				var/mutable_appearance/rod_underlay = mutable_appearance('icons/obj/structures.dmi', "bonfire_rod")
				rod_underlay.pixel_y = 16
				rod_underlay.appearance_flags = RESET_COLOR|PIXEL_SCALE|TILE_BOUND|DEFAULT_APPEARANCE_FLAGS
				underlays += rod_underlay
			if("Grill")
				R.use(1)
				grill = TRUE // We can cook !
				to_chat(user, "<span class='notice'>You add a grill to \the [src].</span>")
				update_icon()
			else
				return ..()

	else if(istype(W, /obj/item/reagent_containers/food/snacks/meat) && grill == TRUE && !current_steak) // MEAT !
		current_steak = W // Start cooking the steak
		insert_item(W, user) // insert the steak inside the fire

	else if(istype(W, /obj/item/stack/material/wood)) // If it's wood, use it as fuel
		add_fuel(W, user)

	else if(isflamesource(W))
		ignite() // Start the fire

	else
		return ..()

/obj/structure/bonfire/attack_hand(mob/user)
	if(buckled_mob)
		return ..()
	DropFuel(user) // Take out some unused fuel

// Fuel stuff
/obj/structure/bonfire/proc/add_fuel(obj/item/W, mob/user)
	insert_item(W, user) // Insert the plank in the fire
	consume_fuel()
	user.visible_message(
						SPAN_NOTICE("[user] insert the [W.name] in the [src.name].") // No need for the user message sine 'insert_item' handle that
						)

/obj/structure/bonfire/proc/use_fuel(var/use)
	if(fuel >= use) // Did we use up the fuel in the ""current"" plank yet?
		fuel -= use // If not, burn the plank a bit more.
		return TRUE
	else if(consume_fuel()) // if we're out of fuel, burn another plank !
		fuel -= use
		return TRUE
	else // If we're also out of planks, burn the rest of the fuel
		fuel = 0
		return FALSE

// Here we turn planks into gasoline !
/obj/structure/bonfire/proc/consume_fuel()
	for(var/item in contents) // Check the bonfire's inventory
		if(istype(item, /obj/item/stack/material/wood)) // Is it wood?
			var/obj/item/stack/material/wood/W = item // Wood-specific vars
			W.use(1) // Use the wood, it will also delete itself when completly used up
			fuel += fuel_conversion_rate // Add the fuel
			return TRUE
	return FALSE // We don't have anything to burn !

// Remove an unburned plank from the flames
/obj/structure/bonfire/proc/DropFuel(mob/user)
	for(var/obj/item in contents) // Check the fire's inventory
		if(istype(item, /obj/item/stack/material/wood)) // Wood!
			user.visible_message(SPAN_NOTICE("[user] remove an intact [item.name] from the [src.name].")) // No need for the user message sine 'eject_item' handle that
			eject_item(item, user) // Remove the object
			return TRUE
	to_chat(user, SPAN_NOTICE("There are no intact planks in the [src.name].")) // No wood...
	return FALSE

/obj/structure/bonfire/Process()
	if(burning) // Are we burning?
		if(use_fuel(fuel_usage_rate)) // Did we have enough fuel for this tick?
			if(buckled_mob) // Are we burning someone at the stake?

				// BURN !!
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_HEAD)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_CHEST)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_GROIN)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_L_ARM)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_R_ARM)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_L_LEG)
				buckled_mob.apply_damage(burn_damage, BURN, def_zone = BP_R_LEG)

			if(current_steak) // Are we cooking?
				time++ // Clock go tick-tock...
				if(time >= cooking_time) // The steak is done.
					qdel(current_steak) // Delete the steak
					current_steak = null // Free up the variable for the next step
					time = initial(time) // Reset the clock
					new /obj/item/reagent_containers/food/snacks/meatsteak(src.loc) // Cooked Steak !
					visible_message(SPAN_NOTICE("The steak finish cooking.")) // Little message
		else // We ran out of fuel.
			extinguish() // The fire is no more.

// Turn off the fire
/obj/structure/bonfire/proc/extinguish()
	if(burning) // Only proceed if we aren't already off
		burning = FALSE // No longer burning
		update_icon()
		visible_message("<span class='notice'>\The [src] stops burning.</span>")

// Turn on the fire
/obj/structure/bonfire/proc/ignite()
	if(!burning && use_fuel(start_fuel_use)) // Make sure we aren't already on and that we have enough fuel
		burning = TRUE // We're burning now.
		update_icon()
		visible_message("<span class='warning'>\The [src] starts burning!</span>")

/obj/structure/bonfire/update_icon()
	cut_overlays()
	if(burning)
		var/state
		switch(fuel)
			if(0 to 500)
				state = "bonfire_warm"
			if(501 to 1000)
				state = "bonfire_hot"
		var/image/I = image(icon, state)
		I.appearance_flags = RESET_COLOR | DEFAULT_APPEARANCE_FLAGS
		add_overlay(I)
		if(buckled_mob && fuel >= 5)
			I = image(icon, "bonfire_intense")
			I.pixel_y = 13
			I.layer = MOB_LAYER + 0.1
			I.appearance_flags = RESET_COLOR | DEFAULT_APPEARANCE_FLAGS
			add_overlay(I)
		var/light_strength = max(clamp(fuel/10, 1, 7), 2)
		set_light(light_strength, light_strength, "#FF9933")
	else
		set_light(0)
	if(grill)
		var/image/grille_image = image(icon, "bonfire_grill")
		grille_image.appearance_flags = RESET_COLOR | DEFAULT_APPEARANCE_FLAGS
		add_overlay(grille_image)

/obj/structure/bonfire/post_buckle_mob(mob/living/M)
	if(M.buckled == src) // Just buckled someone
		M.pixel_y += 13
	else // Just unbuckled someone
		M.pixel_y -= 13
	update_icon()

/obj/structure/bonfire/permanent // For bonfires that never stop
	fuel_usage_rate = 0
	start_fuel_use = 0
	burning = TRUE

/obj/structure/bonfire/permanent/New()
	..()
	fuel = fuel_conversion_rate
	update_icon()
