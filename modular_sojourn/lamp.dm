/obj/item/device/lighting/lamp
	name = "lamp post"
	desc = "A winter proof gas powered lamp, only ever set up during the winters as its a pain to maintain."
	icon = 'modular_sojourn/lamps.dmi'
	icon_state = "lamp_0"
	w_class = ITEM_SIZE_HUGE
	on = FALSE
	brightness_on = 8 //luminosity when on
	density = TRUE
	anchored = TRUE
	turn_on_sound = null
	layer = ABOVE_MOB_LAYER
	New()
		update_icon()

/obj/item/device/lighting/lamp/faith
	name = "abosulte lamp post"
	desc = "A winter proof gas powered lamp, only ever set up during the winters as its a pain to maintain. This one glows brighter and warmer do to using a biomatter mix, with a nice hum."
	brightness_on = 12 //luminosity when on brighter do to being a bad huge
	light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT
	icon_state = "cultlamp_0"

	New()
		update_icon()

/obj/item/device/lighting/lamp/AltClick(mob/user)
	turn_on()
	return

/obj/item/device/lighting/lamp/attackby(obj/item/I, mob/user)
	return

/obj/item/device/lighting/lamp/attack_hand(mob/user)
	return

/obj/item/device/lighting/turn_on(var/mob/living/user)
	if(user && !isturf(user.loc))
		//To prevent some lighting anomalities.
		to_chat(user, "You cannot turn the light on while in this [user.loc].")
		return FALSE
	set_light(brightness_on)
	if(turn_on_sound)
		playsound(src.loc, turn_on_sound, 75, 1)
	on = TRUE
	update_icon()
	return TRUE

/obj/item/device/lighting/lamp/update_icon()
	if(on)
		icon_state = "lamp_1"
	else
		icon_state = "lamp_0"

/obj/item/device/lighting/lamp/faith/update_icon()
	if(on)
		icon_state = "cultlamp_1"
	else
		icon_state = "cultlamp_0"
