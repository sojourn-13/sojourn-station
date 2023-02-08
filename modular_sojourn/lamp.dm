/obj/structure/torchere
	name = "Stone Torchere"
	desc = "Smooth black stone torchere, its flames glow and eerie blue, while dancing and flickering in a non-existent wind."
	icon = 'modular_sojourn/lamps.dmi'
	icon_state = "mixer"
	var/lit_up = FALSE
	var/brightness_on = 6 //Same as a flare
	light_power = 4
	light_color = "#3F79C1"

/obj/structure/torchere/New()
	..()
	update_icon()
	toggle()

/obj/structure/torchere/update_icon()
	if(lit_up)
		icon_state = "[initial(icon_state)]_1"
	else
		icon_state = "[initial(icon_state)]_0"

/obj/structure/torchere/proc/toggle()
	if(lit_up)
		set_light(0)
		lit_up = FALSE
	else
		set_light(brightness_on)
		lit_up = TRUE
	update_icon()