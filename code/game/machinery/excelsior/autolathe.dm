/obj/machinery/autolathe/excelsior
	name = "excelsior autolathe"
	desc = "It produces items using metal and glass."
	icon = 'icons/obj/machines/excelsior/autolathe.dmi'
	icon_state = "stanok"
	circuit = /obj/item/circuitboard/excelsiorautolathe

	have_recycling = TRUE
	build_type = AUTOLATHE | BIOPRINTER
	speed = 4
	storage_capacity = 240
	unsuitable_materials = list()	// Can use biomatter too.

/obj/machinery/autolathe/excelsior/Initialize()
	. = ..()
	container = new /obj/item/reagent_containers/glass/beaker/large(src)

/obj/machinery/autolathe/excelsior/update_icon()
	..()
	if(stat & NOPOWER)
		icon_state = "[initial(icon_state)]_off"

/obj/machinery/autolathe/excelsior/attack_hand(mob/user)
	..()
	log_and_message_admins(" - Exc Autolathe being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it

/obj/machinery/autolathe/excelsior/attackby(obj/item/I, mob/user)
	..()
	log_and_message_admins(" - Exc Autolathe being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it

//Putting this here because fuck making a new .dm for a single antag device
/obj/machinery/excelsior_boombox
	name = "excelsior boombox"
	desc = "A powerful sound propagation system designed to boost Excelsior and lower enemy morale. Plays some sick tunes."
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/machines/excelsior/boombox.dmi'
	icon_state = "boombox_off"
	idle_power_usage = 10
	active_power_usage = 60
	use_power = TRUE
	circuit = /obj/item/circuitboard/excelsior_boombox
	var/active = FALSE
	var/update_time = 0 // Made so callbacks can't be spamed

/obj/machinery/excelsior_boombox/attack_hand(mob/user)
	..()
	toggle_active()
	update_icon()

/obj/machinery/excelsior_boombox/attackby(var/obj/item/I, var/mob/user)
	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

/obj/machinery/excelsior_boombox/update_icon()
	if(!active || (stat & (BROKEN|NOPOWER)))
		icon_state = initial(icon_state)
	else
		icon_state = "boombox_on"

/obj/machinery/excelsior_boombox/proc/toggle_active()
	if(active || (stat & (BROKEN|NOPOWER)))
		active = FALSE
		log_and_message_admins(" - Exc Boombox turned off at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z]") //So we can go to it
	else
		active = TRUE
		log_and_message_admins(" - Exc Boombox turned on at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z]") //So we can go to it
		if(world.time >= update_time + 20 SECONDS)
			send_propaganda()
			update_time = world.time

/obj/machinery/excelsior_boombox/proc/send_propaganda()
	if(active)
		for (var/mob/living/carbon/M in range(10, src))
			if(is_excelsior(M))
				to_chat(M, SPAN_NOTICE("You hear a motivating tune, you feel ready for a fight!"))
				M.stats.addTempStat(STAT_TGH, STAT_LEVEL_ADEPT, 20 SECONDS, "ex_boombox")
				M.stats.addTempStat(STAT_VIG, STAT_LEVEL_BASIC, 20 SECONDS, "ex_boombox")
			else
				to_chat(M, SPAN_WARNING("You hear some stupid propaganda, you dont believe it but... what if they are right?"))
				M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, 20 SECONDS, "ex_boombox_m")
		addtimer(CALLBACK(src, PROC_REF(send_propaganda)), 20 SECONDS)
