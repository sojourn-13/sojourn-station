/obj/item/device/holowarrant
	name = "warrant projector"
	desc = "The practical paperwork replacement for the marshal on the go."
	icon_state = "holowarrant"
	item_state = "holowarrant"
	throwforce = 5
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 10
	slot_flags = SLOT_BELT|SLOT_POCKET // QOL improvement tbh
	req_access = list(access_heads, access_security)
	var/boss_name = "Nadezhda Marshals" //The issuing authority. Can be VVed to make a warrant out to be from another party for whatever reason
	var/station_name = "Nadezhda Colony" //As above
	var/language = LANGUAGE_COMMON //More stuff put here so it can theoretically be VVed
	var/datum/computer_file/data/warrant/active
	var/output //What we give to paper parser
	var/header //The header for the paper
	var/holoheader //The header for the holowarrant

//Examine text
/obj/item/device/holowarrant/examine(mob/user, distance)
	. = ..()
	if(active)
		to_chat(user, "It's a holographic warrant for '[active.fields["namewarrant"]]'.")
	if(distance <= 1)
		show_content(user)
	else
		to_chat(user, "<span class='notice'>You'll have to move closer if you want to read it!</span>")

// An active warrant with access authorized grants access
/obj/item/device/holowarrant/GetAccess()
	. = list()

	if(!active)
		return

	if(active.archived)
		return

	. |= active.fields["access"]

// Use in-hand
/obj/item/device/holowarrant/attack_self(mob/living/user as mob)
	active = null
	var/list/warrants = list()
	for(var/datum/computer_file/data/warrant/W in GLOB.all_warrants)
		if(!W.archived)
			warrants += W.fields["namewarrant"]
	if(warrants.len == 0)
		to_chat(user,"<span class='notice'>There are no warrants available.</span>")
		return
	var/temp
	temp = input(user, "Which warrant would you like to load?") as null|anything in warrants
	for(var/datum/computer_file/data/warrant/W in GLOB.all_warrants)
		if(W.fields["namewarrant"] == temp)
			active = W
	update_icon_status()
	update_icon()
	if(active)
		if(active.fields["arrestsearch"] == "arrest")
			output = {"
			<HTML><HEAD><TITLE>[active.fields["namewarrant"]]</TITLE></HEAD>
			<BODY bgcolor='#ffffff'>Issued under the jurisdiction of the [boss_name]</br>
			</br>
			<b>ARREST WARRANT</b></center></br>
			</br>
			This document serves as authorization and notice for the arrest of _<u>[active.fields["namewarrant"]]</u>____ for the crime(s) of:</br>[active.fields["charges"]]</br>
			</br>
			<b>Jurisdiction:</b> _<u>[station_name]</u>____</br>
			</br>_<u>[active.fields["auth"]]</u>____</br>
			<small>Person authorizing arrest</small></br>
			</BODY></HTML>
			"}

			header = "Arrest warrant for [active.fields["namewarrant"]]"
			holoheader = "window=Search warrant for [active.fields["namewarrant"]]"

		if(active.fields["arrestsearch"] ==  "search")
			output= {"
			<HTML><HEAD><TITLE>[active.fields["namewarrant"]]</TITLE></HEAD>
			<BODY bgcolor='#ffffff'>Issued under the jurisdiction of the [boss_name]</br>
			</br>
			<b>SEARCH WARRANT</b></center></br>
			</br>
			<b>Suspect's/location name: </b>[active.fields["namewarrant"]]</br>
			</br>
			<b>For the following reasons: </b> [active.fields["charges"]]</br>
			</br>
			<b>Warrant issued by: </b> [active.fields ["auth"]]</br>
			</br>
			<b>Jurisdiction:</b> _<u>[station_name]</u>____</br>
			</br>
			<center><small><i>The Marshals Officer(s) bearing this Warrant are hereby authorized by the Issuer to conduct a one-time lawful search of the Suspect's person/belongings/premises and/or Department for any items and materials that could be connected to the suspected criminal charges described below, pending an investigation in progress.</br>
			</br>
			The Marshals Officer(s) are obligated to remove any and all such items from the Suspect's posession and/or Department and file it as evidence.</br>
			</br>
			The Suspect/Departamental staff is expected to offer full co-operation.</br>
			</br>
			In the event of the Suspect/Departamental staff attempting to resist/impede this search or flee, they may be taken into custody immediately and charged with appropriate crimes. </br>
			</br>
			All confiscated items must be filed and taken to Evidence.</small></i></center></br>
			</BODY></HTML>
			"}

			header = "Search warrant for [active.fields["namewarrant"]]"
			holoheader = "window=Search warrant for [active.fields["namewarrant"]]"

// Use your ID on it to authorize warrants
/obj/item/device/holowarrant/attackby(obj/item/W, mob/user)
	if(active)
		var/obj/item/card/id/I = W.GetIdCard()
		if(I && check_access_list(I.GetAccess()))
			var/choice = alert(user, "Would you like to authorize this warrant?","Warrant authorization","Yes","No")
			if(choice == "Yes")
				active.fields["auth"] = "[I.registered_name] - [I.assignment ? I.assignment : "(Unknown)"]"
			user.visible_message("<span class='notice'>You swipe \the [I] through the [src].</span>", \
					"<span class='notice'>[user] swipes \the [I] through the [src].</span>")
			broadcast_security_hud_message("\A [active.fields["arrestsearch"]] warrant for <b>[active.fields["namewarrant"]]</b> has been authorized by [I.assignment ? I.assignment+" " : ""][I.registered_name].", src)
		else
			to_chat(user, "<span class='notice'>A red \"Access Denied\" light blinks on \the [src]</span>")
		return 1
	..()

// Hit other people with it to show them the warrant
/obj/item/device/holowarrant/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	user.visible_message("<span class='notice'>[user] holds up a warrant projector and shows its contents to [M].</span>", \
			"<span class='notice'>You show the warrant to [M].</span>")
	M.examinate(src)

/obj/item/device/holowarrant/proc/update_icon_status()
	if(active)
		icon_state = "holowarrant_filled"
	else
		icon_state = "holowarrant"

/obj/item/device/holowarrant/proc/show_content(mob/user, forceshow)
	if(!active)
		return
	show_browser(user, output, holoheader)

/obj/item/device/holowarrant/verb/print_warrant()
	set src in usr.contents
	set name = "Print Warrant"
	set desc = "Prints the active warrant."
	set category = "Object"

	if(!active)
		return
	new/obj/item/paper(usr.drop_location(), output, header, language)
