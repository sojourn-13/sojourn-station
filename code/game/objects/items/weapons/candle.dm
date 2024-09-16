/obj/item/flame/candle
	name = "red candle"
	desc = "a small pillar candle. Its specially-formulated fuel-oxidizer wax mixture allows continued combustion in airless environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle1"
	item_state = "candle1"
	w_class = ITEM_SIZE_TINY
	light_color = COLOR_LIGHTING_ORANGE_DARK
	var/wax = 2000
	var/endless_burn = FALSE
	var/lit_sanity_damage = -0.5

/obj/item/flame/candle/New()
	wax = rand(800, 1000) // Enough for 27-33 minutes. 30 minutes on average.
	..()


/obj/item/flame/candle/pre_lit


/obj/item/flame/candle/pre_lit/endless
	endless_burn = TRUE

/obj/item/flame/candle/pre_lit/New()
	..()
	light(flavor_text = SPAN_NOTICE("\The [name] lights up."))

/obj/item/flame/candle/update_icon()
	var/i
	if(wax > 1500)
		i = 1
	else if(wax > 800)
		i = 2
	else i = 3
	icon_state = "candle[i][lit ? "_lit" : ""]"


/obj/item/flame/candle/attackby(obj/item/I, mob/user)
	..()
	if(QUALITY_WELDING in I.tool_qualities) //Badasses dont get blinded by lighting their candle with a welding tool
		light(SPAN_NOTICE("\The [user] casually lights the [name] with [I]."))
	else if(istype(I, /obj/item/flame/lighter))
		var/obj/item/flame/lighter/L = I
		if(L.lit)
			light()
	else if(istype(I, /obj/item/flame/match))
		var/obj/item/flame/match/M = I
		if(M.lit)
			light()
	else if(istype(I, /obj/item/flame/candle))
		var/obj/item/flame/candle/C = I
		if(C.lit)
			light()


/obj/item/flame/candle/proc/light(flavor_text = SPAN_NOTICE("\The [usr] lights the [name]."))
	if(!lit)
		lit = 1
		//src.damtype = "fire"
		for(var/mob/O in viewers(usr, null))
			O.show_message(flavor_text, 1)
		set_light(CANDLE_LUM)
		START_PROCESSING(SSobj, src)
		sanity_damage = lit_sanity_damage


/obj/item/flame/candle/Process()
	if(!lit)
		return
	if(!endless_burn)
		wax--
	if(!wax)
		new/obj/item/trash/candle(src.loc)
		if(ismob(loc))
			src.dropped(usr)
		qdel(src)
	update_icon()
	if(istype(loc, /turf)) //start a fire if possible
		var/turf/T = loc
		T.hotspot_expose(700, 5)

/obj/item/flame/candle/attack_self(mob/user as mob)
	if(lit)
		lit = 0
		update_icon()
		set_light(0)
		sanity_damage = 0

/obj/item/flame/candle/eternal
	name = "eternal candle"
	desc = "A ceremonial candle produced by the Church's Numericals division as a reflection of the eternal nature of the soul and the infinite mercy of the divine. No matter how much it burns, it never goes out, though it's only supposed to be lit for ceremonies."
	icon_state = "candle_eternal"
	light_color = COLOR_LIGHTING_CYAN_BRIGHT
	endless_burn = TRUE
	lit_sanity_damage = -1

/obj/item/flame/candle/eternal/update_icon()
	var/i
	if(wax > 1500)
		i = 1
	else if(wax > 800)
		i = 2
	else i = 3
	icon_state = "candle_eternal[i][lit ? "_lit" : ""]"
