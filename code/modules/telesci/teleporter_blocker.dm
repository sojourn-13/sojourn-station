
//Sprites by - @Michiyamenotehifunana and @Sigmasquad!

/obj/machinery/telesci_inhibitor
	name = "bluespace inhibition node"
	desc = "A double-layered network of ansible crystals which use area power distribution systems to cause massive interference in local bluespace fields, inhibiting teleportation and raising the minimum amount of entropy needed to trigger a bluespace anomaly."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "inhibitor"
	anchored = TRUE
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 5000
	circuit = /obj/item/circuitboard/tele_inhibitor
	var/area/area
	var/amount_extra_blocked = 50

/obj/machinery/telesci_inhibitor/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T, -1, 1, 2, 5) //Like a landmine but with less flash.
	bluespace_entropy(20, get_turf(src), TRUE)
	qdel(src)

/obj/machinery/telesci_inhibitor/Initialize()
	. = ..()
	area = get_area(src)
	area.tele_inhibitors += src
	area.bluespace_hazard_threshold += amount_extra_blocked
	GLOB.bluespace_hazard_threshold += amount_extra_blocked
	power_change()

/obj/machinery/telesci_inhibitor/examine(mob/living/user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The inhibitor node's scanner indicates that the room can handle [my_area.bluespace_hazard_threshold] Zeframs of bluespace entropy before anomalous events occur."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The inhibitor node's scanner indicates that the planet can handle [GLOB.bluespace_hazard_threshold] Zeframs of bluespace entropy before anomalous events occur."))

/obj/machinery/telesci_inhibitor/power_change()
	. = ..()
	update_icon()

/obj/machinery/telesci_inhibitor/attackby(obj/item/I, mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()

/obj/machinery/telesci_inhibitor/update_icon()
	cut_overlays()	
	if(!(stat & NOPOWER))
		add_overlay("inhibitor-powered")
	if(panel_open)
		add_overlay("inhibitor-panel")

/obj/machinery/telesci_inhibitor/Destroy()
	area.tele_inhibitors -= src
	area.bluespace_hazard_threshold -= amount_extra_blocked
	GLOB.bluespace_hazard_threshold -= amount_extra_blocked
	. = ..()

/obj/machinery/telesci_inhibitor/proc/can_inhibit()
	return (!stat)

/////////////////////////////
// Additional Vars         //
/////////////////////////////

/area
	var/innate_tele_inhibited = FALSE //Is the area innately tele_inhibited
	var/list/obj/machinery/telesci_inhibitor/tele_inhibitors = list()

/area/proc/tele_inhibited()
	if(innate_tele_inhibited)
		return TRUE
	for(var/obj/machinery/telesci_inhibitor/inhibitor in tele_inhibitors)
		if(inhibitor.can_inhibit())
			return TRUE
	return FALSE

/////////////////////////////
// Mini_inhibitor          //
/////////////////////////////

// map this in places we wanna nerf incoming telesci useage. Armories and such. Just for gods sake don't spam them everywhere we are talking about HIGH security here!
/obj/machinery/telesci_inhibitor/mini
	name = "mini bluespace inhibition node"
	desc = "A wall mounted ansible crystal which use area power distribution systems to cause massive interference in local bluespace fields, inhibiting teleportation. It's compact design however does not offer the full benefit of a full sized inhibitor. Developed by Soteria Research at no cost to ease Provosts concerns over SI's advancements in bluespace. A warning label clearly states that it only inhibits teleportation it does not prevent it. "
	icon = 'icons/obj/telescience.dmi'
	icon_state = "minihibitor"
	density = 0
	idle_power_usage = 150
	circuit = /obj/item/circuitboard/tele_inhibitor/mini
	amount_extra_blocked = 0

/obj/machinery/telesci_inhibitor/mini/update_icon()
	cut_overlays()	
	if(!(stat & NOPOWER))
		add_overlay("minihibitor-powered")
	if(panel_open)
		add_overlay("minihibitor-panel")
