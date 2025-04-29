//STATUES

/obj/structure/statue
	name = "statue"
	desc = "A monolithic piece of stone carved to represent a person."
	icon = 'icons/obj/statue_large.dmi'
	icon_state = "statue"
	density = TRUE
	anchored = TRUE
	health = 5000

/obj/structure/statue/damaged
	name = "damaged statue"
	desc = "A monolithic piece of stone carved to represent a person. This one is heavily damaged, with plenty of cracks in the stone and an entire arm missing. It looks less sturdy than the usual statue."
	icon = 'icons/obj/statue_large.dmi'
	icon_state = "statue_damaged"
	health = 500

/obj/structure/statue/augustine
	name = "absolutist statue"
	desc = "A monolithic piece of stone depicting the Cartographer Augustine Brown. The statue is holding a golden cross-staff in the left, and a Davis' quadrant in the right. There is a fresh wreath woven from bay laurels on it's head."
	icon = 'icons/obj/statue_large.dmi'
	icon_state = "statue"
	health = 5000

/obj/structure/statue/damaged/augustine
	name = "statue"
	desc = "A monolithic piece of stone depicting the Cartographer Augustine Brown. The statue is holding up a broken arm which lies shattered at it's feet, and a broken Davis' quadrant in the right. It looks close to crumbling due to the amount of cracks it has."
	icon_state = "augustine_damaged"
	health = 500

//MISC

/obj/structure/statue/candles
	name = "candles"
	desc = "Lit candles at the foot of the statue."
	icon = 'icons/obj/statue_large.dmi'
	icon_state = "statue_candles"
	density = FALSE
	anchored = TRUE
	health = 500

