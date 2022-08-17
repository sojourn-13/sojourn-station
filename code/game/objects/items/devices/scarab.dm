/obj/item/scarab
	name = "golden scarab"
	desc = "It appears old, tarnished slightly and broken, yet its made from solid gold and where its broken open you can see circuitry poking out."
	icon = 'icons/obj/objects.dmi'
	icon_state = "golden_scarab"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GOLD = 5, MATERIAL_PLASTEEL = 1, MATERIAL_SILVER = 2)

/obj/item/scarab/add_initial_transforms()
	. = ..()

	add_new_transformation(/datum/transform_type/modular, list(0.8, 0.8, flag = SCARAB_INITIAL_SCALE_TRANSFORM, priority = SCARAB_INITIAL_SCALE_TRANSFORM_PRIORITY))
