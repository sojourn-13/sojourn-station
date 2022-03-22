// Tiberium Spire, an indestructible building that constantly refill missing tiberium around it.
/obj/structure/tiberium_crystal/spire
	name = "tiberium spire"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/tiberium.dmi'
	icon_state = "tiberium_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	growth = 6 // Bigger than other crystals
	spread_range = 2
	golem_threshold = 0 // Can always spawn a golem
	golem_range = 1 // It can always spawn a golem, but let's not check more than we have to.

/obj/structure/tiberium_crystal/spire/Initialize(mapload, ...)
	..()
	growth = initial(growth) // Start fully grown
	update_icon()

/obj/structure/tiberium_crystal/spire/update_icon()
	transform = initial(transform)
	transform *= 1.2

/obj/structure/tiberium_crystal/spire/examine(mob/user)
	..()
	if(user.stats.getPerk(PERK_PSION)) // Are we a psion and is there something to see?
		to_chat(user, "<b><font color='purple'>You have the feeling this spire goes deep. Very deep...")

/obj/structure/tiberium_crystal/attackby(obj/item/I, mob/user)
	src.visible_message(SPAN_NOTICE("[user] cannot make a dent into [src]."), SPAN_NOTICE("You cannot make a dent into [src]."))
	return // Can't destroy it
