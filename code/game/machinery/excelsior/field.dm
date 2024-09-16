//Todo: make this thing work under new shield system
/obj/machinery/shieldwallgen/excelsior
	name = "excelsior shield generator"
	desc = "A shield generator."
	icon = 'icons/obj/machines/excelsior/field.dmi'
	stun_chance = 3
	shield_type = /obj/machinery/shieldwall/excelsior
	circuit = /obj/item/circuitboard/excelsiorshieldwallgen
	req_access = null

/obj/machinery/shieldwallgen/excelsior/attack_hand(mob/user as mob)
	..()
	log_and_message_admins(" - Exc Shieldwall being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it

/obj/machinery/shieldwallgen/excelsior/can_stun(var/mob/M)
	if(is_excelsior(M))
		return FALSE

	return TRUE

/obj/machinery/shieldwallgen/excelsior/allowed(var/mob/user)
	if(is_excelsior(user))
		return TRUE

	return FALSE

/obj/machinery/shieldwallgen/excelsior/emag_act()
	return

/obj/machinery/shieldwallgen/excelsior/verb/toggle_stun()
	set category = "Object"
	set name = "Toggle stun mode"
	set src in view(1)

	if(usr.incapacitated())
		return

	stunmode = !stunmode

	if(stunmode)
		to_chat(usr, SPAN_NOTICE("You toggle on [src]'s stun mode."))
		log_and_message_admins(" - Exc Shieldwall being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[usr]") //So we can go to it
	else
		log_and_message_admins(" - Exc Shieldwall being used at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[usr]") //So we can go to it
		to_chat(usr, SPAN_NOTICE("You toggle off [src]'s stun mode."))


//Special variant that allows excelsior people to walk though
/obj/machinery/shieldwall/excelsior

/obj/machinery/shieldwall/excelsior/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(is_excelsior(mover))
		return TRUE
	return ..()
