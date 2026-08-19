/obj/random/pen
	name = "random pen (not safe)"
	icon_state = "junk-black"

/obj/random/pen/item_to_spawn()
	return pickweight(list(/obj/item/pen = 2,\
				/obj/item/pen/red = 1,\
				/obj/item/pen/green = 1,\
				/obj/item/pen/blue = 1,\
				/obj/item/pen/cyan = 1,\
				/obj/item/pen/multi = 0.5,\
				/obj/item/pen/reagent = 0.05,\
				/obj/item/storage/fancy/crayons = 0.1))

/obj/random/pen_safe
	name = "random pen (safe)"
	icon_state = "junk-black"

/obj/random/pen_safe/item_to_spawn()
	return pickweight(list(/obj/item/pen = 2,\
				/obj/item/pen/red = 1,\
				/obj/item/pen/green = 1,\
				/obj/item/pen/blue = 1,\
				/obj/item/pen/cyan = 1,\
				/obj/item/pen/multi = 0.5,\
				/obj/item/pen/chameleon = 0.5,\
				/obj/item/storage/fancy/crayons = 0.1))