//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

var/list/priority_air_alarms = list()
var/list/minor_air_alarms = list()


/obj/machinery/computer/atmos_alert
	name = "atmospheric alert computer"
	desc = "Used to access the station's atmospheric sensors."
	circuit = /obj/item/circuitboard/atmos_alert
	icon_keyboard = "atmos_key"
	icon_screen = "alert:0"
	light_color = COLOR_LIGHTING_GREEN_MACHINERY

/obj/machinery/computer/atmos_alert/Initialize()
	. = ..()
	atmosphere_alarm.register_alarm(src, TYPE_PROC_REF(/atom, update_icon))

/obj/machinery/computer/atmos_alert/Destroy()
	atmosphere_alarm.unregister_alarm(src)
	. = ..()

/obj/machinery/computer/atmos_alert/attack_hand(mob/user)
	if(..())
		return
	ui_interact(user)  //now you respont to TGUI

/obj/machinery/computer/atmos_alert/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AtmosAlertConsole", name)
		ui.open()

/obj/machinery/computer/atmos_alert/ui_data(mob/user)  //reminder that this is only ATMOS alarms, check station_alert for all alerts
	var/data[0]
	var/major_alarms[0]
	var/minor_alarms[0]

	for(var/datum/alarm/alarm in atmosphere_alarm.major_alarms(get_z(src)))
		major_alarms[++major_alarms.len] = alarm.alarm_area()

	for(var/datum/alarm/alarm in atmosphere_alarm.minor_alarms(get_z(src)))
		minor_alarms[++minor_alarms.len] = alarm.alarm_area()

	data["priority"] = major_alarms
	data["minor"] = minor_alarms

	return data

/obj/machinery/computer/atmos_alert/update_icon()
	if(!(stat & (NOPOWER|BROKEN)))
		if(atmosphere_alarm.has_major_alarms(get_z(src)))
			icon_screen = "alert:2"
		else if (atmosphere_alarm.has_minor_alarms(get_z(src)))
			icon_screen = "alert:1"
		else
			icon_screen = initial(icon_screen)
	..()
