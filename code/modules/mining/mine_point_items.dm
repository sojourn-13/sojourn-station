/obj/item/card/mining_point_card
	name = "mining point card"
	desc = "A small card preloaded with mining points. Swipe your ID card over it to transfer the points, then discard."
	icon_state = "data"
	var/mine_points = 500

/obj/item/card/mining_point_card/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/C = I
		if(mine_points)
			C.mining_points += mine_points
			to_chat(user, "<span class='info'>You transfer [mine_points] excavation points to [C].</span>")
			mine_points = 0
		else
			to_chat(user, "<span class='info'>There's no excavation points left on [src].</span>")
	..()

/obj/item/card/mining_point_card/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("There's [mine_points] excavation points on the card."))

/obj/item/card/mining_point_card/onethou
	name = "deluxe mining point card"
	mine_points = 1000

/obj/item/card/mining_point_card/twothou
	name = "deluxe mining point card"
	mine_points = 2000

/obj/item/card/mining_point_card/threethou
	name = "deluxe mining point card"
	mine_points = 3000
