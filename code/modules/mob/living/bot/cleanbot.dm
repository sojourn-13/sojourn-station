/mob/living/bot/cleanbot
	name = "Cleanbot"
	desc = "A little cleaning robot, he looks so excited!"
	icon_state = "cleanbot0"
	req_one_access = list(access_janitor, access_robotics)
	botcard_access = list(access_janitor, access_maint_tunnels)

	locked = 0 // Start unlocked so roboticist can set them to patrol.

	var/obj/effect/decal/cleanable/target
	var/list/path = list()
	var/list/ignorelist = list()

	var/obj/cleanbot_listener/listener = null


	var/cleaning = 0
	var/screwloose = 0
	var/oddbutton = 0
	var/blood = 1
	var/list/target_types = list()

	var/maximum_search_range = 7
	var/give_up_cooldown = 0

/mob/living/bot/cleanbot/New()
	..()
	get_targets()

/mob/living/bot/cleanbot/proc/handle_target()
	if((get_dist(loc, target.loc) <= 1))
		if(!cleaning)
			UnarmedAttack(target)
			return 1
	if(!path.len)
//		spawn(0)
		path = AStar(loc, target.loc, /turf/proc/CardinalTurfsWithAccess, /turf/proc/Distance, 0, 30, id = botcard)
		if(!path)
			target = null
			path = list()
		return
	if(path.len)
		step_to(src, path[1])
		path -= path[1]
		return 1
	return

/mob/living/bot/cleanbot/Life()
	..()

	if(!on)
		return

	if(client)
		return
	if(cleaning)
		return

	if(!screwloose && !oddbutton && prob(5))
		visible_message("[src] makes an excited beeping booping sound!")

	if(screwloose && prob(5)) // Make a mess
		if(istype(loc, /turf/simulated))
			var/turf/simulated/T = loc
			T.wet_floor()

	if(oddbutton && prob(5)) // Make a big mess
		visible_message("Something flies out of [src]. He seems to be acting oddly.")
		var/obj/effect/decal/cleanable/blood/gibs/gib = new /obj/effect/decal/cleanable/blood/gibs(loc)
		ignorelist += gib
		spawn(600)
			ignorelist -= gib

		// Find a target

	if(pulledby) // Don't wiggle if someone pulls you
		return

	var/found_spot
	var/target_in_view = FALSE
	if(world.time > give_up_cooldown)
		search_loop:
			for(var/i=0, i <= maximum_search_range, i++)
				for(var/obj/effect/decal/cleanable/D in view(i, src))
					if(D in ignorelist)
						continue
					for(var/T in target_types)
						if(istype(D, T))
							target = D
							found_spot = handle_target()
							if (found_spot)
								break search_loop
							else
								target_in_view = TRUE
								target = null
								continue // no need to check the other types

	if(!found_spot && target_in_view && world.time > give_up_cooldown)
		visible_message("[src] can't reach the target and is giving up.")
		give_up_cooldown = world.time + rand(300, 600)


/mob/living/bot/cleanbot/UnarmedAttack(var/obj/effect/decal/cleanable/D, var/proximity)
	if(!..())
		return

	if(!istype(D))
		return

//	if(D.loc != loc)
//		return

	cleaning = 1
	visible_message("[src] begins to clean up \the [D]")
	if(prob(10))
		var/message = pick("Cleaning a new canvas.", "Happy little dots.", "The joy of art.", "Fresh paint needed here.", "One day I will paint again.", "Hope you had fun painting.", "Make sure to clean your brushes!", "Beep!", "I wish to be an artbot, to write poems, create music.")
		say(message)
		playsound(loc, "robot_talk_light", 100, 0, 0)
	update_icons()
	var/cleantime = istype(D, /obj/effect/decal/cleanable/dirt) ? 10 : 50
	if(do_after(src, cleantime, progress = 0))
		if(!D)
			return
		qdel(D)
		if(D == target)
			target = null
	cleaning = 0
	update_icons()

/mob/living/bot/cleanbot/explode()
	on = 0
	visible_message(SPAN_DANGER("[src] blows apart!"))
	playsound(loc, "robot_talk_light", 100, 2, 0)
	var/turf/Tsec = get_turf(src)

	new /obj/item/reagent_containers/glass/bucket(Tsec)
	new /obj/item/device/assembly/prox_sensor(Tsec)
	if(prob(50))
		new /obj/item/robot_parts/l_arm(Tsec)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/cleanbot/update_icons()
	if(cleaning)
		icon_state = "cleanbot-c"
	else
		icon_state = "cleanbot[on]"
	..()

/mob/living/bot/cleanbot/turn_off()
	..()
	target = null
	path = list()

/mob/living/bot/cleanbot/attack_hand(var/mob/user)
	var/dat
	dat += "<TT><B>Automatic Colony Cleaner v1.0</B></TT><BR><BR>"
	dat += "Status: <A href='?src=\ref[src];operation=start'>[on ? "On" : "Off"]</A><BR>"
	dat += "Behaviour controls are [locked ? "locked" : "unlocked"]<BR>"
	dat += "Maintenance panel is [open ? "opened" : "closed"]"
	if(!locked || issilicon(user))
		dat += "<BR>Cleans Blood: <A href='?src=\ref[src];operation=blood'>[blood ? "Yes" : "No"]</A><BR>"
	if(open && !locked)
		dat += "Odd looking screw twiddled: <A href='?src=\ref[src];operation=screw'>[screwloose ? "Yes" : "No"]</A><BR>"
		dat += "Weird button pressed: <A href='?src=\ref[src];operation=oddbutton'>[oddbutton ? "Yes" : "No"]</A>"

	user << browse("<HEAD><TITLE>Cleaner v1.0 controls</TITLE></HEAD>[dat]", "window=autocleaner")
	onclose(user, "autocleaner")
	return

/mob/living/bot/cleanbot/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	add_fingerprint(usr)
	switch(href_list["operation"])
		if("start")
			if(on)
				turn_off()
			else
				turn_on()
		if("blood")
			blood = !blood
			get_targets()
		if("screw")
			screwloose = !screwloose
			to_chat(usr, SPAN_NOTICE("You twiddle the screw."))
		if("oddbutton")
			oddbutton = !oddbutton
			to_chat(usr, SPAN_NOTICE("You press the weird button."))
	attack_hand(usr)

/mob/living/bot/cleanbot/emag_act(var/remaining_uses, var/mob/user)
	. = ..()
	if(!screwloose || !oddbutton)
		if(user)
			to_chat(user, SPAN_NOTICE("The [src] buzzes and beeps."))
			playsound(loc, "robot_talk_light", 100, 0, 0)
		oddbutton = 1
		screwloose = 1
		return 1

/mob/living/bot/cleanbot/proc/get_targets()
	target_types = list()

	target_types += /obj/effect/decal/cleanable/blood/oil
	target_types += /obj/effect/decal/cleanable/vomit
	target_types += /obj/effect/decal/cleanable/crayon
	target_types += /obj/effect/decal/cleanable/liquid_fuel
	target_types += /obj/effect/decal/cleanable/mucus
	target_types += /obj/effect/decal/cleanable/dirt
	target_types += /obj/effect/decal/cleanable/rubble
	target_types += /obj/effect/decal/cleanable/mucus

	if(blood)
		target_types += /obj/effect/decal/cleanable/blood

/* Assembly */

/obj/item/bucket_sensor
	desc = "It's a bucket. With a sensor attached."
	name = "proxy bucket"
	icon = 'icons/obj/aibots.dmi'
	icon_state = "bucket_proxy"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/created_name = "Cleanbot"

/obj/item/bucket_sensor/attackby(var/obj/item/O, var/mob/user)
	..()
	if(istype(O, /obj/item/robot_parts/l_arm) || istype(O, /obj/item/robot_parts/r_arm))
		user.drop_item()
		qdel(O)
		var/turf/T = get_turf(loc)
		var/mob/living/bot/cleanbot/A = new /mob/living/bot/cleanbot(T)
		A.name = created_name
		to_chat(user, SPAN_NOTICE("You add the robot arm to the bucket and sensor assembly. Beep boop!"))
		playsound(src.loc, 'sound/effects/insert.ogg', 50, 1)
		user.drop_from_inventory(src)
		qdel(src)

	else if(istype(O, /obj/item/pen))
		var/t = sanitizeSafe(input(user, "Enter new robot name", name, created_name), MAX_NAME_LEN)
		if(!t)
			return
		if(!in_range(src, usr) && src.loc != usr)
			return
		created_name = t
