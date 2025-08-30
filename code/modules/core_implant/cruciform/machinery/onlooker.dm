
//Sprite by Près de l'oiseau#2625
/obj/machinery/telesci_inhibitor/nt_bluespace_seer
	name = "Absolute Nullifier"
	desc = "A floating pillar of size that was developed by the church Numericals under Browne's direction for monitoring bluespace entropy. \
	Also known to block telescience teleportation."
	icon = 'icons/obj/machines/church_looker.dmi'
	icon_state = "Nullifer_i_sleep"
	idle_power_usage = 0 //Holy technology doesn't run on electricity
	var/active_mode = FALSE
	var/activation_counter = 1
	var/time_step = 2 MINUTES
	var/intensity = 0
	var/area/my_area

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/update_icon()
	if(active_mode)
		icon_state = "Nullifer_realshit"
	else
		icon_state = "Nullifer_i_sleep"

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/Initialize()
	my_area = get_area(src)
	. = ..()
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(lower_entropy)), time_step, TIMER_STOPPABLE)

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/examine(mob/living/user, distance)
	if(my_area.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The Nullifier's scanner is detecting bluespace entropy in this room to be [my_area.bluespace_entropy] zeframs."))

	if(GLOB.bluespace_entropy)
		to_chat(user, SPAN_NOTICE("The Nullifier's global scanner notifies of stellar discrepancy at [GLOB.bluespace_entropy] zeframs of bluespace entropy on the planet."))

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/proc/lower_entropy()
	if(active_mode)
		src.intensity = rand(1,3)
		my_area.bluespace_entropy -= src.intensity //Comes out to 5-15 over 10 minutes for both, lower to make up for the fact that it still works while inactive
		GLOB.bluespace_entropy -= src.intensity
		if(activation_counter == 5)
			active_mode = FALSE
			update_icon()
		else
			activation_counter += 1
	else //If we're not active, we still lower the BS, but by a LOT less
		my_area.bluespace_entropy -= 1
		GLOB.bluespace_entropy -= 1
	addtimer(CALLBACK(src, PROC_REF(lower_entropy)), time_step, TIMER_STOPPABLE)

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/attack_hand(mob/user as mob)
	if(active_mode)
		to_chat(user, SPAN_NOTICE("Nullifier scanner is current on and working."))
	else
		to_chat(user, SPAN_NOTICE("You activate the the Nullifier, awakening it to reduce the entropy further."))
		active_mode = TRUE
		activation_counter = 1
		update_icon()
	return

/obj/machinery/telesci_inhibitor/nt_bluespace_seer/attackby(mob/user as mob)
	return
