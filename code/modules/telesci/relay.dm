#define BASE_PATHFINDING_SPEED 20
#define BASE_DEGRADATION_CHANCE 10
#define COMPONENT_RATING_MULTIPLIER 2

//Sprites by - @Michiyamenotehifunana and @Sigmasquad!

/obj/machinery/telesci_relay
	name = "telepad pathing relay"
	desc = "A pylon with a complicated network of circuitry and a slot for a bluespace crystal."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "relay"
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 500
	density = 1
	circuit = /obj/item/circuitboard/telesci_relay
	var/pathfinding_speed = 20
	var/crystal_degradation_chance = 10 // Percent

	var/inUse = FALSE
	var/obj/item/bluespace_crystal/stored_crystal = null

/obj/machinery/telesci_relay/RefreshParts()
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		crystal_degradation_chance = max(BASE_DEGRADATION_CHANCE - COMPONENT_RATING_MULTIPLIER * M.rating, 0)

	for(var/obj/item/stock_parts/micro_laser/L in component_parts)
		pathfinding_speed = max(BASE_PATHFINDING_SPEED - COMPONENT_RATING_MULTIPLIER * L.rating, 0)

/obj/machinery/telesci_relay/attackby(obj/item/I, mob/user, params)
	if(inUse)
		to_chat(user,SPAN_NOTICE("Mechanical interlocks prevent you from adjusting the crystal while the relay is in use."))
		return FALSE
	if(default_deconstruction(I, user) && stored_crystal)
		to_chat(user, "<span class'warning'>You open the wire panel, and \the [stored_crystal] falls from the slot.</span>")
		stored_crystal.forceMove(get_turf(src))
		stored_crystal = null

	if(istype(I, /obj/item/bluespace_crystal))
		if(panel_open)
			to_chat(user, "<span class='warning'>The opened wire panel is obstructing the crystal slot.</span>")
			return FALSE
		user.drop_item()
		I.forceMove(src)
		if(!stored_crystal)
			to_chat(user, "<span class='info'>You insert \the [I] into \the [src]s crystal slot.</span>")
		else{
			to_chat(user, "<span class='info'>You replace \the [stored_crystal] in \the [src].")
			user.put_in_hands(stored_crystal)
		}
		stored_crystal = I
	update_icon()

/obj/machinery/telesci_relay/attack_hand(mob/user)
	if(..())
		return TRUE
	if(inUse)
		to_chat(user,SPAN_NOTICE("Mechanical interlocks prevent you from adjusting the crystal while the relay is in use."))
		return TRUE
	to_chat(user, SPAN_NOTICE("You take \the [stored_crystal] out of \the [src]s crystal slot."))
	stored_crystal.forceMove(get_turf(src))
	user.put_in_hands(stored_crystal)
	stored_crystal = null
	update_icon()

/obj/machinery/telesci_relay/examine(mob/user)
	. = ..(user)
	if(stored_crystal)
		to_chat(user, "<span class='notice'>There is \a [stored_crystal] in \the [src]s crystal slot.</span>")
		if(!(stat & (BROKEN | NOPOWER)))
			to_chat(user, "<span class='notice'>\The [src]s crystal integrity monitor reads [getCrystalIntegrityPercent()]%.</span>")
	else
		to_chat(user, "<span class='notice'>\The [src]s crystal slot is empty.")

/obj/machinery/telesci_relay/update_icon()
	cut_overlays()	
	if(panel_open)
		add_overlay("relay-panel")
	if(checkCrystal())
		add_overlay("relay-powered")
	if(inUse)
		add_overlay("relay-calculating")

/obj/machinery/telesci_relay/proc/getCrystalIntegrityPercent()
	var/percent = stored_crystal.integrity/stored_crystal.max_integrity
	return round(percent*100)

/obj/machinery/telesci_relay/proc/damageCrystal(damage)
	if(!stored_crystal)
		return FALSE
	stored_crystal.integrity -= damage
	if(stored_crystal.integrity >= stored_crystal.max_integrity)
		stored_crystal.integrity = stored_crystal.max_integrity
	if(stored_crystal.integrity <= 0)
		shatterCrystal()
	update_icon()
	return TRUE

/obj/machinery/telesci_relay/proc/shatterCrystal()
	if(!stored_crystal)
		return
	src.visible_message("<span class='warning'>\The [stored_crystal] in \the [src] collapses into dust.")
	do_sparks(6, FALSE, get_turf(src))
	qdel(stored_crystal)
	stored_crystal = null
	bluespace_entropy(4, get_turf(src), TRUE)
	new /obj/item/bluespace_dust(get_turf(src))

/obj/machinery/telesci_relay/proc/pingCrystal()
	. = checkCrystal()
	var/burntOut = FALSE
	if(!.)
		return
	if(rand(1,100) <= crystal_degradation_chance)
		damageCrystal(1)
		if(!checkCrystal())
			burntOut = TRUE
	bluespace_entropy(2, get_turf(src), TRUE)
	cut_overlays()
	if(panel_open)
		add_overlay("relay-panel")
	if(burntOut)
		add_overlay("relay-fried")
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_icon)), 4)
	else
		add_overlay("relay-calculating")
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_icon)), 5)

/obj/machinery/telesci_relay/proc/checkCrystal() //Like pingCrystal(), but without risking damage.
	if(!stored_crystal)
		return FALSE

	if((stat & (BROKEN | NOPOWER)))
		return FALSE

	return TRUE

/obj/machinery/telesci_relay/proc/chanceExplode()
	if(prob(30)) //30% chance to just straight up explode.
		src.visible_message(SPAN_DANGER("\The [src] begins to vibrate, its crystal glowing brightly!"))
		do_sparks(6, FALSE, get_turf(src))
		addtimer(CALLBACK(src, PROC_REF(explode)), 1 SECOND)

/obj/machinery/telesci_relay/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T, -1, 1, 2, 5) //Like a landmine but with less flash.
	qdel(stored_crystal)
	bluespace_entropy(20, get_turf(src), TRUE)
	qdel(src)

/////////////////////////////
//         Additional Vars //
/////////////////////////////

/obj/item/bluespace_crystal
	var/max_integrity = 6
	var/integrity = 6

/obj/item/bluespace_crystal/artificial
	max_integrity = 4
	integrity = 4
