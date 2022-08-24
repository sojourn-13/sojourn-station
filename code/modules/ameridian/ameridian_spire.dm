// Ameridian Spire, an indestructible building that constantly refill missing ameridian around it.
/obj/structure/ameridian_crystal/spire
	name = "ameridian spire"
	desc = "A strange crystal formation that seems to have grown form a more rare crystal core."
	icon_state = "ameridian_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_power = 7
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	resize = FALSE

/obj/structure/ameridian_crystal/spire/New()
	..()
	colour_type = "PURPLE"
	icon_state = "ameridian_crystal_purple"
	new /obj/random/cluster/golem_hoard(src.loc)

/obj/structure/ameridian_crystal/spire/add_initial_transforms()
	add_new_transformation(/datum/transform_type/modular, list(scale_x = 1.5, scale_y = 1.5, flag = AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM, priority = AMERIDIAN_SPIRE_INITIAL_SCALE_TRANSFORM_PRIORITY))
	. = ..()

/obj/structure/ameridian_crystal/spire/harvest_crystals()
	var/obj/item/stack/material/ameridian/T = new(get_turf(src))
	new /obj/item/ameridian_core(T)
	T.amount = 60 //Half a stack for a rare find
	activate_mobs_in_range(src, 15) // Wake up the nearby golems
	qdel(src)

