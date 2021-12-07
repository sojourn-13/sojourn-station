
/obj/machinery/slime_compresser
	name = "slime compresser"
	desc = "This state of the art compresser is designed to take in slime body remains and compresses them into one more slime core."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "compresser"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER

	circuit = /obj/item/circuitboard/slime_compresser

	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 500

/obj/machinery/slime_compresser/update_icon()
	return //Were boring and have no alt icons

/obj/machinery/slime_compresser/affect_grab(var/mob/user, var/mob/target, var/state)
	if(state < GRAB_NECK)
		to_chat(user, SPAN_DANGER("You need a better grip to do that!"))
		return FALSE
	move_into_gibber(user, target)
	return TRUE

/obj/machinery/slime_compresser/MouseDrop_T(mob/target, mob/user)
	if(user.stat || user.restrained())
		return
	move_into_gibber(user,target)

/obj/machinery/slime_compresser/attackby(var/obj/item/I, var/mob/user as mob)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	..()

/obj/machinery/slime_compresser/proc/move_into_gibber(mob/user,mob/living/carbon/slime/victim)

	if(!isslime(victim))
		to_chat(user, SPAN_DANGER("This is not suitable for the gibber!"))
		return

	user.visible_message(SPAN_DANGER("[user] starts to put [victim] into the slime compresser!"))
	src.add_fingerprint(user)
	if(do_after(user, 30, src) && victim.Adjacent(src) && user.Adjacent(src) && victim.Adjacent(user))
		user.visible_message(SPAN_DANGER("\The [user] stuffs \the [victim] into the compresser!"))
		update_icon()
		qdel(victim)
		new victim.coretype(victim.loc)

