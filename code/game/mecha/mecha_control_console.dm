/obj/machinery/computer/mecha //Why is this in mecha and not console?
	name = "exosuit control"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "rd_key"
	icon_screen = "mecha"
	light_color = COLOR_LIGHTING_PURPLE_MACHINERY
	req_access = list(access_robotics)
	circuit = /obj/item/circuitboard/mecha_control
	var/list/located = list()
	var/screen = FALSE
	var/stored_data

/obj/machinery/computer/mecha/attack_ai(var/mob/user as mob)
	return src.attack_hand(user)

/obj/machinery/computer/mecha/attack_hand(var/mob/user as mob)
	if(..())
		return
	nano_ui_interact(user)

/obj/machinery/computer/mecha/Topic(href, href_list)// TODO: fix everything
	if(..())
		return
	var/datum/topic_input/m_filter = new /datum/topic_input(href,href_list)
	if(href_list["send_message"])
		var/obj/item/mecha_parts/mecha_tracking/MT = m_filter.getObj("send_message")
		var/message = sanitize(input(usr,"Input message","Transmit message") as text)
		var/obj/mecha/M = MT.in_mecha()
		if(message && M)
			M.occupant_message(message)
		return
	if(href_list["shock"])
		var/obj/item/mecha_parts/mecha_tracking/MT = m_filter.getObj("shock")
		MT.shock()
	if(href_list["get_log"])
		var/obj/item/mecha_parts/mecha_tracking/MT = m_filter.getObj("get_log")
		stored_data = MT.get_mecha_log()
		screen = TRUE
	if(href_list["return"])
		screen = FALSE
	if(href_list["print"])
		to_chat(usr, "The [src] hums as it begins printing a report.")
		sleep(50)
		print_report(usr)
	src.updateUsrDialog()
	return

/obj/machinery/computer/mecha/proc/print_report(var/mob/living/user)
	new /obj/item/paper(get_turf(src), stored_data, "Exosuit Log") // Spawn the log of the mech
	src.visible_message("\The [src] spits out a piece of paper.")

//I have no idea what im doing
/obj/machinery/computer/mecha/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state = GLOB.default_state)
	if(..())
		return
	user.set_machine(src)
	var/dat = "<html><head><title>[src.name]</title><style>h3 {margin: 0px; padding: 0px;}</style></head><body>"
	if(screen == FALSE)
		dat += "<h3>Tracking beacons data</h3>"
		for(var/obj/item/mecha_parts/mecha_tracking/TR in world)
			var/answer = TR.get_mecha_info()
			if(answer)
				dat += {"<hr>[answer]<br/>
						  <a href='?src=\ref[src];send_message=\ref[TR]'>Send message</a><br/>
						  <a href='?src=\ref[src];get_log=\ref[TR]'>Show exosuit log</a> | <a style='color: #f00;' href='?src=\ref[src];shock=\ref[TR]'>(EMP pulse)</a><br>"}

	if(screen== TRUE)
		dat += "<h3>Log contents</h3>"
		dat += "<a href='?src=\ref[src];return=1'>Return</a><hr>"
		dat += "[stored_data]"
		dat += "<A href='?src=\ref[src];print=1'>Print Log</A><BR>"
		dat += "<A href='?src=\ref[src];refresh=1'>(Refresh)</A><BR>"
		dat += "</body></html>"

	user << browse(dat, "window=computer;size=400x500")
	onclose(user, "computer")
	return


/obj/item/mecha_parts/mecha_tracking //Whe is this here WE HAVE FILES FOR THIS?!
	name = "exosuit tracking beacon"
	desc = "Device used to transmit exosuit data."
	icon = 'icons/obj/device.dmi'
	icon_state = "motion2"
	origin_tech = list(TECH_DATA = 2, TECH_MAGNET = 2)
	matter = list(MATERIAL_STEEL = 5)

/obj/item/mecha_parts/mecha_tracking/proc/get_mecha_info()
	if(!in_mecha())
		return FALSE
	var/obj/mecha/M = src.loc
	var/cell_charge = M.get_charge()
	var/answer = {"<b>Name:</b> [M.name]<br>
						<b>Integrity:</b> [M.health/initial(M.health)*100]%<br>
						<b>Cell charge:</b> [isnull(cell_charge)?"Not found":"[M.cell.percent()]%"]<br>
						<b>Airtank:</b> [M.return_pressure()]kPa<br>
						<b>Pilot:</b> [M.occupant||"None"]<br>
						<b>Location:</b> [get_area(M)||"Unknown"]<br>
						<b>Active equipment:</b> [M.selected||"None"]"}
	if(istype(M, /obj/mecha/working/ripley))
		var/obj/mecha/working/ripley/RM = M
		answer += "<b>Used cargo space:</b> [RM.cargo.len/RM.cargo_capacity*100]%<br>"

	return answer

/obj/item/mecha_parts/mecha_tracking/emp_act()
	qdel(src)
	return

/obj/item/mecha_parts/mecha_tracking/ex_act()
	qdel(src)
	return

/obj/item/mecha_parts/mecha_tracking/proc/in_mecha()
	if(istype(src.loc, /obj/mecha))
		return src.loc
	return FALSE

/obj/item/mecha_parts/mecha_tracking/proc/shock()
	var/obj/mecha/M = in_mecha()
	if(M)
		M.emp_act(2)
	qdel(src)

/obj/item/mecha_parts/mecha_tracking/proc/get_mecha_log()
	if(!src.in_mecha())
		return FALSE
	var/obj/mecha/M = src.loc
	return M.get_log_html()


/obj/item/storage/box/mechabeacons //Whe is this here?!
	name = "Exosuit Tracking Beacons"

/obj/item/storage/box/mechabeacons/New()
	..()
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
	new /obj/item/mecha_parts/mecha_tracking(src)
