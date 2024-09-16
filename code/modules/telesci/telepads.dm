#define BS_POWER_DRAW 1000
#define BS_CAPACITOR_POWER 10000
#define BS_PORTAL_POWER_USE 2000

//Sprites by - @Michiyamenotehifunana and @Sigmasquad, at commission from Fel#3285

/obj/machinery/telepad //For mapping
	name = "short range stable telepad"
	desc = "Short range pads that travel around the plannet, being just stablised somehow to not affect bluespace objects." //Legit plot whole braking the story but what ever
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad-idle"
	anchored = TRUE

/obj/machinery/telesci_pad/attackby(obj/item/I, mob/user, params)
	return //No more plot whole braking the story

/obj/machinery/telesci_pad
	name = "advanced telepad"
	desc = "An advanced bluespace telepad used for teleporting objects to and from a location."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "pad"
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = BS_POWER_DRAW
	circuit = /obj/item/circuitboard/telesci_pad
	var/obj/effect/portal/wormhole/telepad/portal = null
	var/stored_power = 0
	var/max_power = BS_CAPACITOR_POWER
	var/power_efficiency = 1.0 //Multiplied by internal power draw, less is better.
	var/entropy_value = 8
	var/list/obj/machinery/telesci_relay/relaysInUse = list()
	var/calculating = FALSE
	var/obj/machinery/computer/telesci_console/boundComputer = null

/obj/machinery/telesci_inhibitor/Initialize()
	. = ..()
	update_icon()

/obj/machinery/telesci_pad/RefreshParts()
	var/maxpow = 0
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		maxpow += C.rating * BS_CAPACITOR_POWER
	var/eff = 0.5
	for(var/obj/item/bluespace_crystal/crystal in component_parts)
		if(istype(crystal, /obj/item/bluespace_crystal/artificial)) //Efficiency is 25% worse for each artifical bluespace crystal, linearly.
			eff += 0.25
	power_efficiency = eff
	max_power = maxpow

/obj/machinery/telesci_pad/Process()
	stored_power += BS_POWER_DRAW
	if(portal)
		stored_power -= BS_PORTAL_POWER_USE * power_efficiency

	if(stored_power >= max_power)
		stored_power = max_power
		idle_power_usage = 0
	else
		idle_power_usage = initial(idle_power_usage)

	if(stored_power <= 0 && istype(portal))
		closePortal()

/obj/machinery/telesci_pad/Destroy()
	closePortal()
	return ..()

/obj/machinery/telesci_pad/attackby(obj/item/I, mob/user, params)
	if(calculating)
		to_chat(user, SPAN_WARNING("Safety interlocks prevent maintenance while the pad is active."))
		return
	if(default_deconstruction(I, user))
		if(panel_open)
			closePortal()
		return
	if(default_part_replacement(I, user))
		return
	if(panel_open)
		if(istype(I, /obj/item/tool/multitool))
			if(istype(boundComputer))
				to_chat(user, SPAN_WARNING("You unlink the telepad from its console."))
				boundComputer.closePortal()
				boundComputer.telepad = null
				boundComputer = null
				return
			var/obj/item/tool/multitool/M = I
			M.buffer_object = src
			to_chat(user, SPAN_WARNING("You save the data in the [I.name]'s buffer."))
			return
	else
		if(istype(I, /obj/item/tool/multitool))
			to_chat(user, SPAN_WARNING("You should open [src]'s maintenance panel first."))
			return
	return ..()

/obj/machinery/telesci_pad/update_icon()
    cut_overlays()
    if(!(stat & NOPOWER))
        add_overlay("pad-powered")
    if(panel_open)
        add_overlay("pad-panel")
    if(calculating)
        add_overlay("pad-working")

/obj/machinery/telesci_pad/proc/openPortal(x, y, z)
	if(panel_open)
		return FALSE
	var/source = get_turf(src)
	var/target = get_turf(locate(x,y,z))
	closePortal()
	portal = new /obj/effect/portal/wormhole/telepad(source, 0, target)
	return TRUE

/obj/machinery/telesci_pad/proc/closePortal()
	for(var/obj/machinery/telesci_relay/relay in relaysInUse)
		relay.inUse = FALSE
		relay.update_icon()
	relaysInUse = list()
	if(portal)
		portal.partner.close()
		portal.close()
		portal = null

/obj/machinery/telesci_pad/proc/findWorkingRelays()
	var/list/obj/machinery/telesci_relay/relays = findRelays()
	var/list/obj/machinery/telesci_relay/workingRelays = list()
	if(!relays.len <= 0)
		for(var/obj/machinery/telesci_relay/relay in relays)
			if(relay.checkCrystal())
				workingRelays += relay
	return workingRelays

/obj/machinery/telesci_pad/proc/findRelays()
	var/list/obj/machinery/telesci_relay/relays = list()
	for(var/dir in list(WEST,NORTH,EAST,SOUTH))
		var/obj/machinery/telesci_relay/relay = findRelay(dir)
		if(relay)
			relays += relay
	return relays

/obj/machinery/telesci_pad/proc/findRelay(dir)
	var/turf/T = get_step(get_turf(src), dir)
	for(var/i = 1 to 6)
		var/obj/machinery/telesci_relay/relay = locate(/obj/machinery/telesci_relay, T)
		if(relay)
			return relay
		T = get_step(T, dir)

// Subtype of wormhole that doesn't process instability.

/obj/effect/portal/wormhole/telepad
	name = "bluespace tunnel"
	desc = "A hole ripped straight through reality, kept open through massive expenditure of power."
	layer = ABOVE_LIGHTING_LAYER
	admin_announce_new = FALSE

/obj/effect/portal/wormhole/telepad/teleport(atom/movable/M as mob|obj)
	failchance = 0
	.=..(M)

/obj/effect/portal/wormhole/telepad/pair()
	partner = null
	if (!target)
		return

	var/turf/T = get_turf(target)
	partner = (locate(/obj/effect/portal/wormhole) in T)

	//There's no wormhole in the target tile yet. We shall make one
	if (!partner)
		partner = new /obj/effect/portal/wormhole/telepad(T, lifetime, loc)

#undef BS_POWER_DRAW
#undef BS_PORTAL_POWER_USE
