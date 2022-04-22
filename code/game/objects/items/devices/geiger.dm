/obj/item/device/geiger
	name = "geiger counter"
	desc = "This device show the amount of rads in an area"
	icon = 'icons/obj/device.dmi'
	icon_state = "geiger_on"
	item_state = "multitool"
	w_class = ITEM_SIZE_SMALL
	var/rad_level = 0

/obj/item/device/geiger/Initialize()
	..()
	AddRadDetector(src)

/obj/item/device/geiger/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("[src] [rad_level > 0 ? "detect [rad_level] rads" : "doesn't detect any rads"]!"))

/obj/item/device/geiger/proc/reset_rads()
	rad_level = 0
	update_icon()

/obj/item/device/geiger/proc/add_rads(var/amount)
	rad_level += amount
	update_icon()

// TODO : Have the counter emit a noise & change icon when irradiated.
/obj/item/device/geiger/update_icon()
	..()
