/obj/structure/ameridian_crystal
	name = "ameridian crystal"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal"
	anchored = TRUE
	density = FALSE // We can walk through them
	light_range = 1 // Glow in the dark
	light_color = COLOR_LIGHTING_GREEN_BRIGHT

	var/growth = 1 // the growth level of the crystal. The higher it is, the older the crystal is.
	var/max_growth = 5 // Maximum growth level, in case we want to do stuff relative to size

	var/colour_type = "GREEN"

	var/resize = TRUE

/obj/structure/ameridian_crystal/Initialize(mapload, ...)
	update_icon()
	. = ..()

/obj/structure/ameridian_crystal/New()
	..()
	growth = pick(1,1,2,2,2,3,3,3,4,4,4,5,5)
	new /obj/random/mob/golem (src.loc)
	new /obj/random/mob/golem/high_chance (src.loc)
	new /obj/random/mob/golem/high_chance (src.loc)
	update_icon()
	if(prob(33))
		colour_type = "BLUE"
		icon_state = "ameridian_crystal_blue"
		new /obj/random/cluster/golem (src.loc)
		return
	if(prob(33))
		colour_type = "RED"
		icon_state = "ameridian_crystal_red"
		new /obj/random/cluster/golem (src.loc)

/obj/structure/ameridian_crystal/add_initial_transforms()
	if (resize)
		add_new_transformation(/datum/transform_type/ameridian_structures/crystal_resizing)
	. = ..()

/obj/structure/ameridian_crystal/Destroy()
	. = ..()

/obj/structure/ameridian_crystal/update_icon()
	set_light(growth, growth)
	underlays.Cut()
	underlays += ("crystal_floor_[clamp(round(REMAP(growth, 1, max_growth, 1, 5)), 1, 5)]")
	. = ..()

/obj/structure/ameridian_crystal/attackby(obj/item/I, mob/user)
	if(user.a_intent == I_HELP && user.Adjacent(src))
		var/tool_type = I.get_tool_type(user, list(QUALITY_EXCAVATION, QUALITY_DIGGING, QUALITY_SHOVELING), src)
		if(tool_type)
			visible_message(SPAN_NOTICE("[user] starts digging [src] up."), SPAN_NOTICE("You start digging [src] up."))
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_ROB))
				harvest_crystals()
			else
				to_chat(user, SPAN_WARNING("You must stay still to finish excavation."))
	else
		..()

/obj/structure/ameridian_crystal/bullet_act(var/obj/item/projectile/Proj)
	if(istype(Proj, /obj/item/projectile/sonic_bolt))
		if (!(Proj.testing))
			visible_message("[src] shatters.")
			Destroy()
	else
		..()

/obj/structure/ameridian_crystal/ex_act(severity)
	if(severity)
		harvest_crystals(src)

/obj/structure/ameridian_crystal/proc/harvest_crystals()
	var/obj/item/stack/material/ameridian/T = new(get_turf(src))
	T.amount = growth // Drop more crystal the further along we are
	activate_mobs_in_range(src, 15) // Wake up the nearby golems
	qdel(src)
