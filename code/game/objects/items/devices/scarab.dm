/obj/item/scarab
	name = "golden scarab"
	desc = "It appears old, tarnished slightly and broken, yet its made from solid gold and where its broken open you can see circuitry poking out."
	icon = 'icons/obj/objects.dmi'
	icon_state = "golden_scarab"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_GOLD = 5, MATERIAL_PLASTEEL = 1, MATERIAL_SILVER = 2)

/obj/item/scarab/Initialize()
    . = ..()
    src.transform *= 0.8 // this little trick makes bone size small while keeping detail level of 32x32 bones.