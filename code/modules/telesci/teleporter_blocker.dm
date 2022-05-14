
//Sprites by - @Michiyamenotehifunana and @Sigmasquad!

/obj/machinery/telesci_inhibitor
	name = "bluespace inhibition node"
	desc = "A double-layered network of ansible crystals which use area power distribution systems to cause massive interference in local bluespace fields, inhibiting teleportation. As well as raising the maxium amount of entropy needed to trigger a bluespace issue."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "inhibitor"
	anchored = TRUE
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 5000
	circuit = /obj/item/circuitboard/tele_inhibitor
	var/area/area
	var/amout_extra_blocked = 50

/obj/machinery/telesci_inhibitor/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T, -1, 1, 2, 5) //Like a landmine but with less flash.
	bluespace_entropy(20, get_turf(src), TRUE)
	qdel(src)

/obj/machinery/telesci_inhibitor/Initialize()
	. = ..()
	area = get_area(src)
	area.tele_inhibitors += src
	area.bluespace_hazard_threshold += amout_extra_blocked
	GLOB.bluespace_hazard_threshold += amout_extra_blocked
	power_change()

/obj/machinery/telesci_inhibitor/examine(mob/living/user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The scanner reads the room to can handle [my_area.bluespace_hazard_threshold] annomlst bluespace entropy."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The scanner reads the planet to can handle [GLOB.bluespace_hazard_threshold] annomlst bluespace entropy."))

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
	if(!(stat & NOPOWER))
		overlays += "inhibitor-powered"
	if(panel_open)
		overlays += "inhibitor-panel"

/obj/machinery/telesci_inhibitor/Destroy()
	area.tele_inhibitors -= src
	area.bluespace_hazard_threshold -= amout_extra_blocked
	GLOB.bluespace_hazard_threshold -= amout_extra_blocked
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