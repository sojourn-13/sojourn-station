//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/item/implantpad
	name = "implantpad"
	desc = "Used to modify implants."
	icon = 'icons/obj/items.dmi'
	icon_state = "implantpad-0"
	item_state = "electronic"
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/obj/item/implantcase/case = null
	var/broadcasting = null
	var/listening = 1.0


/obj/item/implantpad/proc/update()
	cut_overlays()
	if (src.case)
		if(src.case.implant)
			if(istype(src.case.implant, /obj/item/implant))
				src.icon_state = "implantpad-1"
				add_overlay("implant_[case.implant:overlay_icon]")
	else
		src.icon_state = "implantpad-0"
	return


/obj/item/implantpad/attack_hand(mob/user as mob)
	if ((src.case && (user.l_hand == src || user.r_hand == src)))
		user.put_in_active_hand(case)

		src.case.add_fingerprint(user)
		src.case = null

		src.add_fingerprint(user)
		update()
	else
		return ..()
	return


/obj/item/implantpad/attackby(obj/item/implantcase/C as obj, mob/user as mob)
	..()
	if(istype(C, /obj/item/implantcase))
		if(!( src.case ))
			user.drop_item()
			C.loc = src
			src.case = C
			src.update()
	return


/obj/item/implantpad/attack_self(mob/user as mob)
	user.set_machine(src)
	var/dat = "<html><B>Implant Mini-Computer:</B><HR>"
	if (src.case)
		if(src.case.implant)
			if(istype(src.case.implant, /obj/item/implant))
				dat += src.case.implant.get_data()
				if(istype(src.case.implant, /obj/item/implant/tracking))
					dat += {"ID (1-100):
					<A href='byond://?src=\ref[src];tracking_id=-10'>-</A>
					<A href='byond://?src=\ref[src];tracking_id=-1'>-</A> [case.implant:id]
					<A href='byond://?src=\ref[src];tracking_id=1'>+</A>
					<A href='byond://?src=\ref[src];tracking_id=10'>+</A><BR>"}
		else
			dat += "The implant casing is empty."
	else
		dat += "Please insert an implant casing!"
	dat += "</html>"
	user << browse(dat, "window=implantpad")
	onclose(user, "implantpad")
	return


/obj/item/implantpad/Topic(href, href_list)
	..()
	if (usr.stat)
		return
	if ((usr.contents.Find(src)) || ((in_range(src, usr) && istype(src.loc, /turf))))
		usr.set_machine(src)
		if (href_list["tracking_id"])
			var/obj/item/implant/tracking/T = src.case.implant
			T.id += text2num(href_list["tracking_id"])
			T.id = min(100, T.id)
			T.id = max(1, T.id)

		if (ismob(loc))
			attack_self(src.loc)
		else
			for(var/mob/M in viewers(1, src))
				if (M.client)
					src.attack_self(M)
		src.add_fingerprint(usr)
	else
		usr << browse(null, "window=implantpad")
		return
	return
