/obj/item/device/lighting/glowstick/flare
	name = "flare"
	desc = "A red standard-issue flare. There are instructions on the side reading 'pull cord, make light'."
	brightness_on = 4 // Pretty bright.
	light_power = 2
	color = null
	light_color = COLOR_LIGHTING_RED_BRIGHT
	icon_state = "flare"
	max_fuel = 1000
	var/on_damage = 7
	var/produce_heat = 1500
	turn_on_sound = 'sound/effects/Custom_flare.ogg'
	heat = 1873
	preloaded_reagents = list("sulfur" = 10, "potassium" = 5, "hydrazine" = 5)

/obj/item/device/lighting/glowstick/flare/Process()
	..()
	if(on)
		var/turf/pos = get_turf(src)
		if(pos)
			pos.hotspot_expose(produce_heat, 5)

/obj/item/device/lighting/glowstick/flare/burn_out()
	..()
	damtype = initial(damtype)
	force = initial(force)

/obj/item/device/lighting/glowstick/flare/attack_self(mob/user)
	if(turn_on(user))
		user.visible_message(
			SPAN_NOTICE("\The [user] activates \the [src]."),
			SPAN_NOTICE("You pull the cord on the flare, activating it!")
		)

/obj/item/device/lighting/glowstick/flare/turn_on(var/mob/user)
	. = ..()
	if(.)
		force = on_damage
		damtype = BURN

/obj/item/device/lighting/glowstick/flare/update_icon()
	cut_overlays()
	if(!fuel)
		icon_state = "[initial(icon_state)]-empty"
		set_light(0)
	else if(on)
		icon_state = "[initial(icon_state)]-on"
		set_light(brightness_on)
	else
		icon_state = initial(icon_state)
		set_light(0)
	update_wear_icon()

/obj/item/device/lighting/glowstick/flare/is_hot()
	if (on)
		return heat

/obj/item/device/lighting/glowstick/flare/torch
	name = "torch"
	desc = "A wooden torch with some cloth wrapped on it. Can work as a decent illumination tool for a while."
	brightness_on = 5 // Flashlight level
	light_power = 3
	icon_state = "torch"
	light_color = COLOR_LIGHTING_ORANGE_MACHINERY
	max_fuel = 1750 // Below glowstick, more than a flare
	damtype = BRUTE // Torch is unable to burn webs unlit
	on_damage = 15 // Mediocre weapon when turned on
	produce_heat = 2000 // Burns brighter than flare
	turn_on_sound = 'sound/effects/torch_on.ogg'
	preloaded_reagents = list("woodpulp" = 10)

/obj/item/device/lighting/glowstick/flare/torch/Process()
	..()
	if(on)
		var/turf/pos = get_turf(src)
		if(pos)
			pos.hotspot_expose(produce_heat, 5)

/obj/item/device/lighting/glowstick/flare/torch/burn_out()
	STOP_PROCESSING(SSobj, src)
	damtype = BRUTE //returns torch to not able to burn webs
	on = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/M = loc
		M.visible_message(
			"[src] slowly burns out.",
			"And now... the darkness holds dominion - black as death."
		)
	else
		visible_message("[src] slowly burns out")
	playsound(src.loc, 'sound/items/cigs_lighters/cig_snuff.ogg', 75, 1)

/obj/item/device/lighting/glowstick/flare/torch/update_icon()
	cut_overlays()
	if(!fuel)
		damtype = BRUTE//returns torch to not able to burn webs
		icon_state = "[initial(icon_state)]_burned"
		set_light(0)
	else if(on)
		damtype = BURN //allows torch to burn webs while lit
		icon_state = "[initial(icon_state)]_on"
		set_light(brightness_on)
	else
		damtype = BRUTE//returns torch to not able to burn webs
		icon_state = initial(icon_state)
		set_light(0)
	update_wear_icon()

/obj/item/device/lighting/glowstick/flare/torch/proc/extinguishTorch()
	STOP_PROCESSING(SSobj, src)
	damtype = BRUTE //returns torch to not able to burn webs
	on = FALSE
	fuel -= 50 // We lose a bit of fuel every time we force it to extinguish early.
	update_icon()
	playsound(src.loc, 'sound/effects/torch_off.ogg', 75, 1)
	if(ismob(loc))
		var/mob/M = loc
		M.visible_message(
			"[M] shakes the [src], quickly putting it out.",
			"You quickly shake the [src] in your hand, putting it out."
		)
	else
		visible_message("[src] slowly burns out.")

/obj/item/device/lighting/glowstick/flare/torch/attack_self(mob/user)
	if(on)
		extinguishTorch()
	else
		return

/obj/item/device/lighting/glowstick/flare/torch/attackby(obj/item/W as obj, mob/user as mob)
	if(isflamesource(W))
		if(fuel <= 0)
			to_chat(user, SPAN_NOTICE("The [src] has no more cloth to burn."))
			return
		else if(on)
			to_chat(user, SPAN_NOTICE("The [src] is already lit."))
			return
		else
			on = TRUE
			START_PROCESSING(SSobj, src)
			update_icon()
			user.visible_message(
				SPAN_NOTICE("[user] lights \the [src] with their [W]."),
				SPAN_NOTICE("You light the [src] with \the [W]. A blazing star is born!")
			)

