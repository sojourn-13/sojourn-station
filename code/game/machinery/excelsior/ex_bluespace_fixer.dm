
//Sprite base by Près de l'oiseau#2625
/obj/machinery/power/ex_bluespace_repairer
	name = "excelsior bluespace aligner"
	desc = "A large tower-radio-like machinery that is used to align and repair bluespace, \
	used mostly when the long-range teleporters start to destabilize local space. \
	It can also warn people about a room's bluespace entropy levels."
	icon = 'icons/obj/machines/excelsior/bluespace_fixer.dmi'
	icon_state = "exl_stablizer"
	idle_power_usage = 1200
	active_power_usage = 5000
	circuit = /obj/item/circuitboard/ex_bluespace_repairer
	var/extra_entrop_removed = 4
	var/is_on = FALSE
	//Heals 5-10 + 4 entropy every 5 mins

/obj/machinery/power/ex_bluespace_repairer/update_icon()
	icon_state = "exl_stablizer"

/obj/machinery/power/ex_bluespace_repairer/Initialize()
	. = ..()
	is_on = TRUE
	addtimer(CALLBACK(src, PROC_REF(lower_entropy)), 5 MINUTES, TIMER_STOPPABLE)

/obj/machinery/power/ex_bluespace_repairer/examine(mob/living/user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("Scanners are detecting bluespace entropy in this room to be [my_area.bluespace_entropy] zeframs."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The Bluespace Aligner's global scanner notifies of stellar discrepancy at [GLOB.bluespace_entropy] zeframs of bluespace entropy on the planet."))

/obj/machinery/power/ex_bluespace_repairer/proc/lower_entropy(turf/T)
	var/area/A = get_area(T)
	if(A.bluespace_entropy > 0)
		A.bluespace_entropy -= rand(5, 10) + extra_entrop_removed
		is_on = FALSE

/obj/machinery/power/ex_bluespace_repairer/attack_hand(mob/user as mob)
	if(is_on)
		to_chat(user, SPAN_NOTICE("Aliner scanner is current on and working."))
	else
		to_chat(user, SPAN_NOTICE("You activate the the Aliner allowing it to silently start up."))
	return

/obj/machinery/power/ex_bluespace_repairer/attackby(obj/item/I, mob/user)
	log_and_message_admins(" - Exl Bluespace Aliner being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it
	if(default_deconstruction(I, user))
		return
	..()

/obj/machinery/power/ex_bluespace_repairer/RefreshParts()
	if (!component_parts.len)
		error("[src] \ref[src] had no parts on refresh")
		return //this has runtimed before
	var/man_rating = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	extra_entrop_removed = initial(extra_entrop_removed) + man_rating
