
//Sprite by Près de l'oiseau#2625
/obj/machinery/telesci_inhibitor/nt_bluespace_seer
	name = "Absolute Nullifer"
	desc = "A floating pillar of size that was developed by the church numerals under Browne's direction for monitoring bluespace entropy. \
	Also known to block telescience teleportation."
	icon = 'icons/obj/machines/church_looker.dmi'
	icon_state = "Nullifer_i_sleep"
	idle_power_usage = 600 //Were not that demanding as were so costly already
	var/is_on = FALSE
	//Heals 5-10 entropy every 10 mins

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/update_icon()
	if(is_on)
		icon_state = "Nullifer_realshit"
	else
		icon_state = "Nullifer_i_sleep"

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/Initialize()
	. = ..()
	is_on = TRUE
	update_icon()
	addtimer(CALLBACK(src, .proc/lower_entropy), 10 MINUTES, TIMER_STOPPABLE)

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/examine(mob/living/user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("Nullifer scanner reads the room to [my_area.bluespace_entropy] annomlst bluespace."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("Nullifer scanner is giving off [GLOB.bluespace_entropy] on the planet."))

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/proc/lower_entropy(turf/T)
	var/area/A = get_area(T)
	if(A.bluespace_entropy > 0)
		A.bluespace_entropy -= rand(5, 10)
		update_icon()
		is_on = FALSE

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/attack_hand(mob/user as mob)
	if(is_on)
		to_chat(user, SPAN_NOTICE("Nullifer scanner is current on and working."))
	else
		to_chat(user, SPAN_NOTICE("You activate the the Nullifer allowing it to silently start up."))
		update_icon()
	return

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/attackby(mob/user as mob)
	return
