/obj/structure/artwork_statue
	name = "Weird Statue"
	desc = "A work of art that reflects the ideas of its creator."
	icon = 'icons/obj/structures/artwork_statue.dmi'
	icon_state = "artwork_statue_1"
	density = TRUE
	anchored = FALSE
	price_tag = 500

/obj/structure/artwork_statue/Initialize()
	. = ..()
	name = get_artwork_name(TRUE)
	icon_state = "artwork_statue_[rand(1,6)]"

	var/sanity_value = 2 + rand(0,2)
	AddComponent(/datum/component/atom_sanity, sanity_value, "")
	price_tag += rand(0,5000)

/obj/structure/artwork_statue/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 100