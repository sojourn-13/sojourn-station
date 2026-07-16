/obj/structure/mailshoot
	name = "mail vent"
	desc = "A simple system that takes mail to drop off locations for further teleporation."
	icon = 'icons/obj/objects.dmi'
	icon_state = "borgcharger0(old)"
	density = FALSE
	throwpass = TRUE
	climbable = TRUE
	var/datum/trade_station/target_station

/obj/structure/mailshoot/attack_hand(mob/user)
	..()

	if(!user)
		return

	select_target_station(user)

/obj/structure/mailshoot/attackby(obj/item/I, mob/user)
	..()

	if(!user)
		return

	if(!target_station)
		to_chat(user, "<span class='info'>The vent is shut do to having no target location.</span>")
		return

	if(istype(I, /obj/item/mail))
		deliver_mail(I, user)

/obj/structure/mailshoot/proc/select_target_station(mob/user)
	if(!user)
		return

	if(SStrade.discovered_stations)
		var/choice = input(user,"What station to send mail to?") as null|anything in SStrade.discovered_stations

		if(get_dist(src,user) >= 2)
			to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
			return

		target_station = choice

//A fast way to rapidly pump money into trade stations, all be it unfocused
/obj/structure/mailshoot/proc/deliver_mail(obj/item/I, mob/user)
	if(!user || !I || !target_station)
		return
	if(istype(I, /obj/item/mail))
		var/obj/item/mail/M = I
		to_chat(user, "<span class='info'>The package goes down the shoot without issue</span>")
		if(M.go_to == target_station)
			target_station.favor += 5
			if(M.weight == M.weight_stamp)
				target_station.wealth += round(M.weight/4)
			if(M.mail_type == M.mail_type_stamp)
				target_station.wealth += rand(100, 250)
			if(M.barcode == M.barcode_stamp)
				target_station.wealth += rand(100, 250)
			//Getting "good rng" will give you eather 10 or 20 cr value but in os_cash
			if(M.go_to == /datum/trade_station/greyson_ship || M.go_to == /datum/trade_station/greyson_printer_ship)
				new /obj/item/stack/os_cash/mail_reward (src.loc)
				to_chat(user, "<span class='info'>Out from the bottom spits a bit of cash</span>")
			else
				//Well getting normal stations can be more or less
				var/obj/item/spacecash/ewallet/EW = new /obj/item/spacecash/ewallet(src.loc)
				to_chat(user, "<span class='info'>Out from the bottom prints out bit of credit</span>")
				EW.worth += rand(5, 25)
			GLOB.mail_sent_score++

		qdel(M)

/obj/structure/mailpile
	name = "Mail Pile(TM)"
	desc = "A large tube filled with letters, packets and other items to be stamped, labled and sent out."
	icon = 'icons/obj/objects.dmi'
	icon_state = "borgcharger2(old)"
	density = FALSE
	throwpass = TRUE
	climbable = TRUE
	var/cooling_down = FALSE
	var/travel_time = 3 SECONDS

/obj/structure/mailpile/attack_hand(mob/user as mob)
	..()
	if(!ishuman(user) && !issilicon(user))
		to_chat(user, "<span class='info'>The Mail Pile(TM) does not recognize you as a valid employee type.</span>")
		return
	if(cooling_down >= world.time)
		cooling_down = world.time + travel_time
		to_chat(user, "<span class='info'>The Mail Pile(TM) is processing last request still, give it at lest three more seconds.</span>")
	else
		new /obj/item/mail(src.loc)

/obj/item/mail
	name = "outgoing mail"
	desc = "A small packet of boring mail, has anti-tampering systems that track thief and a protected wrapper around it."
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverycrateSmall"
	w_class = ITEM_SIZE_NORMAL
	var/go_to
	var/weight
	var/weight_stamp
	var/mail_type
	var/mail_type_stamp
	var/barcode = ""
	var/barcode_stamp
	var/list/packet_types = list("Cleaning Supplies", \
								"Shelf Stable Rations", \
								"Fuels", \
								"Letters/Paperwork", \
								"SI Goods", \
								"Church Goods", \
								"LSS Invoices")
	var/list/allowed_actions = list("Barcode", "Weight", "Postage Type", "Cancel")

/obj/item/mail/attack_self(mob/user as mob)
	..()
	var/user_is_choosing = TRUE

	while(user_is_choosing)
		var/action = input(user, "Mail Call", "Make it Snappy!") as null|anything in allowed_actions
		switch(action)
			if("Barcode")
				var/barcode_code = sanitizeSafe(input(user, "Placing Barcode Stamp", "Barcode"))

				if(get_dist(src,user) >= 2)
					to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
					user_is_choosing = FALSE
					return

				if(barcode_stamp)
					to_chat(user, "<span class='info'>You peel off the old barcode stamp.</span>")
					barcode_stamp = ""

				barcode_stamp = barcode_code

			if("Weight")
				if(get_dist(src,user) >= 2)
					to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
					user_is_choosing = FALSE
					return

				weight_stamp = input(user, "Placing Barcode Stamo", "Barcode") as null|num

			if("Postage Type")
				if(get_dist(src,user) >= 2)
					to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
					user_is_choosing = FALSE
					return
				mail_type_stamp = input(user, "Mail Stamp", "Type", ) as null|anything in packet_types

			if("Cancel")
				user_is_choosing = FALSE
			else
				user_is_choosing = FALSE


/obj/item/mail/Initialize()
	. = ..()
	if(SStrade.discovered_stations)
		go_to = pick(SStrade.discovered_stations)
		weight = rand(100, 999)
		mail_type = pick(packet_types)
		if(mail_type == "LSS Invoices" || mail_type == "Letters/Paperwork")
			icon_state = "letters"
		var/barcode_lang = rand(5,21)
		var/barcode_index = 0
		while(barcode_index<barcode_lang)
			barcode_index++
			barcode += pick("|", "{", ")", "(", "}")

	if(!go_to)
		qdel(src)

/obj/item/mail/Destroy()
	go_to = null
	..()

/obj/item/mail/examine(mob/user)
	..()

	var/message = ""

	if(go_to)
		message += "Please Relay To: [go_to].\n"
	if(weight)
		message += "Postage Weight: [weight].\n"
		message += "Stamp Weight: [weight_stamp]\n"
	if(mail_type)
		message += "Postage Type: [mail_type].\n"
		message += "Postage Stamp: [mail_type_stamp]\n"
	if(barcode)
		message += "Barcode: [barcode].\n"
		message += "Stamp Code: [barcode_stamp]\n"

	to_chat(user, "<span class='info'>[message]</span>")
