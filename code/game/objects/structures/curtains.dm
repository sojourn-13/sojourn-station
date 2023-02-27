/obj/structure/curtain
	name = "curtain"
	desc = "A cloth curtain that can be parted and closed accordingly."
	icon = 'icons/obj/curtain.dmi'
	icon_state = "closed"
	matter = list(MATERIAL_CLOTH = 8)
	opacity = 1
	density = 0
	anchored = 1
	layer = WALL_OBJ_LAYER

/obj/structure/curtain/open
	icon_state = "open"
	layer = SIGN_LAYER
	opacity = 0

/obj/structure/curtain/bullet_act(obj/item/projectile/P, def_zone)
	if(!P.nodamage && (!(P.testing)))
		visible_message(SPAN_WARNING("[P] tears [src] down!"))
		qdel(src)
	else
		..(P, def_zone)

/obj/structure/curtain/attack_hand(mob/user)
	playsound(get_turf(loc), "rustle", 15, 1, -5)
	toggle()
	..()

/obj/structure/curtain/attackby(obj/item/I, mob/user)
	if(QUALITY_WIRE_CUTTING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_WIRE_CUTTING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			user.visible_message(SPAN_NOTICE("\The [user] dismantles \the [src]."),SPAN_NOTICE("You dismantle \the [src]."))
			drop_materials(drop_location())
			qdel(src)
	else
		return attack_hand(user)

/obj/structure/curtain/proc/toggle()
	opacity = !opacity
	if(opacity)
		icon_state = "closed"
		layer = WALL_OBJ_LAYER
	else
		icon_state = "open"
		layer = SIGN_LAYER

/obj/structure/curtain/black
	name = "black curtain"
	color = "#222222"

/obj/structure/curtain/red
	name = "red curtain"
	color = "#841423"

/obj/structure/curtain/medical
	name = "plastic curtain"
	desc = "A plastic curtain that can be parted and closed accordingly. Quite transparent."
	matter = list(MATERIAL_PLASTIC = 8)
	color = "#B8F5E3"
	alpha = 200

/obj/structure/curtain/open/bed
	name = "bed curtain"
	color = "#854636"

/obj/structure/curtain/open/privacy
	name = "privacy curtain"
	color = "#B8F5E3"

/obj/structure/curtain/open/shower
	name = "shower curtain"
	desc = "A plastic curtain that can be parted and closed accordingly. Quite transparent."
	matter = list(MATERIAL_PLASTIC = 8)
	color = "#ACD1E9"
	alpha = 200

/obj/structure/curtain/open/shower/closed
	icon_state = "closed"
	layer = WALL_OBJ_LAYER
	opacity = 1

/obj/structure/curtain/open/shower/engineering
	color = "#FFA500"

/obj/structure/curtain/open/shower/security
	color = "#AA0000"
