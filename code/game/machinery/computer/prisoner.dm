//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/obj/machinery/computer/prisoner
	name = "tracker implant management console"
	icon = 'icons/obj/computer.dmi'
	icon_keyboard = "security_key"
	icon_screen = "explosive"
	light_color = COLOR_LIGHTING_SCI_BRIGHT
	req_access = list(access_security)
	circuit = /obj/item/circuitboard/prisoner
	var/id = 0.0
	var/temp = null
	var/status = 0
	var/timeleft = 60
	var/stop = 0.0
	var/screen = 0 // 0 - No Access Denied, 1 - Access allowed


	attack_ai(var/mob/user as mob)
		return src.attack_hand(user)

	attack_hand(var/mob/user as mob)
		if(..())
			return
		user.set_machine(src)
		var/dat = "<html>"
		dat += "<B>Prisoner Implant Manager System</B><BR>"
		if(screen == 0)
			dat += "<HR><A href='?src=\ref[src];lock=1'>Unlock Console</A>"
		else if(screen == 1)
			dat += "<HR>Chemical Implants<BR>"
			for(var/obj/item/implant/chem/C in world)
				if(!C.implanted) continue
				dat += "[C.wearer.name] | Remaining Units: [C.reagents.total_volume] | Inject: "
				dat += "<A href='?src=\ref[src];inject1=\ref[C]'>(<font color=red>(1)</font>)</A>"
				dat += "<A href='?src=\ref[src];inject5=\ref[C]'>(<font color=red>(5)</font>)</A>"
				dat += "<A href='?src=\ref[src];inject10=\ref[C]'>(<font color=red>(10)</font>)</A><BR>"
				dat += "********************************<BR>"
			dat += "<HR>Tracking Implants<BR>"
			for(var/obj/item/implant/tracking/T in world)
				if(!T.implanted) continue
				var/loc_display = "Unknown"
				var/mob/living/carbon/M = T.wearer
				if(isStationLevel(M.z) && !istype(M.loc, /turf/space))
					var/turf/mob_loc = get_turf(M)
					loc_display = mob_loc.loc
				if(T.malfunction)
					loc_display = pick(SSmapping.teleportlocs)
				dat += "ID: [T.id] | Location: [loc_display]<BR>"
				dat += "<A href='?src=\ref[src];warn=\ref[T]'>(<font color=red><i>Message Holder</i></font>)</A> |<BR>"
				dat += "********************************<BR>"
			dat += "<HR><A href='?src=\ref[src];lock=1'>Lock Console</A>"

		dat += "</html>"
		user << browse(dat, "window=computer;size=400x500")
		onclose(user, "computer")
		return


	Process()
		if(!..())
			src.updateDialog()
		return


	Topic(href, href_list)
		if(..())
			return
		if((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf))) || (issilicon(usr)))
			usr.set_machine(src)

			if(href_list["inject1"])
				var/obj/item/implant/I = locate(href_list["inject1"])
				if(I)	I.activate(1)

			else if(href_list["inject5"])
				var/obj/item/implant/I = locate(href_list["inject5"])
				if(I)	I.activate(5)

			else if(href_list["inject10"])
				var/obj/item/implant/I = locate(href_list["inject10"])
				if(I)	I.activate(10)

			else if(href_list["lock"])
				if(src.allowed(usr))
					screen = !screen
				else
					to_chat(usr, "Unauthorized Access.")

			else if(href_list["warn"])
				var/warning = sanitize(input(usr,"Message:","Enter your message here!",""))
				if(!warning) return
				var/obj/item/implant/I = locate(href_list["warn"])
				if(I && I.wearer)
					var/mob/living/carbon/R = I.wearer
					to_chat(R, SPAN_NOTICE("You hear a voice in your head saying: '[warning]'"))

			src.add_fingerprint(usr)
		src.updateUsrDialog()
		return
